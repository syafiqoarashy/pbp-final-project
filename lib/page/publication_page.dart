import 'package:acb_isbe/page/publication_details.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:acb_isbe/model/publication_model.dart';
import 'package:flutter/services.dart';

class PublicationPage extends StatefulWidget {
  const PublicationPage({Key? key}) : super(key: key);

  @override
  State<PublicationPage> createState() => _PublicationPageState();
}

class _PublicationPageState extends State<PublicationPage> {
  Future<List<Publication>> fetchToDo() async {
    List<Publication> listPublication = [];

    final String response = await rootBundle.loadString('jsonfile/publication.json');
    final data = json.decode(response) as List<dynamic>;

    for (var d in data) {
      if (d != null) {
        listPublication.add(Publication.fromJson(d["fields"]));
      }
    }
    return listPublication;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publication'),
        backgroundColor: Colors.deepPurple,
      ),
      body:
      Container(
        child: FutureBuilder(
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
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:  CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${snapshot.data![index].title}",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      )
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${snapshot.data![index].authorsName}",
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "Track : ${snapshot.data![index].track}",
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)  => PublicationDetailsPage(
                                        id: snapshot.data![index].id,
                                        trackId: snapshot.data![index].trackId,
                                        track: snapshot.data![index].track,
                                        title: snapshot.data![index].title,
                                        authorsName: snapshot.data![index].authorsName,
                                        submitted: snapshot.data![index].submitted,
                                        lastUpdated: snapshot.data![index].lastUpdated,
                                        keywords: snapshot.data![index].keywords,
                                        decision: snapshot.data![index].decision,
                                        reviewsSent: snapshot.data![index].reviewsSent,
                                        publicationAbstract: snapshot.data![index].publicationAbstract,
                                        location: snapshot.data![index].location,
                                        date: snapshot.data![index].date,
                                        time: snapshot.data![index].time,
                                        chair: snapshot.data![index].chair
                                    )
                                    ));
                              }
                          ),
                        ),
                      )
                  );
                }
              }
            }
        ),
      ),
    );
  }
}