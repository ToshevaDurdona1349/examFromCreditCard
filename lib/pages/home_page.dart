import 'package:flutter/material.dart';
import 'package:imtihonvisa/pages/addcard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card List"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0,left: 10,right: 10),
                    height: 200,
                    width: 100,
                    child: Image(image: AssetImage("assets/images/ic_master.png")
                    ),
                  ),
                  Text("**** **** **** 9275\n 11/25",),
                ],
              ),
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10,left: 10),
                      height: 200,
                      width: 100,
                      child: Image(image: AssetImage("assets/images/ic_card_visa.png"))),
                  Text("**** **** **** 9275\n 11/25"),
                ],
              ),
            ),
           SizedBox(height: 460,),
           MaterialButton(
             onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder:(context) =>AddCardPage(),
             ),
             );
               },
             child: Container(
               child: Center(child: Text("ADD Card",style: TextStyle(fontSize: 16,color: Colors.white),)),
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[700],
              ),
                 ),
           ),
          ],
        ),

      ),
    );
  }
}
