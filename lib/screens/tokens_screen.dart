import 'package:atlas/components/admin_token_list_item.dart';
import 'package:atlas/components/section_header.dart';
import 'package:atlas/components/token_list_item.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/add_new_token.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class TokensScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
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
                    builder: (context) => AddNewToken(),
                  ),
                );
              },
            )
          : null,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(24),
            child: SectionHeader(
              titleText: 'Tokens',
              subTitleText: 'Tokens available to you',
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('tokens').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: return new Text('Loading...');
                default:
                  return Column(
                      children: snapshot.data.documents.map((document) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(24, 8, 24, 8),
                          child: TokenListItem(
                            id: document['id'],
                            tokenTitle: document['tokenTitle'],
                            tokenType: document['tokenType'],
                          )
                        );
                      }).toList()
                  );
              }
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              'Please contact the nearest volunteer if you are facing any issues',
              style: TextStyle(
                fontSize: 12,
                color: GREY_COLOR,
              ),
            ),
          ),
          Container(height: 64)
        ],
      ),
    );
  }
}
