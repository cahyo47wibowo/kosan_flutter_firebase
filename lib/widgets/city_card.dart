import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/models/city.dart';
import 'package:kosan_flutter_firebase/theme.dart';

class CityCard extends StatelessWidget {

  City city;
  CityCard(this.city);
  
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
            Stack(
              children: [
                Image.asset(city.imageUrl,
                height:102,
                width: 120,
                fit: BoxFit.cover,
                ),
                city.isPopular ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                         bottomLeft : Radius.circular(36),
                        )
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset('assets/icon_star.png',
                        width: 22,
                        height: 22),
                      ),
                    ),
                  ),
                ) : Container(),
              ],
            ),
            SizedBox(height: 12),
            Text(city.name, style: blackTextStyle.copyWith(fontSize:16)),
          ],
        ),
      ),
    );
  }
}