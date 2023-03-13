class Collections {
  String? href;
  Collections({this.href});

  Collections.fromJson(Map<String?, dynamic> json) {
    href = json['href'];
  }
}
