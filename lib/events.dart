import 'package:flutter/material.dart';

class EventCalendar extends StatelessWidget {
  const EventCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: const Text('Events'),
        centerTitle: true,
      ),
    );
  }
}
