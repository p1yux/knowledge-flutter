import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  final bool value;
  final void Function(bool) onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(width: 8),
        ],
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFFFFEB3B), // Yellow color when on
          inactiveTrackColor: Colors.grey[300], // Light gray when off
          inactiveThumbColor:
              Colors.grey[400], // Slightly darker gray for thumb
          activeTrackColor: const Color(0xFFFFF176), // Lighter yellow for track
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}
