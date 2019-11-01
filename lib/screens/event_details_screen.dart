import 'package:atlas/components/primary_button.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/models/EventModal.dart';
import 'package:atlas/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class EventDetailScreen extends StatefulWidget {
  final EventModel events;

  const EventDetailScreen({this.events});
  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    UserModel currentUser = appState.getUser;

    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: Stack(
        children: <Widget>[
          ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(height: 236),
              headerText('Timing'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Text(
                  widget.events.timing,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                child: Text(
                  '30/10/2019',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(height: 6),
              headerText('Venue'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.events.venue,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(height: 16),
              headerText('Event Description'),
              contentText(widget.events.description),
              Container(height: 16),
              headerText('Rules'),
              contentText(widget.events.rules),
              Container(height: 16),
              headerText('Read before registering'),
              contentText(widget.events.instructionBeforeRegistering),
              Container(
                margin: EdgeInsets.all(24),
                child: Text(currentUser.isRegisteredForEvent(widget.events.id) == false ?
                  'Register now' : '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: RED_COLOR,
                  ),
                ),
              ),
              contentText('Registrations are open.'),
              Container(
                margin: EdgeInsets.all(24),
                child: currentUser.isRegisteredForEvent(widget.events.id) ? Text('You have already registered') : PrimaryButton(
                  text: 'REGISTER',
                  onPressed: () {
setState(() {
  currentUser.addEventToRegister(widget.events.id);

});
                    appState.setUser(currentUser);
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(height: 24)
            ],
          ),
          appBar(),
        ],
      ),
    );
  }

  Widget contentText(content) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        content,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget headerText(text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            widget.events.imageUrl,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.fromLTRB(20, 36, 0, 0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: WHITE_COLOR,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.events.eventTitle,
                    style: TextStyle(
                      color: WHITE_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Container(height: 8),
                  Text(
                    widget.events.category,
                    style: TextStyle(
                      fontSize: 14,
                      color: WHITE_COLOR,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
