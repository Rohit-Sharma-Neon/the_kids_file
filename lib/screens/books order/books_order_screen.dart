import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/common_widgets/animated_list_view_builder.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/screens/books%20order/book_order_details_screen.dart';
import 'package:school_project/screens/books%20order/books_make_order_screen.dart';
import 'package:school_project/utils/sizes.dart';

class BooksOrderScreen extends StatefulWidget {
  const BooksOrderScreen({Key? key}) : super(key: key);

  @override
  State<BooksOrderScreen> createState() => _BooksOrderScreenState();
}

class _BooksOrderScreenState extends State<BooksOrderScreen> {
  final List<Map<String, dynamic>> orderList = [
    {
      'id': '#1234',
      'name': [
        {
          'name': 'Hindi',
          'notebooks': 2,
          'price': 30,
        },
        {
          'name': 'English',
          'notebooks': 2,
          'price': 30,
        },
        {
          'name': 'SocialScience',
          'notebooks': 2,
          'price': 30,
        },
      ],
      'price': 1200.00,
    },
    {
      'id': '#1235',
      'name': [
        {
          'name': 'Hindi',
          'notebooks': 2,
          'price': 30,
        },
        {
          'name': 'English',
          'notebooks': 2,
          'price': 30,
        },
        {
          'name': 'SocialScience',
          'notebooks': 2,
          'price': 30,
        },
      ],
      'price': 1500.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Book Orders",
        actions: [
          GestureDetector(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(context, screen: const BooksMakeOrderScreen());
            },
            child: Neumorphic(
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.only(right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding,top: 20,bottom: 80),
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(context, screen: const OrderDetailsScreen());
              },
              child: AnimatedListViewBuilder(
                index: index,
                child: Neumorphic(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(orderList[index]['id'])),
                      Text('₹ ${orderList[index]['price'].toString()}')
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
