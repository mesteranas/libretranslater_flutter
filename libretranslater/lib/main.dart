import 'dart:convert';

import 'settings.dart';
import 'package:flutter/widgets.dart';

import 'language.dart';
import 'package:http/http.dart' as http;
import 'viewText.dart';
import 'app.dart';
import 'contectUs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Language.runTranslation();
  runApp(test());
}
class test extends StatefulWidget{
  const test({Key?key}):super(key:key);
  @override
  State<test> createState()=>_test();
}
class _test extends State<test>{
    String result="";
  TextEditingController _textEdit=TextEditingController();
  var languages={'Abkhaz': 'ab', 'Afar': 'aa', 'Afrikaans': 'af', 'Akan': 'ak', 'Albanian': 'sq', 'Amharic': 'am', 'Arabic': 'ar', 'Aragonese': 'an', 'Armenian': 'hy', 'Assamese': 'as', 'Avaric': 'av', 'Avestan': 'ae', 'Aymara': 'ay', 'Azerbaijani': 'az', 'Bambara': 'bm', 'Bashkir': 'ba', 'Basque': 'eu', 'Belarusian': 'be', 'Bengali; Bangla': 'bn', 'Bihari': 'bh', 'Bislama': 'bi', 'Bosnian': 'bs', 'Breton': 'br', 'Bulgarian': 'bg', 'Burmese': 'my', 'Catalan; Valencian': 'ca', 'Chamorro': 'ch', 'Chechen': 'ce', 'Chichewa; Chewa; Nyanja': 'ny', 'Chinese': 'zh', 'Chuvash': 'cv', 'Cornish': 'kw', 'Corsican': 'co', 'Cree': 'cr', 'Croatian': 'hr', 'Czech': 'cs', 'Danish': 'da', 'Divehi; Dhivehi; Maldivian;': 'dv', 'Dutch': 'nl', 'Dzongkha': 'dz', 'English': 'en', 'Esperanto': 'eo', 'Estonian': 'et', 'Ewe': 'ee', 'Faroese': 'fo', 'Fijian': 'fj', 'Finnish': 'fi', 'French': 'fr', 'Fula; Fulah; Pulaar; Pular': 'ff', 'Galician': 'gl', 'Georgian': 'ka', 'German': 'de', 'Greek, Modern': 'el', 'GuaranÃ\xad': 'gn', 'Gujarati': 'gu', 'Haitian; Haitian Creole': 'ht', 'Hausa': 'ha', 'Hebrew (modern)': 'he', 'Herero': 'hz', 'Hindi': 'hi', 'Hiri Motu': 'ho', 'Hungarian': 'hu', 'Interlingua': 'ia', 'Indonesian': 'id', 'Interlingue': 'ie', 'Irish': 'ga', 'Igbo': 'ig', 'Inupiaq': 'ik', 'Ido': 'io', 'Icelandic': 'is', 'Italian': 'it', 'Inuktitut': 'iu', 'Japanese': 'ja', 'Javanese': 'jv', 'Kalaallisut, Greenlandic': 'kl', 'Kannada': 'kn', 'Kanuri': 'kr', 'Kashmiri': 'ks', 'Kazakh': 'kk', 'Khmer': 'km', 'Kikuyu, Gikuyu': 'ki', 'Kinyarwanda': 'rw', 'Kyrgyz': 'ky', 'Komi': 'kv', 'Kongo': 'kg', 'Korean': 'ko', 'Kurdish': 'ku', 'Kwanyama, Kuanyama': 'kj', 'Latin': 'la', 'Luxembourgish, Letzeburgesch': 'lb', 'Ganda': 'lg', 'Limburgish, Limburgan, Limburger': 'li', 'Lingala': 'ln', 'Lao': 'lo', 'Lithuanian': 'lt', 'Luba-Katanga': 'lu', 'Latvian': 'lv', 'Manx': 'gv', 'Macedonian': 'mk', 'Malagasy': 'mg', 'Malay': 'ms', 'Malayalam': 'ml', 'Maltese': 'mt', 'MÄori': 'mi', 'Marathi (MarÄá¹\xadhÄ«)': 'mr', 'Marshallese': 'mh', 'Mongolian': 'mn', 'Nauru': 'na', 'Navajo, Navaho': 'nv', 'Norwegian BokmÃ¥l': 'nb', 'North Ndebele': 'nd', 'Nepali': 'ne', 'Ndonga': 'ng', 'Norwegian Nynorsk': 'nn', 'Norwegian': 'no', 'Nuosu': 'ii', 'South Ndebele': 'nr', 'Occitan': 'oc', 'Ojibwe, Ojibwa': 'oj', 'Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic': 'cu', 'Oromo': 'om', 'Oriya': 'or', 'Ossetian, Ossetic': 'os', 'Panjabi, Punjabi': 'pa', 'PÄli': 'pi', 'Persian (Farsi)': 'fa', 'Polish': 'pl', 'Pashto, Pushto': 'ps', 'Portuguese': 'pt', 'Quechua': 'qu', 'Romansh': 'rm', 'Kirundi': 'rn', 'Romanian, [])': 'ro', 'Russian': 'ru', 'Sanskrit (Saá¹ská¹›ta)': 'sa', 'Sardinian': 'sc', 'Sindhi': 'sd', 'Northern Sami': 'se', 'Samoan': 'sm', 'Sango': 'sg', 'Serbian': 'sr', 'Scottish Gaelic; Gaelic': 'gd', 'Shona': 'sn', 'Sinhala, Sinhalese': 'si', 'Slovak': 'sk', 'Slovene': 'sl', 'Somali': 'so', 'Southern Sotho': 'st', 'Spanish': 'es', 'Sundanese': 'su', 'Swahili': 'sw', 'Swati': 'ss', 'Swedish': 'sv', 'Tamil': 'ta', 'Telugu': 'te', 'Tajik': 'tg', 'Thai': 'th', 'Tigrinya': 'ti', 'Tibetan Standard, Tibetan, Central': 'bo', 'Turkmen': 'tk', 'Tagalog': 'tl', 'Tswana': 'tn', 'Tonga (Tonga Islands)': 'to', 'Turkish': 'tr', 'Tsonga': 'ts', 'Tatar': 'tt', 'Twi': 'tw', 'Tahitian': 'ty', 'Uyghur, Uighur': 'ug', 'Ukrainian': 'uk', 'Urdu': 'ur', 'Uzbek': 'uz', 'Venda': 've', 'Vietnamese': 'vi', 'VolapÃ¼k': 'vo', 'Walloon': 'wa', 'Welsh': 'cy', 'Wolof': 'wo', 'Western Frisian': 'fy', 'Xhosa': 'xh', 'Yiddish': 'yi', 'Yoruba': 'yo', 'Zhuang, Chuang': 'za', 'Zulu': 'zu'};
  String From="en";
  String To="es";


  var _=Language.translate;
  _test();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      locale: Locale(Language.languageCode),
      title: App.name,
      themeMode: ThemeMode.system,
      home:Builder(builder:(context) 
    =>Scaffold(
      appBar:AppBar(
        title: const Text(App.name),), 
        drawer: Drawer(
          child:ListView(children: [
          DrawerHeader(child: Text(_("navigation menu"))),
          ListTile(title:Text(_("settings")) ,onTap:() async{
            await Navigator.push(context, MaterialPageRoute(builder: (context) =>SettingsDialog(this._) ));
            setState(() {
              
            });
          } ,),
          ListTile(title: Text(_("contect us")),onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ContectUsDialog(this._)));
          },),
          ListTile(title: Text(_("donate")),onTap: (){
            launch("https://www.paypal.me/AMohammed231");
          },),
  ListTile(title: Text(_("visite project on github")),onTap: (){
    launch("https://github.com/mesteranas/"+App.appName);
  },),
  ListTile(title: Text(_("license")),onTap: ()async{
    String result;
    try{
    http.Response r=await http.get(Uri.parse("https://raw.githubusercontent.com/mesteranas/" + App.appName + "/main/LICENSE"));
    if ((r.statusCode==200)) {
      result=r.body;
    }else{
      result=_("error");
    }
    }catch(error){
      result=_("error");
    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewText(_("license"), result)));
  },),
  ListTile(title: Text(_("about")),onTap: (){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(title: Text(_("about")+" "+App.name),content:Center(child:Column(children: [
        ListTile(title: Text(_("version: ") + App.version.toString())),
        ListTile(title:Text(_("developer:")+" mesteranas")),
        ListTile(title:Text(_("description:") + App.description))
      ],) ,));
    });
  },)
        ],) ,),
        body:Container(alignment: Alignment.center
        ,child: Column(children: [
                  TextFormField(controller: _textEdit,decoration: InputDecoration(labelText: "text" ),textInputAction: TextInputAction.newline,),
          DropdownButton<String>(items: [
          for( var name in languages.keys.toList())
          DropdownMenuItem<String>(child: Text(name),value: name,)
        ], onChanged: (value){
          setState(() {
          From=languages[value.toString()]??"en";
          });
        },hint: Text("from"),icon: Icon(Icons.language),),

          DropdownButton<String>(items: [
          for( var name in languages.keys.toList())
          DropdownMenuItem<String>(child: Text(name),value: name,)
        ], onChanged: (value){
          setState(() {
          To=languages[value.toString()]??"en";
          });
        },hint: Text("to"),icon: Icon(Icons.language),),
        ElevatedButton(onPressed: () async{
          setState(() {
            result=_("translating ...");
          });
              final response = await http.post(
      Uri.parse("https://libretranslate.com/translate"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'q': _textEdit.text,
        'source': From,
        'target': To,
        'format': 'text'
      }),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        result=data['translatedText'];
      });
    } else {
      setState(() {
        result=_("error");
      });

      print(response.body);
    }
        }, child: Text("translate")),
        Text(result)
    ])),)));
  }
}
