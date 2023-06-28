import 'package:dailycost/components/login_textfield.dart';
import 'package:dailycost/components/my_button.dart';
import 'package:dailycost/themes/color_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../module/login/login_repository.dart';
// import 'auth_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const String routeName = '/login';
  final dio = Dio();

  //Text Editing Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Sign in METODS

  void signUserIn() async {
    try {
      // Mendapatkan email dan password dari text field
      final email = emailController.text;
      final password = passwordController.text;

      // Memanggil metode login API
      // final response = await login(email, password);

      final response = await dio.post(
        'https://dailycost.my.id/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      // Membuka halaman AuthPage dengan menyertakan accessToken

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        final accessToken = jsonResponse['access_token'];

        Navigator.pushNamed(
          context,
          HomePage.routeName,
          arguments: {
            'isLoggedIn': true,
            'accessToken': accessToken,
          },
        );
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      // Menangani kesalahan login
      print('Failed to login: $e');

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Gagal Masuk'),
            content: Text('Email atau kata sandi salah'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.violet50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 68,
            left: 16,
            right: 19,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // NOTE: Icon Apps
              Text(
                "Daily Cost",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: ColorApp.darkPurple600,
                ),
              ),

              // welcome back
              //lets do planing your finance blablabla
              const SizedBox(
                height: 70,
              ),

              Text(
                'Selamat Datang!',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: ColorApp.darkPurple600,
                ),
              ),
              Text(
                'Mari mulai merencanakan keuangan anda',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorApp.darkPurple600,
                ),
              ),

              // email textfield
              const SizedBox(
                height: 70,
              ),

              Text(
                'Email',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorApp.darkPurple600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              LoginTextField(
                  contoller: emailController,
                  hintText: 'jondoe@gmail.com',
                  obscureText: false),

              const SizedBox(
                height: 24,
              ),

              // pass textfield
              Text(
                'Kata Sandi',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorApp.darkPurple600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              LoginTextField(
                  contoller: passwordController,
                  hintText: 'Kata Sandi Anda',
                  obscureText: true),

              //forgot password
              const SizedBox(
                height: 4,
              ),

              Text(
                'Lupa Kata Sandi?',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorApp.pink600,
                ),
              ),

              // login button
              const SizedBox(
                height: 93,
              ),
              MyButton(
                text: 'Masuk',
                onTap: signUserIn,
              ),
              //or continue with
              const SizedBox(
                height: 12,
              ),
              Text(
                'ATAU MASUK DENGAN',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: ColorApp.darkPurple600,
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              //google + apple sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MyButton(
                      onTap: signUserIn,
                      text: 'Google',
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: MyButton(
                      text: 'Apple',
                      onTap: signUserIn,
                    ),
                  ),
                ],
              ),

              //new arount here? create account
              const SizedBox(
                height: 89,
              ),
              Text(
                'Baru disini? Buat Akun',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorApp.darkPurple600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
