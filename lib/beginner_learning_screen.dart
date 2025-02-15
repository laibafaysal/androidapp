import 'package:flutter/material.dart';
import 'CategorySelector.dart';
import 'project.dart';
import 'counter_screen.dart';
import 'abbreviation_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeginnerLearningScreen extends StatefulWidget {
  @override
  _BeginnerLearningScreenState createState() => _BeginnerLearningScreenState();
}

class _BeginnerLearningScreenState extends State<BeginnerLearningScreen> {
  String selectedCategory = 'Animal';

  // Sample data for each category
  final List<Project> animalProjects = [
    Project('BIRD', 'A small bird crochet project', 'assets/birdy.jpg'),
    Project('BUNNY', 'A cute bunny crochet project', 'assets/bunny.jpg'),
    Project('CAT', 'An easy cat crochet project', 'assets/cat.jpg'),
    Project('DUCKLING', 'A fun duckling to crochet', 'assets/duckling.jpg'),
    Project('ELEPHANT', 'Crochet a small elephant keychain', 'assets/elephantKey.jpg'),
    Project('FROG', 'A simple frog crochet project', 'assets/froggi.jpg'),
    Project('PENGUIN', 'Crochet a cute penguin', 'assets/penguin.jpg'),
   // Project('Turtle', 'A tiny turtle crochet project', 'assets/turtle.jpg'),
  ];

  final List<Project> clothingProjects = [
   Project('BEANIE', 'An easy crochet beanie project', 'assets/beanie.jpg'),
   Project('CROP TOP', 'A beautiful crocheted crop Top', 'assets/cropTop.jpg'),
   Project('EAR WARMERS', 'A cozy beginner-friendly ear warmer', 'assets/earWarmers.jpg'),
   Project('GLOVES', 'Crochet a pair of basic gloves', 'assets/gloves.jpg'),
   Project('PAIR OF SOCKS', 'Learn to crochet a simple tank Top', 'assets/socks.jpg'),
   Project('SCARF', 'A basic crochet scarf', 'assets/scarf.jpg'),
   Project('SHRUG', 'An easy-to-make shrug', 'assets/shrug.jpg'),
   Project('SKIRT', 'A beginner crochet skirt', 'assets/skirt.jpg'),

  ];

  final List<Project> accessoriesProjects = [
    Project('BOOKMARK', 'A small crochet bookmark project', 'assets/bookmark.jpg'),
    Project('BOW KEYCHAIN', 'A quick and easy bow keychain', 'assets/bow.jpg'),
    Project('BRACELET', 'Crochet a simple bracelet', 'assets/bracelet.jpg'),
    Project('COASTER', 'A basic crochet coaster', 'assets/coaster.jpg'),
    Project('EARRINGS', 'Stylish crochet earrings', 'assets/earrings.jpg'),
    Project('HEART KEYCHAIN', 'An easy crochet heart keychain', 'assets/heart.jpg'),
    Project('SCRUNCHY', 'A cute crochet scrunchy', 'assets/scrunchie.jpg'),
   // Project('Wallet', 'Crochet a small wallet', 'assets/wallet.jpg'),
   // Project('Bow', 'A simple bow accessory', 'assets/bow.jpg'),
   // Project('Hat Band', 'A decorative crochet hat band', 'assets/hatband.jpg'),
 ];

  // Function to return projects based on the selected category
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
          'Beginner Level',
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

          // Middle Section: Scrollable Content
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: selectedProjects.length,
              itemBuilder: (context, index) {
                final project = selectedProjects[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the details screen with the selected project details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BeginnerLearningScreenDetails(
                          project: project,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFFE86BA8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          project.imagePath,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
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


class BeginnerLearningScreenDetails extends StatelessWidget {
  final Project project;

  BeginnerLearningScreenDetails({Key? key, required this.project}) : super(key: key);

  // Fetch the tutorial for the given project title
  Future<String> fetchTutorialFromFirestore(String title) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('beginner_level') // The collection in Firestore
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
                //  fontFamily: 'StylishFont',
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
