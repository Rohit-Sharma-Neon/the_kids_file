import 'package:flutter/material.dart';
import 'package:school_project/common_widgets/custom_button.dart';
import 'package:school_project/utils/app_colors.dart';


class PaymentSummaryScreen extends StatefulWidget {
  const PaymentSummaryScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSummaryScreen> createState() => _PaymentSummaryScreenState();
}

class _PaymentSummaryScreenState extends State<PaymentSummaryScreen> {
  final List<BuildPaymentSummary> _paymentSummary = const [
    BuildPaymentSummary(
        feesTitle: 'Tuition Fees', date: '11-01-2023', price: 15000.00),
    BuildPaymentSummary(
        feesTitle: 'Conveyance Fees', date: '11-01-2023', price: 12000.00),
    BuildPaymentSummary(
        feesTitle: 'Tuition Fees', date: '11-01-2023', price: 7000.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Summary',
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Image.asset('assets/images/boyImage.png'),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Riyansh',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      'VIIth - C',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Payment Due',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            BuildMultipalPayment(
                fees: 15000, dueDate: '14/02/2023', onTap: () {}),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Next Payment Due',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            BuildMultipalPayment(
                fees: 15000, dueDate: '14/03/2023', onTap: () {}),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Payment Summary',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _paymentSummary.length,
                    itemBuilder: (context, index) {
                      var data = _paymentSummary[index];
                      return BuildPaymentSummary(
                        feesTitle: data.feesTitle,
                        date: data.date,
                        price: data.price,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class BuildMultipalPayment extends StatelessWidget {
  final double fees;
  final String dueDate;
  final VoidCallback onTap;

  const BuildMultipalPayment({
    Key? key,
    required this.fees,
    required this.dueDate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tuition Fees : ${fees.toString()}',
              style:
                  const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w700),
            ),
            Text(
              'Date : $dueDate',
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
        CustomButton(
          onTap: onTap,
          height: 35.0,
          child: const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Center(
              child: Text(
                'Make Payment',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BuildPaymentSummary extends StatelessWidget {
  final String feesTitle;
  final String date;
  final double price;

  const BuildPaymentSummary({
    Key? key,
    required this.feesTitle,
    required this.date,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feesTitle,
                style: const TextStyle(
                    fontSize: 19.0, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const Spacer(),
          Text(
            '₹ ${price.toString()}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
