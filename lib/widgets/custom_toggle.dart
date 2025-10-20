import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  final String value1;
  final String value2;
  final Function(String) onChanged;

  const CustomToggle({
    super.key,
    required this.value1,
    required this.value2,
    required this.onChanged,
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value1; // Default selection
  }

  void _select(String value) {
    setState(() {
      selectedValue = value;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          _buildOption(widget.value1),
          _buildOption(widget.value2),
        ],
      ),
    );
  }

  Widget _buildOption(String value) {
    final bool isSelected = selectedValue == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => _select(value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).primaryColor: Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              // color: isSelected ? Colors.white : Colors.grey[700],
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}