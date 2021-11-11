class Interaction {
    Interaction({
        required this.code,
        required this.reason,
    });

    final String code;
    final String reason;

    factory Interaction.fromJson(Map<String, dynamic> json) => Interaction(
        code: json["code"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "reason": reason,
    };
}