import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/theme.dart';
import 'package:kosan_flutter_firebase/widgets/city_card.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical:edge,
            horizontal: edge
          ),
          child: ListView(
            children: <Widget> [
              Text("Explore Now", style: blackTextStyle.copyWith(fontSize: 24)),
              Text("Mencari kosan yang cozy", style: greyTextStyle.copyWith(fontSize:16)),
              SizedBox(height: 30),
              Text("Popular Cities", style: regularTextStyle.copyWith(fontSize:16)),
              SizedBox(height: 16),
              Container(
                height: 150,
                width: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(),
                    SizedBox(width: 20),
                    CityCard(),
                    SizedBox(width: 20),
                    CityCard(),
                    SizedBox(width: 20),
                    CityCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}