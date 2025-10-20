import 'package:flutter/material.dart';

class NewCardButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;

  const NewCardButton({
    Key? key,
    this.onTap,
    this.label = 'New Card',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            // color: const Color(0xFF0F1724), // dark pill background
            color: Theme.of(context).scaffoldBackgroundColor, 
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color.fromARGB(60, 70, 69, 69)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                // decoration: BoxDecoration(
                //   shape: BoxShape.circle,
                //   border: Border.all(color: Colors.white24),
                // ),
                child: const Center(
                  child: Icon(Icons.add, size: 18, color: Colors.white),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: theme.textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
