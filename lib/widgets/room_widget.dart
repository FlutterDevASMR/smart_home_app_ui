import 'package:flutter/material.dart';
import 'package:smart_home_app_ui/utils/constants.dart';

class RoomWidget extends StatelessWidget {
  RoomWidget({
    super.key,
    required this.image,
    required this.title,
    required this.connectedDevices,
  });

  String image;
  String title;
  int connectedDevices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/$image.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(200),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Constants.shadowColor,
                      offset: Offset(0, 30),
                      blurRadius: 20,
                      spreadRadius: 10,
                    )
                  ]),
              margin: EdgeInsets.only(top: 30),
            ),
          ),
          SizedBox(height: 40),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '$connectedDevices devices connected',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
