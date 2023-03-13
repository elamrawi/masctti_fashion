class Tag {
  int? id;
  String? name, slug;
  Tag({this.id, this.name, this.slug});
  Tag.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.slug = json['slug'];
  }
}
