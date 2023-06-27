import 'package:dailycost/components/login_textfield.dart';
import 'package:dailycost/components/my_button.dart';
import 'package:dailycost/themes/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //Text Editing Controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //Sign in function
  void signUserIn() {}

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
                  contoller: usernameController,
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
