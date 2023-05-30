class ImageModel {
  String? id;
  String? url;
  int? orgWidth;
  int? orgHeight;
  String? orgUrl;
  String? cloudName;
  String? dominantColor;
  int? fileSize;

  ImageModel(
      {this.id,
      this.url,
      this.orgWidth,
      this.orgHeight,
      this.orgUrl,
      this.cloudName,
      this.dominantColor,
      this.fileSize});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    orgWidth = json['org_width'];
    orgHeight = json['org_height'];
    orgUrl = json['org_url'];
    cloudName = json['cloud_name'];
    dominantColor = json['dominant_color'];
    fileSize = json['file_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['org_width'] = orgWidth;
    data['org_height'] = orgHeight;
    data['org_url'] = orgUrl;
    data['cloud_name'] = cloudName;
    data['dominant_color'] = dominantColor;
    data['file_size'] = fileSize;
    return data;
  }
}