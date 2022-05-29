import 'package:flutter/material.dart';
import 'package:flutter_api_example/business_logic/providers.dart';
import 'package:flutter_api_example/presentation/pages/home_page.dart';
import 'package:flutter_api_example/presentation/pages/login_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<bool> isLoggedIn = ref.watch(loginStatusProvider);
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'Flutter Demo',
        home: isLoggedIn.when(
          data: (bool val) {
            if (val) {
              return HomePage();
            }
            return LoginPage(ref: ref);
          },
          error: (_, e) => Center(child: Text('something went wrong')),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
