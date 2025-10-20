import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final Icon icon;
  final String name;
  final String amount;
  final String date;
  const PaymentCard({
    super.key,
    required this.icon,
    required this.name,
    required this.amount,
    required this.date,
    });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return  Container(
       margin: const EdgeInsets.all(8),
       padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
       decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               CircleAvatar(
                backgroundColor: Color.fromARGB(255, 38, 42, 61),
                child:  Center(child: icon),
               ),
               const SizedBox(width: 25),
                Text(
                  name,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
            ],
           ),
           const SizedBox(height: 20,),
           Text(
                  amount,
                   style: Theme.of(context).textTheme.displaySmall!.copyWith(
                       color: Colors.white,
                       fontSize: 30,
                      fontWeight: FontWeight.w700
                     ),
             ),
             const SizedBox(height: 6,),
             Text(date, style: Theme.of(context).textTheme.displaySmall)
         ],
       ),
    );
  }
}