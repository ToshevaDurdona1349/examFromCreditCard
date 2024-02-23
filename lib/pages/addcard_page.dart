import 'package:flutter/material.dart';
import 'package:imtihonvisa/pages/home_page.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Card",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Column(
          children: [
           Container(
             margin: EdgeInsets.all(30),
               height: 220,
               width: 330,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image:AssetImage("assets/images/im_card_bg.png"),
                  // konenierni to'liq qoplavaladi
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ) ,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 200,top: 20),
                        child: Text("VISA\n\n ",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white70),)),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                        child: Text("5272 8920 9183 9183  ",
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white70),)),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 180),
                            child: Text("VALID\nTHRU  ",
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white30),)),
                        SizedBox(width: 10,),
                        Container(
                            child: Text("11/26  ",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white70),)),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //   orqa foni ko'rinadi
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 100),
                child: Text("Enter expiration date",style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
            Container(
              margin: EdgeInsets.all(30),
              child: TextField(  onChanged: (text) {
                print('First text field: $text (${text.characters.length})');
              },
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 120,right: 120),
                child: TextField(  onChanged: (text) {
                  print('First text field: $text (${text.characters.length})');
                },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text("Orqaga qaytish",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
