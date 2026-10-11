import 'package:flutter/material.dart';

import '../widgets/banner_carousel.dart';
import '../widgets/category_item.dart';
import '../data/product_data.dart';
import '../widgets/product_card.dart';
import 'category_page.dart';
import 'product_details_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // All categories shown on the Home Page.
  final List<Map<String, dynamic>> categories = const [
    {'name': 'Electronics', 'icon': Icons.devices},
    {'name': 'Fashion', 'icon': Icons.checkroom},
    {'name': 'Shoes', 'icon': Icons.directions_run},
    {'name': 'Beauty', 'icon': Icons.spa_outlined},
    {'name': 'Accessories', 'icon': Icons.watch_outlined},
    {'name': 'Home', 'icon': Icons.chair_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rosabee',
          style: TextStyle(
            color: Color(0xFFD5001C),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            tooltip: 'Search',
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Your shopping bag is coming soon!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined),
            tooltip: 'Shopping bag',
          ),
          const SizedBox(width: 8),
        ],
      ),

      // A scrollable Home Page.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Short promotional message.
            Container(
              width: double.infinity,
              color: const Color(0xFFD5001C),
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: const Text(
                'NEW SEASON. NEW POSSIBILITIES.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Promotional image carousel.
            const BannerCarousel(),

            const SizedBox(height: 28),

            // Categories heading.
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'SHOP BY CATEGORY',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Scroll horizontally through categories.
            SizedBox(
              height: 95,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: CategoryItem(
                      name: category['name'] as String,
                      icon: category['icon'] as IconData,
                      onTap: () {
                        // Open the selected category page.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(
                              categoryName: category['name'] as String,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            // Featured products heading.
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'TRENDING NOW',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Display products in two columns.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.48,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCard(
                    product: product,
                    onTap: () {
                      // Open details for the selected product.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
