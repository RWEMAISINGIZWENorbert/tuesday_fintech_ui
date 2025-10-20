import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tuesday_fintech_ui/components/saving_plan_card.dart';
import 'package:tuesday_fintech_ui/components/transaction_list_tile.dart';
import 'package:tuesday_fintech_ui/widgets/add_button.dart';
import 'package:tuesday_fintech_ui/components/new_card_button.dart';
import 'package:tuesday_fintech_ui/components/stacked_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipOval(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent, // optional background color
              ),
              child: Image.asset(
                'assets/user01.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
                              const SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                       '${DateTime.now().hour < 12 ? "good morning" : "good afternoon"} ,\n',
                                      style: Theme.of(context).textTheme.displaySmall,
                                    ),
                                    TextSpan(
                                      text: 'rwema',
                                      style: GoogleFonts.poppins(
                                        color: Theme.of(context).hintColor,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             CircleAvatar(
                              backgroundColor: Theme.of(context).cardColor,
                              child: InkWell(
                                onTap: () => {},
                                 child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Icon(
                                      IconlyLight.notification,
                                      size: 24,
                                      fill: 1.0,
                                      color: Theme.of(context).hintColor,
                                    ),
                                    // Badge (replace 3 with your actual count)
                                    Positioned(
                                      right: -12,
                                      top: -9,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF4B2AD6),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        constraints: const BoxConstraints(
                                          minWidth: 16,
                                          minHeight: 16,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            '2',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('Your balance', style: Theme.of(context).textTheme.displaySmall),
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
                          AddButton()  
                        ],
                       )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Wallet',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ), 
                    ),
                    NewCardButton()
                  ],
                )
                ,
                const SizedBox(height: 18),
                StackedCard1(
                   bankName: 'Equity\nBank Rwanda',
                  last4: '7842',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Saving Plan',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ), 
                    ),
                    NewCardButton(label: 'Add New',)
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index){
                     return SavingPlanCard(
                      icon:  index == 0 
                      ? Icon(IconlyLight.chart, color: Color(0xFF4B2AD6), size: 28) 
                      :  index == 1
                      ? Icon(IconlyLight.calendar, color: Color.fromARGB(255, 53, 179, 89), size: 28)
                      : Icon(IconlyLight.wallet, color: Color.fromARGB(255, 190, 147, 5), size: 28),
                      name: 'By Macbook', 
                      amount: "\$100k"
                      );
                  }
                  ),
              ),
              const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions History',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ), 
                    ),
                    Text(
                      'See All',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Color(0xFF4B2AD6),
                        fontSize: 14,
                      ), 
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                 Column(
                  children: List.generate(5, (index) => 
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: TransactionListTile(),
                    )
                  ),
                ),
              ],
            ),
          ),
        );
  }
}