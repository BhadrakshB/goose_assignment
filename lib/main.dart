import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goose_flutter_assignment/constants.dart';
import 'package:goose_flutter_assignment/firebase_options.dart';
import 'package:goose_flutter_assignment/pages/profile_settings.dart';
import 'package:goose_flutter_assignment/pages/sign_up_page.dart';
import 'package:provider/provider.dart';

import 'Providers/authentication_handler.dart';
import 'Providers/profile_settings_handler.dart';
import 'Providers/sell_item_handler.dart';
import 'Providers/sign_up_handler.dart';
import 'pages/sell_item_page.dart';
import 'pages/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: UIColors.backgroundColor,
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
          color: UIColors.backgroundColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: UIColors.secondaryColor,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      initialRoute: 'sign_in_page',
      routes: {
        'sign_in_page': (context) => ChangeNotifierProvider(
              create: (context) => AuthenticationHandler(),
              child: const SignInPage(),
            ),
        'profile_settings_page': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (context) => ProfileSettingsHandler()),
                ChangeNotifierProvider(
                    create: (context) => AuthenticationHandler()),
              ],
              child: const ProfileSettingsPage(),
            ),
        'sell_item_page': (context) => ChangeNotifierProvider(
              create: (context) => SellItemHandler(),
              child: const SellItemPage(),
            ),
        'sign_up_page': (context) => ChangeNotifierProvider(
              create: (context) => SignUpHandler(),
              child: SignUpPage(),
            ),
      },
    );
  }
}
