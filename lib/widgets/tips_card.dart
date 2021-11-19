import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/models/tips.dart';
import 'package:kosan_flutter_firebase/theme.dart';

class TipsCard extends StatelessWidget {

  Tips tips;
  
  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height:80,
            width:80,
            child: Image.asset(tips.imageUrl))),

        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text(tips.title, style: blackTextStyle.copyWith(fontSize:18)),
           SizedBox(height:4),
           Text.rich(
             TextSpan(
              text: 'Updated ', style: greyTextStyle.copyWith(fontSize:14),
              children: [
                TextSpan(
                  text: tips.updatedAt, style: greyTextStyle.copyWith(fontSize:14)
                )
              ]
             )
           )
          ],
        ), 
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right, size: 24, color: greyColor,))
      ]
      
    );
  }
}