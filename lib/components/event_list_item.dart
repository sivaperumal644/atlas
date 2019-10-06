import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class EventListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: BLACK_COLOR,
            blurRadius: 10.0,
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 170,
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
                  GREY_COLOR.withOpacity(0.0),
                  BLACK_COLOR,
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
