import 'package:atlas/app_state.dart';
import 'package:atlas/constants/colors.dart';
import 'package:atlas/models/EventModal.dart';
import 'package:atlas/models/UserModel.dart';
import 'package:atlas/screens/event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventListItem extends StatelessWidget {
  final EventModel eventModel;

  const EventListItem({this.eventModel});
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    UserModel currentUser = appState.getUser;
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
      // padding: EdgeInsets.only(left: 2, right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: BLACK_COLOR,
            blurRadius: 5.0,
          )
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventDetailScreen(
                      events: eventModel,
                    )),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: <Widget>[
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(eventModel.imageUrl.contains('.com') ==
                          false
                      ? 'https://images.unsplash.com/photo-1554470938-85886688c6e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
                      : eventModel.imageUrl),
                ),
              ),
            ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    RED_COLOR.withOpacity(0.1),
                    BLACK_COLOR.withOpacity(0.75),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      eventModel.eventTitle,
                      style: TextStyle(
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Container(height: 8),
                    Text(
                      eventModel.category,
                      style: TextStyle(
                        fontSize: 14,
                        color: WHITE_COLOR,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: currentUser.isRegisteredForEvent(eventModel.id) ? Colors.green.withOpacity(0.3) : RED_COLOR.withOpacity(0.3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Text(currentUser.isRegisteredForEvent(eventModel.id) ?
                'Registered' : 'Registration open',
                style: TextStyle(
                  fontSize: 12,
                  color: WHITE_COLOR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
