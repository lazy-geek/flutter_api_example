import 'package:flutter/material.dart';
import 'package:flutter_api_example/business_logic/providers.dart';
import 'package:flutter_api_example/data/models/user.dart';
import 'package:flutter_api_example/data/services/user_service.dart';
import 'package:flutter_api_example/presentation/widgets/outlined_radio_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class EditPage extends ConsumerStatefulWidget {
  final User user;
  const EditPage({Key? key, required this.user}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends ConsumerState<EditPage> {
  late TextEditingController name;
  late TextEditingController email;
  late int currentGender;
  late int currentStatus;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.user.name);
    email = TextEditingController(text: widget.user.email);
    if (widget.user.gender == 'male') {
      currentGender = 0;
    } else {
      currentGender = 1;
    }

    if (widget.user.status != 'active') {
      currentStatus = 0;
    } else {
      currentStatus = 1;
    }
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f2f2),
      appBar: AppBar(
          backgroundColor: const Color(0xFF0B6EFE),
          title: Text(
            'Edit',
            style: GoogleFonts.outfit(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          )),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: name,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    icon: const Icon(Icons.person_outlined),
                    hintText: 'name',
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
                controller: email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    icon: const Icon(Icons.email_outlined),
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
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedRadioButton(
                    label: 'male',
                    index: 0,
                    current: currentGender,
                    onChange: (int index) {
                      setState(() {
                        currentGender = index;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 2.0,
                  ),
                  OutlinedRadioButton(
                    label: 'female',
                    index: 1,
                    current: currentGender,
                    onChange: (int index) {
                      setState(() {
                        currentGender = index;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedRadioButton(
                    label: 'Active',
                    index: 1,
                    current: currentStatus,
                    onChange: (int index) {
                      setState(() {
                        currentStatus = index;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 2.0,
                  ),
                  OutlinedRadioButton(
                    label: 'InActive',
                    index: 0,
                    current: currentStatus,
                    onChange: (int index) {
                      setState(() {
                        currentStatus = index;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () async {
                    if (email.text.trim() == "" || name.text.trim() == "") {
                      return;
                    }
                    User updatedUser = widget.user.copyWith(
                        email: email.text,
                        gender: currentGender == 0 ? 'male' : 'female',
                        name: name.text,
                        status: currentStatus == 0 ? 'inactive' : 'active');
                    setState(() {
                      isLoading = true;
                    });
                    await UserService.instance.updateUser(updatedUser);
                    setState(() {
                      isLoading = false;
                    });
                    ref.refresh(usersProvider);
                    Navigator.pop(context);
                  },
                  child: Container(
                    // padding: EdgeInsets.symmetric(vertical: 12.0),
                    alignment: Alignment.center,

                    width: 30.w,
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Save',
                                style: GoogleFonts.outfit(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
