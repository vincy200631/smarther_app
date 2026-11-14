
import 'package:flutter/material.dart';
import 'list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Category Images
  final List<String> images = const [
    'images/category1.jpg',
    'images/category2.jpg',
    'images/category3.jpg',
    'images/category4.jpg',
    'images/category5.jpg',
    'images/category6.jpg',
    'images/category7.jpg',
    'images/category8.jpg',
    'images/category9.jpg',
    'images/category10.jpg',
    'images/category11.jpg',
    'images/category12.jpg',
    'images/category13.jpg',
    'images/category14.jpg',
    'images/category15.jpg',
  ];

  // Category Names
  final List<String> categories = const [
    'Food App',
    'Ecommerce App',
    'Home Service App',
    'Laundry App',
    'Community App',
    'Learning App',
    'Porter app',
    'Sports App',
    'Beautician app',
    'Pharmacy app',
    'Cab booking app',
    'Social Media app',
    'Food App',
    'E-commerce App',
    'Home Services App',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0866C5),
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 28,
        ),
        title: const Text(
          'SMARTHER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 22,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: images.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 35,
                  childAspectRatio: 0.78,
                ),

                itemBuilder: (context, index) {
                  return GestureDetector(
                    // Open Food App List Screen
                    onTap: () {
                      if (index == 0 || index == 12) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ListScreen(),
                          ),
                        );
                      }
                    },

                    child: Column(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: 0.04,
                                ),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(22),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.contain,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 13),

                        Text(
                          categories[index],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
