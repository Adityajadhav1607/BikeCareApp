import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1A23),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Booking Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Customer Information",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profileimg.png'), // Replace with actual image path
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Ethan Carter",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("+1-555-123-4567", style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),

            _sectionTitle("Vehicle Details"),
            _infoTile(Icons.motorcycle, "Make & Model", "Honda CBR600RR"),

            _sectionTitle("Service Requested"),
            _infoTile(Icons.build, "Service", "Full Service"),

            _sectionTitle("Appointment Details"),
            _infoTile(Icons.calendar_today, "Date & Time", "10:00 AM"),

            _sectionTitle("Booking Status"),
            Row(
              children: const [
                Icon(Icons.check_circle, color: Colors.cyan),
                SizedBox(width: 8),
                Text("Confirmed", style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 24),

            // Action Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Update status logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Update Status"),
              ),
            ),
            const SizedBox(height: 12),
            _secondaryButton("Contact Customer", () {
              // TODO: Contact logic
            }),
            const SizedBox(height: 8),
            _secondaryButton("View Service History", () {
              // TODO: View history logic
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0E1A23),
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1B2B34),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: Colors.cyan),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              Text(subtitle,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _secondaryButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1B2B34),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
