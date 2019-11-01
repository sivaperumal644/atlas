import 'package:atlas/components/admin_event_list_item.dart';
import 'package:atlas/components/event_list_item.dart';
import 'package:atlas/components/search_bar.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/models/EventModal.dart';
import 'package:atlas/screens/add_new_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    List<EventModel> events = appState.getEventsList;

    return Scaffold(
      backgroundColor: WHITE_COLOR,
      floatingActionButton: appState.getIsAdmin
          ? FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: RED_COLOR,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewEvent(
                      onEventAdding: (EventModel eventModel) {
                        print(eventModel.eventTitle);
                        setState(() {
                          events.add(eventModel);
                        });
                        print(events.length);
                      },
                    ),
                  ),
                );
              },
            )
          : null,
body: ListView(
  children:   [
Container(
            margin: EdgeInsets.only(top: 48, left: 24, right: 24),
            child: SectionHeader(
              titleText: 'Events',
              subTitleText: 'List of events at SNS Allora 2020',
            ),
          ),

          Container(height: 32),
    StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('events').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError)
        return new Text('Error: ${snapshot.error}');
      switch (snapshot.connectionState) {
        case ConnectionState.waiting: return new Text('Loading...');
        default:
          return Column(
            children: snapshot.data.documents.map((document) {
              return EventListItem(
                eventModel: EventModel(
                  id: document['id'],
                category: document['category'],
                description: document['description'],
                eventTitle: document['eventTitle'],
                  imageUrl: document['imageUrl'],
                  instructionBeforeRegistering: document['instructionBeforeRegistering'],
                  rules: document['rules'],
                  timing: document['timing'],
                  venue: document['venue']
                )
              );
            }).toList()
          );
      }
    },
  ),]
),
//      body: ListView(
//        physics: BouncingScrollPhysics(),
//        children: <Widget>[
//          Container(
//            margin: EdgeInsets.only(top: 48, left: 24, right: 24),
//            child: SectionHeader(
//              titleText: 'Events',
//              subTitleText: 'List of events at SNS Allora 2020',
//            ),
//          ),
//          Container(
//            margin: EdgeInsets.only(top: 32, left: 24, right: 24),
//            child: SearchBar(),
//          ),
//          Container(height: 32),
//          ...buildEventsAsComponents(events),
//          // ListView.builder(
//          //   physics: BouncingScrollPhysics(),
//          //   itemCount: events.length,
//          //   itemBuilder: (context, index) {
//          //     return appState.getIsAdmin
//          //         ? AdminEventListItem(
//          //             events: events[index],
//          //           )
//          //         : EventListItem(
//          //             eventModel: events[index],
//          //           );
//          //   },
//          // ),
//          Container(height: 70)
//        ],
//      ),
    );
  }

  buildEventsAsComponents(List<EventModel> eventsList) {
    List<EventListItem> componentsList = [];
    eventsList.forEach((event) {
      componentsList.add(EventListItem(
        eventModel: event,
      ));
    });
    return componentsList;
  }
}
