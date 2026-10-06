import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../domain/models/vehicle_model.dart';

class ReceiptPdfGenerator {
  static Future<File> generateReceiptPdf({
    required VehicleModel vehicle,
    required String targetFilePath,
  }) async {
    final fontRegular = await PdfGoogleFonts.robotoRegular();
    final fontBold = await PdfGoogleFonts.robotoBold();
    final fontItalic = await PdfGoogleFonts.robotoItalic();
    final fontBoldItalic = await PdfGoogleFonts.robotoBoldItalic();

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: fontRegular,
        bold: fontBold,
        italic: fontItalic,
        boldItalic: fontBoldItalic,
      ),
    );

    final primaryColor = PdfColor.fromHex('#0066FF');
    final darkColor = PdfColor.fromHex('#0F172A');
    final greyColor = PdfColor.fromHex('#64748B');
    final lightGreyColor = PdfColor.fromHex('#F1F5F9');
    final borderColor = PdfColor.fromHex('#E2E8F0');
    final successColor = PdfColor.fromHex('#10B981');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) => [
          // Header
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'AUTOYARD',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'Official Vehicle Purchase Receipt',
                    style: pw.TextStyle(
                      fontSize: 14,
                      fontWeight: pw.FontWeight.bold,
                      color: darkColor,
                    ),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Container(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: pw.BoxDecoration(
                      color: primaryColor.shade(0.1),
                      borderRadius: pw.BorderRadius.circular(6),
                      border: pw.Border.all(color: primaryColor),
                    ),
                    child: pw.Text(
                      'RECEIPT #${vehicle.id}',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    'Date: ${_formatDate(vehicle.pickupDate ?? vehicle.createdAt)}',
                    style: pw.TextStyle(fontSize: 10, color: greyColor),
                  ),
                ],
              ),
            ],
          ),

          pw.SizedBox(height: 20),
          pw.Divider(color: borderColor, thickness: 1),
          pw.SizedBox(height: 12),

          // Vehicle Specifications Section
          _buildSectionHeader('VEHICLE SPECIFICATIONS', primaryColor),
          pw.SizedBox(height: 8),
          pw.Container(
            decoration: pw.BoxDecoration(
              color: lightGreyColor,
              borderRadius: pw.BorderRadius.circular(8),
              border: pw.Border.all(color: borderColor),
            ),
            padding: const pw.EdgeInsets.all(12),
            child: pw.Column(
              children: [
                _buildDataRow('Vehicle', vehicle.vehicleTitle),
                _buildDataRow('Registration / State', '${vehicle.registrationNumber ?? 'N/A'} (${vehicle.registrationState ?? 'N/A'})'),
                _buildDataRow('VIN Number', vehicle.vinNumber ?? 'N/A'),
                _buildDataRow('Engine Number', vehicle.engineNumber ?? 'N/A'),
                _buildDataRow('Transmission / Body', '${vehicle.transmission ?? 'N/A'} / ${vehicle.bodyType ?? 'N/A'}'),
                _buildDataRow('Odometer Reading', '${vehicle.odometer ?? 'N/A'} km'),
                _buildDataRow('Built Date', vehicle.built ?? 'N/A'),
              ],
            ),
          ),

          pw.SizedBox(height: 16),

          // Seller Details Section
          _buildSectionHeader('SELLER INFORMATION', primaryColor),
          pw.SizedBox(height: 8),
          pw.Container(
            decoration: pw.BoxDecoration(
              color: lightGreyColor,
              borderRadius: pw.BorderRadius.circular(8),
              border: pw.Border.all(color: borderColor),
            ),
            padding: const pw.EdgeInsets.all(12),
            child: pw.Column(
              children: [
                _buildDataRow('Full Name', vehicle.sellerFullName),
                _buildDataRow('Phone Number', vehicle.phoneNumber ?? 'N/A'),
                _buildDataRow('Driver License No.', vehicle.licenseNumber ?? 'N/A'),
                if (vehicle.businessName != null && vehicle.businessName!.isNotEmpty)
                  _buildDataRow('Business Name / ABN', '${vehicle.businessName} (ABN: ${vehicle.abnNumber ?? 'N/A'})'),
                _buildDataRow('Pickup Address', vehicle.pickupAddress ?? 'N/A'),
                _buildDataRow('Residential Address', vehicle.residentialAddress ?? vehicle.pickupAddress ?? 'N/A'),
              ],
            ),
          ),

          pw.SizedBox(height: 16),

          // Vehicle Condition & Financial Settlement
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Condition Column
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('CONDITION SUMMARY', primaryColor),
                    pw.SizedBox(height: 8),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: pw.BorderRadius.circular(8),
                        border: pw.Border.all(color: borderColor),
                      ),
                      padding: const pw.EdgeInsets.all(12),
                      child: pw.Column(
                        children: [
                          _buildDataRow('Drivable', vehicle.vehicleCondition?.drivable.toUpperCase() ?? 'N/A'),
                          _buildDataRow('Accidental', vehicle.vehicleCondition?.accidental.toUpperCase() ?? 'N/A'),
                          _buildDataRow('WOVI Listed', vehicle.vehicleCondition?.wovi.toUpperCase() ?? 'N/A'),
                          _buildDataRow('Under Finance', vehicle.vehicleCondition?.underFinance.toUpperCase() ?? 'N/A'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(width: 16),
              // Financial Settlement Column
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('PAYMENT SETTLEMENT', successColor),
                    pw.SizedBox(height: 8),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                        color: successColor.shade(0.05),
                        borderRadius: pw.BorderRadius.circular(8),
                        border: pw.Border.all(color: successColor.shade(0.3)),
                      ),
                      padding: const pw.EdgeInsets.all(12),
                      child: pw.Column(
                        children: [
                          _buildDataRow(
                            'Agreed Purchase Price',
                            '\$${vehicle.price ?? '0.00'} AUD',
                            isBold: true,
                            valueColor: successColor,
                          ),
                          _buildDataRow('Payment Method', vehicle.paymentMethod ?? 'Direct Transfer'),
                          _buildDataRow('Inventory Status', vehicle.status?.toUpperCase() ?? 'IN-STOCK'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (vehicle.note != null && vehicle.note!.trim().isNotEmpty) ...[
            pw.SizedBox(height: 14),
            _buildSectionHeader('TRANSACTION NOTES', greyColor),
            pw.SizedBox(height: 6),
            pw.Container(
              width: double.infinity,
              padding: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                color: lightGreyColor,
                borderRadius: pw.BorderRadius.circular(6),
                border: pw.Border.all(color: borderColor),
              ),
              child: pw.Text(
                vehicle.note!,
                style: const pw.TextStyle(fontSize: 10, color: PdfColors.black),
              ),
            ),
          ],

          pw.SizedBox(height: 24),

          // Digital Signatures
          _buildSectionHeader('DIGITAL SIGNATURES & VERIFICATION', darkColor),
          pw.SizedBox(height: 8),
          pw.Row(
            children: [
              pw.Expanded(
                child: pw.Container(
                  padding: const pw.EdgeInsets.all(12),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: borderColor),
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'SELLER / OWNER SIGNATURE',
                        style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: greyColor),
                      ),
                      pw.SizedBox(height: 16),
                      pw.Container(
                        height: 35,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          'Digitally Signed by ${vehicle.sellerFullName}',
                          style: pw.TextStyle(
                            fontSize: 11,
                            fontStyle: pw.FontStyle.italic,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      pw.Divider(color: borderColor),
                      pw.Text(
                        'Name: ${vehicle.sellerFullName}',
                        style: const pw.TextStyle(fontSize: 9, color: PdfColors.black),
                      ),
                    ],
                  ),
                ),
              ),
              pw.SizedBox(width: 16),
              pw.Expanded(
                child: pw.Container(
                  padding: const pw.EdgeInsets.all(12),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: borderColor),
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'BUYER / DRIVER SIGNATURE',
                        style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: greyColor),
                      ),
                      pw.SizedBox(height: 16),
                      pw.Container(
                        height: 35,
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          'AutoYard Authorized Representative',
                          style: pw.TextStyle(
                            fontSize: 11,
                            fontStyle: pw.FontStyle.italic,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      pw.Divider(color: borderColor),
                      pw.Text(
                        'Verified Driver Portal Entry',
                        style: const pw.TextStyle(fontSize: 9, color: PdfColors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          pw.SizedBox(height: 20),
          pw.Center(
            child: pw.Text(
              'AutoYard Management System | Generated automatically for official transaction records.',
              style: pw.TextStyle(fontSize: 8, color: greyColor),
            ),
          ),
        ],
      ),
    );

    final file = File(targetFilePath);
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  static String _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return 'N/A';
    if (raw.contains('T')) {
      return raw.split('T').first;
    }
    return raw;
  }

  static pw.Widget _buildSectionHeader(String title, PdfColor color) {
    return pw.Text(
      title,
      style: pw.TextStyle(
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
        color: color,
        letterSpacing: 0.5,
      ),
    );
  }

  static pw.Widget _buildDataRow(
    String label,
    String value, {
    bool isBold = false,
    PdfColor? valueColor,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2.5),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            label,
            style: const pw.TextStyle(
              fontSize: 9,
              color: PdfColors.grey700,
            ),
          ),
          pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 9,
              fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
              color: valueColor ?? PdfColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
