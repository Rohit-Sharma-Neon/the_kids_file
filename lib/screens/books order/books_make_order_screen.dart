import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:school_project/common_widgets/animated_column.dart';
import 'package:school_project/common_widgets/animated_list_view_builder.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/common_widgets/primary_button.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';


class BooksMakeOrderScreen extends StatefulWidget {
  const BooksMakeOrderScreen({Key? key}) : super(key: key);

  @override
  State<BooksMakeOrderScreen> createState() => _BooksMakeOrderScreenState();
}

class _BooksMakeOrderScreenState extends State<BooksMakeOrderScreen> {
  double finalPrice = 0.0;
  double takeLastPrice = 0.0;
  double totalNoteBooksPrice = 0.0;

  final List<Map<String, dynamic>> booksList = [
    {
      'name': 'Hindi',
      'price': 100.00,
      'notebooks': 0,
      'singleNotebookPrice': 10,
      'notebookPrice': 0,
      'selected': true,
    },
    {
      'name': 'English',
      'price': 200.00,
      'notebooks': 0,
      'singleNotebookPrice': 30,
      'notebookPrice': 0,
      'selected': true,
    },
    {
      'name': 'Maths',
      'price': 150.00,
      'notebooks': 0,
      'singleNotebookPrice': 10,
      'notebookPrice': 0,
      'selected': true,
    },
    {
      'name': 'Social Science',
      'price': 200.00,
      'notebooks': 0,
      'singleNotebookPrice': 15,
      'notebookPrice': 0,
      'selected': true,
    },
    {
      'name': 'Drawing',
      'price': 350.00,
      'notebooks': 0,
      'singleNotebookPrice': 20,
      'notebookPrice': 0,
      'selected': true,
    },
  ];
  final List<Map<String, dynamic>> notebooksList = [
    {
      'name': 'Hindi NoteBooks',
      'notebooksQty': 0,
      'singleNotebookPrice': 10,
      'notebookPrice': 0,
    },
    {
      'name': 'English NoteBooks',
      'notebooksQty': 0,
      'singleNotebookPrice': 30,
      'notebookPrice': 0,
    },
    {
      'name': 'Maths NoteBooks',
      'notebooksQty': 0,
      'singleNotebookPrice': 10,
      'notebookPrice': 0,
    },
    {
      'name': 'Social Science NoteBooks',
      'notebooksQty': 0,
      'singleNotebookPrice': 15,
      'notebookPrice': 0,
    },
    {
      'name': 'Drawing NoteBooks',
      'notebooksQty': 0,
      'singleNotebookPrice': 20,
      'notebookPrice': 0,
    },
  ];

  void noteBookPriceCalculation({required int index, required int qty}) {
    setState(() {
      notebooksList[index]['notebookPrice'] =
          qty * notebooksList[index]['singleNotebookPrice'];
    });
  }

  void calculatePriceWithNoteBooks({
    required int index,
    bool reduce = false,
  }) {
    totalNoteBooksPrice = 0.0;
    finalPrice = takeLastPrice;
    for (var element in notebooksList) {
      totalNoteBooksPrice += double.parse(element['notebookPrice'].toString());
    }
    finalPrice += totalNoteBooksPrice;
  }

  void totalPrice() {
    finalPrice = 0.0;
    for (var element in booksList) {
      if (element['selected'] == true) {
        finalPrice += element['price'];
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
      extendBody: true,
      appBar: const BaseAppBar(title: "Make Book Order"),
      body: AnimatedColumn(
          padding: const EdgeInsets.only(right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding,bottom: 150),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Books :',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            AnimationLimiter(
              child: ListView.builder(
                itemCount: booksList.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 20),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final bookData = booksList[index];
                  return AnimatedListViewBuilder(
                    index: index,
                    child: Neumorphic(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(bottom: 12),
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
                              child: Text(bookData['name'] +
                                  ' Book')),
                          Text(
                              '₹ ${bookData['price'].toString()}'),
                          NeumorphicCheckbox(
                              margin: const EdgeInsets.only(left: 10),
                              value: bookData['selected'],
                              onChanged: (value) {
                                setState(() {
                                  bookData['selected'] = !bookData['selected'];
                                  totalPrice();
                                });
                              }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text('NoteBooks :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            AnimationLimiter(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: notebooksList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AnimatedListViewBuilder(
                    index: index,
                    child: Neumorphic(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(notebooksList[index]
                                      ['name'])),
                            ],
                          ),
                          const Divider(
                              thickness: 1, color: Colors.grey),
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
                                        if (notebooksList[index]
                                                ['notebooksQty'] !=
                                            0) {
                                          setState(() {
                                            notebooksList[index][
                                                'notebooksQty'] -= 1;
                                            noteBookPriceCalculation(
                                                index: index,
                                                qty: notebooksList[
                                                        index][
                                                    'notebooksQty']);
                                            calculatePriceWithNoteBooks(
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
                                                BorderRadius
                                                    .circular(5),
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(notebooksList[index]
                                            ['notebooksQty']
                                        .toString()),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          notebooksList[index]
                                              ['notebooksQty'] += 1;
                                          noteBookPriceCalculation(
                                              index: index,
                                              qty: notebooksList[
                                                      index]
                                                  ['notebooksQty']);
                                          calculatePriceWithNoteBooks(
                                            index: index,
                                          );
                                        });
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius
                                                    .circular(5),
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
                                  '₹ ${notebooksList[index]['notebookPrice'].toString()}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
      bottomNavigationBar: PrimaryButton(
        margin: const EdgeInsets.only(bottom: 60,right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding),
        onTap: () {},
        isAnimate: true,
        title: 'Checkout',
      ),
    );
  }
}
