import 'package:flutter/material.dart';
import 'package:school_project/common_widgets/custom_button.dart';
import 'package:school_project/utils/app_colors.dart';

class UniformMakeOrderScreen extends StatefulWidget {
  const UniformMakeOrderScreen({Key? key}) : super(key: key);

  @override
  State<UniformMakeOrderScreen> createState() => _UniformMakeOrderScreenState();
}

class _UniformMakeOrderScreenState extends State<UniformMakeOrderScreen> {
  final List<Map<String, dynamic>> uniformList = [
    {
      'name': 'Shirt',
      'qty': 0,
      'singleQtyPrice': 220,
      'price': 0.0,
      'selected': true,
      'size': ['Select', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
      'selectedSize': 'Select',
    },
    {
      'name': 'Pant',
      'qty': 0,
      'singleQtyPrice': 180,
      'price': 0.0,
      'selected': true,
      'size': ['Select', '1', '2', '3', '4'],
      'selectedSize': 'Select',
    },
    {
      'name': 'Belt',
      'qty': 0,
      'singleQtyPrice': 110,
      'price': 0.0,
      'selected': true,
      'size': ['Select', 'S', 'M', 'L', 'XL'],
      'selectedSize': 'Select',
    },
    {
      'name': 'Tie',
      'qty': 0,
      'singleQtyPrice': 250,
      'price': 0.0,
      'selected': true,
      'size': [
        'Select',
      ],
      'selectedSize': 'Select',
    },
  ];
  double finalPrice = 0.0;
  double takeLastPrice = 0.0;
  double totalNoteBooksPrice = 0.0;
  String? enquiryName;

  void uniformPriceCalculation({required int index, required int qty}) {
    setState(() {
      uniformList[index]['price'] = qty * uniformList[index]['singleQtyPrice'];
    });
  }

  void calculatePriceWithUniform({
    required int index,
    bool reduce = false,
  }) {
    totalNoteBooksPrice = 0.0;
    finalPrice = takeLastPrice;
    for (var element in uniformList) {
      totalNoteBooksPrice += double.parse(element['price'].toString());
    }
    finalPrice += totalNoteBooksPrice;
  }

  void totalPrice() {
    finalPrice = 0.0;
    for (var element in uniformList) {
      if (element['selected'] == true) {
        finalPrice += element['singleQtyPrice'];
      }
    }
    takeLastPrice = finalPrice;
  }

  @override
  void initState() {
    totalPrice();
    takeLastPrice = finalPrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Uniform make order',
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 90.0),
              child: ListView.builder(
                itemCount: uniformList.length,
                itemBuilder: (context, index) {
                  final uniformData = uniformList[index];

                  return Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: uniformData['selected'] == true
                                ? Border.all(color: AppColors.primary, width: 1)
                                : null,
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
                                    Expanded(child: Text(uniformData['name'])),
                                    Text(
                                        '₹ ${uniformData['singleQtyPrice'].toString()}'),
                                    Checkbox(
                                        activeColor: AppColors.primary,
                                        value: uniformData['selected'],
                                        onChanged: (value) {
                                          setState(() {
                                            uniformData['selected'] =
                                                !uniformData['selected'];
                                            totalPrice();
                                          });
                                        }),
                                  ],
                                ),
                                const Divider(thickness: 1, color: Colors.grey),
                                Row(
                                  children: [
                                    const Text('QTY : '),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (uniformData['qty'] != 0) {
                                                setState(() {
                                                  uniformData['qty'] -= 1;
                                                  uniformPriceCalculation(
                                                      index: index,
                                                      qty: uniformData['qty']);
                                                  calculatePriceWithUniform(
                                                    index: index,
                                                    reduce: true,
                                                  );
                                                });
                                              }
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(uniformData['qty'].toString()),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                uniformData['qty'] += 1;
                                                uniformPriceCalculation(
                                                    index: index,
                                                    qty: uniformData['qty']);
                                                calculatePriceWithUniform(
                                                  index: index,
                                                );
                                              });
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                        '₹ ${uniformData['price'].toString()}'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                if (uniformData['name'] != 'Tie')
                                  Row(
                                    children: [
                                      const Text('Size : '),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          height: 30,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 0),
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: Container(),
                                            hint: const Center(
                                                child: Text('Size')),
                                            onChanged: (newValue) {
                                              setState(() {
                                                uniformData['selectedSize'] =
                                                    newValue.toString();
                                              });
                                            },
                                            value: uniformData['selectedSize'],
                                            items: uniformData['size']
                                                .map<DropdownMenuItem<String>>(
                                                    (classes) {
                                              return DropdownMenuItem(
                                                value: classes.toString(),
                                                child: Text(
                                                  classes.toString(),
                                                ),
                                              );
                                            }).toList(),
                                          )),
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
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: CustomButton(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      Text('₹ ${finalPrice.toString()}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
