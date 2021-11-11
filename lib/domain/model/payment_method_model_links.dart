class PaymentMethodModelLinks {
    PaymentMethodModelLinks({
        required this.self,
        required this.lang,
    });

    final String self;
    final String lang;

    factory PaymentMethodModelLinks.fromJson(Map<String, dynamic> json) => PaymentMethodModelLinks(
        self: json["self"],
        lang: json["lang"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "lang": lang,
    };
}