import 'package:payment_app/domain/model/enum_values.dart';

class InputElement {
  InputElement({
    required this.name,
    required this.type,
  });

  final Name? name;
  final Type? type;

  factory InputElement.fromJson(Map<String, dynamic> json) => InputElement(
        name: nameValues.map[json["name"]],
        type: typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "type": typeValues.reverse[type],
      };
}

final nameValues = EnumValues({
  "bic": Name.BIC,
  "expiryMonth": Name.EXPIRY_MONTH,
  "expiryYear": Name.EXPIRY_YEAR,
  "holderName": Name.HOLDER_NAME,
  "iban": Name.IBAN,
  "number": Name.NUMBER,
  "verificationCode": Name.VERIFICATION_CODE
});

final typeValues = EnumValues(
    {"integer": Type.INTEGER, "numeric": Type.NUMERIC, "string": Type.STRING});
