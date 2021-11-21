class ApplicableLinks {
  ApplicableLinks({
    required this.logo,
    required this.self,
    required this.lang,
    required this.operation,
    required this.validation,
  });

  final String logo;
  final String self;
  final String lang;
  final String operation;
  final String validation;

  factory ApplicableLinks.fromJson(Map<String, dynamic> json) =>
      ApplicableLinks(
        logo: json["logo"],
        self: json["self"],
        lang: json["lang"],
        operation: json["operation"],
        validation: json["validation"],
      );

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "self": self,
        "lang": lang,
        "operation": operation,
        "validation": validation,
      };
}
