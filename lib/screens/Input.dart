import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Result.dart';

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: InputPageView()),
    );
  }
}

class InputPageView extends StatefulWidget {
  InputPageView({Key key}) : super(key: key);

  @override
  _InputPageViewState createState() => _InputPageViewState();
}

class _InputPageViewState extends State<InputPageView> {

    int height = 200, weight = 150, age = 30;
    String resultat;
    String result;
    String result2;
    int currentIndex=0;
   final GetStorage box=GetStorage();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("BMI Calculator"),centerTitle: true,),
        body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Expanded(child:
                      Row(
                         children: [

                             radioBotton("Male",HexColor("#143350"),0),
                             radioBotton("FEMALE",HexColor("#143350"),1),

                    ],)),

                 Expanded(child: 
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                       Text('HEIGHT',),
                       Row( 
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                       children: <Widget>[
                      Text(
                           "$height", style: TextStyle(fontSize: 34.0),),
                      Text('cm', )
                    ],),

                     SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x29eb1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),



///////////////////////////////////

                   Expanded(child:
                      Row(children: [

                       Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                           color:  HexColor("#212F3D"),
                           borderRadius: BorderRadius.circular(10.0),),
                        margin: EdgeInsets.symmetric(horizontal: 12.0),
                        height: 180.0,
                        child: Column(children: [
                      SizedBox( height: 40,),
                      Text( 'WEIGHT', ),
                         SizedBox(height:5, ),
                        Text
                        ('$weight',style: TextStyle(fontSize: 34.0),),
                     Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.baseline,
                    
                       children: [
                         MaterialButton(
                         child: Text("-",style: TextStyle(fontSize: 40.0)),
                         shape: CircleBorder(),
                          color: Color(0xff4c4f5e),
                           onPressed: () {
                                setState(() {
                             // weight--;
                             if (weight > 1) weight--;}); }, ),
   
   
                          MaterialButton(
                          child: Text("+",style: TextStyle(fontSize: 40.0)),
                          shape: CircleBorder(),
                          color: Color(0xff4c4f5e),
                           onPressed: () {
                                setState(() {
                              weight++; }); }, ),],)], ),
                               )),
   
////////////////////////////////////


                    Expanded(child: 
                          Container(

                            decoration: BoxDecoration(
                            color:  HexColor("#212F3D"),
                            borderRadius: BorderRadius.circular(10.0), ),
                            margin: EdgeInsets.symmetric(horizontal: 12.0),
                            height: 180.0,
                            child: Column(children: [
                            SizedBox(height: 40,  ),
                            Text('AGE',),
                            SizedBox( height:5,  ),
                            Text( '$age', style: TextStyle(fontSize: 34.0) ),
                            Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.baseline,
                    
                                children: [
 
                                   MaterialButton(
                                   child: Text("-",style: TextStyle(fontSize: 40.0)),
                                   shape: CircleBorder(),
                                   color: Color(0xff4c4f5e),
                                    onPressed: () {
                                         setState(() {
                              //age--;
                                        if (age > 1) age--; }); },  ),
   
   
                     MaterialButton(
                       child: Text("+",style: TextStyle(fontSize: 40.0)),
                       shape: CircleBorder(),
                       color: Color(0xff4c4f5e),
                       onPressed: () {
                          setState(() { age++;});  }, ),], )],), ) ),

          ],))],))
,
             SizedBox( height: 10, ),
      
             Container( 
     height: 50.0,
    width: double.infinity,
    child: 
    FlatButton(
    color: Colors.pink,
    onPressed: () { 
     double h =double.parse("$height");
     double w =double.parse("$weight");
     CalculateBmi(h, w);
     box.write("res", "$resultat");
     double i = double.parse("$resultat");
     getResult(i);
     box.write("res1","$result");
     getInterpretation(i);
     box.write("res2","$result2");
     Get.off(ResultPage(),arguments: "this argument");  },
    child: Text("CALCULATE",style: TextStyle(fontSize: 24.0),),),)





], ),); }


Void CalculateBmi(double height,double weight)
{
 
double resf=weight /  pow(height / 100, 2);
String bmi =resf.toStringAsFixed(1) ;
setState(() {
  resultat=bmi;
});

}


// ignore: missing_return
Void getResult( double _bmi) {
    if (30 < _bmi)
    setState(() {
  result="Obesity";
});
    else if (_bmi > 25)
      setState(() {
  result="Overweight";
});
    else if (_bmi > 18.5)
       setState(() {
  result="Normal";
});
    else
         setState(() {
  result="Underweight";
});
  }




 String getInterpretation(double _bmi ) {
    if (_bmi > 30)
          setState(() {
  result2='Ohh No! You have much more weight than that of a normal person. Consult a doctor immediately!!';
});
    else if (_bmi > 25)

       setState(() {
  result2='Ahh! Your body weight is more than normal. Try to exercise more and maintain a healthy diet.';
});
     
    else if (_bmi > 18.5)
    setState(() {
  result2='WOW! You have a perfect weight. Let\'s maintain this.';
});

    else
       setState(() {
  result2='Ohh! Your body weight is less than normal. Try to eat more and live a healthy life.';
});
  }








void changeIndex(int index)
{
setState(() {
  currentIndex = index;
});
}

Widget radioBotton(String value,Color color,int index )
{
return Expanded(
  child: Container(
    margin: EdgeInsets.symmetric(horizontal: 12.0),
    height: 180.0,
    child: FlatButton(

      color: currentIndex == index ? color : HexColor("#212F3D"),
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: () { 
changeIndex(index);

       },

      child: Text(value,style: TextStyle(color: currentIndex == index ? Colors.white : color ),),
     
      ),
      
      ));

}









}

