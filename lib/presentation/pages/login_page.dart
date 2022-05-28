import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    width: (MediaQuery.of(context).size.width * 90) / 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    SvgPicture.asset('assets/login-art.svg'),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Login',
                      style: GoogleFonts.outfit(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'email',
                          hintStyle: GoogleFonts.outfit(
                            fontSize: 18.0,
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
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: GoogleFonts.outfit(
                            fontSize: 18.0,
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
                    SizedBox(
                      height: 40.0,
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        child: Text(
                          'Login',
                          style: GoogleFonts.outfit(
                            fontSize: 28.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF0B6EFE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: Color(0xFF0B6EFE),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SvgPicture.asset(
                'assets/bg-waves.svg',
                alignment: Alignment.bottomCenter,
                allowDrawingOutsideViewBox: true,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 30) / 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
