import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/screens/home_screen.dart';
import 'package:kosan_flutter_firebase/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/splash_image.png")),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      )),
                    ),
                    const SizedBox(height: 50),
                    Text("Find Cozy House\nto Stay and Happy",
                        style: blackTextStyle.copyWith(fontSize: 24)),
                    const SizedBox(height: 10),
                    Text(
                        "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                        style: greyTextStyle),
                    const SizedBox(height: 40),
                    Container(
                      width: 210,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        color: purpleColor,
                        child: Text("Explore Now",
                            style: whiteTextStyle.copyWith(fontSize: 18)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
