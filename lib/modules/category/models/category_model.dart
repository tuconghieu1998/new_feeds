class Category {
  String? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  String? images;
  int? photoCounts;

  Category(
      {this.id,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.description,
      this.images,
      this.photoCounts});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    description = json['description'];
    images = json['images'];
    photoCounts = json['photo_counts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['description'] = description;
    data['images'] = images;
    data['photo_counts'] = photoCounts;
    return data;
  }
}