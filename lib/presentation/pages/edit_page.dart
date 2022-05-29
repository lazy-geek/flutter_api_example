import 'package:flutter/material.dart';
import 'package:flutter_api_example/data/models/user.dart';
import 'package:flutter_api_example/data/services/user_service.dart';
import 'package:flutter_api_example/presentation/widgets/outlined_radio_button.dart';
import 'package:flutter_api_example/presentation/widgets/user_card.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPage extends StatefulWidget {
  final User user;
  const EditPage({Key? key, required this.user}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
              fontSize: 28.0,
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
                decoration: InputDecoration(
                    icon: Icon(Icons.person_outlined),
                    hintText: 'name',
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
                controller: email,
                decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined),
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
                  SizedBox(
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
              SizedBox(
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
                  SizedBox(
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
                height: ((MediaQuery.of(context).size.height * 35) / 100),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () async {
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
                  },
                  child: Container(
                    // padding: EdgeInsets.symmetric(vertical: 12.0),
                    alignment: Alignment.center,

                    width: ((MediaQuery.of(context).size.width * 30) / 100),
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Save',
                                style: GoogleFonts.outfit(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
