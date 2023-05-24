class Avatar {
  String? url;
  int? orgWidth;
  int? orgHeight;
  String? orgUrl;
  String? cloudName;
  String? dominantColor;

  Avatar(
      {this.url,
      this.orgWidth,
      this.orgHeight,
      this.orgUrl,
      this.cloudName,
      this.dominantColor});

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    orgWidth = json['org_width'];
    orgHeight = json['org_height'];
    orgUrl = json['org_url'];
    cloudName = json['cloud_name'];
    dominantColor = json['dominant_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['org_width'] = orgWidth;
    data['org_height'] = orgHeight;
    data['org_url'] = orgUrl;
    data['cloud_name'] = cloudName;
    data['dominant_color'] = dominantColor;
    return data;
  }
}