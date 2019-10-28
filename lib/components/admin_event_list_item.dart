import 'package:atlas/constants/colors.dart';
import 'package:atlas/screens/event_details_screen.dart';
import 'package:flutter/material.dart';

class AdminEventListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
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
            MaterialPageRoute(builder: (context) => EventDetailScreen()),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: <Widget>[
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/place_holder.jpg',
                  ),
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
                      'Battle Royale ',
                      style: TextStyle(
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Container(height: 8),
                    Text(
                      'Be the last one alive. Compete solo, or form a team of up to 4 members.',
                      style: TextStyle(
                        fontSize: 14,
                        color: WHITE_COLOR,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: WHITE_COLOR,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Registrations:',
                          style: TextStyle(fontSize: 12, color: WHITE_COLOR),
                        ),
                        Container(width: 12),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            '40 / 80',
                            style: TextStyle(
                              color: WHITE_COLOR,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Hall A302 · 04:30 PM 25/10/2019',
                          style: TextStyle(
                            color: WHITE_COLOR,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: WHITE_COLOR,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: RED_COLOR.withOpacity(0.3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Text(
                'InProgress',
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
