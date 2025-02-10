import 'package:flutter/material.dart';

class YellowButton extends StatelessWidget {
  const YellowButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9F99D), // Lime background color
        borderRadius: BorderRadius.circular(8), // Reduced corner radius
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8), // Matching radius
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF1E3A8A), // Dark blue text
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF1E3A8A), // Dark blue icon
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
