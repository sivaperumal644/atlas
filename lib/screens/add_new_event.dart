import 'package:atlas/app_state.dart';
import 'package:atlas/components/secondart_button.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/models/EventModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewEvent extends StatefulWidget {
  final Function onEventAdding;

  const AddNewEvent({this.onEventAdding});
  @override
  _AddNewEventState createState() => _AddNewEventState();
}

class _AddNewEventState extends State<AddNewEvent> {
  Map eventFields = {
    'eventTitle': '',
    'category': '',
    'venue': '',
    'imageUrl': '',
    'timing': '',
    'description': '',
    'rules': '',
    'instructionBeforeRegistering': ''
  };
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          appBar(),
          Container(height: 24),
          editFields('Event title', (val) {
            eventFields['eventTitle'] = val;
          }),
          editFields('Category', (val) {
            eventFields['category'] = val;
          }),
          editFields('Venue', (val) {
            eventFields['venue'] = val;
          }),
          editFields('Image url', (val) {
            eventFields['imageUrl'] = val;
          }),
          editFields('Timing', (val) {
            eventFields['timing'] = val;
          }),
          editFields('Description', (val) {
            eventFields['description'] = val;
          }, bottom: 130.0),
          editFields('Rules', (val) {
            eventFields['rules'] = val;
          }, bottom: 130.0),
          editFields('Instructions before registering', (val) {
            eventFields['instructionBeforeRegistering'] = val;
          }, bottom: 130.0),
          Container(
            margin: EdgeInsets.all(24),
            height: 1,
            color: GREY_COLOR,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Assign members',
              style: TextStyle(
                color: RED_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(24),
            child: SecondaryButton(
              onPressed: () {
                appState.setEvent(EventModel(
                  eventTitle: eventFields['eventTitle'],
                  category: eventFields['category'],
                  venue: eventFields['venue'],
                  imageUrl: eventFields['imageUrl'],
                  timing: eventFields['timing'],
                  description: eventFields['description'],
                  rules: eventFields['rules'],
                  instructionBeforeRegistering:
                      eventFields['instructionBeforeRegistering'],
                ));
                // widget.onEventAdding(
                //   EventModel(
                //     eventTitle: eventFields['eventTitle'],
                //     category: eventFields['category'],
                //     venue: eventFields['venue'],
                //     imageUrl: eventFields['imageUrl'],
                //     timing: eventFields['timing'],
                //     description: eventFields['description'],
                //     rules: eventFields['rules'],
                //     instructionBeforeRegistering:
                //         eventFields['instructionBeforeRegistering'],
                //   ),
                // );
                Navigator.pop(context);
              },
              text: 'ADD MEMBERS',
            ),
          )
        ],
      ),
    );
  }

  Widget editFields(hintText, onChanged, {bottom = 10.0}) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, bottom),
      decoration: BoxDecoration(
        border: Border.all(color: GREY_COLOR, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: hintText),
        onChanged: onChanged,
      ),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: GREY_COLOR, blurRadius: 5),
        ],
        color: WHITE_COLOR,
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: GREY_COLOR,
                ),
              ),
              Container(width: 32),
              Text(
                'Add new event',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: RED_COLOR,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.check,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
