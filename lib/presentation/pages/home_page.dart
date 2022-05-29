import 'package:flutter/material.dart';
import 'package:flutter_api_example/business_logic/providers.dart';
import 'package:flutter_api_example/data/models/user.dart';
import 'package:flutter_api_example/data/services/userpref_service.dart';
import 'package:flutter_api_example/presentation/pages/add_page.dart';
import 'package:flutter_api_example/presentation/widgets/user_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<User>> userList = ref.watch(usersProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFf2f2f2),
      appBar: AppBar(
          backgroundColor: const Color(0xFF0B6EFE),
          title: Text(
            'Home',
            style: GoogleFonts.outfit(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  await UserPrefService.instance.setLogin(false);
                  ref.refresh(loginStatusProvider);
                },
                child: Text(
                  'Logout',
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ))
          ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddPage()));
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          )),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
        child: userList.when(
            data: (List<User> users) {
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(user: users[index]);
                },
              );
            },
            error: (_, e) => const Center(child: Text('something went wrong')),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
