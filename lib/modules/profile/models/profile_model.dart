import 'package:news_feed/models/image_model.dart';

class Profile {
  int? cityId;
  List<ImageModel>? coverImages;
  List<String>? interestTopics;
  int? castPriceMin;
  int? castPriceMax;
  int? bust;
  int? waist;
  int? hips;
  int? shoes;
  String? bio;
  int? weight;
  int? height;
  String? instagramUsername;
  List<String>? shootingStyles;
  String? photoGear;

  Profile(
      {this.cityId,
      this.coverImages,
      this.interestTopics,
      this.castPriceMin,
      this.castPriceMax,
      this.bust,
      this.waist,
      this.hips,
      this.shoes,
      this.bio,
      this.weight,
      this.height,
      this.instagramUsername,
      this.shootingStyles,
      this.photoGear});

  Profile.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    if (json['cover_images'] != null) {
      coverImages = <ImageModel>[];
      json['cover_images'].forEach((v) {
        coverImages!.add(ImageModel.fromJson(v));
      });
    }
    interestTopics = json['interest_topics'];
    castPriceMin = json['cast_price_min'];
    castPriceMax = json['cast_price_max'];
    bust = json['bust'];
    waist = json['waist'];
    hips = json['hips'];
    shoes = json['shoes'];
    bio = json['bio'];
    weight = json['weight'];
    height = json['height'];
    instagramUsername = json['instagram_username'];
    shootingStyles = json['shooting_styles'];
    photoGear = json['photo_gear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    if (coverImages != null) {
      data['cover_images'] = coverImages!.map((v) => v.toJson()).toList();
    }
    data['interest_topics'] = interestTopics;
    data['cast_price_min'] = castPriceMin;
    data['cast_price_max'] = castPriceMax;
    data['bust'] = bust;
    data['waist'] = waist;
    data['hips'] = hips;
    data['shoes'] = shoes;
    data['bio'] = bio;
    data['weight'] = weight;
    data['height'] = height;
    data['instagram_username'] = instagramUsername;
    data['shooting_styles'] = shootingStyles;
    data['photo_gear'] = photoGear;
    return data;
  }
}





