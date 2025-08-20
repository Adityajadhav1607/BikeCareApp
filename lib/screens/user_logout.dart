import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    // After sign out, redirect to login page
    Navigator.pushReplacementNamed(context, '/user-login');
  }

  Widget _buildListTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/profile.png"), // replace with user image
              radius: 20,
            ),
            title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Edit your profile"),
            onTap: () {},
          ),
          _buildListTile(Icons.notifications_none, "Notifications", "Manage your notification preferences", () {}),
          _buildListTile(Icons.payment, "Payment Methods", "Manage your payment methods", () {}),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Support", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          _buildListTile(Icons.help_outline, "Help Center", "Get help with the app", () {}),
          _buildListTile(Icons.email_outlined, "Contact Us", "Contact us for support", () {}),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Sign Out", style: TextStyle(fontSize: 16)),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3, // Profile tab active
        onTap: (index) {
          // Handle navigation
          if (index == 0) Navigator.pushNamed(context, '/home-page');
          if (index == 1) Navigator.pushNamed(context, '/book-appointment');
          if (index == 2) Navigator.pushNamed(context, '/find-garage');
          if (index == 3) {} // already on Profile
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
