import 'package:flutter/material.dart';
import '../buttons/yellow_button.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.period,
    required this.description,
    required this.onLearnMorePressed,
  });

  final String imageUrl;
  final String title;
  final String period;
  final String description;
  final VoidCallback onLearnMorePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias, // For clean image corners
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left Image
            SizedBox(
              width: 120,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.error_outline),
                  );
                },
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E3A8A),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Period
                    Text(
                      period,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Description
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    // Learn More Button
                    YellowButton(
                      text: 'Learn more',
                      onPressed: onLearnMorePressed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
