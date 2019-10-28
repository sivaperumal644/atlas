import 'package:atlas/components/activity_timeline.dart';
import 'package:atlas/components/data_component.dart';
import 'package:atlas/components/engagement_component.dart';
import 'package:atlas/components/section_header.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: SectionHeader(
              titleText: 'Dashboard',
              subTitleText: 'View ongoing status of events',
            ),
          ),
          DataComponent(
            dataHeader: 'Data Insights - Stats',
            eventDescription: 'Most popular event',
            eventContent:
                'Technical Quiz - (125 registered - 45% of all participants)',
            eventPeriod: 'Highest user engagement period',
            eventContent2:
                '02:30 PM to 03:30 PM - (starts in 45 minutes) - (10 events occuring - 234 total registered)',
            buttonText: 'VIEW ALL STATS',
          ),
          DataComponent(
            dataHeader: 'Data Insights - Issues',
            eventDescription: 'Capacity is inadequate',
            eventContent:
                'Technical Quiz is in high demand, but capacity falls short in accomodating all registrants',
            eventPeriod: 'Poor feedback',
            eventContent2:
                'Workshop has received poor reviews from the participants',
            buttonText: 'VIEW ALL ISSUES',
            color: true,
          ),
          EngagementComponent(
            title: 'User engagement',
            count: '5/450',
            registeredText: 'users registered for events',
            totalCapacity: 'total event capacity',
          ),
          ActivityTimeline(title: 'Activity Timeline'),
          EngagementComponent(
            title: 'Volunteer engagement',
            count: '45/50',
            registeredText: 'currently active',
            totalCapacity: 'total volunteers',
          ),
          Container(height: 50)
        ],
      ),
    );
  }
}
