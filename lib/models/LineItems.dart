import 'MetaData.dart';
import 'Taxs.dart';

class LineItems {
  int? id;
  String? name;
  int? productId;
  int? variationId;
  int? quantity;
  String? taxClass;
  String? subtotal;
  String? subtotalTax;
  String? total;
  String? totalTax;
  List<Taxes>? taxes;
  List<MetaData>? metaData;
  String? sku;
  int? price;
  late String urlImage;

  LineItems({
    this.id,
    this.name,
    this.productId,
    this.variationId,
    this.quantity,
    this.taxClass,
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.totalTax,
    this.taxes,
    this.metaData,
    this.sku,
    this.price,
    this.urlImage = '',
  });

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    variationId = json['variation_id'];
    quantity = json['quantity'];
    taxClass = json['tax_class'];
    subtotal = json['subtotal'];
    subtotalTax = json['subtotal_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    if (json['taxes'] != null) {
      taxes = [];
      json['taxes'].forEach((v) {
        taxes!.add(new Taxes.fromJson(v));
      });
    }
    if (json['meta_data'] != null) {
      metaData = [];
      json['meta_data'].forEach((v) {
        metaData!.add(new MetaData.fromJson(v));
      });
    }
    sku = json['sku'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['variation_id'] = this.variationId;
    data['quantity'] = this.quantity;
    data['tax_class'] = this.taxClass;
    data['subtotal'] = this.subtotal;
    data['subtotal_tax'] = this.subtotalTax;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    if (this.taxes != null) {
      data['taxes'] = this.taxes!.map((v) => v.toJson()).toList();
    }
    if (this.metaData != null) {
      data['meta_data'] = this.metaData!.map((v) => v.toJson()).toList();
    }
    data['sku'] = this.sku;
    data['price'] = this.price;
    return data;
  }
}
