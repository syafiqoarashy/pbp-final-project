import 'package:flutter/material.dart';
import 'package:acb_isbe/page/bottom_navbar.dart';

class PublicationDetailsPage extends StatefulWidget {
  PublicationDetailsPage ({Key? key,
    required this.id,
    required this.trackId,
    required this.track,
    required this.title,
    required this.authorsName,
    this.submitted,
    this.lastUpdated,
    required this.keywords,
    this.decision,
    this.reviewsSent,
    required this.publicationAbstract,
    required this.location,
    required this.date,
    required this.time,
    required this.chair}) : super(key: key);

  String id;
  String trackId;
  String track;
  String title;
  String authorsName;
  DateTime? submitted;
  DateTime? lastUpdated;
  String keywords;
  String? decision;
  String? reviewsSent;
  String publicationAbstract;
  String location;
  DateTime date;
  String time;
  String chair;

  @override
  State<PublicationDetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<PublicationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
          children:[

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              child: Text(
                  '${widget.title}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.w700,
                  )
              ),
            ),

            // Track
            Text(
                '${widget.track}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize:14,
                )
            ),

            // Submission Date
            Text(
                'Submitted on ${widget.submitted}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize:14,
                )
            ),
            Text(
                '${widget.authorsName}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize:14,
                )
            ),
            Text(
                '${widget.decision}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize:14,
                )
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                  children: [
                    Text(
                        '${widget.location}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize:14,
                        )
                    ),
                    Text(
                        '${widget.date}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize:14,
                        )
                    ),
                    Text(
                        '${widget.time}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize:14,
                        )
                    ),
                    Text(
                        '${widget.chair}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize:14,
                        )
                    ),
                  ],
                ),
            ),
            const Text(
                'Abstract',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:14,
                )
            ),
            Text(
                '${widget.publicationAbstract}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize:14,
                )
            ),
            const Text(
                'Keywords',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:14,
                )
            ),
            Text(
                '${widget.keywords}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize:14,
                )
            ),
          ]
      ),
      bottomNavigationBar: displayNavbar.display(context),
    );
  }


}