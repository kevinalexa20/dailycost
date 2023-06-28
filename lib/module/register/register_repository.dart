import "package:dio/dio.dart";

final dio = Dio();

Future<String> register(String name, String email, String password) async {
  try {
    final response = await dio.post(
      'https://dailycost.my.id/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return response.data['token'];
    } else {
      throw Exception('Failed to Register');
    }
  } catch (e) {
    throw Exception('Failed to Register: $e');
  }
}
