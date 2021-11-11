class Style {
    Style({
        required this.language,
    });

    final String language;

    factory Style.fromJson(Map<String, dynamic> json) => Style(
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
    };
}