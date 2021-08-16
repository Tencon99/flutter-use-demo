import 'package:scan/scan.dart';

class QrCodeState {
  late String qrCode;
  late ScanController controller;
  QrCodeState() {
    qrCode = 'Unknown';
  }
}
