import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    this.initialDate,
    this.onDateSelected,
    this.selectedDates,
  });

  final DateTime? initialDate;
  final Function(DateTime)? onDateSelected;
  final List<DateTime>? selectedDates;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _currentMonth;
  late final TextStyle _weekDayStyle;

  @override
  void initState() {
    super.initState();
    _currentMonth = widget.initialDate ?? DateTime.now();
  }

  void _onPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month - 1,
        _currentMonth.day,
      );
    });
  }

  void _onNextMonth() {
    setState(() {
      _currentMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month + 1,
        _currentMonth.day,
      );
    });
  }

  bool _isSelected(DateTime date) {
    return widget.selectedDates?.any(
          (selectedDate) =>
              date.year == selectedDate.year &&
              date.month == selectedDate.month &&
              date.day == selectedDate.day,
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(),
        const SizedBox(height: 20),
        _buildWeekDays(),
        _buildCalendarGrid(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFFFFEB3B),
            ),
            onPressed: _onPreviousMonth,
          ),
          Text(
            DateFormat('MMMM yyyy').format(_currentMonth),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
          ),
          IconButton(
            icon: const Icon(
              Icons.chevron_right,
              color: Color(0xFFFFEB3B),
            ),
            onPressed: _onNextMonth,
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDays() {
    final weekDays = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekDays
          .map(
            (day) => SizedBox(
              width: 40,
              child: Text(
                day,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month + 1,
      0,
    ).day;

    final firstDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month,
      1,
    );

    final firstWeekday = firstDayOfMonth.weekday;
    final days = List<Widget>.filled(42, const SizedBox());

    for (var i = 0; i < firstWeekday - 1; i++) {
      days[i] = const SizedBox();
    }

    for (var i = 0; i < daysInMonth; i++) {
      final date = DateTime(
        _currentMonth.year,
        _currentMonth.month,
        i + 1,
      );
      final index = firstWeekday - 1 + i;

      days[index] = _DayCell(
        date: date,
        isSelected: _isSelected(date),
        onTap: () => widget.onDateSelected?.call(date),
      );
    }

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 7,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      children: days,
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.date,
    required this.isSelected,
    this.onTap,
  });

  final DateTime date;
  final bool isSelected;
  final VoidCallback? onTap;

  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFFEB3B)
              : isToday
                  ? const Color(0xFFFFF9C4)
                  : null,
          shape: BoxShape.circle,
          border: isToday && !isSelected
              ? Border.all(color: const Color(0xFFFFEB3B), width: 1)
              : null,
        ),
        child: Center(
          child: Text(
            '${date.day}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isSelected || isToday ? Colors.black : Colors.black87,
                  fontWeight: isSelected || isToday
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }
}
