import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/models/space.dart';
import 'package:kosan_flutter_firebase/screens/error_screen.dart';
import 'package:kosan_flutter_firebase/theme.dart';
import 'package:kosan_flutter_firebase/widgets/facility_item.dart';
import 'package:kosan_flutter_firebase/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  // const DetailScreen({Key key}) : super(key: key);

  final Space space;
  DetailScreen(this.space);
  int indexPhotos = 0;
  @override
  Widget build(BuildContext context) {
    // launchURL(String url)async{
    // await canLaunch(url) ? await launch(url) : throw ('Could not launch: ' + url);
    // }

    launchURL(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
            builder: (BuildContext context) => const ErrorScreen()));
      }
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          top: false,
          bottom: false,
          child: Stack(
            children: [
              Image.network(space.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: 384,
                  fit: BoxFit.cover),
              ListView(
                children: [
                  const SizedBox(height: 328),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: edge,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //NOTE TITLE
                                  Text(space.name,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 22)),
                                  Text.rich(TextSpan(
                                      text: '\$${space.price} ',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: '/ month',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16))
                                      ]))
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Image.asset('assets/icon_star.png',
                              //         width: 20),
                              //     Image.asset('assets/icon_star.png',
                              //         width: 20),
                              //     Image.asset('assets/icon_star.png',
                              //         width: 20),
                              //     Image.asset('assets/icon_star.png',
                              //         width: 20),
                              //     Image.asset('assets/icon_star.png',
                              //         width: 20, color: Color(0xFF989BA1)),
                              //   ],
                              // )
                              Row(
                                children: [1,2,3,4,5].map((index) {
                                  return Container (
                                    margin: const EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: RatingItem(
                                      index: index,
                                      rating: space.rating,
                                    )
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          //NOTE Main Facilities
                          Text('Main Facilities',
                              style: blackTextStyle.copyWith(fontSize: 16)),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                name: 'kitchen',
                                imageUrl: 'assets/icon_kitchen.png',
                                total: space.numberOfKitchens,
                              ),
                              FacilityItem(
                                name: 'bedroom',
                                imageUrl: 'assets/icon_bedroom.png',
                                total: space.numberOfBedrooms,
                              ),
                              FacilityItem(
                                name: 'cupboard',
                                imageUrl: 'assets/icon_cupboard.png',
                                total: space.numberOfCupboards,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          //NOTE PHOTOS
                          Text("Photos",
                              style: blackTextStyle.copyWith(fontSize: 16)),
                          SizedBox(height: 12),
                          Container(
                            height: 88,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: space.photos.map((item) {
                                  return Container(
                                      margin: EdgeInsets.only(right: 18),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.network(item,
                                              width: 110,
                                              height: 88,
                                              fit: BoxFit.cover)));
                                }).toList()
                                // Image.network(space.photos[0], width: 110, height: 88,fit: BoxFit.cover),
                                // SizedBox(width:18),
                                // Image.network(space.photos[1], width: 110, height: 88,fit: BoxFit.cover),
                                // SizedBox(width:18),
                                // Image.network(space.photos[2], width: 110, height: 88,fit: BoxFit.cover),

                                ),
                          ),
                          SizedBox(height: 30),
                          Text('Location',
                              style: blackTextStyle.copyWith(fontSize: 16)),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(space.address,
                                      style:
                                          greyTextStyle.copyWith(fontSize: 14)),
                                  Text(space.city,
                                      style:
                                          greyTextStyle.copyWith(fontSize: 14))
                                ],
                              ),
                              InkWell(
                                  onTap: () { 
                                    launchURL(
                                        space.mapUrl);
                                    // launchURL('wkwkwkLand');
                                  },
                                  child: Image.asset('assets/btn_map.png',
                                      width: 40))
                            ],
                          ),
                          SizedBox(height: 40),
                          Container(
                            width:
                                MediaQuery.of(context).size.width - (2 * edge),
                            height: 50,
                            child: RaisedButton(
                              onPressed: () {
                                launchURL('tel:+${space.phone}');
                                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17)),
                              color: purpleColor,
                              child: Text("Book Now",
                                  style: whiteTextStyle.copyWith(fontSize: 18)),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: edge + edge, horizontal: edge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/btn_back.png',
                          width: 40,
                        )),
                    Image.asset('assets/btn_wishlist.png', width: 40)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
