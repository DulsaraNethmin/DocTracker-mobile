import 'package:meta/meta.dart';
import 'dart:convert';

List<Document> documentFromJson(String str) =>
    List<Document>.from(json.decode(str).map((x) => Document.fromJson(x)));

String documentToJson(List<Document> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Document {
  Document({
    required this.docId,
    required this.doc,
    required this.docType,
    required this.customerId,
    required this.customerName,
    required this.branchId,
    required this.branch,
  });

  final String docId;
  final String doc;
  final String docType;
  final String customerId;
  final String customerName;
  final String branchId;
  final String branch;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        docId: json["doc_id"],
        doc: json["doc"],
        docType: json["doc_type"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        branchId: json["branch_id"],
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "doc_id": docId,
        "doc": doc,
        "doc_type": docType,
        "customer_id": customerId,
        "customer_name": customerName,
        "branch_id": branchId,
        "branch": branch,
      };
}
