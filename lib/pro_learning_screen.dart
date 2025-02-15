import 'package:flutter/material.dart';
import 'CategorySelector.dart';
import 'project.dart';
import 'counter_screen.dart';
import 'abbreviation_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProLearningScreen extends StatefulWidget {
  @override
  _ProLearningScreenState createState() => _ProLearningScreenState();
}

class _ProLearningScreenState extends State<ProLearningScreen> {
  String selectedCategory = 'Animal'; // Default selected category

  // Separate projects by categories
  final List<Project> animalProjects = [
    Project('KOALA', 'Whats more cute than crocheting a koala', 'assets/koala.jpg'),
    Project('BUTTERFLY', 'Crochet a cute butterfly', 'assets/butterfly.jpg'),
    Project('COW', 'A beginner cow project', 'assets/cow.jpg'),
    Project('ELEPHANT WITH BLANKET', 'how do we make a cozy blanket that has elephant', 'assets/elephantBlanket.jpg'),
    Project('LION', 'A not-to-scare cutsie lion','assets/lion.jpg'),
    Project('GIRAFFE', 'An adorable giraffe crochet toy', 'assets/giraffe.jpg'),
  ];

  final List<Project> clothingProjects = [
    Project('TANK TOP', 'Learn to crochet a simple tank Top', 'assets/tankTop.jpg'),
    Project('CABLE CARDIGAN', 'An easy crochet cardigan project', 'assets/cableCardigan.jpg'),
    Project('LACE DRESS', 'A basic crocheted dress', 'assets/laceDress.jpg'),
    Project('TURTLE NECK', 'Description of Clothing Project 1', 'assets/turtleNeck.jpg'),
    Project('CARDIGAN', 'A simple crocheted cardigan to slay', 'assets/cardigan.jpg'),
    Project('SPIDEY CAP', 'A special cap for MARVEL fans', 'assets/spideyHat.jpg'),
    Project('SWEATER', 'The coziest flowery sweater to style', 'assets/sweater.jpg'),

  ];

  final List<Project> accessoriesProjects = [
    Project('FLOWER FROM TANGLED', 'A flower for TANGLED fan girl', 'assets/flower.jpg'),
    Project('NIGHT FURY', 'So cute to handle night furies from HOW TO TRAIN YOUR DRAGON', 'assets/nightFury.jpg'),
    Project('ANGRY BIRD', 'A very simple to crochet angry bird', 'assets/angryBirds.jpg'),
    Project('TOTE BAG', 'Best tote bag for winters with rapunzel feels', 'assets/toteBag.jpg'),
    Project('RABBIT PLUSHIE', 'An adorable rabbit for warm hugs', 'assets/rabbitPlushie.jpg'),
    Project('TULIP AIRPODS CASE', 'A very cutesy, girly, convenient airpods case', 'assets/tulipCase.jpg'),

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
          'Pro Level',
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
                        builder: (context) => ProLearningDetailsScreen(project: project),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 120, // Adjusted container height
                    decoration: BoxDecoration(
                      color: Color(0xFFE86BA8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // Image
                        Image.asset(
                          project.imagePath,
                          width: 120, // Increased width
                          height: 120, // Increased height
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        // Title and Description
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


// Details Page for Pro Level Projects

class ProLearningDetailsScreen extends StatelessWidget {
  final Project project;

  ProLearningDetailsScreen({Key? key, required this.project}) : super(key: key);

  // Fetch the tutorial for the given project title
  Future<String> fetchTutorialFromFirestore(String title) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('pro_level') // The collection in Firestore
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
                 // fontFamily: 'StylishFont',
                  fontWeight: FontWeight.bold,
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


