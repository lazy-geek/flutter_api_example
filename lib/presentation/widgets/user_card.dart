import 'package:flutter/material.dart';
import 'package:flutter_api_example/business_logic/providers.dart';
import 'package:flutter_api_example/data/services/user_service.dart';
import 'package:flutter_api_example/presentation/pages/details_page.dart';
import 'package:flutter_api_example/presentation/pages/edit_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_api_example/data/models/user.dart';
import 'package:sizer/sizer.dart';

class UserCard extends ConsumerWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromARGB(20, 149, 157, 165),
          blurRadius: 24.0,
          offset: Offset(0, 8),
        ),
        // BoxShadow(
        //   color: Color.fromARGB(10, 0, 0, 0),
        //   blurRadius: 50.0,
        //   offset: Offset(0, 10),
        // ),
      ]),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DetailsPage(id: user.id)));
          },

          // highlightColor: Colors.blue,
          // splashColor: Colors.red,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_outlined, size: 20.sp),
                        SizedBox(
                          width: 5.0,
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            user.name,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Icon(Icons.email_outlined, size: 16.sp),
                          SizedBox(
                            width: 5.0,
                          ),
                          SizedBox(
                            width: 65.w,
                            child: Text(
                              user.email,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // IconButton(
                    //   padding: EdgeInsets.zero,
                    //   icon: Icon(
                    //     Icons.delete_outlined,
                    //     size: 28.0,
                    //   ),
                    //   onPressed: () {},
                    //   visualDensity: VisualDensity.compact,
                    // ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await UserService.instance.deleteUserById(user.id);
                        ref.refresh(usersProvider);
                      },
                      child: Container(
                        // padding: EdgeInsets.symmetric(vertical: 12.0),
                        alignment: Alignment.center,
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_outlined,
                              size: 16.sp,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Delete',
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Color.fromARGB(255, 254, 11, 116),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: Color.fromARGB(255, 254, 11, 116),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPage(
                                      user: user,
                                    )));
                      },
                      child: Container(
                        // padding: EdgeInsets.symmetric(vertical: 12.0),
                        alignment: Alignment.center,

                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit_outlined,
                              size: 16.sp,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Edit',
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
