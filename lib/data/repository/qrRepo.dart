import 'dart:convert';

import 'package:doctracker/data/model/qr_scanModel.dart';
import 'package:doctracker/data/provider/qrProvider.dart';

class QrRepo {
  Future<QrScan> verify(String url) async {
    QrProvider qr_provider = QrProvider();
    final response = await qr_provider.verify(url);
    print(response.data);
    final data = response.data;
    final jsonData = jsonEncode(data);
    QrScan qr_scan_data = QrScan.fromJson(jsonDecode(jsonData));
    return qr_scan_data;
  }
}
