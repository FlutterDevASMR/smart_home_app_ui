import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app_ui/screens/control_screen.dart';
import 'package:smart_home_app_ui/utils/constants.dart';

class DevicesButton extends StatefulWidget {
  DevicesButton({
    super.key,
    required this.index,
    required this.icon,
    required this.title,
  });

  int index;
  IconData icon;
  String title;

  @override
  State<DevicesButton> createState() => _DevicesButtonState();
}

class _DevicesButtonState extends State<DevicesButton> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    Color shadowColor =
        widget.index == 0 ? Constants.pinkColor : Constants.greyColor;

    Color textColor = widget.index == 0 ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: () {
        if (widget.index == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ControlScreen(),
              ));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.index == 0 ? Constants.pinkColor : null,
          gradient: widget.index == 0
              ? null
              : LinearGradient(
                  colors: [
                    Constants.shadowColor,
                    Constants.backgroundColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 0.6],
                ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: enabled
              ? []
              : [
                  BoxShadow(
                    color: shadowColor,
                    offset: Offset(5, 5),
                    blurRadius: widget.index == 0 ? 20 : 15,
                    spreadRadius: widget.index == 0 ? -5 : 2,
                  ),
                  BoxShadow(
                    color: Constants.backgroundColor,
                    offset: Offset(-5, -5),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Icon(
                widget.icon,
                color: Constants.greyColor,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              widget.index == 0
                  ? Container()
                  : CupertinoSwitch(
                      value: enabled,
                      onChanged: (value) {
                        setState(() {
                          enabled = value;
                        });
                      },
                    ),
            ],
            mainAxisAlignment: widget.index == 0
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
