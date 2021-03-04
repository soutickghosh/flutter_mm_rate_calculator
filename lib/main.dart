import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'sq.dart';
import 'mm.dart';

const String testDevice = '';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Awsome app',
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  static final MobileAdTargetingInfo targetInfo = new MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>['wall', 'wallpaper', 'amoled'],
    birthday: new DateTime.now(),
    childDirected: true,

  );


  BannerAd _bannerAd;

  BannerAd createBannerAd(){
    return new BannerAd(adUnitId: BannerAd.testAdUnitId, size: AdSize.banner, targetingInfo: targetInfo, listener: (MobileAdEvent event){
      print("Banner event : $event");
    }
    );
  }

  @override
  void initState(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/ig3.jpeg'),
              fit: BoxFit.fill,
            ),
          ),

          child: Center(

            child: Container(



              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget>[


                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => sq()));
                        HapticFeedback.heavyImpact();
                      },

                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius:BorderRadius.circular(30),
                            boxShadow:[ BoxShadow(
                                color: Colors.grey,blurRadius: 5
                            )]
                        ),
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset('images/ft.png',height: 50,width: 50,),
                            Text("Square Feet", style: TextStyle(fontWeight: FontWeight.bold, fontSize:20),)
                          ],
                        ),


                      ),
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => mm()));
                        HapticFeedback.heavyImpact();
                      },

                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.lime,
                            borderRadius:BorderRadius.circular(30),
                            boxShadow:[ BoxShadow(
                                color: Colors.grey,blurRadius: 5
                            )]
                        ),
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.asset('images/ft.png',height: 50,width: 50,),
                            Text("MM Rate ", style: TextStyle(fontWeight: FontWeight.bold, fontSize:20),)
                          ],
                        ),


                      ),
                    ),
                  ]



              ),
            ),
          ),
        ));
  }
}