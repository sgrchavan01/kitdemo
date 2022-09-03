class ApiConstants {
  Map<String, String> getHeader() => {
        'Content-Type': 'application/json',
      };

  Map<String, String> getHeader1(String token) => {
        'x-auth-token': token,
        'Content-Type': 'application/json',
      };

  final baseUrl = 'https://services.kit19.com/api/';

  String loginUrl() => baseUrl + 'GetToken';

  String leadlistUrl() => baseUrl + 'ContactSuggestions';
}
