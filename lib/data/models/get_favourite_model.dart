import 'package:e_commerce_app/data/models/product_model.dart';

import 'category_or_brand_model.dart';

class GetFavouriteModel {
  GetFavouriteModel({this.status, this.count, this.data, this.message});

  GetFavouriteModel.fromJson(dynamic json) {
    status = json['status'];
    status = json['message'];

    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetFavouriteData.fromJson(v));
      });
    }
  }
  String? message;
  String? status;
  int? count;
  List<GetFavouriteData>? data;
}

class GetFavouriteData {
  GetFavouriteData({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  GetFavouriteData.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrand.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? CategoryOrBrand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryOrBrand? category;
  CategoryOrBrand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;
}
