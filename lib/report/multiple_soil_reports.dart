import 'package:flutter/material.dart';
import 'package:krishak_sathi/constant.dart';

class SoilReportsPage extends StatelessWidget {
  // Example list of reports
  final List<Map<String, String>> reports = [
    {"name": "Soil Report 1", "deliveredDate": "2024-11-25"},
    {"name": "Soil Report 2", "deliveredDate": "2024-11-20"},
    {"name": "Soil Report 3", "deliveredDate": "2024-11-15"},
    {"name": "Soil Report 4", "deliveredDate": "2024-11-10"},
  ];

  SoilReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Soil Reports',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: GobalColors.PrimaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: CircleAvatar(
                  backgroundColor: GobalColors.PrimaryColor,
                  child: const Icon(
                    Icons.article,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  report["name"]!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Delivered on: ${report["deliveredDate"]!}",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/report-analyze');
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ReportDetailsPage extends StatelessWidget {
  final String reportName;
  final String deliveredDate;

  const ReportDetailsPage({
    super.key,
    required this.reportName,
    required this.deliveredDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reportName),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Report Name: $reportName",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Delivered Date: $deliveredDate",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Detailed information about the soil report will be displayed here.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
