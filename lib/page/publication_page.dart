import 'package:acb_isbe/page/publication_details.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:acb_isbe/model/publication_model.dart';
import 'package:flutter/services.dart';

class PublicationPage extends StatefulWidget {
  PublicationPage({Key? key, this.track}) : super(key: key);

  String? track;

  @override
  State<PublicationPage> createState() => _PublicationPageState();
}

class _PublicationPageState extends State<PublicationPage> {
  List<Publication> listPublication = [];
  List<Publication> displayList = [];
  List<Publication> titleList = [];
  List<Publication> authorList = [];
  List<Publication> trackList = [];
  String searchKeyword = '';
  String? selectedTrack = 'Track';
  List<String> listTracks = ['Track', 'SCE', 'IT', 'AME', 'BBE', 'CPE', 'SBCC', 'ECE', 'MME',  'IE', 'ISBE'];
  String? test = null;

  Future<List<Publication>> fetchPublication(String value) async {
    // listPublication = [];

    final String response = await rootBundle.loadString('jsonfile/publication.json');
    final data = json.decode(response) as List<dynamic>;

    if (listPublication.isEmpty){
      for (var d in data) {
        if (d != null) {
          listPublication.add(Publication.fromJson(d["fields"]));
        }
      }
    }

    test = '${widget.track}';

    setState(() {
      if(selectedTrack == 'Track') {
        if (test == 'null') {
          selectedTrack = 'Track';
        } else {
          selectedTrack = test;
        }
        titleList = listPublication.where((element) =>
            element.title!.toLowerCase().contains(value.toLowerCase())).toList();
        authorList = listPublication.where((element) =>
            element.authorsName!.toLowerCase().contains(value.toLowerCase())).toList();
        displayList = titleList + authorList;
      } else {
        trackList = listPublication.where((element) =>
            element.track!.toLowerCase().contains(selectedTrack!.toLowerCase())).toList();
        titleList = trackList.where((element) =>
            element.title!.toLowerCase().contains(value.toLowerCase())).toList();
        authorList = trackList.where((element) =>
            element.authorsName!.toLowerCase().contains(value.toLowerCase())).toList();
        displayList = titleList + authorList;
      }
    });

    return displayList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publication'),
        backgroundColor: Colors.deepPurple,
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    // width: 300,
                    child: TextField(
                      onChanged: (value) => fetchPublication(value),
                      cursorColor: Colors.deepPurple,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search for title, author(s)',
                        prefixIcon: Icon(Icons.search, color: Colors.deepPurple,)
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5
                      )
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedTrack,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: listTracks.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTrack = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
                future: fetchPublication(searchKeyword),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ));
                  } else {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: displayList.map((data) {
                          return Container(
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
                                          "${data.title}",
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                          "Last Updated: ${data.lastUpdated}",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey.shade600
                                          )
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${data.authorsName}",
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        "Keywords: ${data.keywords}",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey.shade600
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "${data.track}",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context)  => PublicationDetailsPage(
                                            id: data.id,
                                            trackId: data.trackId,
                                            track: data.track,
                                            title: data.title,
                                            authorsName: data.authorsName,
                                            submitted: data.submitted,
                                            lastUpdated: data.lastUpdated,
                                            keywords: data.keywords,
                                            decision: data.decision,
                                            reviewsSent: data.reviewsSent,
                                            publicationAbstract: data.publicationAbstract,
                                            location: data.location,
                                            date: data.date,
                                            time: data.time,
                                            chair: data.chair
                                        )
                                        ));
                                  }
                              ),
                            ),
                          );
                        }).toList());
                  }
                }),
          ],
        ),
      ),
    );
  }
}