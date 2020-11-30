
import 'package:apptest/screens/Input.dart';
import 'package:apptest/screens/Result.dart';
import 'package:apptest/utils/myTranslations.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
    await GetStorage.init();

  runApp(GetMaterialApp(


debugShowCheckedModeBanner: false,
debugShowMaterialGrid: false,
initialRoute: '/InputPage',
theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
defaultTransition: Transition.zoom,
translations: MyTranslations(),

getPages: [GetPage(name: '/InputPage', page: ()=>InputPage()),
GetPage(name: '/ResultPage', page: () => ResultPage(),
    )],));

}
