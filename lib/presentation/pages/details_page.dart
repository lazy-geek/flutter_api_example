import 'package:flutter/material.dart';
import 'package:flutter_api_example/business_logic/providers.dart';
import 'package:flutter_api_example/data/models/user.dart';
import 'package:flutter_api_example/data/services/user_service.dart';
import 'package:flutter_api_example/presentation/pages/edit_page.dart';
import 'package:flutter_api_example/presentation/widgets/user_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends ConsumerStatefulWidget {
  final int id;
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  late User user;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    user = await UserService.instance.getUserById(widget.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f2f2),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPage(
                          user: user,
                        )));
            getData();
          },
          backgroundColor: Color(0xFF0B6EFE),
          isExtended: true,
          icon: const Icon(
            Icons.edit_outlined,
            color: Colors.white,
          ),
          label: const Text(
            'Edit',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
          )),
      appBar: AppBar(
          backgroundColor: const Color(0xFF0B6EFE),
          actions: [
            IconButton(
              onPressed: () async {
                await UserService.instance.deleteUserById(user.id);
                Navigator.pop(context);
                ref.refresh(usersProvider);
              },
              icon: Icon(
                Icons.delete_outlined,
                size: 28.0,
              ),
            )
          ],
          title: Text(
            'Details',
            style: GoogleFonts.outfit(
              fontSize: 28.0,
              fontWeight: FontWeight.w400,
            ),
          )),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
        child: isLoading
            ? const Center(
                child: const CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Text(
                          'Name: ',
                          style: GoogleFonts.outfit(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        SizedBox(
                          width:
                              ((MediaQuery.of(context).size.width * 65) / 100),
                          child: Text(
                            user.name,

                            // overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Text(
                          'Email: ',
                          style: GoogleFonts.outfit(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        SizedBox(
                          width:
                              ((MediaQuery.of(context).size.width * 65) / 100),
                          child: Text(
                            user.email,

                            // overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Gender: ',
                        style: GoogleFonts.outfit(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        user.gender,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Status: ',
                        style: GoogleFonts.outfit(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        user.status,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
