class Payment {
    Payment({
        required this.reference,
        required this.amount,
        required this.currency,
    });

    final String reference;
    final int amount;
    final String currency;

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        reference: json["reference"],
        amount: json["amount"],
        currency: json["currency"],
    );

    Map<String, dynamic> toJson() => {
        "reference": reference,
        "amount": amount,
        "currency": currency,
    };
}