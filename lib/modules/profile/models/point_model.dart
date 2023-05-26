class Point {
  int? activityPoints;
  int? maxActivityPoints;
  int? trustedPoints;
  int? reviewRating;
  int? reviewCount;

  Point(
      {this.activityPoints,
      this.maxActivityPoints,
      this.trustedPoints,
      this.reviewRating,
      this.reviewCount});

  Point.fromJson(Map<String, dynamic> json) {
    activityPoints = json['activity_points'];
    maxActivityPoints = json['max_activity_points'];
    trustedPoints = json['trusted_points'];
    reviewRating = json['review_rating'];
    reviewCount = json['review_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_points'] = activityPoints;
    data['max_activity_points'] = maxActivityPoints;
    data['trusted_points'] = trustedPoints;
    data['review_rating'] = reviewRating;
    data['review_count'] = reviewCount;
    return data;
  }
}