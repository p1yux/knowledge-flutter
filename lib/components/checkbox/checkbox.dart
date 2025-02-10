import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.isEnabled = true,
  });

  final bool value;
  final void Function(bool?)? onChanged;
  final String? label;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? () => onChanged?.call(!value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: isEnabled ? onChanged : null,
              activeColor: const Color(0xFFFFEB3B), // Yellow when checked
              checkColor: Colors.black, // Check mark color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(
                color: isEnabled
                    ? (value ? const Color(0xFFFFEB3B) : Colors.grey)
                    : Colors.grey.withOpacity(0.5),
                width: 1.5,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          if (label != null) ...[
            const SizedBox(width: 8),
            Text(
              label!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color:
                        isEnabled ? Colors.black : Colors.grey.withOpacity(0.5),
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
