import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class sq extends StatefulWidget {

  @override
  _sqState createState() => _sqState();
}

class _sqState extends State<sq> {

  double _height=0, _width=0, _rate=0;
  double _calculate=0, num2=0, num1=0;
  String valueChoose;

  List listItem = ["None", "18%"];

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void calculate(){
    HapticFeedback.heavyImpact();
    setState(() {
      if (_formKey.currentState.validate()){

      }

      _height = double.parse ( t1.text );
      _width = double.parse ( t2.text );
      _rate = double.parse ( t3.text );
      num1 = (_height * _width * _rate);
      num2 = num1*(18/100) ;

      if ( valueChoose == "18%") {
        _calculate = num1 + num2;

      } else {
        _calculate = num1;
      }
      HapticFeedback.heavyImpact();

    });
  }

  void res (){
    HapticFeedback.heavyImpact();
    t1.clear();
    t2.clear();
    t3.clear();
    setState(() {
      _calculate = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold (

      body: Container(
        decoration: BoxDecoration(

          image: DecorationImage(
            image: AssetImage('images/ig5.jpeg'),
            fit: BoxFit.fill,
          ),
        ),


        child: ListView ( children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:110.0),
            padding: EdgeInsets.only(bottom:70.0),
            child:
            Center(child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom:20.0),
                  child: Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white),),
                ),
                Text("$_calculate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35.0,color: Colors.white),),
              ],
            ),),),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row ( children: <Widget>[
                  Expanded (
                    child: Padding (
                      padding: EdgeInsets.all ( 10.0 ),
                      child: TextFormField (
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        controller: t1,
                        validator: (value){
                          if (value.isEmpty){
                            return 'Enter data';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration (

                            errorStyle: TextStyle(fontSize: 15.0,color: Colors.limeAccent),
                            labelText: 'Height',
                            hintText: 'Enter Height',
                            hintStyle: TextStyle(color: Colors.white70),
                            labelStyle: TextStyle(color: Colors.white),
                            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.limeAccent,width: 3,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.limeAccent,width: 3,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 3,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            border: OutlineInputBorder (
                              borderRadius: BorderRadius.circular ( 5.0 ),
                              borderSide: BorderSide(color: Colors.white,width: 3,),
                            ) ),
                      ),
                    ),
                  ),
                  Expanded (
                    child: Padding (
                      padding: EdgeInsets.all ( 10.0 ),
                      child: TextFormField (
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        controller: t2,
                        validator: (value){
                          if (value.isEmpty){
                            return 'Enter data';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration (

                            errorStyle: TextStyle(fontSize: 15.0,color: Colors.limeAccent),
                            labelText: 'Width',
                            hintText: 'Enter Width',
                            hintStyle: TextStyle(color: Colors.white70),
                            labelStyle: TextStyle(color: Colors.white),
                            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.limeAccent,width: 3,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.limeAccent,width: 3,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 3,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            border: OutlineInputBorder (
                                borderRadius: BorderRadius.circular ( 5.0 ),
                                borderSide: BorderSide(color: Colors.white,width: 3,),
                            ) ),
                      ),
                    ),
                  ),
                ] ),
                Row ( children: <Widget>[
                  Expanded (
                    child: Padding (
                      padding: EdgeInsets.all ( 10.0 ),
                      child: TextFormField (
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        controller: t3,
                        validator: (value){
                          if (value.isEmpty){
                            return 'Enter data';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration (

                            errorStyle: TextStyle(fontSize: 15.0,color: Colors.limeAccent),
                            labelText: 'Rate',
                            hintText: 'Enter Per SqFt Rate',
                            hintStyle: TextStyle(color: Colors.white70),
                            labelStyle: TextStyle(color: Colors.white),
                            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.limeAccent,width: 3,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.limeAccent,width: 3,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 3,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2,),borderRadius: BorderRadius.circular ( 10.0 ),),
                            border: OutlineInputBorder (
                              borderRadius: BorderRadius.circular ( 5.0 ),
                              borderSide: BorderSide(color: Colors.white,width: 3,),
                            ) ),
                      ),
                    ),
                  ),
                  Expanded (
                    child: Padding (
                      padding: EdgeInsets.all ( 10.0 ),
                      child: Container(
                        decoration: BoxDecoration(

                            border: Border.all(color: Colors.white,width: 2),


                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: DropdownButton(

                          hint: Container(padding:EdgeInsets.only(left: 10,right: 100),child: Text("GST",style: TextStyle(color: Colors.white),)),
                          iconSize: 30,
                          underline: Container(height: 0,),
                          icon:Container(child: new Icon(Icons.arrow_drop_down,color: Colors.white,)),
                          style: TextStyle(color: Colors.black),
                          value: valueChoose,
                          onChanged: (newValue){
                            setState(() {
                              valueChoose = newValue;
                              print(newValue);
                            });
                          },
                          items: listItem.map((valueItem){
                            return DropdownMenuItem(

                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ] ),
                Row ( children: <Widget>[
                  Expanded (
                    child: Padding (
                        padding: EdgeInsets.all ( 10.0 ),
                        child: MaterialButton (
                          height: 50,
                          elevation: 30,
                          color: Colors.lightGreenAccent,
                          highlightColor: Colors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Text ( 'Calculate',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold), ),
                          textColor: Colors.black,

                          onPressed: calculate,
                        ) ),
                  ),
                  Expanded (
                    child: Padding (
                        padding: EdgeInsets.all ( 10.0 ),
                        child: MaterialButton (
                          height: 50,
                          elevation: 30,
                          highlightColor: Colors.green,
                          color: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Text ( 'Reset',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold), ),
                          onPressed: res,
                        ) ),
                  ),
                ] ),
              ],
            ),
          ),


        ] ),
      ),
    );
  }
}