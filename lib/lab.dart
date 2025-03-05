import 'package:flutter/material.dart';
import 'package:krishak_sathi/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            Colors.green, // Set the theme color (Green for agriculture)
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[700], // Custom AppBar color
        ),
        textTheme: const TextTheme(),
      ),
      home: LabsPage(),
    );
  }
}

class LabsPage extends StatelessWidget {
  // A sample list of labs in Bhopal (this can be fetched from a database or API)
  final List<Map<String, String>> labs = [
    {
      'name': 'Bhopal Soil Testing Lab 1',
      'address': 'gandhi Nagar, Bhopal',
      'contact': '123-456-7890',
    },
    {
      'name': 'Bhopal Soil Testing Lab 2',
      'address': 'narela, Bhopal',
      'contact': '123-456-7891',
    },
    {
      'name': 'Bhopal Soil Testing Lab 3',
      'address': 'indra Puri, Bhopal',
      'contact': '123-456-7892',
    },
    {
      'name': 'Bhopal Soil Testing Lab 4',
      'address': 'lal ghati, Bhopal',
      'contact': '123-456-7892',
    },
    {
      'name': 'Bhopal Soil Testing Lab 5',
      'address': 'Minal road, Bhopal',
      'contact': '123-456-7892',
    },
    {
      'name': 'Bhopal Soil Testing Lab 6',
      'address': 'Ayodhya Nagar, Bhopal',
      'contact': '123-456-7892',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labs in Bhopal'),
        foregroundColor: Colors.white,
        backgroundColor: GobalColors.PrimaryColor,
      ),
      body: ListView.builder(
        itemCount: labs.length,
        itemBuilder: (context, index) {
          final lab = labs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20), // Rounded corners for the card
            ),
            elevation: 10, // Add some shadow for a floating effect
            color: Colors.green[50], // Light green background for the card
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(lab['name']!),
                      content: Text(
                          'Address: ${lab['address']}\nContact: ${lab['contact']}'),
                      actions: [
                        TextButton(
                          onPressed: () => {},
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side with lab details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lab['name']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green, // Dark green for title
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            lab['address']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey, // Darker grey for address
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Contact: ${lab['contact']}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey, // Lighter grey for contact
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Enhanced Arrow button
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(lab['name']!),
                              content: Text(
                                  'Address: ${lab['address']}\nContact: ${lab['contact']}'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green[700], // Dark green background
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ], // Shadow effect for depth
                        ),
                        padding: const EdgeInsets.all(
                            12.0), // Space inside the button
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/confirm_address');
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white, // White icon for contrast
                            size: 20, // Icon size
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
