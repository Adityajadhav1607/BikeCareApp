import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class GarageDashboard extends StatefulWidget {
  const GarageDashboard({super.key});

  @override
  State<GarageDashboard> createState() => _GarageDashboardState();
}

class _GarageDashboardState extends State<GarageDashboard> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1A23),
        elevation: 0,
        title: const Text("Dashboard", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top stats
            Row(
              children: [
                Expanded(child: _statCard("Upcoming Appointments", "5")),
                const SizedBox(width: 10),
                Expanded(child: _statCard("Average Rating", "4.8")),
              ],
            ),
            const SizedBox(height: 10),
            _fullWidthStatCard("Service Requests", "20"),
            const SizedBox(height: 20),

            // Recent Reviews
            const Text("Recent Reviews",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: const [
                    Text("4.8",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.cyan, size: 16),
                        Icon(Icons.star, color: Colors.cyan, size: 16),
                        Icon(Icons.star, color: Colors.cyan, size: 16),
                        Icon(Icons.star, color: Colors.cyan, size: 16),
                        Icon(Icons.star_half, color: Colors.cyan, size: 16),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text("150 reviews", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      _reviewRow(5, 0.70),
                      _reviewRow(4, 0.20),
                      _reviewRow(3, 0.05),
                      _reviewRow(2, 0.03),
                      _reviewRow(1, 0.02),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Calendar
            const Text("Calendar",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 10),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                selectedDecoration:
                    BoxDecoration(color: Colors.cyan, shape: BoxShape.circle),
                defaultTextStyle: TextStyle(color: Colors.white),
                weekendTextStyle: TextStyle(color: Colors.white),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(color: Colors.white),
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon:
                    Icon(Icons.chevron_right, color: Colors.white),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Quick Actions
            const Text("Quick Actions",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 10),
            _quickAction("Manage Services"),
            _quickAction("Update Garage Details"),
            _quickAction("View Booking History"),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _statCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2B34),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _fullWidthStatCard(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2B34),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  static Widget _reviewRow(int stars, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text("$stars", style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 4),
          const Icon(Icons.star, color: Colors.cyan, size: 14),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              color: Colors.cyan,
              backgroundColor: Colors.white12,
            ),
          ),
          const SizedBox(width: 8),
          Text("${(percent * 100).round()}%",
              style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _quickAction(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1B2B34),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () {},
          child: Text(title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
