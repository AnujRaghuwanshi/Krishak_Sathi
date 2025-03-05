import 'package:flutter/material.dart';
import 'package:krishak_sathi/Home_info.dart';
import 'package:krishak_sathi/lab.dart';
import 'package:krishak_sathi/profile.dart';
import 'package:krishak_sathi/weather_pages/weather_pages.dart';

class GobalColors {
  static const PrimaryColor = Color(0xFF2DB83D); // Define primary color
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Pages for navigation
  final List<Widget> pages = [
    LabsPage(), // Replace with LabStatus()
    HomePageInfo(),
    FarmerProfilePage(), // Replace with ProfilePage()
    WeatherScreen(), // Replace with WeatherPage()
  ];

  int currentIndex = 1; // Default to Home Page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex, // Control which page is displayed
        children: pages, // Pages to navigate between
      ),
      bottomNavigationBar: Container(
        height: 80,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white, // White background for floating effect
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            type:
                BottomNavigationBarType.fixed, // Ensure background color works
            backgroundColor: Colors.white, // Match the container background
            currentIndex: currentIndex,
            selectedItemColor:
                GobalColors.PrimaryColor, // Green for selected items
            unselectedItemColor:
                const Color.fromARGB(255, 0, 0, 0), // Grey for unselected items
            showUnselectedLabels: true,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            onTap: (value) {
              setState(() {
                currentIndex = value; // Update the index on tap
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: 'Lab',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cloud),
                label: 'Weather',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
