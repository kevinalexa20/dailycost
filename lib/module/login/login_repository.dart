import "package:dio/dio.dart";

final dio = Dio();

Future<String> login(String email, String password) async {
  try {
    final response = await dio.post(
      'https://dailycost.my.id/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = response.data;
      final accessToken = jsonResponse['access_token'];
      return accessToken;
    } else {
      throw Exception('Failed to login');
    }
  } catch (e) {
    throw Exception('Failed to login: $e');
  }
}
