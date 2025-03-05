import 'package:flutter/material.dart';
import 'package:krishak_sathi/constant.dart';

class FarmerProfilePage extends StatelessWidget {
  const FarmerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Farmer Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: GobalColors.PrimaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Farmer Information Section
            Container(
              decoration: BoxDecoration(
                color: GobalColors.PrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green[200],
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Farmer Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: GobalColors.PrimaryColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Email: farmer@example.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Phone: +91 1234567890',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Action Buttons
            _actionButton(
              context: context,
              title: 'Track Soil Tests',
              icon: Icons.science,
              onPressed: () {
                // Navigate to soil tests page
                Navigator.pushNamed(context, '/test-tracker');
              },
            ),
            const SizedBox(height: 15),
            _actionButton(
              context: context,
              title: 'View Reports',
              icon: Icons.article,
              onPressed: () {
                // Navigate to view reports page
                Navigator.pushNamed(context, '/multiple-reports');
              },
            ),
            const SizedBox(height: 15),
            _actionButton(
              context: context,
              title: 'View and Update Address',
              icon: Icons.location_on,
              onPressed: () {
                // Navigate to address update page
                Navigator.pushNamed(context, '/adress-update');
              },
            ),
            const SizedBox(height: 15),
            _actionButton(
              context: context,
              title: 'Logout',
              icon: Icons.logout,
              color: Colors.red,
              onPressed: () {
                // Logout functionality
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),

            const SizedBox(height: 40),

            // Motivational Quote Section
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Icon(
                    Icons.lightbulb,
                    color: Colors.yellow,
                    size: 40,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '"The future of farming lies in sustainable practices and innovation."',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '- Let\'s grow together!',
                          style: TextStyle(
                            fontSize: 14,
                            color: GobalColors.PrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for creating action buttons
  Widget _actionButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
    Color color = GobalColors.PrimaryColor,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
