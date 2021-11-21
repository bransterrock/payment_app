class Identification {
  Identification({
    required this.longId,
    required this.shortId,
    required this.transactionId,
  });

  final String longId;
  final String shortId;
  final String transactionId;

  factory Identification.fromJson(Map<String, dynamic> json) => Identification(
        longId: json["longId"],
        shortId: json["shortId"],
        transactionId: json["transactionId"],
      );

  Map<String, dynamic> toJson() => {
        "longId": longId,
        "shortId": shortId,
        "transactionId": transactionId,
      };
}
