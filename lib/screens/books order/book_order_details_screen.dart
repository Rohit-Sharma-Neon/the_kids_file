import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:school_project/common_widgets/animated_column.dart';
import 'package:school_project/common_widgets/animated_list_view_builder.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';


class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final List<Map<String, dynamic>> orderDataList = [
    {
      'name': 'Hindi',
      'singlePrice': 100.00,
      'price': 100.00,
      'qty': 1,
    },
    {
      'name': 'English',
      'price': 100.00,
      'singlePrice': 100.00,
      'qty': 1,
    },
    {
      'name': 'Social Science',
      'price': 100.00,
      'singlePrice': 100.00,
      'qty': 1,
    },
  ];
  final List<Map<String, dynamic>> notebookOrderDataList = [
    {
      'name': 'Hindi notebook',
      'singlePrice': 100.00,
      'price': 100.00,
      'qty': 1,
    },
    {
      'name': 'English notebook',
      'price': 100.00,
      'singlePrice': 100.00,
      'qty': 1,
    },
    {
      'name': 'Maths notebook',
      'price': 100.00,
      'singlePrice': 100.00,
      'qty': 1,
    },
  ];

  double bookTotal = 0.0;
  double noteBookTotal = 0.0;

  void calculateBookTotal() {
    orderDataList.forEach((element) {
      bookTotal += element['price'];
    });
  }

  void calculateNoteBookTotal() {
    notebookOrderDataList.forEach((element) {
      noteBookTotal += element['price'];
    });
  }

  @override
  void initState() {
    calculateBookTotal();
    calculateNoteBookTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicColors.background,
      appBar: const BaseAppBar(title: "Order Details"),
      body: AnimatedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          padding: const EdgeInsets.only(right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding,top: 10,bottom: 80),
          children: [
          const Text('Books :',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          AnimationLimiter(
            child: ListView.builder(
              itemCount: orderDataList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: (context, index) {
              final orderdata = orderDataList[index];
             return AnimatedListViewBuilder(
               index: index,
               child: Neumorphic(
                 padding: const EdgeInsets.all(8.0),
                 margin: const EdgeInsets.only(bottom: 15),
                 child: Row(
                   children: [
                     const CircleAvatar(
                       radius: 20,
                       backgroundColor: Colors.grey,
                     ),
                     const SizedBox(
                       width: 10,
                     ),
                     Expanded(
                         child: Text(orderdata['name'] + ' Book')),
                     Text(
                         '${orderdata['qty'].toString()} *  ${orderdata['singlePrice'].toString()} ='),
                     const SizedBox(
                       width: 5,
                     ),
                     Text('₹ ${orderdata['price'].toString()}'),
                   ],
                 ),
               ),
             );
         },
       ),
          ),
          const SizedBox(height: 20),
          const Text('NoteBooks :',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          AnimationLimiter(
            child: ListView.builder(
      itemCount: notebookOrderDataList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final orderdata = notebookOrderDataList[index];
        return AnimatedListViewBuilder(
          index: index,
          child: Neumorphic(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(orderdata['name'] + ' Book')),
                Text(
                    '${orderdata['qty'].toString()} *  ${orderdata['singlePrice'].toString()} ='),
                const SizedBox(
                  width: 5,
                ),
                Text('₹ ${orderdata['price'].toString()}'),
              ],
            ),
          ),
        );
      },
            ),
          ),
          const SizedBox(height: 20),
          Text('Total : ${bookTotal + noteBookTotal}',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ]),
    );
  }
}
