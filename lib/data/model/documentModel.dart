// To parse this JSON data, do
//
//     final document = documentFromJson(jsonString);

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
  });

  final String docId;
  final String doc;
  final String docType;
  final String customerId;
  final String customerName;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        docId: json["doc_id"],
        doc: json["doc"],
        docType: json["doc_type"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
      );

  Map<String, dynamic> toJson() => {
        "doc_id": docId,
        "doc": doc,
        "doc_type": docType,
        "customer_id": customerId,
        "customer_name": customerName,
      };
}
