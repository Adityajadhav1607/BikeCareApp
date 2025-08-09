import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1A23),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Picture and Name
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/profileimg.png"), // Replace with your image
            ),
            const SizedBox(height: 12),
            const Text(
              "Ethan Carter",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "Member since 2021",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Personal Information Section
            _buildSectionTitle("Personal Information"),
            _buildInfoRow("Name", "Ethan Carter"),
            _buildInfoRow("Phone Number", "+1 (555) 123-4567"),
            _buildInfoRow("Email", "ethan.carter@email.com"),

            const SizedBox(height: 20),

            // Vehicle Details Section
            _buildSectionTitle("Vehicle Details"),
            _buildInfoRow("Make", "Honda"),
            _buildInfoRow("Model", "CBR600RR"),
            _buildInfoRow("Year", "2020"),

            const SizedBox(height: 20),

            // Saved Addresses Section
            _buildSectionTitle("Saved Addresses"),
            _buildInfoRow("Home", "123 Main St, Anytown, USA"),
            _buildInfoRow("Work", "456 Oak Ave, Anytown, USA"),

            const SizedBox(height: 20),

            // Payment Methods Section
            _buildSectionTitle("Payment Methods"),
            _buildInfoRow("Credit Card", "Visa •••• 1234"),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0E1A23),
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Appointments"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  static Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  static Widget _buildInfoRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Info text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
          // Edit icon
          IconButton(
            onPressed: () {
              // Handle edit action
            },
            icon: const Icon(Icons.edit, color: Colors.grey, size: 20),
          ),
        ],
      ),
    );
  }
}
