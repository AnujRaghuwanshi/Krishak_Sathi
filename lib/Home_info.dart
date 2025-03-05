import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:krishak_sathi/constant.dart';

class HomePageInfo extends StatefulWidget {
  const HomePageInfo({super.key});

  @override
  State<HomePageInfo> createState() => _HomePageInfoState();
}

class _HomePageInfoState extends State<HomePageInfo> {
  // List of images for the carousel
  final List<String> imageList = [
    'assets/images/farmer1.jpg',
    'assets/images/farmer2.jpg',
    'assets/images/farmer3.jpg',
  ];

  // List of news articles related to agriculture and farmers
  final List<Map<String, String>> newsArticles = [
    {
      'title': 'Government Scheme for Farmers',
      'image': 'assets/images/news1.jpg',
      'description':
          'This scheme helps farmers with financial aid for better crop production.',
    },
    {
      'title': 'New Agricultural Technology',
      'image': 'assets/images/news2.jpg',
      'description':
          'Learn about new agricultural technology making farming more efficient.',
    },
    {
      'title': 'Farming Tips for Winter',
      'image': 'assets/images/news3.jpg',
      'description':
          'Stay prepared with these essential farming tips for the winter season.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Krishak Sathi',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
        ),
        backgroundColor: GobalColors.PrimaryColor,
        elevation: 5,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // Carousel with farmer images
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 4),
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              viewportFraction: 0.85,
            ),
            items: imageList
                .map((item) => ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(item, fit: BoxFit.cover),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ), // Gradient overlay
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              'Inspiring Farmer Stories',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.8),
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),

          // Section heading
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'News Related to Agriculture and Farmers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: GobalColors.PrimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // News article cards with enhanced design
          ...newsArticles.map((article) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // News article image with rounded top corners
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      article['image']!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // News title
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      article['title']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  // News description
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      article['description']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  // Read more button
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Placeholder for "Read More" functionality
                      },
                      child: const Text(
                        'Read More',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
