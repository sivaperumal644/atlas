class UserModel {
  final String id;
  final String name;
  final String registerno;
  final String email;
  final String phone;
  final String institute;
  final String degree;
   List<String> registeredEvents;
   List<String> redeemedTokens;

  UserModel({this.registeredEvents = const [], this.redeemedTokens = const [], this.id = 'USERNO', this.name = 'Test Name', this.registerno = 'Test Reg no', this.email = 'test@test.com', this.phone = 'TESTNUM', this.institute = 'TEST INSTITUTE', this.degree = 'TEST DEGREE'});
  addEventToRegister(String eventId) {
    var tempList = registeredEvents;
    tempList.add(eventId);
    registeredEvents = tempList;
  }
  isRegisteredForEvent(String eventId) {
    if(registeredEvents.contains(eventId)) {
      return true;
    }
    return false;
  }
}