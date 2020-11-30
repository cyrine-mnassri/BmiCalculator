import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Input.dart';


class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResultPageView(),
    );
  }
}

class ResultPageView extends StatefulWidget {
  ResultPageView({Key key}) : super(key: key);

  @override
  _ResultPageViewState createState() => _ResultPageViewState();
}

class _ResultPageViewState extends State<ResultPageView> {
  GetStorage box = GetStorage();
  var arg = Get.arguments;
  String result;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('YOUR RESULTAT'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(box.read("res1").toString(),
                  style: TextStyle(fontSize: 40.0)
                  ),

                   Text(box.read("res").toString(),
                      style: TextStyle(fontSize: 30.0)

                   ),
                
                  Text(
                   box.read("res2").toString(),
                  style: TextStyle(fontSize: 15.0),

                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Container(
             height: 50.0,
            width: double.infinity,
            child:     
             RaisedButton(
                          textColor: Colors.white,
                          color: Colors.pink,
                          child: Text(
            'RE-CALCULATE',
            style: TextStyle(fontSize: 20)
          ),
                          onPressed: () {
                            // Respond to button press
                                 Get.off(InputPage()) ;

                          },
                         // icon: Icon(Icons.chevron_right_rounded, size: 18),
                         // label: Text("next".tr),


          ),)
        ],
      ),
    );
  }
    



}