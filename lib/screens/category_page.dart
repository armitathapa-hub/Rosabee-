
import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../widgets/product_card.dart';
import 'product_details_page.dart';

// Display products in the selected category.
class CategoryPage extends StatelessWidget {
  final String categoryName;

  // The category selected by the user.
  const CategoryPage({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    // Keep only products that match the selected category.
    final categoryProducts = products
        .where((product) => product.category == categoryName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: categoryProducts.isEmpty
      // Display a message if the category has no products.
          ? const Center(
        child: Text('No products available in this category.'),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the category title and product count.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  '${categoryProducts.length} products',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Display filtered products in two columns.
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categoryProducts.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 16,
                childAspectRatio: 0.48,
              ),
              itemBuilder: (context, index) {
                final product = categoryProducts[index];

                return ProductCard(
                  product: product,
                  onTap: () {
                    // Navigate to the selected product's details.
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
        ],
      ),
    );
  }
}
