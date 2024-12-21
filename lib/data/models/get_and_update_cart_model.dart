import 'package:e_commerce_app/data/models/category_or_brand_model.dart';
import 'package:e_commerce_app/data/models/product_model.dart';

class GetAndUpdateCartModel {
  GetAndUpdateCartModel(
      {this.status, this.numOfCartItems, this.cartId, this.data, this.message});

  GetAndUpdateCartModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null
        ? GetAndUpdateDataCart.fromJson(json['data'])
        : null;
  }
  String? status;
  int? numOfCartItems;
  String? cartId;
  GetAndUpdateDataCart? data;
  String? message;
}

class GetAndUpdateDataCart {
  GetAndUpdateDataCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  GetAndUpdateDataCart.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
}

class Products {
  Products({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
  }
  int? count;
  String? id;
  Product? product;
  int? price;
}

class Product {
  Product({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  Product.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrand.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? CategoryOrBrand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
  List<Subcategory>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryOrBrand? category;
  CategoryOrBrand? brand;
  num? ratingsAverage;
}
