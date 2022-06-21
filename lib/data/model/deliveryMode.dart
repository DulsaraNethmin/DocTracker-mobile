// To parse this JSON data, do
//
//     final deliveries = deliveriesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Delivery> deliveryFromJson(String str) =>
    List<Delivery>.from(json.decode(str).map((x) => Delivery.fromJson(x)));

String deliveriesToJson(List<Delivery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Delivery {
  Delivery({
    required this.jobId,
    required this.customerId,
    required this.customerName,
    required this.isJobCompleted,
    required this.deliveryId,
    required this.docId,
    required this.docName,
    required this.endCustmerId,
    required this.endCustomerName,
    required this.isDeliveryCompleted,
  });

  final String jobId;
  final String customerId;
  final String customerName;
  final int isJobCompleted;
  final String deliveryId;
  final String docId;
  final String docName;
  final String endCustmerId;
  final String endCustomerName;
  final int isDeliveryCompleted;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        jobId: json["job_id"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        isJobCompleted: json["is_job_completed"],
        deliveryId: json["delivery_id"],
        docId: json["doc_id"],
        docName: json["doc_name"],
        endCustmerId: json["end_custmer_id"],
        endCustomerName: json["end_customer_name"],
        isDeliveryCompleted: json["is_delivery_completed"],
      );

  Map<String, dynamic> toJson() => {
        "job_id": jobId,
        "customer_id": customerId,
        "customer_name": customerName,
        "is_job_completed": isJobCompleted,
        "delivery_id": deliveryId,
        "doc_id": docId,
        "doc_name": docName,
        "end_custmer_id": endCustmerId,
        "end_customer_name": endCustomerName,
        "is_delivery_completed": isDeliveryCompleted,
      };
}
