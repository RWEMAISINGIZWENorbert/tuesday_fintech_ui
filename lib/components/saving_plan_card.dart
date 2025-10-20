import 'package:flutter/material.dart';

class SavingPlanCard extends StatelessWidget {
  final Icon icon;
  final String name;
  final String amount;
  String? perAmount;
  SavingPlanCard({
    super.key,
    required this.icon,
    required this.name, 
    required this.amount,
    this.perAmount
    });

  @override
  Widget build(BuildContext context) { 
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    print("The Screen Width $screenWidth");
    return SizedBox(
      width: screenWidth <= 492 ? screenWidth / 3 : screenWidth / 4,
      height: screenHeight <= 714 ? 178.5 : screenHeight / 4,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon
              ],
            ),
            const SizedBox(height: 26),
            Text(name, style: Theme.of(context).textTheme.displaySmall),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    // text: totalAmount.toStringAsFixed(0),
                    text: amount,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                  ),
                 if(perAmount != null)  TextSpan(
                    text: "/$perAmount",
                    style: Theme.of(context).textTheme.displaySmall,
                  ) else const TextSpan(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}