
import 'package:flutter/material.dart';

// A reusable widget for one shopping category.
class CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Open the selected category when tapped.
      onTap: onTap,
      child: SizedBox(
        width: 78,
        child: Column(
          children: [
            // Simple circular category icon.
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F3F1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFE5E5E5),
                ),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF171717),
                size: 25,
              ),
            ),

            const SizedBox(height: 8),

            // Category name below the icon.
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF171717),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
