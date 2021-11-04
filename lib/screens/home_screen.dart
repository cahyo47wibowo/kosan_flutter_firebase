import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/models/city.dart';
import 'package:kosan_flutter_firebase/theme.dart';
import 'package:kosan_flutter_firebase/widgets/city_card.dart';
import 'package:kosan_flutter_firebase/widgets/space_card.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            // top:edge,
            horizontal:edge
          ),
          child: ListView(
            children: <Widget> [
               SizedBox(height: 24),
              // NOTE: TITLE/HEADER
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
                    CityCard(
                      City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/city1.png'
                      )
                    ),
                    SizedBox(width: 20),
                    CityCard(
                       City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopular: true,
                      )
                    ),
                    SizedBox(width: 20),
                    CityCard(
                       City(
                        id: 3,
                        name: 'Solo',
                        imageUrl: 'assets/city3.png',
                        isPopular: true,
                      )
                    ),
                    SizedBox(width: 20),
                    CityCard( City(
                        id: 4,
                        name: 'Surabaya',
                        imageUrl: 'assets/city4.png'
                      )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //RECOMENDED SPACE
              Text("Popular Cities", style: regularTextStyle.copyWith(fontSize:16)),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceCard(),
                  SizedBox(height:30),
                  SpaceCard(),
                  SizedBox(height:30),
                  SpaceCard(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              //RECOMENDED SPACE
              Text("Tips & Guidance", style: regularTextStyle.copyWith(fontSize:16)),
            ],
          ),
        ),
      ),
    );
  }
}