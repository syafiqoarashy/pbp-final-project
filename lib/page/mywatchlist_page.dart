import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:acb_isbe/model/mywatchlist.dart';
import 'package:acb_isbe/page/mywatchlist_details.dart';
import 'package:acb_isbe/page/drawer.dart';
import 'package:flutter/services.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({Key? key}) : super(key: key);

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  Future<List<MyWatchlist>> fetchToDo() async {
    List<MyWatchlist> listMywatchlist = [];

    final String response = await rootBundle.loadString('jsonfile/watchlist.json');
    final data = json.decode(response) as List<dynamic>;

    for (var d in data) {
      if (d != null) {
        listMywatchlist.add(MyWatchlist.fromJson(d["fields"]));
      }
    }
    return listMywatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
        drawer: displayDrawer.display(context),
        body: FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "To do list is empty :(",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                        child:ListTile(
                          title:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].title}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500
                                )
                              )
                            ],
                          ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)  => DetailsPage(rating: snapshot.data![index].rating,
                                      releaseDate: snapshot.data![index].releaseDate,
                                      review: snapshot.data![index].review,
                                      title: snapshot.data![index].title,
                                      watched: snapshot.data![index].watched)
                                  ));
                            }
                        ),
                        )
                      );
                }
              }
            }
        )
    );
  }
}