import 'package:meta/meta.dart';
import 'dart:convert';

List<QrScan> qrScanFromJson(String str) =>
    List<QrScan>.from(json.decode(str).map((x) => QrScan.fromJson(x)));

String qrScanToJson(List<QrScan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QrScan {
  QrScan({
    required this.docId,
    required this.docName,
    required this.type,
    required this.branchId,
    required this.branch,
  });

  final String docId;
  final String docName;
  final String type;
  final String branchId;
  final String branch;

  factory QrScan.fromJson(Map<String, dynamic> json) => QrScan(
        docId: json["doc_id"],
        docName: json["doc_name"],
        type: json["type"],
        branchId: json["branch_id"],
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "doc_id": docId,
        "doc_name": docName,
        "type": type,
        "branch_id": branchId,
        "branch": branch,
      };
}
