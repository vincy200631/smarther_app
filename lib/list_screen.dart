
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  // Restaurant Names
  final List<String> restaurantNames = const [
    'Hurry Bunny',
    'Undu Magzhil',
    "L'Original",
    'Karikadai',
    'Karikadai',
    'Hilarity Inn',
    'Undu Magzhil',
    "L'Original",
    'Karikadai',
    'Karikadai',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      // App Bar
      appBar: AppBar(
        backgroundColor: const Color(0xFF0870BD),
        elevation: 0,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'Food App List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Restaurant List
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 8,
        ),
        itemCount: restaurantNames.length,

        itemBuilder: (context, index) {
          return Container(
            height: 82,
            margin: const EdgeInsets.only(bottom: 7),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),

            child: Row(
              children: [
                // Restaurant Image
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.asset(
                      'images/restaurant${index + 1}.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.restaurant,
                          color: Colors.grey,
                          size: 30,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Restaurant Name
                Expanded(
                  child: Text(
                    restaurantNames[index],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Copy Button
                IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: restaurantNames[index],
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Restaurant name copied'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),

                // Share Button
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Share Restaurant'),
                          content: Text(
                            restaurantNames[index],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
