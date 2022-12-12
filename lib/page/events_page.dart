import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:acb_isbe/model/events_general_model.dart';
import 'package:flutter/services.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPage();
}

class _EventsPage extends State<EventsPage> {
  List<EventsGeneral> listEventsGeneral = [];

  Future<List<EventsGeneral>> fetchEventsGeneral() async {
    listEventsGeneral = [];

    final String response = await rootBundle.loadString('jsonfile/eventsgeneral.json');
    final data = json.decode(response) as List<dynamic>;

    for (var d in data) {
      if (d != null) {
        listEventsGeneral.add(EventsGeneral.fromJson(d["fields"]));
      }
    }
    return listEventsGeneral;
  }
  
  displaySpeakerName(String? speakerName) {
    if (speakerName != null) {
      return "$speakerName";
    } else {
      return "";
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: FutureBuilder(
                future: fetchEventsGeneral(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text("No events to display", style: TextStyle(color: Colors.red, fontSize: 20),),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => Center(
                                child: Card(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text("${snapshot.data![index].program}", style:TextStyle(color: Colors.white, fontSize: 20),),
                                        tileColor: Colors.deepPurple,
                                        subtitle: RichText(
                                          text: TextSpan(
                                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
                                            children: <TextSpan>[
                                              TextSpan(text: "${snapshot.data![index].startTime} - ${snapshot.data![index].endTime}   "),
                                              TextSpan(text: "${snapshot.data![index].place}   "),
                                              TextSpan(text: displaySpeakerName(snapshot.data![index].speaker))
                                            ]
                                          )
                                        )
                                      ),
                                    ]
                                  )
                                )
                              )
                            )
                          )
                        ]
                      );
                    }
                  }
                }
              )
            ),
          ]
        )
      )
    );
  }
}