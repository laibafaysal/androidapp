import 'package:flutter/material.dart';

class AnimatedTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Abbreviations',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'StylishFont',
            color: Color(0xFF7C5EBD),
          ),
        ),
        backgroundColor: Color(0xFFF4ED92), // AppBar color
      ),
      backgroundColor: Color(0xFFF4ED92), // Background color for the Scaffold
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF7C5EBD), width: 10), // Border color and width
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            padding: EdgeInsets.all(16.0), // Add padding for better spacing
            child: Column(
              children: [
                // Note Text
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Heres a little cheat sheet for you  🧶✨',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'ItalicFont',
                      color: Color(0xFF7C5EBD),
                      fontWeight: FontWeight.bold
                    //  textAlign: TextAlign.center,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Table
                Table(
                  border: TableBorder(
                    horizontalInside: BorderSide(color: Color(0xFF7C5EBD), width: 2), // Horizontal lines inside the table
                    verticalInside: BorderSide(color: Color(0xFF7C5EBD), width: 2), // Vertical lines inside the table
                  ),
                  columnWidths: {
                    0: FixedColumnWidth(150.0), // Set width for the first column
                    1: FixedColumnWidth(150.0), // Set width for the second column
                  },
                  children: [
                    // Header Row
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFE86BA8)), // Header row color
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Stitch',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'StylishFont', color: Color(0xFF7C5EBD)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'StylishFont', color: Color(0xFF7C5EBD)),
                          ),
                        ),
                      ],
                    ),
                    // Data Rows
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFE86BA8)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('ch', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('chain', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFE86BA8)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('sl st', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('slip stitch', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFE86BA8)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('hdc', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                        Padding(
                          padding : const EdgeInsets.all(8.0),
                          child: Text('half double crochet', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFE86BA8)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('dc', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('double crochet', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFE86BA8)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('sc', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('single crochet', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFE86BA8)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('tr', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('treble crochet', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFE86BA8)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('dtr', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('double treble crochet', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xFFE86BA8)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('yo', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('yarn over', style: TextStyle(fontSize: 16, fontFamily: 'NewFont', color: Colors.white)),
                        ),
                      ],
                    ),
                    // Add more rows as needed
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}