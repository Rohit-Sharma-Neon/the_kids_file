import 'package:flutter/material.dart';
import 'package:school_project/common_widgets/custom_button.dart';
import 'package:school_project/utils/app_colors.dart';


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
      appBar: AppBar(
        title: const Text(
          'Make Book Order',
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
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 90.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Books :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      ListView.builder(
                        itemCount: booksList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final bookData = booksList[index];
                          return Column(
                            children: [
                              InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: bookData['selected'] == true
                                        ? Border.all(
                                            color: AppColors.primary, width: 1)
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                child: Text(bookData['name'] +
                                                    ' Book')),
                                            Text(
                                                '₹ ${bookData['price'].toString()}'),
                                            Checkbox(
                                                activeColor: AppColors.primary,
                                                value: bookData['selected'],
                                                onChanged: (value) {
                                                  setState(() {
                                                    bookData['selected'] =
                                                        !bookData['selected'];
                                                    totalPrice();
                                                  });
                                                }),
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      ListView.builder(
                        itemCount: notebooksList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ]),
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
