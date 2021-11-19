import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/models/city.dart';
import 'package:kosan_flutter_firebase/models/space.dart';
import 'package:kosan_flutter_firebase/models/tips.dart';
import 'package:kosan_flutter_firebase/provides/space_provider.dart';
import 'package:kosan_flutter_firebase/theme.dart';
import 'package:kosan_flutter_firebase/widgets/bottom_navbar_item.dart';
import 'package:kosan_flutter_firebase/widgets/city_card.dart';
import 'package:kosan_flutter_firebase/widgets/space_card.dart';
import 'package:kosan_flutter_firebase/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecomendedSpaces();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
              // top:edge ,
              horizontal: edge),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 24),
              // NOTE: TITLE/HEADER
              Text("Explore Now", style: blackTextStyle.copyWith(fontSize: 24)),
              Text("Mencari kosan yang cozy",
                  style: greyTextStyle.copyWith(fontSize: 16)),
              SizedBox(height: 30),
              Text("Popular Cities",
                  style: regularTextStyle.copyWith(fontSize: 16)),
              SizedBox(height: 16),
              Container(
                height: 150,
                width: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(City(
                        id: 1, name: 'Jakarta', imageUrl: 'assets/city1.png')),
                    SizedBox(width: 20),
                    CityCard(City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true,
                    )),
                    SizedBox(width: 20),
                    CityCard(City(
                      id: 3,
                      name: 'Solo',
                      imageUrl: 'assets/city3.png',
                      isPopular: true,
                    )),
                    SizedBox(width: 20),
                    CityCard(City(
                        id: 4, name: 'Surabaya', imageUrl: 'assets/city4.png')),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //RECOMENDED SPACE
              Text("Recomended Space",
                  style: regularTextStyle.copyWith(fontSize: 16)),
              SizedBox(height: 16),
              FutureBuilder(
                  future: spaceProvider.getRecomendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;
                      int index = 0;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // children: data.map((item) => SpaceCard(item)).toList(),
                        children: data.map((item) {
                          index++;
                          return Container (
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(item)
                            
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),

              SizedBox(
                height: 30,
              ),
              //RECOMENDED SPACE
              Text("Tips & Guidance",
                  style: regularTextStyle.copyWith(fontSize: 16)),
              SizedBox(height: 16),
              Column(
                children: [
                  TipsCard(Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/tips1.png',
                      updatedAt: '20 Apr')),
                  SizedBox(height: 20),
                  TipsCard(Tips(
                      id: 1,
                      title: 'Jakarta Fairship',
                      imageUrl: 'assets/tips2.png',
                      updatedAt: '20 Apr')),
                ],
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        //  margin: EdgeInsets.only(
        //   //  bottom: edge,
        //  ),
        decoration: BoxDecoration(
          color: Color(0xFFF6F7F8),
          // color: blackColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
