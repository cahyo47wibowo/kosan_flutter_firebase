import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/theme.dart';

class BottomNavBarItem extends StatelessWidget {

  final String imageUrl;
  final bool isActive;

  const BottomNavBarItem({Key key, this.imageUrl, this.isActive}) : super(key: key);

  @override  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(imageUrl, width:24),
        Spacer(),
        isActive ? Container(
          width:30,
          height:2,
          decoration: BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.circular(1000)
          ),
        ) : Container()
      ]
    );
  }
}