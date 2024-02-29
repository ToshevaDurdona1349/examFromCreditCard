
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imtihonvisa/models/credit_card_model.dart';


class MyAppState extends StatefulWidget {
  const MyAppState({super.key});

  @override
  State<MyAppState> createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiredDateController = TextEditingController();
  TextEditingController cardHolderNameDateController = TextEditingController();
  TextEditingController cvvCodeController = TextEditingController();
  TextEditingController cardTypeController = TextEditingController();

  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  String cardType = "";
  String cardImage= "";


  bool showBackView = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // bu chiqish belgisini o'chiradi
        automaticallyImplyLeading: true,
        title: Text(
          "Add Card",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/images/img_5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: showBackView,
                onCreditCardWidgetChange: (CreditCardBrand brand) {},
                bankName: 'Name of the Bank',
                // cardBgColor: Colors.blue,
                //kartani  rangli qilib turadi
                // glassmorphismConfig: Glassmorphism.defaultConfig(),
                //rasmni o'zgartirib bo'ladi turibdi kartani
                enableFloatingCard: true,
                floatingConfig: FloatingConfig(
                  // raqamlar bosilishini taminlaydi
                  isGlareEnabled: true,
                  isShadowEnabled: true,
                  shadowConfig: FloatingShadowConfig(),
                ),
                backgroundImage: 'assets/images/img_7.png',
                labelValidThru: 'VALID\nTHRU',
                //false bo'lsa kartani raqamini to'liq ko'rsatadi
                obscureCardNumber: true,
                //tru bo'lsa context.read<karta raqam boshi va oxirini ko'rsatadi>()
                obscureInitialCardNumber: false,
                //cvvni kodini yopib berati true
                obscureCardCvv: false,
                labelCardHolder: 'CARD HOLDER NAME',
                // labelValidThru: 'VALID\nTHRU',
                //katra taypi beriladi
                // cardType: CardType.mastercard,
                //kartaga holderni yozishni yopadi false
                isHolderNameVisible: true,
                height: 230,
                textStyle: TextStyle(color: Colors.black),
                width: MediaQuery.of(context).size.width,
                //chipni olib tashidi false bo'lsa
                isChipVisible: true,
                // kartani aylanmaydi falseda
                isSwipeGestureEnabled: true,
                animationDuration: Duration(milliseconds: 1000),
                frontCardBorder: Border.all(color: Colors.grey),
                // kartani orqaqa fonini rangi
                backCardBorder: Border.all(color: Colors.yellow),
                chipColor: Colors.grey,
                // umumiy kontanerdan siqadi
                padding: 16,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        formKey: formKey,
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        // Required
                        obscureCvv: true,
                        obscureNumber: true,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        enableCvv: true,
                        cvvValidationMessage: 'Please input a valid CVV',
                        dateValidationMessage: 'Please input a valid date',
                        numberValidationMessage: 'Please input a valid number',
                        //yozilishi kerak bo'lgan joylar qizil ko'rsatadi
                        // autovalidateMode: AutovalidateMode.always,
                        // aftamatik saqlab qo'yasizmi true
                        disableCardNumberAutoFillHints: true,
                        inputConfiguration: const InputConfiguration(
                          cardNumberDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',

                          ),
                          expiryDateDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Holder',
                          ),
                          cardNumberTextStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          cardHolderTextStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          expiryDateTextStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          cvvCodeTextStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue,
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                      saveCreditCard();
                                  }
                                },
                                child: const Text(
                                  'Save Card',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  var cardDetails = CardScanner.scanCard(
                                    scanOptions: CardScanOptions(
                                      scanCardHolderName: true,
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.document_scanner_outlined,
                                )),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// carta bilan pastdagi yozuvlarni bog'lab turadi
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
    });
  }
  void saveCreditCard() {
    setState(() {

      CreditCard creditCard = CreditCard(
        cardNumber: cardNumber,
        cardHolderName: cardHolderName,
        cardImage:"assets/images/ic_card_visa.png",
        cvvCode: cvvCode,
        expiryDate: expiryDate,
        cardType: cardType,
      );

      backToFinish(creditCard);
    });
  }

  void backToFinish(CreditCard creditCard) {
    Navigator.of(context).pop(creditCard);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
