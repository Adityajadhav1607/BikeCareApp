import 'package:flutter/material.dart';

class GarageLogin extends StatelessWidget {
  const GarageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Banner
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                'assets/garagetools.png', 
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Title
            const Text(
              "Garage Owner Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // Username / Email Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Username / Email",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your username/email",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFF1B2B34),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Password Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFF1B2B34),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Add login logic
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Forgot Password
            TextButton(
              onPressed: () {
                // TODO: Forgot password logic
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
