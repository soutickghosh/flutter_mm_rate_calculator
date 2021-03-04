import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class mm extends StatefulWidget {
  @override
  _mmState createState() => _mmState();
}

class _mmState extends State<mm> {
  double _height=0, _width=0, _rate=0,_mm=0,_sqft=0;
  double _calculate=0,num2=0,num1=0,num3=0,num4=0,num5=0,num6=0;
  String valueChoose;

  List listItem = ["None", "18%"];

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  final TextEditingController t3 = new TextEditingController();
  final TextEditingController t4 = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void calculate(){
    HapticFeedback.heavyImpact();
    setState(() {
      if (_formKey.currentState.validate()){

      }

      _height = double.parse ( t1.text );
      _width = double.parse ( t2.text );
      _rate = double.parse ( t3.text );
      _mm = double.parse (t4.text);
      num1 = (_mm * 2.2326 * _rate);
      num2 = num1*(18/100) ;
      num3 = (num1 +num2)/24; //per squarefeet with gst
      num4 = num1/24; //per squarefeet without gst
      num5 = num3 * _height * _width; //with gst
      num6 = num4 * _height * _width; //without gst

      if ( valueChoose == "18%") {
        _calculate = num5;
        _sqft = num3;

      } else {
        _calculate = num6;
        _sqft = num4;
      }
      HapticFeedback.heavyImpact();

    });
  }

  void res (){
    HapticFeedback.heavyImpact();
    t1.clear();
    t2.clear();
    t3.clear();
    t4.clear();
    setState(() {
      _calculate = 0.0;
      _sqft = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (

      body: Container (
        decoration: BoxDecoration(

          image: DecorationImage(
            image: AssetImage('images/ig4.jpeg'),
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
                  padding: EdgeInsets.only(bottom:30.0),
                  child: Text("Total: $_calculate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.white),),
                ),
                Text("Per SqFt: $_sqft",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.white),),
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
                        controller: t4,
                        validator: (value){
                          if (value.isEmpty){
                            return 'Enter data';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration (

                            errorStyle: TextStyle(fontSize: 15.0,color: Colors.limeAccent),
                            labelText: 'MM',
                            hintText: 'Enter mm',
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
                            hintText: 'Enter Per mm Rate',
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
                Row (
                  children: <Widget>[
                    Expanded (
                      child: Padding (
                        padding: EdgeInsets.all ( 10.0 ),
                        child: Container(
                          decoration: BoxDecoration(

                              border: Border.all(color: Colors.white,width: 2),


                              borderRadius: BorderRadius.circular(10)
                          ),

                          child: DropdownButton(

                            hint: Container(padding:EdgeInsets.only(left: 10,right: 300),child: Text("GST",style: TextStyle(color: Colors.white),)),
                            iconSize: 30,
                            underline: Container(height: 0,),
                            icon:Container( child: Icon(Icons.arrow_drop_down,color: Colors.white,),alignment: Alignment.centerRight ,),
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
                    ),
                  ],
                ),
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
