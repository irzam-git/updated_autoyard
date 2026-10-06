import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import '../../data/inventory_repository_impl.dart';
import '../utils/receipt_pdf_generator.dart';

part 'purchase_receipt_controller.freezed.dart';
part 'purchase_receipt_controller.g.dart';

@freezed
abstract class PurchaseReceiptState with _$PurchaseReceiptState {
  const factory PurchaseReceiptState({
    @Default(true) bool isLoading,
    @Default(false) bool isDownloading,
    String? receiptUrl,
    String? localPdfPath,
    String? errorMessage,
  }) = _PurchaseReceiptState;
}

@riverpod
class PurchaseReceiptController extends _$PurchaseReceiptController {
  @override
  PurchaseReceiptState build(int vehicleId) {
    Future.microtask(() => loadReceiptPdf(vehicleId));
    return const PurchaseReceiptState();
  }

  Future<void> loadReceiptPdf(int vehicleId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.getPurchaseReceiptPdfUrl(vehicleId);

    await result.fold(
      (failure) async {
        // If getting receipt URL failed, attempt generating directly from vehicle details
        await _generateFallbackPdf(vehicleId);
      },
      (url) async {
        state = state.copyWith(receiptUrl: url);
        final success = await _downloadPdf(url, vehicleId);
        if (!success) {
          // If remote storage returned 404 or failed to download, generate local PDF
          await _generateFallbackPdf(vehicleId);
        }
      },
    );
  }

  Future<bool> _downloadPdf(String url, int vehicleId) async {
    try {
      state = state.copyWith(isDownloading: true);
      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/receipt_$vehicleId.pdf';

      final dio = Dio();
      await dio.download(url, filePath);

      state = state.copyWith(
        isLoading: false,
        isDownloading: false,
        localPdfPath: filePath,
        errorMessage: null,
      );
      return true;
    } catch (e) {
      // Remote download failed (e.g. 404 on server static storage)
      return false;
    }
  }

  Future<void> _generateFallbackPdf(int vehicleId) async {
    try {
      state = state.copyWith(isDownloading: true);
      final repo = ref.read(inventoryRepositoryImplProvider);
      final vehicleResult = await repo.getVehicleDetail(vehicleId);

      await vehicleResult.fold(
        (failure) async {
          state = state.copyWith(
            isLoading: false,
            isDownloading: false,
            errorMessage: failure.message,
          );
        },
        (vehicle) async {
          final dir = await getTemporaryDirectory();
          final filePath = '${dir.path}/receipt_${vehicleId}_generated.pdf';
          await ReceiptPdfGenerator.generateReceiptPdf(
            vehicle: vehicle,
            targetFilePath: filePath,
          );

          state = state.copyWith(
            isLoading: false,
            isDownloading: false,
            localPdfPath: filePath,
            errorMessage: null,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isDownloading: false,
        errorMessage: 'Failed to generate receipt PDF: $e',
      );
    }
  }

  Future<void> shareReceipt() async {
    final path = state.localPdfPath;
    if (path != null && await File(path).exists()) {
      // ignore: deprecated_member_use
      await Share.shareXFiles(
        [XFile(path)],
        text: 'AutoYard Vehicle Purchase Receipt',
      );
    }
  }
}

