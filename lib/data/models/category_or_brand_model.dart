class CategoryOrBrandModel {
  CategoryOrBrandModel({
    this.results,
    this.metadata,
    this.data,
    this.message,
  });

  CategoryOrBrandModel.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrand.fromJson(v));
      });
    }
  }
  num? results;
  Metadata? metadata;
  List<CategoryOrBrand>? data;
  String? message;
}

class CategoryOrBrand {
  CategoryOrBrand({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryOrBrand.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  num? currentPage;
  num? numberOfPages;
  num? limit;
}
