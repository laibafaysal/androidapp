import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0; // counter variable

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0; // Reset the counter to 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4ED92),
      appBar: AppBar(
        title: Text(
          'Stitch Counter',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'StylishFont',
            color: Color(0xFF7C5EBD),
          ),
        ),
        backgroundColor: Color(0xFFF4ED92),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF7C5EBD)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your stitch count is',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                fontFamily: 'ItalicFont',
                color: Color(0xFF7C5EBD),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE86BA8),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Color(0xFFE86BA8),
                    side: BorderSide(color: Color(0xFFEACA6D), width: 4),
                  ),
                  child: Icon(Icons.remove, color: Colors.white, size: 30),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Color(0xFFE86BA8),
                    side: BorderSide(color: Color(0xFFEACA6D), width: 4),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 30),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: _resetCounter,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Color(0xFFE86BA8),
                    side: BorderSide(color: Color(0xFFEACA6D), width: 4),
                  ),
                  child: Icon(Icons.refresh, color: Colors.white, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}