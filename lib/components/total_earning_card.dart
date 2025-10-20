import 'package:flutter/material.dart';
import 'package:tuesday_fintech_ui/graph/bar_graph.dart' show BarGraph;

class TotalEarningCard extends StatelessWidget {
  const TotalEarningCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
       ),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Earnings',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                  '\$79,456.88',
                   style: Theme.of(context).textTheme.displaySmall!.copyWith(
                       color: Colors.white,
                       fontSize: 30,
                      fontWeight: FontWeight.w700
                     ),
             ),
             CircleAvatar(
              backgroundColor: Color.fromARGB(255, 38, 42, 61),
              child: const Icon(
                 Icons.trending_up,
                color: Color(0xFF4B2AD6),
                size: 22,
              ),
             ),
            ],
          ),
          const SizedBox(height: 12),
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
               height: 34,
               width: 80,
               decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 42, 61),
                borderRadius: BorderRadius.circular(18),
               ),
               child: const Center(
                  child: Text('D', style: TextStyle(color: Colors.white),),
               ),
            ),
            const SizedBox(width: 4),
            Container(
               height: 34,
               width: 80,
               decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 42, 61),
                borderRadius: BorderRadius.circular(18),
               ),
               child: const Center(
                  child: Text('W', style: TextStyle(color: Colors.white),),
               ),
            ),
            const SizedBox(width: 4),
            Container(
               height: 34,
               width: 80,
               decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(18),
               ),
               child: Center(
                  child: Text('M', style: TextStyle(color: Colors.white),),
               ),
            ),
            const SizedBox(width: 4),
            Container(
              height: 34,
               width: 80,
               decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 42, 61),
                borderRadius: BorderRadius.circular(18),
               ),
               child: const Center(
                  child: Text('Y', style: TextStyle(color: Colors.white),),
               ),
            ),
          ],
         ),
         const SizedBox(height: 12),
         SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: BarGraph()
          ) 
        ],
       ),
    );
  }
}