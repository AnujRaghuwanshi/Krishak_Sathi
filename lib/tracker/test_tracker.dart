import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TestTracker extends StatelessWidget {
  const TestTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoilTestTracker(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(),
      ),
    );
  }
}

class SoilTestTracker extends StatelessWidget {
  final List<Map<String, dynamic>> stages = [
    {
      "stage": "Request Submitted",
      "date": "27 Nov 2024, 10:00 AM",
      "description": "The farmer's request for a soil test has been submitted.",
      "completed": true,
    },
    {
      "stage": "Sample Collected",
      "date": "28 Nov 2024, 02:30 PM",
      "description":
          "The lab technician visited the farmer's location and collected the soil sample.",
      "completed": true,
    },
    {
      "stage": "Lab Processing",
      "date": "29 Nov 2024, 09:00 AM",
      "description":
          "The soil sample is currently being analyzed in the lab for its nutrient content.",
      "completed": false,
    },
    {
      "stage": "Report Ready",
      "date": "Expected: 30 Nov 2024",
      "description":
          "The soil test report will be available for review and download.",
      "completed": false,
    },
  ];

  SoilTestTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Soil Test Tracker"),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress Bar
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: LinearProgressIndicator(
              value: _calculateProgress(),
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 8,
            ),
          ),
          // Timeline
          Expanded(
            child: ListView.builder(
              itemCount: stages.length,
              itemBuilder: (context, index) {
                final stage = stages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: TimelineTile(
                      alignment: TimelineAlign.start,
                      isFirst: index == 0,
                      isLast: index == stages.length - 1,
                      indicatorStyle: IndicatorStyle(
                        width: 30,
                        color: stage['completed'] ? Colors.green : Colors.grey,
                        iconStyle: IconStyle(
                          iconData: stage['completed']
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: Colors.white,
                        ),
                      ),
                      beforeLineStyle: LineStyle(
                        color: stage['completed'] ? Colors.green : Colors.grey,
                        thickness: 3,
                      ),
                      endChild: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  stage['completed']
                                      ? Icons.check_circle_outline
                                      : Icons.pending,
                                  color: stage['completed']
                                      ? Colors.green
                                      : Colors.grey,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  stage['stage'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: stage['completed']
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              stage['date'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              stage['description'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  double _calculateProgress() {
    final completedStages = stages.where((stage) => stage['completed']).length;
    return completedStages / stages.length;
  }
}
