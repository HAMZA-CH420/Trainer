import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trainer/UiHelper/colorPalette/color_palette.dart';

class TrainerCalendar extends StatefulWidget {
  const TrainerCalendar({super.key});

  @override
  State<TrainerCalendar> createState() => _TrainerCalendarState();
}

class _TrainerCalendarState extends State<TrainerCalendar> {
  DateTime _currentMonth = DateTime.now();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Schedule a Session",
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildDaysOfWeek(),
              _buildCalendarGrid(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('MMMM yyyy').format(_currentMonth),
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                setState(() {
                  _currentMonth = DateTime(
                    _currentMonth.year,
                    _currentMonth.month - 1,
                  );
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                setState(() {
                  _currentMonth = DateTime(
                    _currentMonth.year,
                    _currentMonth.month + 1,
                  );
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDaysOfWeek() {
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) {
        return Expanded(
          child: Center(
            child: Text(
              day,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth = DateUtils.getDaysInMonth(_currentMonth.year, _currentMonth.month);
    final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final offset = firstDayOfMonth.weekday - 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemCount: daysInMonth + offset,
      itemBuilder: (context, index) {
        if (index < offset) {
          return const SizedBox.shrink();
        }

        final day = index - offset + 1;
        final date = DateTime(_currentMonth.year, _currentMonth.month, day);
        final isSelected = _selectedDate != null &&
            _selectedDate!.day == day &&
            _selectedDate!.month == _currentMonth.month &&
            _selectedDate!.year == _currentMonth.year;
        
        final isToday = DateUtils.isSameDay(date, DateTime.now());

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Palette.primaryColor : Colors.transparent,
              shape: BoxShape.circle,
              border: isToday && !isSelected
                  ? Border.all(color: Palette.primaryColor, width: 1)
                  : null,
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: GoogleFonts.poppins(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected || isToday ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
