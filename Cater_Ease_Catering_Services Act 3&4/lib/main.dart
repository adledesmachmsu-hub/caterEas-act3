import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/booking_form_screen.dart';
import 'screens/bookings_list_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/chats_screen.dart';
import 'screens/status_screen.dart';
import 'screens/calls_screen.dart';

void main() {
  runApp(const CaterEaseApp());
}

class CaterEaseApp extends StatelessWidget {
  const CaterEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaterEase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: const Color(0xFFFF6B35),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B35),
        ),
        useMaterial3: true,
      ),
      // Named routes implementation (Activity #7)
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/contact': (context) => const ContactScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/booking-form': (context) => const BookingFormScreen(),
        '/bookings-list': (context) => const BookingsListScreen(),
        '/menu': (context) => const MenuScreen(),
        '/chats': (context) => const ChatsScreen(),
        '/status': (context) => const StatusScreen(),
        '/calls': (context) => const CallsScreen(),
      },
    );
  }
}
