import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class AddNewToken extends StatefulWidget {
  @override
  _AddNewTokenState createState() => _AddNewTokenState();
}

class _AddNewTokenState extends State<AddNewToken> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          appBar(),
          Container(height: 48),
          editFields('Token title'),
          editFields('Token type'),
          editFields('Total tokens'),
          editFields('Total tokens availed.')
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
                'Add new token',
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
