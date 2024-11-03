// Component: DateOfBirthField (with DatePicker)
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String text;

  const DatePicker({required this.text ,super.key});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextField(
              decoration: InputDecoration(
                hintText: _selectedDate == null
                    ? 'MM/DD/YYYY'
                    : '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.4),
                    ),
                prefixIcon: const Icon(Icons.calendar_today),
                prefixIconColor: Colors.grey.withOpacity(0.4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}