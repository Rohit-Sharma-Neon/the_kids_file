import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/utils/app_string.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Comments (12)"),
      body: AnimationLimiter(
        child: ListView.builder(
            itemCount: 12,
            shrinkWrap: true,
            padding: const EdgeInsets.only(right: 20,left: 20,bottom: 50,top: 20),
            itemBuilder: (context,index){
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              child: FadeInAnimation(
                child: Neumorphic(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                    child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                            const Text("Rohit",style: TextStyle(fontWeight: FontWeight.w500)),
                            Text("3 Days Ago",style: TextStyle(fontSize: 10,color: Colors.grey.shade600)),
                      ]),
                         const SizedBox(height: 7),
                         Text(loremIpsum,style: TextStyle(fontSize: 12,color: Colors.grey.shade800),)
                  ],
                )),
              ),
            ),
          );
        }),
      ),
    );
  }
}
