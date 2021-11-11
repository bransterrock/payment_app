class ContractData {
    ContractData({
        required this.pageEnvironment,
        required this.javascriptIntegration,
        required this.pageButtonLocale,
    });

    final String pageEnvironment;
    final String javascriptIntegration;
    final String pageButtonLocale;

    factory ContractData.fromJson(Map<String, dynamic> json) => ContractData(
        pageEnvironment: json["PAGE_ENVIRONMENT"],
        javascriptIntegration: json["JAVASCRIPT_INTEGRATION"],
        pageButtonLocale: json["PAGE_BUTTON_LOCALE"],
    );

    Map<String, dynamic> toJson() => {
        "PAGE_ENVIRONMENT": pageEnvironment,
        "JAVASCRIPT_INTEGRATION": javascriptIntegration,
        "PAGE_BUTTON_LOCALE": pageButtonLocale,
    };
}