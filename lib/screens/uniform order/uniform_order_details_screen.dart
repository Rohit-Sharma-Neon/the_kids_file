import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:school_project/common_widgets/animated_list_view_builder.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';

class UniformOrderDetailsScreen extends StatefulWidget {
  const UniformOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UniformOrderDetailsScreen> createState() =>
      _UniformOrderDetailsScreenState();
}

class _UniformOrderDetailsScreenState extends State<UniformOrderDetailsScreen> {
  final List<Map<String, dynamic>> orderDataList = [
    {
      'name': 'Shirt',
      'singlePrice': 100.00,
      'price': 100.00,
      'qty': 1,
      'size': '10',
    },
    {
      'name': 'Pant',
      'price': 100.00,
      'singlePrice': 100.00,
      'qty': 1,
      'size': '8',
    },
    {
      'name': 'Tie',
      'price': 100.00,
      'singlePrice': 100.00,
      'qty': 1,
      'size': '',
    },
  ];

  double bookTotal = 0.0;

  void calculateBookTotal() {
    orderDataList.forEach((element) {
      bookTotal += element['price'];
    });
  }

  @override
  void initState() {
    calculateBookTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Order Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: orderDataList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final orderdata = orderDataList[index];
              return AnimatedListViewBuilder(
                index: index,
                child: Neumorphic(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(bottom: 10),
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
                          Expanded(child: Text(orderdata['name'])),
                          Text(
                              '${orderdata['qty'].toString()} *  ${orderdata['singlePrice'].toString()} ='),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('₹ ${orderdata['price'].toString()}'),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          const Text('size'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('${orderdata['size'].toString()}'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: FadeInUp(child: Padding(
        padding: const EdgeInsets.only(bottom: 70,left: scaffoldHorizontalPadding,right: scaffoldHorizontalPadding),
        child: Text('Total : $bookTotal', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      )),
    );
  }
}
