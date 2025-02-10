import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.label,
    this.isEnabled = true,
  });

  final double value;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;
  final String? label;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      isEnabled ? Colors.black : Colors.grey.withOpacity(0.5),
                ),
          ),
          const SizedBox(height: 8),
        ],
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: const Color(0xFFFFEB3B), // Yellow active track
            inactiveTrackColor: Colors.grey[300], // Light gray inactive track
            thumbColor: const Color(0xFFFFEB3B), // Yellow thumb
            overlayColor: const Color(0xFFFFEB3B).withOpacity(0.12),
            trackHeight: 2.0, // Thin track
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 6.0, // Smaller thumb
              elevation: 2.0,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 16.0,
            ),
            trackShape: const RoundedRectSliderTrackShape(),
            disabledActiveTrackColor: Colors.grey.withOpacity(0.3),
            disabledInactiveTrackColor: Colors.grey.withOpacity(0.2),
            disabledThumbColor: Colors.grey.withOpacity(0.4),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: isEnabled ? onChanged : null,
            onChangeEnd: isEnabled ? onChangeEnd : null,
          ),
        ),
      ],
    );
  }
}
