import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_header.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../controllers/purchase_receipt_controller.dart';

class PurchaseReceiptScreen extends ConsumerStatefulWidget {
  final int vehicleId;

  const PurchaseReceiptScreen({
    super.key,
    required this.vehicleId,
  });

  @override
  ConsumerState<PurchaseReceiptScreen> createState() => _PurchaseReceiptScreenState();
}

class _PurchaseReceiptScreenState extends ConsumerState<PurchaseReceiptScreen> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool _isReady = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(purchaseReceiptControllerProvider(widget.vehicleId));
    final controller = ref.read(purchaseReceiptControllerProvider(widget.vehicleId).notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? AppColors.backgroundDark : AppColors.backgroundLight;
    final surfaceColor = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
    final textPrimary = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final textSecondary = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppHeader(
        title: 'Purchase Receipt',
        subtitle: 'Official Tax Invoice PDF',
        showBackButton: true,
        onBack: () => context.pop(),
      ),
      body: Builder(
        builder: (context) {
          if (state.isLoading || state.isDownloading) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 36,
                    height: 36,
                    child: CircularProgressIndicator(strokeWidth: 3, color: AppColors.primary),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    state.isDownloading
                        ? 'Downloading receipt PDF...'
                        : 'Fetching purchase receipt...',
                    style: AppTypography.bodyMd.copyWith(
                      color: textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state.errorMessage != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.error_outline_rounded,
                        color: AppColors.error,
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Could not load receipt',
                      style: AppTypography.h5.copyWith(
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      state.errorMessage!,
                      textAlign: TextAlign.center,
                      style: AppTypography.bodyMd.copyWith(
                        color: textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    AppButton(
                      label: 'Retry',
                      icon: const Icon(Icons.refresh_rounded, size: 18, color: Colors.white),
                      onPressed: () => controller.loadReceiptPdf(widget.vehicleId),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state.localPdfPath == null) {
            return Center(
              child: Text(
                'Receipt PDF not available',
                style: AppTypography.bodyLg.copyWith(
                  color: textSecondary,
                ),
              ),
            );
          }

          return Stack(
            children: [
              PDFView(
                filePath: state.localPdfPath,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: true,
                pageFling: true,
                pageSnap: true,
                defaultPage: _currentPage,
                fitPolicy: FitPolicy.BOTH,
                preventLinkNavigation: false,
                onRender: (pages) {
                  setState(() {
                    _totalPages = pages ?? 0;
                    _isReady = true;
                  });
                },
                onError: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error rendering PDF: $error'),
                      backgroundColor: AppColors.error,
                    ),
                  );
                },
                onPageError: (page, error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error on page $page: $error'),
                      backgroundColor: AppColors.error,
                    ),
                  );
                },
                onPageChanged: (int? page, int? total) {
                  setState(() {
                    _currentPage = page ?? 0;
                    _totalPages = total ?? 0;
                  });
                },
              ),
              if (!_isReady)
                const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              if (_isReady && _totalPages > 0)
                Positioned(
                  bottom: 24,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        'Page ${_currentPage + 1} of $_totalPages',
                        style: AppTypography.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      bottomNavigationBar: state.localPdfPath != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
              decoration: BoxDecoration(
                color: surfaceColor,
                border: Border(top: BorderSide(color: isDark ? AppColors.borderDark : AppColors.borderLight)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: const Offset(0, -2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'Done',
                        variant: ButtonVariant.secondary,
                        icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
                        onPressed: () => context.pop(),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: AppButton(
                        label: 'Share PDF',
                        variant: ButtonVariant.primary,
                        icon: const Icon(Icons.share_rounded, size: 18, color: Colors.white),
                        onPressed: () => controller.shareReceipt(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
