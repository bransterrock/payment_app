// To parse this JSON data, do
//
//     final paymentMethodModel = paymentMethodModelFromJson(jsonString);

import 'package:payment_app/domain/model/enum_values.dart';
import 'package:payment_app/domain/model/identification.dart';
import 'package:payment_app/domain/model/networks.dart';
import 'package:payment_app/domain/model/payment.dart';
import 'package:payment_app/domain/model/payment_method_model_links.dart';
import 'package:payment_app/domain/model/return_code.dart';
import 'package:payment_app/domain/model/style.dart';
import 'package:retrofit/http.dart';
import 'interaction.dart';

@Parser.JsonSerializable
class PaymentMethodModel {
  PaymentMethodModel({
    required this.links,
    required this.timestamp,
    required this.operation,
    required this.resultCode,
    required this.resultInfo,
    required this.returnCode,
    required this.status,
    required this.interaction,
    required this.identification,
    required this.networks,
    required this.operationType,
    required this.style,
    required this.payment,
    required this.integrationType,
  });

  final PaymentMethodModelLinks links;
  final String timestamp;
  final String operation;
  final String resultCode;
  final String resultInfo;
  final ReturnCode returnCode;
  final Interaction status;
  final Interaction interaction;
  final Identification identification;
  final Networks networks;
  final OperationType? operationType;
  final Style style;
  final Payment payment;
  final String integrationType;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        links: PaymentMethodModelLinks.fromJson(json["links"]),
        timestamp: json["timestamp"],
        operation: json["operation"],
        resultCode: json["resultCode"],
        resultInfo: json["resultInfo"],
        returnCode: ReturnCode.fromJson(json["returnCode"]),
        status: Interaction.fromJson(json["status"]),
        interaction: Interaction.fromJson(json["interaction"]),
        identification: Identification.fromJson(json["identification"]),
        networks: Networks.fromJson(json["networks"]),
        operationType: operationTypeValues.map[json["operationType"]],
        style: Style.fromJson(json["style"]),
        payment: Payment.fromJson(json["payment"]),
        integrationType: json["integrationType"],
      );

  Map<String, dynamic> toJson() => {
        "links": links.toJson(),
        "timestamp": timestamp,
        "operation": operation,
        "resultCode": resultCode,
        "resultInfo": resultInfo,
        "returnCode": returnCode.toJson(),
        "status": status.toJson(),
        "interaction": interaction.toJson(),
        "identification": identification.toJson(),
        "networks": networks.toJson(),
        "operationType": operationTypeValues.reverse[operationType],
        "style": style.toJson(),
        "payment": payment.toJson(),
        "integrationType": integrationType,
      };
}
