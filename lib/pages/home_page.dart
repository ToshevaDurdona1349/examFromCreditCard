import 'package:flutter/material.dart';
import 'package:imtihonvisa/models/credit_card_model.dart';
import 'package:imtihonvisa/pages/cridit_card_page.dart';
import 'package:imtihonvisa/pages/details_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CreditCard>?cards =[
    // CreditCard(cardNumber: '**** **** **** ****',expiryDate: '12/25',cvvCode: "1234",cardHolderName: "Tosheva Durdona",
    //     cardImage:"assets/images/ic_card_visa.png",cardType: "Visa" ),
    // CreditCard(cardNumber: '**** **** **** ****',expiryDate: '13/24',cvvCode: "1234",cardHolderName: "Islomova Durdona",
    //     cardImage: "assets/images/ic_master.png",cardType: "Master"),

  ];



  @override
  Widget build(BuildContext context) {
    Future _openDetailsPage() async {
      CreditCard result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const MyAppState();
          },
        ),
      );

      setState(() {
          cards?.add(result);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(" My Cards "),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: cards?.length,
                itemBuilder: (ctx, i) {
                  return _itemOfCardList(cards![i]);
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: MaterialButton(
                onPressed: () {
                  _openDetailsPage();
                },
                child: const Text(
                  'Add Card',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemOfCardList(CreditCard creditCard) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 120,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Image(image: AssetImage(creditCard.cardImage!)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '**** **** **** ${creditCard.cardNumber!.substring(creditCard.cardNumber!.length - 4)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                creditCard.expiryDate!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                creditCard.cvvCode!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                creditCard.cardHolderName!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                getCardType(creditCard.cardType!),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,

                ),
              ),


            ],
          )
        ],
      ),
    );
  }
  String getCardType(String cardNumber) {
    // Visa kartalari 4 bilan boshlanadi
    if (cardNumber.startsWith('4')) {
      return 'Visa';
    }
    // MasterCard kartalari 6 bilan boshlanadi
    else if (cardNumber.startsWith('6')) {
      return 'MasterCard';
    }
    // Agar hech qaysi kartaga mos kelmasa
    else {
      return 'Noma\'lum';
    }
  }


}