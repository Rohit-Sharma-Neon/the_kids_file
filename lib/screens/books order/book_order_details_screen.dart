import 'package:flutter/material.dart';
import 'package:school_project/utils/app_colors.dart';


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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Books :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            const Text('NoteBooks :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ListView.builder(
              itemCount: notebookOrderDataList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final orderdata = notebookOrderDataList[index];
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            Text('Total : ${bookTotal + noteBookTotal}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }
}
