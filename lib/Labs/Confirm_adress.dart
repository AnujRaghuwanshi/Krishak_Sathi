import 'package:flutter/material.dart';
import 'package:krishak_sathi/constant.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Sample lab data to simulate a lab booking
  final Map<String, String> lab = {
    'name': 'Bhopal Soil Testing Lab 1',
    'address': 'Address 1, Bhopal',
    'contact': '123-456-7890',
    'services': 'Soil testing, Nutrient analysis, Fertilizer recommendations',
  };

  // Variable to store selected payment method
  String? selectedPaymentMethod;

  // Method to update selected payment method
  void selectPaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Lab Booking'),
        foregroundColor: Colors.white,
        backgroundColor: GobalColors.PrimaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Card for Lab Details
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lab Name: ${lab['name']}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Address: ${lab['address']}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Contact: ${lab['contact']}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Services: ${lab['services']}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Payment Method Selection
              const Text(
                'Select Payment Method:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PaymentOption(
                    icon: Icons.qr_code,
                    label: 'QR Code',
                    isSelected: selectedPaymentMethod == 'QR Code',
                    onTap: () {
                      selectPaymentMethod('QR Code');
                    },
                  ),
                  const SizedBox(width: 20),
                  PaymentOption(
                    icon: Icons.attach_money,
                    label: 'Cash',
                    isSelected: selectedPaymentMethod == 'Cash',
                    onTap: () {
                      selectPaymentMethod('Cash');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Full-Width Confirm Booking Button with Rounded Rectangle
              Container(
                width: double.infinity, // Make the button span the entire width
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedPaymentMethod != null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Booking Confirmed'),
                            content: const Text(
                                'Your lab booking has been confirmed!'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // If no payment method is selected, show a warning
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content:
                                const Text('Please select a payment method.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    'Confirm Booking',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    backgroundColor: GobalColors.PrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    elevation: 6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget for displaying payment options with color change
class PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOption({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[300] : Colors.green[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isSelected ? Colors.green[700]! : Colors.green[700]!,
              width: 1),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.green[700]),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.green[700],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
