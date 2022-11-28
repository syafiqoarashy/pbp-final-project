import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage ({Key? key, required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review}) : super(key: key);

  final watched;
  final title;
  final rating;
  final releaseDate;
  final review;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Detail')
      ),
      body: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${widget.title}',
                      style: const TextStyle(fontSize:23, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6.0, 0, 6.0, 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Release Date: ${widget.releaseDate}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Rating: ${widget.rating}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Status: ${widget.watched}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Wrap(
                children: [
                  Text("Reviewe: ${widget.review}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }


}