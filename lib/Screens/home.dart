import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_quizzer/utils/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var liveScoreleaguename = [];

  bool isScoreLoading = true;
  // getLiveScore() async {
  //   var headers = {
  //     'auth_type': 'email',
  //     'email': 'parveen1@yopmail.com',
  //     'dob': '02/02/2000',
  //     'password': '123123',
  //     'first_name': 'test',
  //     'last_name': 'test'
  //   };

  //   var request = http.Request(
  //     'GET',
  //     Uri.parse(
  //         'https://api.soccerdataapi.com/livescores/?auth_token=184c67b6e6f546650bee35d2ee6b8e1aba9f04a4'),
  //   );
  //   request.headers.addAll(headers);

  //   try {
  //     var response = await request.send();

  //     if (response.statusCode == 200) {
  //       var responseBody = await response.stream.bytesToString();
  //       var body = jsonDecode(responseBody);

  //       setState(() {
  //         liveScoreleaguename = body;
  //         isScoreLoading = false;
  //       });
  //     } else {
  //       print('Failed to get live scores: ${response.reasonPhrase}');
  //       setState(() {
  //         isScoreLoading = false;
  //       });
  //     }
  //   } catch (e) {
  //     print('Error fetching live scores: $e');
  //     setState(() {
  //       isScoreLoading = false;
  //     });
  //   }
  // }

  var url = Uri.parse(
      'https://api.soccerdataapi.com/livescores/?auth_token=184c67b6e6f546650bee35d2ee6b8e1aba9f04a4');

  Future<void> fetchData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var res = await response.body;
      var body = jsonDecode(res);

      setState(() {
        liveScoreleaguename = body;
        print('Upcoming Matches= $liveScoreleaguename');
        isScoreLoading = false;
      });
    }
  }

  TextEditingController search = TextEditingController();
// Assuming this is inside a StatefulWidget
  @override
  void initState() {
    super.initState();
    fetchData();
    // getLiveScore();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setState(() {});
  }

// Assuming liveScoreleaguename and isScoreLoading are defined as state variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("League Scores"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg.png"), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  height: 55,
                  child: TextFormField(
                    controller: search,
                    onChanged: (val) {
                      setState(() {});
                    },
                    maxLines: 1,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black38,
                      ),
                      hintText: 'Search league...',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                isScoreLoading
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: liveScoreleaguename.length,
                            itemBuilder: (context, index) {
                              if (
                                  // liveScore[index]['stage']
                                  //       .toLowerCase()
                                  //       .contains(search.text.toLowerCase()) &&
                                  //   liveScoreCountry[index]['country']
                                  //       .toLowerCase()
                                  //       .contains(search.text.toLowerCase()) &&
                                  liveScoreleaguename[index]['league_name']
                                      .toLowerCase()
                                      .contains(search.text.toLowerCase())) {
                                return GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     (
                                    //         builder: (context) => TopScoreScreen(
                                    //               leageKey:
                                    //                   liveScoreleaguename[index]
                                    //                       ['league_id'],
                                    //             )));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(bottom: 15),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: MyColors.container_grey,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 6)
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'league name: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              liveScoreleaguename[index]
                                                      ['league_name']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'country name: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              liveScoreleaguename[index]
                                                      ['country']['name']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Stage: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Flexible(
                                              child: Container(
                                                child: Text(
                                                  "${liveScoreleaguename[index]['stage'][0]['stage_name'].toString()}",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Team Home: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              liveScoreleaguename[index]
                                                              ['stage'][0]
                                                          ['matches'][0]
                                                      ['teams']['home']['name']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Team Away: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              liveScoreleaguename[index]
                                                              ['stage'][0]
                                                          ['matches'][0]
                                                      ['teams']['away']['name']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Matches Time: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              liveScoreleaguename[index]
                                                          ['stage'][0]
                                                      ['matches'][0]['time']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Matches Date: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              liveScoreleaguename[index]
                                                          ['stage'][0]
                                                      ['matches'][0]['date']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Home Win Odds: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              liveScoreleaguename[index]
                                                              ['stage'][0]
                                                          ['matches'][0]['odds']
                                                      ['match_winner']['home']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Away Win Odds: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              liveScoreleaguename[index]
                                                              ['stage'][0]
                                                          ['matches'][0]['odds']
                                                      ['match_winner']['away']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Draw: ',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Spacer(),
                                            Text(
                                              liveScoreleaguename[index]
                                                              ['stage'][0]
                                                          ['matches'][0]['odds']
                                                      ['match_winner']['draw']
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ),
              ],
            ),
          ),
        )));
  }
}
