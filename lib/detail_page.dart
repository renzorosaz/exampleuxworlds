import 'package:flutter/material.dart';
import 'package:flutterux1/constants.dart';
import 'package:flutterux1/data/data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 300,
                        ),
                        Text(
                          "Jupiter",
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 56,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Solar System",
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 32,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 5,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Divider(color: Colors.black38)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      "Galeria",
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 25,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.only(left: 32),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: planetInfo.images.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  )
                ],
              ),
            ),
            Positioned(
                right: -64,
                child: Hero(
                  tag: planetInfo.position,
                  child: Image.asset(
                    planetInfo.iconImage,
                  ),
                )),
            Positioned(
                top: 60,
                left: 32,
                child: Text(
                  "5",
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 247,
                      color: primaryTextColor.withOpacity(0.08),
                      fontWeight: FontWeight.w900),
                )),
            IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
