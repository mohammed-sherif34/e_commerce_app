class AddToCartModel {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  AddToCartData? data;

  AddToCartModel(
      {this.status, this.message, this.numOfCartItems, this.cartId, this.data});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? new AddToCartData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['numOfCartItems'] = this.numOfCartItems;
    data['cartId'] = this.cartId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddToCartData {
  String? sId;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  AddToCartData(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});

  AddToCartData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cartOwner'] = this.cartOwner;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['totalCartPrice'] = this.totalCartPrice;
    return data;
  }
}

class Products {
  int? count;
  String? sId;
  String? product;
  int? price;

  Products({this.count, this.sId, this.product, this.price});

  Products.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['_id'] = this.sId;
    data['product'] = this.product;
    data['price'] = this.price;
    return data;
  }
}
