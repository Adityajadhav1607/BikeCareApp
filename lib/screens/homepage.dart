import 'package:bike_service_app/screens/book_appointment.dart';
import 'package:bike_service_app/screens/find_garage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0E1A23), // Dark background
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1A23),
        elevation: 0,
        title: const Text(
          "BikeCare",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back, Ethan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1E2D3A),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Featured Services
            const Text(
              "Featured Services",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildServiceCard("assets/bike1.png", "Routine Maintenance"),
                  _buildServiceCard("assets/bike2.png", "Repair Services"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Quick Actions
            const Text(
              "Quick Actions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookAppointment()),
                        );
                  },
                  child: const Text("Book Service"),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E2D3A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FindGarage()),
                        );
                  },
                  child: const Text("Find Garage"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Promotions
            const Text(
              "Promotions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/bike3.png",
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                  Container(
                    // color: const Color(0xFF0E1A23),
                    padding: const EdgeInsets.all(8),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Summer Service Special",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Get 20% off on all maintenance services\nValid until August 15",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0E1A23),
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String imagePath, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
      // color: Colors.blue, // Border color
      width: 2,           // Border thickness
    ),
      ),
      child: Column(
        children: [
          Container(
            width: 200,
            // margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2D3A),
              borderRadius: BorderRadius.circular(12),
              
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: 100,
                    width: double.infinity,
                  ),
                ),
                
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
        ],
      ),
    );
  }
}
