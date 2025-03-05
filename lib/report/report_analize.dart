import 'package:flutter/material.dart';

class SoilTestDetailsPage extends StatelessWidget {
  const SoilTestDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded values for the soil test details
    const String testName = "Soil Test 1";
    const String testDate = "2024-11-25";
    const String labName = "Green Agro Lab";
    const String farmerName = "Aman Yadav";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Soil Test Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card showing soil test details
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.science, color: Colors.green[800], size: 30),
                        const SizedBox(width: 10),
                        Text(
                          "Soil Test Details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900],
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1.5, color: Colors.green),
                    const SizedBox(height: 10),
                    _buildDetailRow(Icons.assignment, "Test Name", testName),
                    _buildDetailRow(
                        Icons.calendar_today, "Test Date", testDate),
                    _buildDetailRow(Icons.business, "Lab Name", labName),
                    _buildDetailRow(Icons.person, "Farmer Name", farmerName),
                  ],
                ),
              ),
            ),
            const Spacer(), // Pushes the button to the bottom of the screen

            // Button at the bottom
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Define button action here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Further action triggered!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Analyze",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green[800]),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$label: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green[900],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
