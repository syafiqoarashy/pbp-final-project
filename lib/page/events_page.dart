import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:acb_isbe/model/events_general_model.dart';
import 'package:acb_isbe/model/events_parallel_model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'events_parallel_page.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPage();
}

class _EventsPage extends State<EventsPage> {
  List<EventsGeneral> listEventsGeneral = [];
  List<EventsGeneral> listEventsFiltered = [];
  String? test;
  String? test2;
  String selectedDate = "2019-07-22";
  List<String> listDates = ["2019-07-22", "2019-07-23", "2019-07-24", "2019-07-25"];

  Future<List<EventsGeneral>> fetchEventsGeneral() async {
    
    listEventsGeneral = [];

    final String response = await rootBundle.loadString('jsonfile/eventsgeneral.json');
    final data = await json.decode(response);

    for (var d in data) {
      if (d != null) {
        listEventsGeneral.add(EventsGeneral.fromJson(d["fields"]));
      }
    }

    setState(() {
      listEventsFiltered = listEventsGeneral.where((element) => element.date.toLowerCase().contains(selectedDate.toLowerCase())).toList();
    });

    return listEventsFiltered;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton(
                      value: selectedDate,
                      items: listDates.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDate = newValue!;
                        });
                      }
                    )
                  )
                ]
              ),
            ),
            FutureBuilder(
              future: fetchEventsGeneral(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: listEventsFiltered.map((data) {
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
                                if (data.isParallel == "True")
                                  TextButton(
                                    child: Text("View Parallel Sessions"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EventsParallelPage())
                                      );
                                    }
                                  )
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