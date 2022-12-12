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
  Future<List<EventsGeneral>> fetchEventsGeneral() async {

    final String response = await rootBundle.loadString('jsonfile/eventsgeneral.json');
    final data = json.decode(response) as List<dynamic>;

    List<EventsGeneral> listEventsGeneral = [];
    for (var d in data) {
      if (d != null) {
        listEventsGeneral.add(EventsGeneral.fromJson(d["fields"]));
      }
    }

    return listEventsGeneral;
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
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
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Center(
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("${snapshot.data![index].program}"),
                          ),
                        ]
                      )
                    )
                  )
                );
              }
            }
          }
        )
      )
    );
  }
}