import 'package:atlas/components/primary_button.dart';
import 'package:atlas/constants/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: Container(
        margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(height: 16),
            Text(
              'Hi there, Roshan.',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: ORANGE_COLOR,
              ),
            ),
            Text(
              'Welcome to  SNS Allora 2020',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: RED_COLOR,
              ),
            ),
            Container(height: 72),
            Text(
              'This app is your key to all the events and services offered at SNS Allora 2020.',
              style: TextStyle(fontSize: 24),
            ),
            Container(height: 16),
            Text(
              'Take a look at some of the things you can do',
              style: TextStyle(
                color: GREY_COLOR,
                fontSize: 14,
              ),
            ),
            Container(height: 92),
            onBoardListItem(
              'Like an event? Just tap register to participate.',
              'You’ve already given your information, so why bother giving it again? Browse through the list of events and simply tap register to add yourself as a participant.',
              Icons.event,
              GREEN_COLOR,
            ),
            dividerLine(),
            onBoardListItemRight(
              'We’ve got your coupons and tokens right here. ',
              'Simply scan the QR Code at the venue and claim your goodies.',
              Icons.fastfood,
              ORANGE_COLOR,
            ),
            dividerLine(),
            onBoardListItem(
              'Never miss an announcement.',
              'All the updates will be posted on the information feed, so you’ll never miss out.',
              Icons.message,
              BLUE_COLOR,
            ),
            dividerLine(),
            Text(
              'Well, let’s not keep you waiting. Let’s go!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: GREY_COLOR,
                fontSize: 14,
              ),
            ),
            Container(height: 22),
            PrimaryButton(
              text: 'CONTINUE',
              onPressed: () {},
            ),
            Container(height: 60)
          ],
        ),
      ),
    );
  }

  Widget dividerLine() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: 42,
        left: MediaQuery.of(context).size.width / 6,
        right: MediaQuery.of(context).size.width / 6,
        bottom: 42,
      ),
      height: 1,
      color: GREY_COLOR.withOpacity(0.5),
    );
  }

  Widget onBoardListItem(title, subTitle, icon, color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: color,
          size: 54,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(height: 14),
              Text(
                subTitle,
                style: TextStyle(
                  color: GREY_COLOR,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget onBoardListItemRight(title, subTitle, icon, color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(height: 14),
              Text(
                subTitle,
                style: TextStyle(
                  color: GREY_COLOR,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Icon(
          icon,
          color: color,
          size: 54,
        ),
      ],
    );
  }
}
