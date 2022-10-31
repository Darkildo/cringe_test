import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            highlightColor: Colorss.kLight,
            appBarTheme: const AppBarTheme(
              color: Colorss.kLight,
            )),
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Contenter Club',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Space Grotesk',
                fontSize: 23,
              ),
            ),
          ),
          backgroundColor: Colorss.kGray02,
          body: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 42, bottom: 13, left: 20, right: 20),
                child: _UserCard(),
              ),
              _ContenterClubBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colorss.kLight),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text('Cameron Williamson',
                      maxLines: 2,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Space Grotesk',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(
                height: 2,
                color: Colorss.kGray02,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Text(
                          '15 requests',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colorss.kBlue),
                        ),
                      ),
                      Text(
                        'available',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colorss.kBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colorss.kGray02,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                      maxLines: 2,
                      text: const TextSpan(
                        text: 'Earned ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colorss.kBlack,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(text: '''\$100''', style: TextStyle(fontWeight: FontWeight.w700, color: Colorss.kBlue)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ContenterClubBody extends StatefulWidget {
  const _ContenterClubBody();

  @override
  State<_ContenterClubBody> createState() => __ContenterClubBodyState();
}

class __ContenterClubBodyState extends State<_ContenterClubBody> {
  bool _marketPlaceSelect = true;

  final PageController _pageController = PageController();

  _updatePage() {
    _pageController.animateToPage(_marketPlaceSelect ? 0 : 1, duration: const Duration(milliseconds: 900), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    _marketPlaceSelect = true;
                    setState(() {});
                    _updatePage();
                  },
                  child: Text(
                    'Marketplace',
                    style:
                        TextStyle(fontWeight: _marketPlaceSelect ? FontWeight.w700 : FontWeight.w400, fontSize: 23, color: Colorss.kBlack),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _marketPlaceSelect = false;
                    setState(() {});
                    _updatePage();
                  },
                  child: Text(
                    'My proposals',
                    style:
                        TextStyle(fontWeight: _marketPlaceSelect ? FontWeight.w400 : FontWeight.w700, fontSize: 23, color: Colorss.kBlack),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (newPage) {
                _marketPlaceSelect = newPage != 1;
                setState(() {});
              },
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: _MarketplacePageView()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class _MarketplacePageView extends StatefulWidget {
  const _MarketplacePageView();

  @override
  State<_MarketplacePageView> createState() => __MarketplacePageViewState();
}

class __MarketplacePageViewState extends State<_MarketplacePageView> {
  bool _mapSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CupertinoSlidingSegmentedControl(
                  groupValue: _mapSelected ? 0 : 1,
                  children: {
                    0: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.map_outlined,
                              color: !_mapSelected ? Colorss.kBlue : Colorss.kLight,
                            ),
                          ),
                          Text(
                            'Map',
                            style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: !_mapSelected ? Colorss.kBlue : Colorss.kLight),
                          )
                        ],
                      ),
                    ),
                    1: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.table_rows_rounded,
                              color: _mapSelected ? Colorss.kBlue : Colorss.kLight,
                            ),
                          ),
                          Text(
                            'List',
                            style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _mapSelected ? Colorss.kBlue : Colorss.kLight),
                          )
                        ],
                      ),
                    ),
                  },
                  onValueChanged: (v) {
                    _mapSelected = (v == 0);
                    setState(() {});
                  },
                  thumbColor: Colorss.kBlue,
                  backgroundColor: Colorss.kLight,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(color: Colorss.kBlue, borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(16),
                child: const Icon(
                  Icons.filter_list_sharp,
                  size: 20,
                  color: Colorss.kLight,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 0),
              physics: const BouncingScrollPhysics(),
              itemCount: _cardItems.length,
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _ListCard(_cardItems[index].first, _cardItems[index].last),
                  ))),
        )
      ],
    );
  }
}

class _ListCard extends StatelessWidget {
  final String name;
  final String desciption;

  const _ListCard(this.name, this.desciption);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colorss.kLight,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  desciption,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colorss.kGray02,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    '${Random().nextInt(30)}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colorss.kBlue),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    color: Colorss.kBlue,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

final _cardItems = [
  {'Runo', 'brano anfangen'},
  {'Dudo', 'hano'},
  {'Karto', 'fanos kewarden'},
  {'Nein', 'zweilf kaufen'},
  {'Runo', 'brano anfangen'},
  {'Dudo', 'hano'},
  {'Karto', 'fanos kewarden'},
  {'Nein', 'zweilf kaufen'},
  {'Runo', 'brano anfangen'},
  {'Dudo', 'hano'},
  {'Karto', 'fanos kewarden'},
  {'Nein', 'zweilf kaufen'},
  {'Runo', 'brano anfangen'},
  {'Dudo', 'hano'},
  {'Karto', 'fanos kewarden'},
  {'Nein', 'zweilf kaufen'},
];

/// {@template main.main}
/// Colorss class
/// {@endtemplate}
class Colorss {
  /// {@macro main.main}
  const Colorss();
  static const Color kBlack = Color(0xff1c1b1b);
  static const Color kBlue_hover = Color(0xff290692);
  static const Color kViolet = Color(0xff907cf4);
  static const Color kYellow = Color(0xffe7f336);
  static const Color kPink = Color(0xffec54f4);
  static const Color kMint = Color(0xff4efbb5);
  static const Color kLight = Color(0xffefefef);
  static const Color kDark = Color(0xff373737);
  static const Color kBlue = Color(0xff3c04e4);
  static const Color kGray03 = Color(0xfff0f2f4);
  static const Color kGray04 = Color(0xfffbfbfb);
  static const Color kGray02 = Color(0xffd2dae3);
  static const Color kGray01 = Color(0xffa9acb0);
  static const Color kNeutral = Color(0xfffd7e09);
  static const Color kNegative = Color(0xfffd0935);
  static const Color kPositive = Color(0xff0abe31);
} // Colorss
