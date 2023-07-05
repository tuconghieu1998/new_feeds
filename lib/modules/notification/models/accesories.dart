import 'package:news_feed/models/image_model.dart';

class Accessories {
  String? model;
  int? modelId;
  ImageModel? thumbnail;

  Accessories({this.model, this.modelId, this.thumbnail});

  Accessories.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    modelId = json['model_id'];
    thumbnail = json['thumbnail'] != null ? ImageModel.fromJson(json['thumbnail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model'] = model;
    data['model_id'] = modelId;
    data['thumbnail'] = thumbnail?.toJson();
    return data;
  }
}