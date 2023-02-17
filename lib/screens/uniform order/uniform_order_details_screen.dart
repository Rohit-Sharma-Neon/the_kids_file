import 'package:flutter/material.dart';
import 'package:school_project/utils/app_colors.dart';

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
      appBar: AppBar(
        title: const Text(
          'Order Details',
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: orderDataList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final orderdata = orderDataList[index];
                  return Column(
                    children: [
                      InkWell(
                        child: Container(
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
                                    Expanded(child: Text(orderdata['name'])),
                                    Text(
                                        '${orderdata['qty'].toString()} *  ${orderdata['singlePrice'].toString()} ='),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text('₹ ${orderdata['price'].toString()}'),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                                Row(
                                  children: [
                                    Text('size'),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text('${orderdata['size'].toString()}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
              const SizedBox(height: 30),
              Text('Total : ${bookTotal}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
