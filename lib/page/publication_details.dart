import 'package:flutter/material.dart';

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

  String getTrackName(String trackId) {
    String res = '';
    if (trackId == 'SCE') {
      res = 'International Symposium on Sustainable and Clean Energy';
    }
    else if (trackId == 'IT') {
      res = 'International Symposium on Infrastructure and Transport';
    }
    else if (trackId == 'AME') {
      res = 'International Symposium on Advances in Mechanical Engineering';
    }
    else if (trackId == 'BBE') {
      res = 'International Symposium on Biotechnology and Bioprocess Engineering';
    }
    else if (trackId == 'CPE') {
      res = 'International Symposium on Chemical Process and Engineering';
    }
    else if (trackId == 'SBCC') {
      res = 'International Symposium on Sustainable Building, City, and Community';
    }
    else if (trackId == 'ECE') {
      res = 'International Symposium on Electrical and Computer Engineering';
    }
    else if (trackId == 'MME') {
      res = 'International Symposium on Metallurgy and Materials Engineering';
    }
    else if (trackId == 'IE') {
      res = 'International Symposium on Industrial Engineering';
    }
    else if (trackId == 'ISBE') {
      res = 'International Symposium on Biomedical Engineering';
    }
    return res;
  }

  String getDecision(String decision) {
    String res = '';
    if (decision == 'accept') {
      res = 'The paper is accepted';
    }
    else {
      res = decision;
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: ListView(
            children:[
              Text(
                  '${widget.title}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.w700,
                  )
              ),
              SizedBox(height: 20),
              Text(
                  getTrackName('${widget.track}'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize:14,
                  )
              ),
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
              SizedBox(height: 10),
              Divider(color: Colors.grey.shade400,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                    getDecision('${widget.decision}'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize:14,
                    )
                ),
              ),
              Divider(color: Colors.grey.shade400,),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                          'Conference Information',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize:18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          )
                      ),
                      SizedBox(height: 10),
                      Text(
                          'Location: ${widget.location}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize:14,
                            color: Colors.white,
                          )
                      ),
                      Text(
                          'Date: ${widget.date}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize:14,
                            color: Colors.white,
                          )
                      ),
                      Text(
                          'Time: ${widget.time}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize:14,
                            color: Colors.white,
                          )
                      ),
                      Text(
                          'Chair: ${widget.chair}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize:14,
                            color: Colors.white,
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              const Text(
                  'Abstract',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.w700,
                  ),
              ),
              SizedBox(height: 5),
              Text(
                  '${widget.publicationAbstract}',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize:14,
                  )
              ),
              SizedBox(height: 20),
              const Text(
                  'Keywords',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.w700,
                  )
              ),
              SizedBox(height: 5),
              Text(
                  '${widget.keywords}',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize:14,
                  )
              ),
            ]
        ),
      ),
    );
  }


}