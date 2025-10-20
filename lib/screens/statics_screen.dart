import 'package:flutter/material.dart';
import 'package:tuesday_fintech_ui/components/payment_card.dart';
import 'package:tuesday_fintech_ui/components/total_earning_card.dart';
import 'package:tuesday_fintech_ui/widgets/custom_toggle.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pushNamed(context, '/app'),
          child: Container(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              child: Center(
                 child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 20
                 ),
              ),
            ),
          ),
        ),
         title: const Text('Statics'),
         centerTitle: true,
         actions: [
          Container(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            child: Center(
               child: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
                size: 20,
               ),
            ),
                    ),
          )
         ],
       ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                 CustomToggle(
                  value1: 'Income', 
                  value2: 'Spending', 
                  onChanged: (value){}
                  ),
                const SizedBox(height: 20,), 
                TotalEarningCard(),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payments', style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),),
                   Text('see more', style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Theme.of(context).primaryColor),),              
                  ],
                ),
                const SizedBox(height: 20,), 
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: 2,
                     itemBuilder: (context, index){
                       if(index == 0)  {
                        return   PaymentCard(
                                //  icon: Icon(Icons.trending_down, color: Theme.of(context).primaryColor,),
                                 icon: 'assets/behance.png',
                                 name: 'Behance',
                                 amount: '\$5,200.00',
                                 date: 'Aug 20, 2023',
                     ); } else{
                     return PaymentCard(
                      icon: "assets/upwork.png",
                      name: 'Upwork',
                      amount: '\$3,200.00',
                      date: 'Aug 21, 2023'
                      );}
                    }),
                 ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 2,
                                    itemBuilder: (context, index){
                                 if( index == 0 ) { return PaymentCard(
                           icon: 'assets/github.png',
                           name: 'github',
                           amount: '\$5,200.00',
                           date: 'Aug 20, 2023',
                                    ); }else {
                                       return PaymentCard(
                                      icon: 'assets/dribble.png',
                                      name: 'Dribble',
                                      amount: '\$5,200.00',
                                      date: 'Aug 20, 2023',
                                    );
                                    }
                               }),
                  ),
                  // child: GridView.count(
                  //           scrollDirection: Axis.vertical,
                  //           crossAxisCount: MediaQuery.of(context).size.width > 700 ? 4 : 2,
                  //           crossAxisSpacing: 16,
                  //           mainAxisSpacing: 16,
                  //           childAspectRatio: 1.1,
                  //           children: [
                  //             PaymentCard(
                  //               icon: Icon(Icons.trending_down, color: Theme.of(context).primaryColor,),
                  //               name: 'Credit Card',
                  //               amount: '\$5,200.00',
                  //               date: 'Aug 20, 2023',
                  //             ),
                  //             PaymentCard(
                  //               icon: Icon(Icons.trending_down, color: Theme.of(context).primaryColor,),
                  //               name: 'Credit Card',
                  //               amount: '\$5,200.00',
                  //               date: 'Aug 20, 2023',
                  //             ),
                  //             PaymentCard(
                  //               icon: Icon(Icons.trending_down, color: Theme.of(context).primaryColor,),
                  //               name: 'Credit Card',
                  //               amount: '\$5,200.00',
                  //               date: 'Aug 20, 2023',
                  //             ),
                  //             PaymentCard(
                  //               icon: Icon(Icons.trending_down, color: Theme.of(context).primaryColor,),
                  //               name: 'Credit Card',
                  //               amount: '\$5,200.00',
                  //               date: 'Aug 20, 2023',
                  //             ),
                  //           ],
                  //    ),
                
              ],
            ),
          ),
        ),
      ), 
    );
  }
}