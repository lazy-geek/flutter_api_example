import 'package:flutter/material.dart';
import 'package:flutter_api_example/business_logic/providers.dart';
import 'package:flutter_api_example/data/services/userpref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  final WidgetRef ref;
  const LoginPage({Key? key, required this.ref}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints.tightFor(
                  width: 90.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    SvgPicture.asset('assets/login-art.svg'),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Login',
                      style: GoogleFonts.outfit(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: username,
                      decoration: InputDecoration(
                          hintText: 'email',
                          hintStyle: GoogleFonts.outfit(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF887E7E),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF887E7E),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: GoogleFonts.outfit(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF887E7E),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF887E7E),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextButton(
                      onPressed: () async {
                        if (username.text == 'admin' &&
                            password.text == 'admin') {
                          await UserPrefService.instance.setLogin(true);
                          widget.ref.refresh(loginStatusProvider);
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'wrong credentials',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        child: Text(
                          'Login',
                          style: GoogleFonts.outfit(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF0B6EFE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(
                            color: Color(0xFF0B6EFE),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SvgPicture.asset(
                'assets/bg-waves.svg',
                alignment: Alignment.bottomCenter,
                allowDrawingOutsideViewBox: true,
                width: MediaQuery.of(context).size.width,
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
