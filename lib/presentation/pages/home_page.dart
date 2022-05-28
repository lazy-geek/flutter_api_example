import 'package:flutter/material.dart';
import 'package:flutter_api_example/data/models/user.dart';
import 'package:flutter_api_example/data/services/user_service.dart';
import 'package:flutter_api_example/presentation/widgets/user_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf2f2f2),
      appBar: AppBar(
          backgroundColor: const Color(0xFF0B6EFE),
          title: Text(
            'Home',
            style: GoogleFonts.outfit(
              fontSize: 28.0,
              fontWeight: FontWeight.w400,
            ),
          )),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
        child: FutureBuilder(
          future: UserService.instance.getAllUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data == null) {
              return Container();
            } else if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(user: snapshot.data![index]);
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: const CircularProgressIndicator(),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
