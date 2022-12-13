import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:acb_isbe/model/events_general_model.dart';
import 'package:acb_isbe/model/events_parallel_model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class EventsParallelPage extends StatefulWidget {
  const EventsParallelPage({Key? key}) : super(key: key);

  @override
  State<EventsParallelPage> createState() => _EventsParallelPage();
}

class _EventsParallelPage extends State<EventsParallelPage> {
  List<EventsParallel> listEventsParallel = [];

  Future<List<EventsParallel>> fetchEventsParallel() async {

    listEventsParallel = [];

    final String response = await rootBundle.loadString('jsonfile/eventsparallel.json');
    final data = await json.decode(response);

    for (var d in data) {
      if (d != null) {
        listEventsParallel.add(EventsParallel.fromJson(d["fields"]));
      }
    }

    return listEventsParallel;
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
                  FutureBuilder(
                      future: fetchEventsParallel(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: listEventsParallel.map((data) {
                                return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                            title: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("${data.program}", style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,),),
                                                  SizedBox(height: 10.0),
                                                  Text("${data.startTime} - ${data.endTime}", style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,),),
                                                  SizedBox(height: 10.0),
                                                  Text("${data.place}", style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,),),
                                                  SizedBox(height: 10.0),
                                                  Text(displaySpeakerName(data.speaker), style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,),),
                                                ]
                                            )
                                        )
                                    )
                                );
                              }).toList()
                          );
                        }
                      }
                  )
                ]
            )
        )
    );
  }
}