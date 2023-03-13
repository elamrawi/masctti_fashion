import 'Links.dart';
import 'Image.dart';

class ProductCategory {
  int? id;
  String? name;
  String? slug;

  ProductCategory({this.id, this.name, this.slug});

  ProductCategory.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  Image? image;
  int? menuOrder;
  int? count;
  Links? lLinks;

  Category(
      {this.id,
      this.name,
      this.slug,
      this.parent,
      this.description,
      this.display,
      this.image,
      this.menuOrder,
      this.count,
      this.lLinks});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
    description = json['description'];
    display = json['display'];
    if (json['image'].runtimeType != Null) {
      image = Image.fromJson(json['image']);
    }

    menuOrder = json['menu_order'];
    count = json['count'];
    // lLinks = json['_links'] != null ?  Links.fromJson(json['_links']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['slug'] = this.slug;
  //   data['parent'] = this.parent;
  //   data['description'] = this.description;
  //   data['display'] = this.display;
  //   if (this.image != null) {
  //     data['image'] = this.image!.map((v) => v.toJson()).toList();
  //   }
  //   data['menu_order'] = this.menuOrder;
  //   data['count'] = this.count;
  //   if (this.lLinks != null) {
  //     data['_links'] = this.lLinks!.toJson();
  //   }
  //   return data;
  // }
}
