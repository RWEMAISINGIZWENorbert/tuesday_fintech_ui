import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  width: 60,
  height: 60,
  decoration: const BoxDecoration(
    color: Color(0xFF4B2AD6),
    shape: BoxShape.circle,
  ),
  child: const Icon(
    Icons.add,
    color: Colors.white,
    size: 30,
  ),
);

  }
}