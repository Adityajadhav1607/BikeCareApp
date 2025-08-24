import 'package:bike_service_app/garageScreens/booking_details.dart';
import 'package:bike_service_app/garageScreens/garage_dashboard.dart';
import 'package:bike_service_app/garageScreens/garage_login.dart';
import 'package:bike_service_app/garageScreens/register_garage.dart';
// import 'package:bike_service_app/screens/book_appointment.dart';
import 'package:bike_service_app/screens/find_garage.dart';
import 'package:bike_service_app/screens/homepage.dart';
import 'package:bike_service_app/screens/landing_page.dart';
import 'package:bike_service_app/screens/user_login.dart';
import 'package:bike_service_app/screens/user_logout.dart';
import 'package:bike_service_app/screens/user_profile.dart';
import 'package:bike_service_app/screens/user_registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';  
import 'firebase_options.dart'; 
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const BikeServiceApp());
}

class BikeServiceApp extends StatelessWidget {
  const BikeServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Vehicle Servicing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthWrapper(),
      routes: {
        '/landing-page': (context) => const LandingPage(),
        '/home-page': (context) => const HomePage(),
        '/user-login': (context) => const UserLogin(),
        '/user-registration': (context) => const UserRegistration(),
        '/user-profile': (context) => const UserProfile(),
        '/find-garage': (context) => const FindGarage(),
        // '/book-appointment': (context) => const BookAppointment(garageId: garageId, garageName: garageName, garageAddress: garageAddress),
        '/garage-dashboard': (context) => const GarageDashboard(),
        '/garage-login': (context) => const GarageLogin(),
        '/register-garage': (context) => const RegisterGarage(),
        '/booking-details': (context) => const BookingDetails(),
        '/settings-page': (context) => const SettingsPage(),
      },
    );
  }
}


class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          // if User is logged in
          return const HomePage();
        }
        // if User is not logged in
        return const LandingPage();
      },
    );
  }
}
