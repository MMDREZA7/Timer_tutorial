import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_tutorial/pages/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // number of start of timer
  int _number = 5;

  // time line
  void _decreaseNumber() {
    _number = 5;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_number > 0) {
        setState(() {
          _number--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'T I M E R',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // show timer
            Text(
              _number.toString() == '0' ? "DONE" : _number.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),

            const SizedBox(height: 100),

            // button to start timer
            GestureDetector(
              onTap: _decreaseNumber,
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[500],
                ),
                width: 200,
                height: 100,
                child: const Center(
                  child: Text(
                    'S T A R T',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
