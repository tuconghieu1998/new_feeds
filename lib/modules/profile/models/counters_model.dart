class Counters {
  int? photos;
  int? likes;
  int? followers;
  int? followings;
  int? collections;
  int? bookings;
  int? bookingApplications;

  Counters(
      {this.photos,
      this.likes,
      this.followers,
      this.followings,
      this.collections,
      this.bookings,
      this.bookingApplications});

  Counters.fromJson(Map<String, dynamic> json) {
    photos = json['photos'];
    likes = json['likes'];
    followers = json['followers'];
    followings = json['followings'];
    collections = json['collections'];
    bookings = json['bookings'];
    bookingApplications = json['booking_applications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photos'] = photos;
    data['likes'] = likes;
    data['followers'] = followers;
    data['followings'] = followings;
    data['collections'] = collections;
    data['bookings'] = bookings;
    data['booking_applications'] = bookingApplications;
    return data;
  }
}