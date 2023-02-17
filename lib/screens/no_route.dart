import 'package:flutter/material.dart';
import 'package:school_project/utils/app_colors.dart';

class NoRoute extends StatefulWidget {
  final String title;

  const NoRoute({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<NoRoute> createState() => _NoRouteState();
}

class _NoRouteState extends State<NoRoute> {
  PreferredSizeWidget appBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.title),
      body: Center(
        child: Text('${widget.title} Screen'),
      ),
    );
  }
}
