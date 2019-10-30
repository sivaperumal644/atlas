import 'package:atlas/models/AnnouncementModel.dart';
import 'package:atlas/models/EventModal.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isAdmin = false;
  List<AnnouncementModel> announcementList = [
    AnnouncementModel(
        postTitle: 'Welcome',
        postContent: 'Welcome to our fest. We hope you enjoy the events.')
  ];
  List<EventModel> eventDatabaseList = [
    EventModel(
        eventTitle: 'Android Hackathon',
        category: 'Technical Event',
        venue: 'CC1 Lab - A Block',
        timing: '03:30 PM to 06:30 PM',
        description:
            'Android Hackathon event, hosted by the department of Computer Science, tests your creative and coding skills. Make an amazing Android app, or a game, and you win exciting goodies.',
        instructionBeforeRegistering:
            'This event requires you to bring a laptop with Android Studio installed. Internet will be provided. Bring adapters for charging the laptop',
        rules:
            'The topic of the hackathon will be informed to the participants only by 03: 30 PM',
        imageUrl:
            'https://images.unsplash.com/photo-1571867424485-4754edeaf0b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
    EventModel(
        eventTitle: 'iOS Hackathon',
        category: 'Technical Event',
        venue: 'CC1 Lab - A Block',
        timing: '03:30 PM to 06:30 PM',
        description:
            'Android Hackathon event, hosted by the department of Computer Science, tests your creative and coding skills. Make an amazing Android app, or a game, and you win exciting goodies.',
        instructionBeforeRegistering:
            'This event requires you to bring a Mac device with XCode installed. Internet will be provided. Bring adapters for charging the laptop',
        rules:
            'The topic of the hackathon will be informed to the participants only by 03: 30 PM',
        imageUrl:
            'https://images.unsplash.com/photo-1571867424485-4754edeaf0b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
    EventModel(
        eventTitle: 'Tamil Poetry',
        category: 'Literary Event',
        venue: 'RNG Hall',
        timing: '01:30 PM to 02:30 PM',
        description:
            'Poetry (the term derives from a variant of the Greek term, poiesis, "making") is a form of literature that uses aesthetic and rhythmic qualities of language—such as phonaesthetics, sound symbolism, and metre—to evoke meanings in addition to, or in place of, the prosaic ostensible meaning. ',
        instructionBeforeRegistering:
            'Paper will be provided to the students. Please bring writing instruments such as pen and pencil.',
        rules:
            'The topic of the poetry competition will be informed to the participants only by 03: 30 PM',
        imageUrl:
            'https://images.unsplash.com/photo-1473186505569-9c61870c11f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
  ];

  void setAnnouncement(AnnouncementModel announcementModel) {
    announcementList.add(announcementModel);
    notifyListeners();
  }

  void setEvent(EventModel event) {
    eventDatabaseList.add(event);
    notifyListeners();
  }

  void setIsAdmin(bool val) {
    isAdmin = val;
    notifyListeners();
  }

  get getIsAdmin => isAdmin;
  get getAnnouncements => announcementList;
  get getEventsList => eventDatabaseList;
}
