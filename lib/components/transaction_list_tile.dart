import 'package:flutter/material.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
      ),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 25,
          backgroundColor: Color.fromARGB(255, 38, 42, 61),
          child: Icon(
            Icons.shopping_bag_rounded,
            color: Color.fromARGB(255, 96, 85, 139),
            size: 28,
          ),
        ),
        title: const Text(
          'Grocery Shopping',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: const Text(
          'Aug 20, 2023',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        trailing: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\$45.90\n',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'Shopping',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}