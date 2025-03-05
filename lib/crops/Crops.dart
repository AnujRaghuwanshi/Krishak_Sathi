import 'package:flutter/material.dart';

class SelectCropsPage extends StatefulWidget {
  const SelectCropsPage({super.key});

  @override
  _SelectCropsPageState createState() => _SelectCropsPageState();
}

class _SelectCropsPageState extends State<SelectCropsPage> {
  // Sample crop data
  final List<Map<String, String>> crops = [
    {'name': 'Wheat', 'image': 'assets/images/wheat.jpeg'},
    {'name': 'Rice', 'image': 'assets/images/rice.jpeg'},
    {'name': 'Maize', 'image': 'assets/images/maize.jpg'},
    {'name': 'Sugarcane', 'image': 'assets/images/sugarcane.jpg'},
    {'name': 'Cotton', 'image': 'assets/images/cotton.jpg'},
    {'name': 'Mustard', 'image': 'assets/images/mustard.jpg'},
    {'name': 'Soybean', 'image': 'assets/images/soybean.jpeg'},
    {'name': 'Barley', 'image': 'assets/images/barley.jpg'},
  ];

  // Keep track of selected crops
  final Set<String> selectedCrops = {};

  // Toggle crop selection
  void toggleCropSelection(String cropName) {
    setState(() {
      if (selectedCrops.contains(cropName)) {
        selectedCrops.remove(cropName);
      } else {
        selectedCrops.add(cropName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Crops'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Grid view of crops
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two crops per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: crops.length,
                itemBuilder: (context, index) {
                  final crop = crops[index];
                  final isSelected = selectedCrops.contains(crop['name']!);

                  return GestureDetector(
                    onTap: () => toggleCropSelection(crop['name']!),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green[100] : Colors.white,
                        border: Border.all(
                          color: isSelected
                              ? Colors.green[700]!
                              : Colors.grey[300]!,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Placeholder image for the crop
                          // Replace with actual images in your assets folder
                          Image.asset(
                            crop['image']!,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            crop['name']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  isSelected ? Colors.green[700] : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Proceed button
            ElevatedButton(
              onPressed: () {
                // Action on button press
                if (selectedCrops.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Selected Crops: ${selectedCrops.join(", ")}',
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select at least one crop.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
              ),
              child: const Text(
                'Proceed',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
