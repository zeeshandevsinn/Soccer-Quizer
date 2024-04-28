import 'package:flutter/material.dart';

class SportsFootballScreen extends StatefulWidget {
  const SportsFootballScreen({super.key});

  @override
  State<SportsFootballScreen> createState() => _SportsFootballScreenState();
}

class _SportsFootballScreenState extends State<SportsFootballScreen> {
  List football_players = [
    "Lionel Messi",
    "Cristiano Ronaldo",
    "Neymar Jr.",
    "Robert Lewandowski",
    "Kevin De Bruyne",
    "Kylian Mbappé"
  ];
  var i = 0;
  doI() {
    setState(() {
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Team Selection'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: size.width * .60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        "Select your players",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              for (i = 0; i < football_players.length; i = i + 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 150,
                          width: size.width * .47,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              football_players[i],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // doI(),
                    Column(
                      children: [
                        Container(
                          height: 150,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * .47,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                              color: Colors.black),
                          child: Center(
                            child: Text(
                              football_players[i + 1],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // doI(),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
