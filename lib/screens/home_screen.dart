import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_home_app_ui/utils/constants.dart';
import 'package:smart_home_app_ui/widgets/devices_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/room_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> buttonIcons = [
      Icons.tune,
      Icons.lightbulb_outline,
      Icons.light,
      Icons.thermostat,
      Icons.music_note_outlined,
      Icons.wifi,
    ];

    List<String> buttonTitles = [
      'Control\nCenter',
      'Hue Lights',
      'Side Lamp',
      'Air Condition',
      'Music',
      'Wi-Fi',
    ];
    PageController controller = PageController();
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: PageView(
                          controller: controller,
                          children: [
                            RoomWidget(
                              image: 'living_room',
                              title: 'Living room',
                              connectedDevices: Random().nextInt(5),
                            ),
                            RoomWidget(
                              image: 'kitchen',
                              title: 'Kitchen',
                              connectedDevices: Random().nextInt(5),
                            ),
                            RoomWidget(
                              image: 'bedroom',
                              title: 'Bedroom',
                              connectedDevices: Random().nextInt(5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 70,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Constants.pinkColor,
                        dotColor: Colors.grey.shade400,
                        dotHeight: 5,
                        dotWidth: 20,
                      ),
                    ),
                  )
                ],
                alignment: AlignmentDirectional.bottomCenter,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) => DevicesButton(
                    index: index,
                    icon: buttonIcons[index],
                    title: buttonTitles[index],
                  ),
                  itemCount: buttonIcons.length,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
