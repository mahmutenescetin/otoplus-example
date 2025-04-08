enum WeatherApiEndpoints {
  forecast('/forecast.json');

  final String path;

  const WeatherApiEndpoints(this.path);

  String buildUrl({
    required String apiKey,
    required String baseUrl,
    String city = 'Istanbul',
    int days = 3,
    bool includeAqi = false,
    bool includeAlerts = false,
    String lang = 'tr',
  }) {
    final queryParams = {
      'key': apiKey,
      'q': city,
      'days': days.toString(),
      'aqi': includeAqi ? 'yes' : 'no',
      'alerts': includeAlerts ? 'yes' : 'no',
      'lang': lang,
    };

    final queryString = queryParams.entries
        .map((e) => '${e.key}=${e.value}')
        .join('&');

    return '$baseUrl$path?$queryString';
  }
}
