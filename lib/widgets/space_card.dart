import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/models/space.dart';
import 'package:kosan_flutter_firebase/screens/detail_screen.dart';
import 'package:kosan_flutter_firebase/theme.dart';

class SpaceCard extends StatelessWidget {

  final Space space;
  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(space),
        ));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
                width: 130,
                height: 110,
                child: Stack(
                  children: [
                    // Image.asset(space.imageUrl,  fit: BoxFit.cover),
                    Image.network(space.imageUrl, fit: BoxFit.cover,
                    width: 130,
                    height: 110,),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                               bottomLeft : Radius.circular(36),
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset('assets/icon_star.png',
                                width: 18,
                                height: 18),
                              ),
                              SizedBox(width:2),
                              Text('${space.rating}/5', style: whiteTextStyle.copyWith(fontSize:13)),
                            ],
                          ),
                        ),
                      ) 
                  ],
                )    
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(space.name, style: blackTextStyle.copyWith(fontSize: 18)),
              Text.rich(
                TextSpan(
                  text: '\$${space.price}', style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: ' / month', style: greyTextStyle.copyWith(fontSize:16)
                    )
                  ]
                )
              ),
              SizedBox(height: 16),
              Text(space.city +', '+space.country, style: greyTextStyle.copyWith(fontSize:14))
            ],
          )
        ],
      ),
    );
  }
}