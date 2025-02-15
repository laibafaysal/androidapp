import 'package:flutter/material.dart';
import 'CategorySelector.dart';
import 'project.dart';
import 'counter_screen.dart';
import 'abbreviation_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SkilledLearningScreen extends StatefulWidget {
  @override
  _SkilledLearningScreenState createState() => _SkilledLearningScreenState();
}

class _SkilledLearningScreenState extends State<SkilledLearningScreen> {
  String selectedCategory = 'Animal'; // Default selected category

  // Separate projects by categories
  final List<Project> animalProjects = [
    Project('BEE', 'A small bee crochet project', 'assets/bee.jpg'),
    Project('CHAMELEON', 'A cute chameleon crochet project', 'assets/chameleon.jpg'),
    Project('DRAGON', 'An easy dragon crochet project', 'assets/dragon.jpg'),
    Project('ELEPHANT', 'A cutie elephant project', 'assets/elephant.jpg'),
    Project('FOX', 'A fun fox to crochet', 'assets/fox.jpg'),
    Project('HORSE', 'Crochet a small horse', 'assets/horse.jpg'),
    Project('OCTOPUS', 'A simple octopus crochet project', 'assets/octopus.jpg'),
    Project('PEACOCK', 'An adorable peacock crochet toy', 'assets/peacock.jpg'),
    Project('SLOTH', 'Crochet a cute sloth', 'assets/sloth.jpg'),
    Project('TURTLE', 'A tiny turtle crochet project', 'assets/turtle.jpg'),
  ];

  final List<Project> clothingProjects = [

    Project('CAT BEANIE', 'A cozy crocheted cat beanie', 'assets/catBeanie.jpg'),
    Project('DUSTER CARDIGAN', 'Learn to crochet a beautiful duster cardigan', 'assets/dusterCardigan.jpg'),
    Project('HOODED JACKET', 'An adorable hooded jacket', 'assets/hoodedJacket.jpg'),
    Project('JUMPER', 'How to crochet a cute cozy jumper', 'assets/jumper.jpg'),
    Project('MUFFLER', 'Description of Clothing Project 2', 'assets/pinkScarf.jpg'),
    Project('PONCHO', 'A simple cardigan project', 'assets/poncho.jpg'),
    Project('SHORT CARDIGAN', 'Description of Clothing Project 2', 'assets/shortCardigan.jpg'),
  ];

  final List<Project> accessoriesProjects = [
    Project('BACK PACK', 'So cool to carry back pack', 'assets/backpack.jpg'),
    Project('CLUTCH', 'Crochet a simple clutch', 'assets/clutch.jpg'),
    Project('EAR WARMERS', 'A flowery strand to warm your ears', 'assets/earwarmer.jpg'),
    Project('MITTENS', 'A cutie cozy pair of mittens', 'assets/mittens.jpg'),
    Project('NECKLACE', 'Stylish crocheted necklace', 'assets/necklace.jpg'),
    Project('SUN HAT', 'A quick and easy cozy sun hat', 'assets/sunHat.jpg'),
  ];

  // Function to return the selected projects
  List<Project> getSelectedProjects() {
    if (selectedCategory == 'Animal') {
      return animalProjects;
    } else if (selectedCategory == 'Clothing') {
      return clothingProjects;
    } else {
      return accessoriesProjects;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedProjects = getSelectedProjects();

    return Scaffold(
      backgroundColor: Color(0xFFF4ED92),
      appBar: AppBar(
        title: Text(
          'Skilled Level',
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
      body: Column(
        children: [
          // Top Section: Category Selector
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CategorySelector(
              categories: ['Animal', 'Clothing', 'Accessories'],
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
          ),

          // Middle Section: Project List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: selectedProjects.length,
              itemBuilder: (context, index) {
                final project = selectedProjects[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to details screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SkilledLearningScreenDetails(
                          project: project,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 120, // Adjust the container height
                    decoration: BoxDecoration(
                      color: Color(0xFFE86BA8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // Image Widget
                        Image.asset(
                          project.imagePath,
                          width: 120, // Increased width
                          height: 120, // Increased height
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        // Text Description
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NewFont',
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                project.description,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NewFont',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom Section: Buttons for Abbreviation and Counter Screens
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnimatedTableScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE86BA8),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Abbreviations',
                    style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'StylishFont',),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CounterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE86BA8),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Counter',
                    style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'StylishFont',),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class SkilledLearningScreenDetails extends StatelessWidget {
  final Project project;

SkilledLearningScreenDetails({Key? key, required this.project}) : super(key: key);

// Fetch the tutorial for the given project title
Future<String> fetchTutorialFromFirestore(String title) async {
try {
final doc = await FirebaseFirestore.instance
    .collection('skilled_level') // The collection in Firestore
    .doc(title) // The document ID corresponds to the project title
    .get();
if (doc.exists && doc.data() != null) {
      return doc['tutorial']; // Return the tutorial field
     } else {
      return 'Tutorial not found. Please check back later!';
    }
    } catch (e) {
      return 'Error fetching tutorial: $e';
    }
    }

@override
Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Color(0xFFF4ED92),
      appBar: AppBar(
        title: Text(
             'Tutorial',
        style: TextStyle(
        color: Color(0xFF7C5EBD),
        fontWeight: FontWeight.bold,
        fontFamily: 'StylishFont',
        ),
        ),
       backgroundColor: Color(0xFFF4ED92),
      ),
        body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: SingleChildScrollView(
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    // Project Image
      Center(
          child: Container(
           width: 100,
           height: 100,
            padding: EdgeInsets.all(4),
           decoration: BoxDecoration(
            border: Border.all(
           color: Color(0xFFE86BA8),
            width: 8,
       ),
       borderRadius: BorderRadius.circular(10),
         ),
        child: Image.asset(
               project.imagePath,
               width: 100,
               height: 100,
               fit: BoxFit.cover,
         ),
           ),
         ),
         SizedBox(height: 16),
            // Project Title
           Text(
               project.title,
                style: TextStyle(
                   fontSize: 28,
                   fontWeight: FontWeight.bold,
                  //fontFamily: 'StylishFont',
                  color: Color(0xFF7C5EBD),
                ),
                     textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
// Fetch and display the tutorial from Firestore
             FutureBuilder<String>(
                 future: fetchTutorialFromFirestore(project.title),
                builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                   return CircularProgressIndicator(); // Show a loading indicator
              } else if (snapshot.hasError) {
                   return Text(
                          'Error: ${snapshot.error}',
                       style: TextStyle(color: Colors.red),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text(
                            'No tutorial available for this project.',
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                        textAlign: TextAlign.center,
                     );
                  } else {
             return Text(
                   snapshot.data!, // Display the fetched tutorial
                     style: TextStyle(fontSize: 18, color: Colors.black87),
                  textAlign: TextAlign.center,
                  );
                  }
              },
          ),
           ],
        ),
        ),
      ),
    );
   }
}

