import 'package:bike_service_app/garageScreens/garage_dashboard.dart';
import 'package:flutter/material.dart';

class RegisterGarage extends StatelessWidget {
  const RegisterGarage({super.key});

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
            // Form Fields
            _buildTextField(label: "Garage Name"),
            const SizedBox(height: 12),
            _buildTextField(label: "Address"),
            const SizedBox(height: 12),
            _buildTextField(label: "Contact Number", keyboardType: TextInputType.phone),
            const SizedBox(height: 12),
            _buildTextField(label: "Email", keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 12),
            _buildTextField(
              label: "Description",
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            _buildTextField(label: "Operating Hours (e.g. 9AM-6PM)"),
            const SizedBox(height: 24),

            const Text(
              "Upload Garage Photos",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Upload Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "Add Photos",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Showcase your garage and facilities",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
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
                    child: const Text("Upload", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GarageDashboard()),
                        );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable text field widget
  Widget _buildTextField({
    required String label,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
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
