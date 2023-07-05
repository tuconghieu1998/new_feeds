import 'package:news_feed/models/image_model.dart';

class Accessory {
  String? model;
  int? modelId;
  ImageModel? thumbnail;

  Accessory({this.model, this.modelId, this.thumbnail});

  Accessory.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    modelId = json['model_id'];
    thumbnail = ImageModel.fromJson(json['thumbnail']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model'] = model;
    data['model_id'] = modelId;
    data['thumbnail'] = thumbnail?.toJson();
    return data;
  }
}