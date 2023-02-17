import 'package:flutter/material.dart';
import 'package:school_project/utils/app_colors.dart';

class TrackChildScreen extends StatefulWidget {
  final String whereToCome;
  const TrackChildScreen({
    Key? key,
    required this.whereToCome,
  }) : super(key: key);

  @override
  State<TrackChildScreen> createState() => _TrackChildScreenState();
}

class _TrackChildScreenState extends State<TrackChildScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      appBar: AppBar(
        title: const Text(
          'Tracking',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: widget.whereToCome == "NavBar"
            ? SizedBox()
            : GestureDetector(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: const Text(
              'Riyansh Sharma',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/mapPath.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 60.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                        'assets/images/boyImage.png'),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const Text(
                                    'Riyansh',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Text(
                                'Latitude-Longitude',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: AppColors.primary,
                                ),
                              ),
                              const Text(
                                '31.5489231',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text("N 31.31'9.325"),
                              const Text(
                                'Malviya Nagar, Jaipur',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
