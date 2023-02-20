import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/common_widgets/animated_list_view_builder.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/screens/uniform%20order/uniform_make_order_screen.dart';
import 'package:school_project/screens/uniform%20order/uniform_order_details_screen.dart';
import 'package:school_project/utils/app_colors.dart';

class UniformOrderScreen extends StatefulWidget {
  const UniformOrderScreen({Key? key}) : super(key: key);

  @override
  State<UniformOrderScreen> createState() => _UniformOrderScreenState();
}

class _UniformOrderScreenState extends State<UniformOrderScreen> {
  final List<Map<String, dynamic>> orderList = [
    {
      'id': '#1234',
      'name': [
        {
          'name': 'Shirt',
          'size': 2,
          'qty': 2,
          'price': 30,
        },
        {
          'name': 'Shirt',
          'size': 2,
          'qty': 2,
          'price': 30,
        },
      ],
      'price': 1200.00,
    },
    {
      'id': '#12345',
      'name': [
        {
          'name': 'Pant',
          'size': 2,
          'qty': 2,
          'price': 30,
        },
        {
          'name': 'Shirt',
          'size': 2,
          'qty': 2,
          'price': 30,
        },
      ],
      'price': 1200.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Uniform Orders",
        actions: [
          GestureDetector(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(context, screen: const UniformMakeOrderScreen());
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
          padding: const EdgeInsets.all(20.0),
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UniformOrderDetailsScreen(),
                  ),
                );
              },
              child: AnimatedListViewBuilder(
                index: index,
                child: Neumorphic(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(bottom: 10),
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
