import 'package:flutter/material.dart';
import 'package:school_project/screens/books%20order/book_order_details_screen.dart';
import 'package:school_project/screens/books%20order/books_make_order_screen.dart';
import 'package:school_project/utils/app_colors.dart';

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
      appBar: AppBar(
        title: const Text(
          'Book Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 17.0),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primary,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BooksMakeOrderScreen(),
                ),
              );
            },
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 17.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.add,
                    color: AppColors.primary,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderDetailsScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6.0,
                            offset: Offset(0.0, 3))
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
