import 'package:flutter/material.dart';
import 'package:soccer_quizzer/components/article_screen.dart';

class SportsFootballScreen extends StatefulWidget {
  const SportsFootballScreen({super.key});

  @override
  State<SportsFootballScreen> createState() => _SportsFootballScreenState();
}

class _SportsFootballScreenState extends State<SportsFootballScreen> {
  List image_tile = [
    "images/la liga.png",
    "images/premier league.png",
    "images/european cup.png",
    "images/score ranking.png"
  ];
  List ContainerImage = [
    "images/01.png",
    "images/02.png",
    "images/03.png",
    "images/04.png"
  ];
  List ArticleImage = [
    "images/atrical 01.png",
    "images/atrical 02.png",
    "images/atrical 03.png",
    "images/atrical 04.png"
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('Soccer Articles'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg.png"), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  for (int i = 0; i < image_tile.length; i = i + 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ArticleScreen(
                                        articleImage:
                                            ArticleImage[i].toString())));
                          },
                          child: Container(
                            height: 100,
                            // margin: EdgeInsets.symmetric(vertical: 10),
                            width: size.width * .40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(image_tile[i]),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                        // doI(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ArticleScreen(
                                        articleImage: ArticleImage[i + 1])));
                          },
                          child: Container(
                            height: 100,
                            width: size.width * .40,
                            // margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(image_tile[i + 1]),
                                    fit: BoxFit.contain)),
                          ),
                        ),

                        // doI(),
                      ],
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  for (int j = 0; j < ContainerImage.length; j = j + 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ArticleScreen(
                                              articleImage: ArticleImage[j])));
                                },
                                child: Container(
                                  height: 200,
                                  width: size.width * .44,
                                  // margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(ContainerImage[j]),
                                          fit: BoxFit.contain)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: size.width * .44,
                                  child: Text(
                                    "African Cup of nations The transformation of the Asian Power",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ArticleScreen(
                                              articleImage:
                                                  ArticleImage[j + 1])));
                                },
                                child: Container(
                                  height: 200,
                                  width: size.width * .44,
                                  // margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage(ContainerImage[j + 1]),
                                          fit: BoxFit.contain)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: size.width * .44,
                                  child: Text(
                                    "African Cup of nations The transformation of the Asian Power",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        )));

    // SingleChildScrollView(
    //   child: Container(
    //     child: Column(
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               height: 60,
    //               width: size.width * .60,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(30.0),
    //                   color: Colors.black),
    //               child: Center(
    //                 child: Text(
    //                   "Select your players",
    //                   textAlign: TextAlign.center,
    //                   style: Theme.of(context)
    //                       .textTheme
    //                       .titleMedium
    //                       ?.copyWith(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         SizedBox(
    //           height: 30,
    //         ),
    //         for (i = 0; i < football_players.length; i = i + 2)
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Column(
    //                 children: [
    //                   Container(
    //                     margin: EdgeInsets.symmetric(vertical: 10),
    //                     height: 150,
    //                     width: size.width * .47,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.only(
    //                           bottomRight: Radius.circular(20.0),
    //                           topRight: Radius.circular(20.0),
    //                         ),
    //                         color: Colors.black),
    //                     child: Center(
    //                       child: Text(
    //                         football_players[i],
    //                         style: Theme.of(context)
    //                             .textTheme
    //                             .titleSmall
    //                             ?.copyWith(
    //                                 color: Colors.white,
    //                                 fontWeight: FontWeight.bold),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               // doI(),
    //               Column(
    //                 children: [
    //                   Container(
    //                     height: 150,
    //                     margin: EdgeInsets.symmetric(vertical: 10),
    //                     width: size.width * .47,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.only(
    //                           bottomLeft: Radius.circular(20.0),
    //                           topLeft: Radius.circular(20.0),
    //                         ),
    //                         color: Colors.black),
    //                     child: Center(
    //                       child: Text(
    //                         football_players[i + 1],
    //                         style: Theme.of(context)
    //                             .textTheme
    //                             .titleSmall
    //                             ?.copyWith(
    //                                 color: Colors.white,
    //                                 fontWeight: FontWeight.bold),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               // doI(),
    //             ],
    //           )
    //       ],
    //     ),
    //   ),
    // ),
  }
}
