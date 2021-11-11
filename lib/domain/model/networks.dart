import 'package:payment_app/domain/model/applicable.dart';

class Networks {
    Networks({
        required this.applicable,
    });

    final List<Applicable> applicable;

    factory Networks.fromJson(Map<String, dynamic> json) => Networks(
        applicable: List<Applicable>.from(json["applicable"].map((x) => Applicable.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "applicable": List<dynamic>.from(applicable.map((x) => x.toJson())),
    };
}