import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('fa', ''), //farsi
        ],
        theme: ThemeData(
            fontFamily: 'Vazir',
            textTheme: const TextTheme(
                headline1: TextStyle(
                    fontFamily: 'Vazir',
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
                bodyText1: TextStyle(
                    fontFamily: 'Vazir',
                    fontWeight: FontWeight.w300,
                    fontSize: 13),
                headline2: TextStyle(
                    fontFamily: 'Vazir',
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 14))),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 243, 243, 243),
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Image.asset("assets/images/icon.png"),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "قیمت بروز سکه و ارز",
                  style: Theme.of(context).textTheme.headline1,
                )),
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/menu.png"))),
            const SizedBox(width: 16),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("/images/qmark.png"),
                  const SizedBox(width: 5),
                  Text(
                    'نرخ ارز آزاد چیست؟',
                    style: Theme.of(context).textTheme.headline1,
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'نرخ ارزها در معاملات نقدی و رابج روزانه است، معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله ، ارز و ریال را باهم تبادل میکنند . ',
                style: TextStyle(color: Colors.black),
                textDirection: TextDirection.rtl,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 35,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 130, 130, 130),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "نرخ آزاد ارز",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          'قیمت',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          'تغییر',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 350,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 14,
                    itemBuilder: (BuildContext context, int position) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 6),
                        child: SignalItem(),
                      );
                    }),
                    
              )
            ],
          ),
        ));
  }
}

class SignalItem extends StatelessWidget {
  const SignalItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(boxShadow: const <BoxShadow>[
        BoxShadow(blurRadius: 1.0, color: Colors.grey)
      ], color: Colors.white, borderRadius: BorderRadius.circular(1000)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "دلار",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "16000",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "+3",
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
