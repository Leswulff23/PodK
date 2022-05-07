import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:podk/view/home_page.dart';
import 'package:podk/view/lead_page.dart';
import 'package:podk/view/login_page.dart';
import 'package:podk/view/onboarding_page.dart';
import 'package:podk/view/register_page.dart';
import 'package:podk/view/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:podk/components/bottom_navigation.dart';
import 'package:podk/components/text.dart' as size;
import 'package:podk/components/colors.dart' as color;

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Gilroy-Regular',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const BottomNavigation(),
        '/splash': (context) => const SplashScreen(),
        '/onboard': (context) => const Onboarding(),
        '/lead': (context) => const LeadScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
