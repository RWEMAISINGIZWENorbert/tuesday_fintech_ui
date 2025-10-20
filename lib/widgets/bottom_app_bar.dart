import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomAppBarComponent extends StatelessWidget {
  final int currentIndex;
   final Function(int) onItemTapped;
  const BottomAppBarComponent({
    required this.currentIndex,
    required this.onItemTapped,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return  Container(
          // height: screenHeight / 11,
          height: screenHeight  * 0.1,
          width: screenWidth - 120,
          margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
          decoration: BoxDecoration(
            color: Color(0xFF0D0E1A),
            // color: Color.fromARGB(255, 3, 22, 224),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(2, 5),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                 onItemTapped(0);
              },
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF1C1F2E),
                    borderRadius: BorderRadius.circular(60)
                  ),
                  child: Icon(
                    IconlyLight.home, 
                    color: Color(0xFFE7E9F3), size: 28
                    )
                  ),
              ),
              GestureDetector(
                onTap: () => {
                  onItemTapped(1)
                },
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF1C1F2E),
                    borderRadius: BorderRadius.circular(60)
                  ),
                  child: Icon(Icons.bar_chart_rounded,color: Color(0xFFE7E9F3), size: 28)),
              ),
              GestureDetector(
                onTap: () => onItemTapped(1),
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF1C1F2E),
                    borderRadius: BorderRadius.circular(60)
                  ),
                  child: Icon(Icons.person_rounded, color: Color(0xFFE7E9F3), size: 28)),
              ),
            ],
          ),
       );
  }
}