import 'package:flutter/material.dart';

class FindGarage extends StatelessWidget {
  const FindGarage({super.key});

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
        title: const Text("Find a Garage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1B2B34),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),

            // Filter buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _filterButton("Location"),
                _filterButton("Service Type"),
                _filterButton("Ratings"),
              ],
            ),
            const SizedBox(height: 16),

            // Garage List
            Expanded(
              child: ListView(
                children: [
                  _garageItem(
                    image: "assets/garage1.png",
                    name: "Velocity Cycles",
                    address: "123 Main St, Anytown, 5 miles away",
                    rating: 4.5,
                    reviews: 120,
                    description: "Quick repairs and maintenance",
                  ),
                  _garageItem(
                    image: "assets/garage2.png",
                    name: "Cycle Care",
                    address: "456 Oak Ave, Anytown, 8 miles away",
                    rating: 4.2,
                    reviews: 85,
                    description: "Specialized in electric bikes",
                  ),
                  _garageItem(
                    image: "assets/garage3.png",
                    name: "Bike Fixers",
                    address: "789 Pine Ln, Anytown, 10 miles away",
                    rating: 4.8,
                    reviews: 200,
                    description: "All types of bikes, expert mechanics",
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

  static Widget _filterButton(String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1B2B34),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          const Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
    );
  }

  static Widget _garageItem({
    required String image,
    required String name,
    required String address,
    required double rating,
    required int reviews,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Garage Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          // Garage Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(address, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text("$rating",
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(width: 4),
                    Text("• $reviews reviews",
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(description,
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
