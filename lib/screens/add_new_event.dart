import 'package:atlas/components/secondart_button.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class AddNewEvent extends StatefulWidget {
  @override
  _AddNewEventState createState() => _AddNewEventState();
}

class _AddNewEventState extends State<AddNewEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          appBar(),
          Container(height: 24),
          editFields('Event title'),
          editFields('Category'),
          editFields('Venue'),
          editFields('Image url'),
          editFields('Timing'),
          editFields('Description', bottom: 130.0),
          editFields('Rules', bottom: 130.0),
          editFields('Instructions before registering', bottom: 130.0),
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
                Navigator.pop(context);
              },
              text: 'ADD MEMBERS',
            ),
          )
        ],
      ),
    );
  }

  Widget editFields(hintText, {bottom = 10.0}) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, bottom),
      decoration: BoxDecoration(
        border: Border.all(color: GREY_COLOR, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: hintText),
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
