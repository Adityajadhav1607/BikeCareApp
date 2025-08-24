import 'package:bike_service_app/garageScreens/garage_login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterGarage extends StatefulWidget {
  const RegisterGarage({super.key});

  @override
  State<RegisterGarage> createState() => _RegisterGarageState();
}

class _RegisterGarageState extends State<RegisterGarage> {
  final TextEditingController garageName = TextEditingController();
  final TextEditingController garageAddress = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  final TextEditingController gEmail = TextEditingController();
  final TextEditingController garageDesc = TextEditingController();
  final TextEditingController operatingHours = TextEditingController();
  final TextEditingController gPassword = TextEditingController();

  bool isLoading = false;

  Future<void> registerGarage() async {
    try {
      setState(() => isLoading = true);

      // Firebase Auth registration
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: gEmail.text.trim(),
        password: gPassword.text.trim(),
      );

      // Firestore save
      await FirebaseFirestore.instance
          .collection("garage")
          .doc(userCredential.user!.uid)
          .set({
        "garageName": garageName.text.trim(),
        "address": garageAddress.text.trim(),
        "contactNumber": contactNumber.text.trim(),
        "email": gEmail.text.trim(),
        "description": garageDesc.text.trim(),
        "operatingHours": operatingHours.text.trim(),
        "createdAt": Timestamp.now(),
      });

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const GarageLogin()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = "Something went wrong";
      if (e.code == 'email-already-in-use') {
        message = "Email is already in use";
      } else if (e.code == 'weak-password') {
        message = "Password is too weak";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1A23),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "List Your Garage",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(controller: garageName, label: "Garage Name"),
            const SizedBox(height: 12),
            _buildTextField(controller: garageAddress, label: "Address"),
            const SizedBox(height: 12),
            _buildTextField(
                controller: contactNumber,
                label: "Contact Number",
                keyboardType: TextInputType.phone),
            const SizedBox(height: 12),
            _buildTextField(
                controller: gEmail,
                label: "Email",
                keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 12),
            _buildTextField(
                controller: gPassword,
                label: "Password",
                keyboardType: TextInputType.visiblePassword),
            const SizedBox(height: 12),
            _buildTextField(
                controller: garageDesc, label: "Description", maxLines: 4),
            const SizedBox(height: 12),
            _buildTextField(
                controller: operatingHours,
                label: "Operating Hours (e.g. 9AM-6PM)"),
            const SizedBox(height: 24),

            const Text(
              "Upload Garage Photos",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text("Add Photos",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("Showcase your garage and facilities",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Upload logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B2B34),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Upload",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : registerGarage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1B2B34),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
