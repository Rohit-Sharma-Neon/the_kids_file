import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:school_project/common_widgets/animated_list_view_builder.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';

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
      appBar: const BaseAppBar(title: "Uniform Make Order"),
      extendBody: true,
      body: AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 90.0,top: 15,left: scaffoldHorizontalPadding,right: scaffoldHorizontalPadding),
          itemCount: uniformList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final uniformData = uniformList[index];
            return AnimatedListViewBuilder(
              index: index,
              child: Neumorphic(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(bottom: 15),
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
                        NeumorphicCheckbox(
                            value: uniformData['selected'],
                            margin: const EdgeInsets.only(left: 10),
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
                          SizedBox(
                            width: 130,
                            height: 35,
                            child: Neumorphic(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                                child: DropdownButton(
                                  isExpanded: true,
                                  dropdownColor: AppColors.primaryColor,
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
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        margin: const EdgeInsets.only(bottom: primaryButtonBottomMargin,left: scaffoldHorizontalPadding,right: scaffoldHorizontalPadding),
        isAnimate: true,
        onTap: () {},
        title: 'Checkout',
      ),
    );
  }
}
