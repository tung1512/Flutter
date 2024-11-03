import 'package:flutter/material.dart';

class DropdownField extends StatefulWidget {
  final List<Map<String, String>> items; // Cấu trúc item sẽ là {"value": "Bangladesh", "flag": "assets/flags/bangladesh.png"}
  final String text;

  const DropdownField({required this.text, required this.items, super.key});

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.items.isNotEmpty ? widget.items[0]["value"] : null;
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
        DropdownButtonFormField<String>(
          value: selectedCountry,
          items: widget.items.map((item) {
            return DropdownMenuItem<String>(
              value: item["value"],
              child: Row(
                children: [
                  Image.asset(
                    item["flag"]!,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(item["value"]!),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCountry = newValue;
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
        ),
      ],
    );
  }
}
