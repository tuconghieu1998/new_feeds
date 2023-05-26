class Config {
  bool? allowPushNotif;
  bool? allowBookingNotif;
  bool? acceptingBooking;

  Config({this.allowPushNotif, this.allowBookingNotif, this.acceptingBooking});

  Config.fromJson(Map<String, dynamic> json) {
    allowPushNotif = json['allow_push_notif'];
    allowBookingNotif = json['allow_booking_notif'];
    acceptingBooking = json['accepting_booking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allow_push_notif'] = allowPushNotif;
    data['allow_booking_notif'] = allowBookingNotif;
    data['accepting_booking'] = acceptingBooking;
    return data;
  }
}