import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterux1/constants.dart';
import 'package:flutterux1/data/data.dart';
import 'package:flutterux1/detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEdnColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEdnColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Text(
                    "Explora",
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                  DropdownButton(
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Sistema solar",
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Sistema Solar",
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 24,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                    onChanged: (value) {},
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Image.asset('assets/drop_down_icon.png'),
                    ),
                    underline: SizedBox(),
                  )
                ],
              ),
            ),
            Container(
              height: 500,
              padding: EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: planets.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8)),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, a, b) =>
                                  DetailPage(planetInfo: planets[index])));
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(planets[index].name,
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 44,
                                            color: Color(0xff47455f),
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left),
                                    Text(
                                      "Sistema Solar",
                                      style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 23,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Row(
                                      children: [
                                        Text("Conoce más"),
                                        Icon(Icons.arrow_forward_ios,
                                            color: secondaryTextColor),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Hero(
                            tag: planets[index].iconImage,
                            child: Image.asset(planets[index].iconImage))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
            color: navigationColor),
        padding: EdgeInsets.all(24),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            icon: Image.asset('assets/menu_icon.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/search_icon.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/profile_icon.png'),
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}
