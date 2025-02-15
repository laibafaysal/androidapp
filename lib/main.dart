import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'beginner_learning_screen.dart';
import 'skilled_learning_screen.dart';
import 'pro_learning_screen.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(); // Initialize Firebase
  runApp(CrochetApp());
}

class CrochetApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crochet Learning App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        //fontFamily: 'StylishFont',
      ),
      home: WelcomeScreen(),
    );
 }
}


// First Screen: Welcome Screen
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4ED92), // Light pastel yellow background
      body: Column(
        children: [
          Spacer(), // Push logo and text to the center

          // Add padding to the logo to move it to the right
          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: Container(
              width: 200, // Set the width of the image container
              height: 200, // Set the height of the image container
              decoration: BoxDecoration(
                color: Color(0xFFEACA6D),
                border: Border.all(
                  color: Color(0xFFF36091),
                  width: 6.0,
                ),
                borderRadius: BorderRadius.circular(80), // Rounded edges
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  'assets/logo.png', // Path to the logo image
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover, // Ensures the image fits the container
                ),
              ),
            ),
          ),
          SizedBox(height: 60), // Space between logo and text

          // Text under the logo
          Padding(
            padding: const EdgeInsets.only(left: 50.0),

            child: Text(
              'very cutesy,\n\t\t\t\t\t\t\t\t\t\t\t\t\t\tvery demure :)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'ItalicFont',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color(0xFF7C5EBD), // Text color
              ),
            ),
          ),

          Spacer(), // Push the button to the bottom

          // Continue Button
          Padding(
            padding: const EdgeInsets.only(left:80.0,bottom: 50.0), // Adjust space from bottom
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelSelectionScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE86BA8), // Pink button color
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFFEACA6D), // Border color
                    width: 8, // Border width
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'StylishFont',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Second Screen: Level Selection Screen

class LevelSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4ED92), // Consistent pastel yellow background
      appBar: AppBar(
        title: Text(
          'Select Your Level',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'StylishFont',
            color: Color(0xFF7C5EBD), // Purple text color
          ),
        ),
        backgroundColor: Color(0xFFF4ED92),
        elevation: 0, // Removes shadow for a cleaner look
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF7C5EBD),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Beginner Level Button
            _buildLevelButton(
                context,
                'Beginner',
                BeginnerLearningScreen(),
                Icons.emoji_nature_outlined
            ),

            SizedBox(height: 20), // Space between buttons

            // Skilled Level Button
            _buildLevelButton(
                context,
                'Skilled',
                SkilledLearningScreen(),
                Icons.hotel_class_outlined
            ),

            SizedBox(height: 20), // Space between buttons

            // Pro Level Button
            _buildLevelButton(
                context,
                'Pro',
                ProLearningScreen(),
                Icons.emoji_events
            ),
          ],
        ),
      ),
    );
  }

  // consistent level selection buttons
  Widget _buildLevelButton(
      BuildContext context,
      String levelName,
      Widget destinationScreen,
      IconData icon
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        // Navigation to specific learning screen
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => destinationScreen
            ),
          );
        },

        // Button Styling
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFE86BA8),
          padding: EdgeInsets.symmetric(
              horizontal: 60.0,
              vertical: 20.0
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: Color(0xFFEACA6D),
              width: 4,
            ),
          ),
        ),

        // Button Content
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              color: Color(0xFF7C5EBD),
              size: 30,
            ),
            SizedBox(width: 10), // Space between icon and text
            Text(
              levelName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'StylishFont',
                fontSize: 18,
                color: Color(0xFF7C5EBD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




