import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/theme.dart';

class CityCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        decoration: BoxDecoration(
          color:Color(0xFFF6F7F8),
        ),
        child: Column(
          children: [
            Image.asset("assets/city1.png",
            height:102,
            width: 120,
            fit: BoxFit.cover,
            ),
            SizedBox(height: 12),
            Text("Jakarta", style: blackTextStyle.copyWith(fontSize:16)),
          ],
        ),
      ),
    );
  }
}