import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  const CategorySelector({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories.first; // Default to the first category
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.categories.map((category) {
        bool isSelected = selectedCategory == category;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedCategory = category;
              });
              widget.onCategorySelected(category); // Notify parent widget
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Color(0xFFE86BA8) : Color(0xFFEACA6D),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                    color: isSelected ? Color(0xFFE86BA8) : Color(0xFFEACA6D), width: 2),
              ),
              elevation: isSelected ? 15 : 5, // Shadow for selected button
              //shadowColor: isSelected ? Colors.deepPurple : Colors.transparent,
            ),
            child: Text(
              category,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Color(0xFF7C5EBD) : Colors.white,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}