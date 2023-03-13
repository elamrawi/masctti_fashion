import 'Collections.dart';
import 'Self.dart';

class Links {
  List<Self>? self;
  List<Collections>? collections;

  Links({this.self, this.collections});

  Links.fromJson(Map<String?, dynamic> json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self!.add( Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collections =  [];
      json['collection'].forEach((v) {
        collections!.add( Collections.fromJson(v));
      });
    }
  }

  // Map<String?, dynamic> toJson() {
  //   final Map<String?, dynamic> data =  Map<String?, dynamic>();
  //   if (this.self != null) {
  //     data['self'] = this.self!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.collections != null) {
  //     data['collections'] = this.collections!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
class CategoryLinks {
  List<Self>? self;
  List<Collections>? collection;
  List? up;

  CategoryLinks({this.self, this.collection, this.up});

  CategoryLinks.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self!.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection!.add(new Collections.fromJson(v));
      });
    }
    if (json['up'] != null) {
      up = [];
      json['up'].forEach((v) {
        up!.add(json['up']);
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.self != null) {
  //     data['self'] = this.self!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.collection != null) {
  //     data['collection'] = this.collection!.map<Collections>((v) => v!.toJson()).toList();
  //   }
  //   if (this.up != null) {
  //     data['up'] = this.up!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}