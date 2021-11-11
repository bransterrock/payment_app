class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}

final operationTypeValues = EnumValues({"CHARGE": OperationType.CHARGE});
final recurrenceValues =
    EnumValues({"NONE": Recurrence.NONE, "OPTIONAL": Recurrence.OPTIONAL});

enum Type { NUMERIC, INTEGER, STRING }
enum OperationType { CHARGE }
enum Recurrence { NONE, OPTIONAL }
enum Name {
  NUMBER,
  EXPIRY_MONTH,
  EXPIRY_YEAR,
  VERIFICATION_CODE,
  HOLDER_NAME,
  BIC,
  IBAN
}
