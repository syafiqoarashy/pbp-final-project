import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:acb_isbe/model/tracks_model.dart';
import 'package:acb_isbe/page/publication_page.dart';
import 'package:flutter/services.dart';


class SessionsPage extends StatefulWidget {
  const SessionsPage({Key? key}) : super(key: key);

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  List<Tracks> listTracks= [];

  Future<List<Tracks>> fetchTracks() async {
    listTracks = [];

    final String response = await rootBundle.loadString('jsonfile/tracks.json');
    final data = json.decode(response) as List<dynamic>;

    for (var d in data) {
      if (d != null) {
        listTracks.add(Tracks.fromJson(d["fields"]));
      }
    }

    return listTracks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('graphics/sessions2.png', width:130)),
        backgroundColor: Colors.deepPurple,
      ),
        body: FutureBuilder(
            future: fetchTracks(),
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
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color:Colors.deepPurple,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color:const Color(0xfffeda07), width:3),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.yellow,
                                  blurRadius: 4.0
                              )
                            ]
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                                  child: Text(
                                    "${snapshot.data![index].symposium}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                        color:Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text("${snapshot.data![index].title}",
                                          style: const TextStyle(
                                              fontSize: 13.8,
                                              color:Colors.white),),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                          color:Colors.white
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            tileColor: const Color(0xff6849ef),

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PublicationPage(track:snapshot.data![index].symposium))
                              );
                            },
                          ),
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