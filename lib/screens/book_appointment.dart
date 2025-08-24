import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookAppointment extends StatefulWidget {
  final String garageId;
  final String garageName;
  final String garageAddress;

  const BookAppointment({
    super.key,
    required this.garageId,
    required this.garageName,
    required this.garageAddress,
  });

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _selectedTime = "12:00 PM";

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
        title: const Text("Book Appointment",
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Selection
            const Text("Select Service",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1B2B34),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.pedal_bike,
                        color: Colors.cyan, size: 24),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bike Service",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("Full service",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Calendar
            const Text("Select Date",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
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
                selectedDecoration: BoxDecoration(
                    color: Colors.cyan, shape: BoxShape.circle),
                defaultTextStyle: TextStyle(color: Colors.white),
                weekendTextStyle: TextStyle(color: Colors.white),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(color: Colors.white),
                leftChevronIcon:
                    Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon:
                    Icon(Icons.chevron_right, color: Colors.white),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Time Selection
            const Text("Select Time",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _timeButton("9:00 AM"),
                _timeButton("10:00 AM"),
                _timeButton("11:00 AM"),
                _timeButton("12:00 PM"),
              ],
            ),
            const SizedBox(height: 16),

            // Garage Details (Dynamic)
            const Text("Garage Details",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B2B34),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      const Icon(Icons.store, color: Colors.cyan, size: 24),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.garageName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text(widget.garageAddress,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Total Cost (hardcoded for now)
            const Text("Total Cost",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 4),
            const Text("\$50",
                style: TextStyle(color: Colors.white, fontSize: 18)),

            const SizedBox(height: 24),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _confirmBooking,
                child: const Text("Confirm Booking",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
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

  Widget _timeButton(String time) {
    final isSelected = _selectedTime == time;
    return ChoiceChip(
      label: Text(time),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedTime = time;
        });
      },
      selectedColor: Colors.cyan,
      backgroundColor: const Color(0xFF1B2B34),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.white70,
      ),
    );
  }

  Future<void> _confirmBooking() async {
    if (_selectedDay == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a date")),
      );
      return;
    }

    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance.collection("appointments").add({
        "userId": currentUser?.uid, // ✅ Added userId
        "garageId": widget.garageId,
        "garageName": widget.garageName,
        "garageAddress": widget.garageAddress,
        "service": "Bike Service - Full Service",
        "date": _selectedDay!.toIso8601String(),
        "time": _selectedTime,
        "createdAt": DateTime.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Booking confirmed!")),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
}
