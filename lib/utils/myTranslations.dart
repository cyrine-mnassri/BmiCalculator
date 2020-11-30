import 'package:get/get.dart';

class MyTranslations extends Translations{
  @override
 
  Map<String, Map<String, String>> get keys =>
  
   {

'en':{
'title':'hello %s',
'next':'NEXT',
'back':'BACK',
'valide': "valide",
'correct':'correct',
'incorrect':'incorrect',
'formatgood':'good format',
'formatbad':'bad format'

},

'fr':{


'title':'bonjour %s',
'next':'Suivant',
'back':'Retour',
'valide': "valide",
'correct':'correct',
'incorrect':'incorrect',
'formatgood':'bon  format',
'formatbad':'mal format'

}




  };



}