import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.isEnabled = true,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? () => onChanged?.call(value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Radio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: isEnabled ? onChanged : null,
              activeColor: const Color(0xFFFFEB3B), // Yellow when selected
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.withOpacity(0.5);
                }
                if (states.contains(MaterialState.selected)) {
                  return const Color(0xFFFFEB3B);
                }
                return Colors.grey;
              }),
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
