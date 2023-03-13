import 'Attributes.dart';
import 'Category.dart';
import 'Dimensions.dart';
import 'Links.dart';
import 'Tag.dart';
import 'Image.dart';
import 'MetaData.dart';

class Product {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  // Null dateOnSaleFrom;
  // Null dateOnSaleFromGmt;
  // Null dateOnSaleTo;
  // Null dateOnSaleToGmt;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  // List<Download> downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  int? stockQuantity;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  int? lowStockAmount;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  // List<Null> upsellIds;
  // List<Null> crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Category>? categories;
  List<Tag>? tags;
  List<Image>? images;
  List<Attributes>? attributes;
  // List<Null> defaultAttributes;
  List<int?>? variations;
  // List<Null> groupedProducts;
  int? menuOrder;
  String? priceHtml;
  List<int?>? relatedIds;
  List<MetaData>? metaData;
  String? stockStatus;
  bool? hasOptions;
  Links? lLinks;

  Product({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    // this.dateOnSaleFrom,
    // this.dateOnSaleFromGmt,
    // this.dateOnSaleTo,
    // this.dateOnSaleToGmt,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    // this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    // this.upsellIds,
    // this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    // this.defaultAttributes,
    this.variations,
    // this.groupedProducts,
    this.menuOrder,
    this.priceHtml,
    this.relatedIds,
    this.metaData,
    this.stockStatus,
    this.hasOptions,
    this.lLinks,
  });

  Product.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    permalink = json['permalink'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    type = json['type'];
    status = json['status'];
    featured = json['featured'];
    catalogVisibility = json['catalog_visibility'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    // dateOnSaleFrom = json['date_on_sale_from'];
    // dateOnSaleFromGmt = json['date_on_sale_from_gmt'];
    // dateOnSaleTo = json['date_on_sale_to'];
    // dateOnSaleToGmt = json['date_on_sale_to_gmt'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    totalSales = json['total_sales'];
    virtual = json['virtual'];
    downloadable = json['downloadable'];
    // if (json['downloads'] != null) {
    //   downloads = new List<Null>();
    //   json['downloads'].forEach((v) {
    //     downloads.add(new Null.fromJson(v));
    //   });
    // }
    downloadLimit = json['download_limit'];
    downloadExpiry = json['download_expiry'];
    externalUrl = json['external_url'];
    buttonText = json['button_text'];
    taxStatus = json['tax_status'];
    taxClass = json['tax_class'];
    manageStock = json['manage_stock'];
    stockQuantity = json['stock_quantity'];
    backorders = json['backorders'];
    backordersAllowed = json['backorders_allowed'];
    backordered = json['backordered'];
    lowStockAmount = json['low_stock_amount'];
    soldIndividually = json['sold_individually'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    shippingRequired = json['shipping_required'];
    shippingTaxable = json['shipping_taxable'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    reviewsAllowed = json['reviews_allowed'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    // if (json['upsell_ids'] != null) {
    //   upsellIds = [];
    //   json['upsell_ids'].forEach((v) {
    //     upsellIds.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['cross_sell_ids'] != null) {
    //   crossSellIds = [];
    //   json['cross_sell_ids'].forEach((v) {
    //     crossSellIds.add(new Null.fromJson(v));
    //   });
    // }
    parentId = json['parent_id'];
    purchaseNote = json['purchase_note'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(new Category.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags!.add(new Tag.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(new Image.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = [];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
    // if (json['default_attributes'] != null) {
    //   defaultAttributes = [];
    //   json['default_attributes'].forEach((v) {
    //     defaultAttributes.add(new Null.fromJson(v));
    //   });
    // }
    variations = json['variations'].cast<int?>();
    // if (json['grouped_products'] != null) {
    //   groupedProducts = [];
    //   json['grouped_products'].forEach((v) {
    //     groupedProducts.add(new Null.fromJson(v));
    //   });
    // }
    menuOrder = json['menu_order'];
    priceHtml = json['price_html'];
    relatedIds = json['related_ids'].cast<int?>();
    if (json['meta_data'] != null) {
      metaData = [];
      json['meta_data'].forEach((v) {
        metaData!.add(new MetaData.fromJson(v));
      });
    }
    stockStatus = json['stock_status'];
    hasOptions = json['has_options'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  // Map<String?, dynamic> toJson() {
  //   final Map<String?, dynamic> data = new Map<String?, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['slug'] = this.slug;
  //   data['permalink'] = this.permalink;
  //   data['date_created'] = this.dateCreated;
  //   data['date_created_gmt'] = this.dateCreatedGmt;
  //   data['date_modified'] = this.dateModified;
  //   data['date_modified_gmt'] = this.dateModifiedGmt;
  //   data['type'] = this.type;
  //   data['status'] = this.status;
  //   data['featured'] = this.featured;
  //   data['catalog_visibility'] = this.catalogVisibility;
  //   data['description'] = this.description;
  //   data['short_description'] = this.shortDescription;
  //   data['sku'] = this.sku;
  //   data['price'] = this.price;
  //   data['regular_price'] = this.regularPrice;
  //   data['sale_price'] = this.salePrice;
  //   // data['date_on_sale_from'] = this.dateOnSaleFrom;
  //   // data['date_on_sale_from_gmt'] = this.dateOnSaleFromGmt;
  //   // data['date_on_sale_to'] = this.dateOnSaleTo;
  //   // data['date_on_sale_to_gmt'] = this.dateOnSaleToGmt;
  //   data['on_sale'] = this.onSale;
  //   data['purchasable'] = this.purchasable;
  //   data['total_sales'] = this.totalSales;
  //   data['virtual'] = this.virtual;
  //   data['downloadable'] = this.downloadable;
  //   // if (this.downloads != null) {
  //   //   data['downloads'] = this.downloads.map((v) => v.toJson()).toList();
  //   // }
  //   data['download_limit'] = this.downloadLimit;
  //   data['download_expiry'] = this.downloadExpiry;
  //   data['external_url'] = this.externalUrl;
  //   data['button_text'] = this.buttonText;
  //   data['tax_status'] = this.taxStatus;
  //   data['tax_class'] = this.taxClass;
  //   data['manage_stock'] = this.manageStock;
  //   data['stock_quantity'] = this.stockQuantity;
  //   data['backorders'] = this.backorders;
  //   data['backorders_allowed'] = this.backordersAllowed;
  //   data['backordered'] = this.backordered;
  //   data['low_stock_amount'] = this.lowStockAmount;
  //   data['sold_individually'] = this.soldIndividually;
  //   data['weight'] = this.weight;
  //   if (this.dimensions != null) {
  //     data['dimensions'] = this.dimensions!.toJson();
  //   }
  //   data['shipping_required'] = this.shippingRequired;
  //   data['shipping_taxable'] = this.shippingTaxable;
  //   data['shipping_class'] = this.shippingClass;
  //   data['shipping_class_id'] = this.shippingClassId;
  //   data['reviews_allowed'] = this.reviewsAllowed;
  //   data['average_rating'] = this.averageRating;
  //   data['rating_count'] = this.ratingCount;
  //   // if (this.upsellIds != null) {
  //   //   data['upsell_ids'] = this.upsellIds.map((v) => v.toJson()).toList();
  //   // }
  //   // if (this.crossSellIds != null) {
  //   //   data['cross_sell_ids'] =
  //   //       this.crossSellIds.map((v) => v.toJson()).toList();
  //   // }
  //   data['parent_id'] = this.parentId;
  //   data['purchase_note'] = this.purchaseNote;
  //   if (this.categories != null) {
  //     data['categories'] = this.categories!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.tags != null) {
  //     data['tags'] = this.tags!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.images != null) {
  //     data['images'] = this.images!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.attributes != null) {
  //     data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
  //   }
  //   // if (this.defaultAttributes != null) {
  //   //   data['default_attributes'] =
  //   //       this.defaultAttributes!.map((v) => v.toJson()).toList();
  //   // }
  //   // data['variations'] = this.variations;
  //   // if (this.groupedProducts != null) {
  //   //   data['grouped_products'] =
  //   //       this.groupedProducts!.map((v) => v.toJson()).toList();
  //   // }
  //   data['menu_order'] = this.menuOrder;
  //   data['price_html'] = this.priceHtml;
  //   data['related_ids'] = this.relatedIds;
  //   if (this.metaData != null) {
  //     data['meta_data'] = this.metaData!.map((v) => v.toJson()).toList();
  //   }
  //   data['stock_status'] = this.stockStatus;
  //   data['has_options'] = this.hasOptions;
  //   if (this.lLinks != null) {
  //     data['_links'] = this.lLinks!.toJson();
  //   }
  //   return data;
  // }
}
