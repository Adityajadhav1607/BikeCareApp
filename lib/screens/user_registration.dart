import 'package:flutter/material.dart';
import 'package:bike_service_app/screens/user_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //seperate storage cloud storage mde save kelela data
  Future<void> storeUserData(String uid, String name, String number) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': emailController.text,
      'name': fullNameController.text,
      'number': phoneController.text,
    });
  }

  Future<void> signUp(BuildContext context, String name, String email,
      int number, String password) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await storeUserData(userCredential.user!.uid, fullNameController.text,
          phoneController.text);

      // If successful
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful!")),
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserLogin()),
        );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Email already registered
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Already registered! Please go to login.")),
        );

        //navigate to Login page automatically
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserLogin()),
        );
      } else {
        // Other Firebase-specific errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Registration failed")),
        );
      }
    } catch (e) {
      // Non-Firebase errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong.")),
      );
    }
  }

  void registerUserUI() {
    // Here you can handle the UI click event (e.g., print controllers)
    print("Full Name: ${fullNameController.text}");
    print("Email: ${emailController.text}");
    print("Phone: ${phoneController.text}");
    print("Password: ${passwordController.text}");
    signUp(context, fullNameController.text, emailController.text,
        phoneController.hashCode, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Create your account",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            _buildTextField("Full Name", controller: fullNameController),
            const SizedBox(height: 16),
            _buildTextField("Email", controller: emailController),
            const SizedBox(height: 16),
            _buildTextField("Phone Number", controller: phoneController),
            const SizedBox(height: 16),
            _buildTextField(
              "Password",
              controller: passwordController,
              obscureText: _obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: registerUserUI,
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserLogin()),
                );
              },
              child: const Text(
                "Already have an account? Sign in",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hintText, {
    bool obscureText = false,
    required TextEditingController controller,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1E2D3A),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
