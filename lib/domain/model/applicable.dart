import 'package:payment_app/domain/model/applicable_links.dart';
//import 'package:payment_app/domain/model/contract_data.dart';
import 'package:payment_app/domain/model/input_element.dart';

import 'enum_values.dart';

class Applicable {
  Applicable({
    required this.code,
    required this.label,
    required this.method,
    required this.grouping,
    required this.registration,
    required this.recurrence,
    required this.redirect,
    required this.links,
    required this.selected,
    required this.inputElements,
    required this.operationType,
    // required this.contractData,
  });

  final String code;
  final String label;
  final String method;
  final String grouping;
  final Recurrence? registration;
  final Recurrence? recurrence;
  final bool redirect;
  final ApplicableLinks links;
  final bool selected;
  final List<InputElement>? inputElements;
  final OperationType? operationType;
  // final ContractData? contractData;

  factory Applicable.fromJson(Map<String, dynamic> json) => Applicable(
        code: json["code"],
        label: json["label"],
        method: json["method"],
        grouping: json["grouping"],
        registration: recurrenceValues.map[json["registration"]],
        recurrence: recurrenceValues.map[json["recurrence"]],
        redirect: json["redirect"],
        links: ApplicableLinks.fromJson(json["links"]),
        selected: json["selected"],
        inputElements: json["inputElements"] == null
            ? null
            : List<InputElement>.from(
                json["inputElements"].map((x) => InputElement.fromJson(x))),
        operationType: operationTypeValues.map[json["operationType"]],
        // contractData: ContractData.fromJson(json["contractData"])
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "label": label,
        "method": method,
        "grouping": grouping,
        "registration": recurrenceValues.reverse[registration],
        "recurrence": recurrenceValues.reverse[recurrence],
        "redirect": redirect,
        "links": links.toJson(),
        "selected": selected,
        "inputElements": inputElements == null
            ? null
            : List<dynamic>.from(inputElements!.map((x) => x.toJson())),
        "operationType": operationTypeValues.reverse[operationType],
        // "contractData": contractData?.toJson(),
      };
}
