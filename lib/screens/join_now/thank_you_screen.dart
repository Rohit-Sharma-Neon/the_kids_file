import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(title: const Text("Thank You",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),centerTitle: true,automaticallyImplyLeading: false,
          leading: NeumorphicBackButton(onPressed: (){Navigator.pop(context);},style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),depth: 10))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Thanks for Joining Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,)),
            ],
          ),
          const Text("Venue: City Park, Mansarovar, Jaipur",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,)),
        ],
      ),
      bottomNavigationBar: NeumorphicButton(onPressed: (){
        Navigator.pop(context);
      },margin: const EdgeInsets.only(bottom: 70,right: 20,left: 20),
          padding: const EdgeInsets.symmetric(vertical: 18), child: const Text("Back",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),)),
    );
  }
}
