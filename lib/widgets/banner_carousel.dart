
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// This widget displays promotional banners on the Home Page.
class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  // Sample promotional banner information.
  final List<Map<String, String>> banners = const [
    {
      'title': 'NEW SEASON',
      'subtitle': 'Discover your everyday style',
      'image':
      'https://i.pinimg.com/736x/e0/83/57/e083570272a758a98cce243b588a4f59.jpg',
    },
    {
      'title': 'LESS, BUT BETTER',
      'subtitle': 'Simple pieces. Timeless style.',
      'image':
      'https://i.pinimg.com/1200x/04/84/7c/04847c2f6303a4f9dd174feefb5a8bb4.jpg',
    },
    {
      'title': 'YOUR STYLE',
      'subtitle': 'Find something you love',
      'image':
      'https://i.pinimg.com/1200x/0d/6d/0c/0d6d0cfecab61743a8afcd6f16218441.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      // Create one slide for each banner.
      items: banners.map((banner) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Show the banner photograph.
              Image.network(
                banner['image']!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: const Color(0xFFF4F3F1));
                },
              ),

              // Add a subtle dark layer so the text is readable.
              Container(color: Colors.black.withValues(alpha: 0.25)),

              // Promotional text on top of the image.
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      banner['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      banner['subtitle']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),

      // Show one banner at a time and allow swiping.
      options: CarouselOptions(
        height: 230,
        viewportFraction: 0.92,
        enlargeCenterPage: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
      ),
    );
  }
}
