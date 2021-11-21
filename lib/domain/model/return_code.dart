class ReturnCode {
  ReturnCode({
    required this.name,
    required this.source,
  });

  final String name;
  final String source;

  factory ReturnCode.fromJson(Map<String, dynamic> json) => ReturnCode(
        name: json["name"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "source": source,
      };
}
