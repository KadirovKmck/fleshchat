import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class WidgetContener extends StatelessWidget {
  WidgetContener({
    super.key,
    this.style,
    required this.text,
  });
  final TextStyle? style;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: Colors.blue),
      height: 60,
      width: 500,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(EvaIcons.arrowBack)),
          SizedBox(
            width: 90,
          ),
          Text(text, style: style),
        ],
      ),
    );
  }
}
