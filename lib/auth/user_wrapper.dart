import 'package:bike_service_app/screens/homepage.dart';
import 'package:bike_service_app/screens/user_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserWrapper extends StatefulWidget {
  const UserWrapper({super.key});

  @override
  State<UserWrapper> createState() => _UserWrapperState();
}

class _UserWrapperState extends State<UserWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context , snapshot){
        if(snapshot.hasData){
          return HomePage();
        }
        else{
          return UserLogin();
        }
      });
  }
}