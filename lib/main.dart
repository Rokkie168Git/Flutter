import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PhoneShopApp());
}

class PhoneShopApp extends StatelessWidget {
  const PhoneShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      colorSchemeSeed: const Color(0xFF4F46E5), // indigo-ish
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(),
    );

    return MaterialApp(
      title: 'PhoneShop',
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
