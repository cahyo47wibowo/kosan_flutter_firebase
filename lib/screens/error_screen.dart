import 'package:flutter/material.dart';
import 'package:kosan_flutter_firebase/screens/home_screen.dart';
import 'package:kosan_flutter_firebase/theme.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        bottom: false, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.,
            children: <Widget>[
              Align
              ( alignment: Alignment.center,
                child: Image.asset("assets/error.png", width: 300)),
              SizedBox(height: 60),
              Text("Where are you going?", style:blackTextStyle.copyWith(fontSize: 24)),
              SizedBox(height: 20),
              Text("Seems like the page that you were\nrequested is already gone", textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 16),),
              SizedBox(height: 50),
              Container(
                width: 210,
                height:50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()),
                      (route) => false);
                  }, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  color: purpleColor,
                  child: Text("Back to Home", style: whiteTextStyle.copyWith(fontSize: 20) ,),
                )
              )


            ],
          ),
        ),

      )
    );
  }
}