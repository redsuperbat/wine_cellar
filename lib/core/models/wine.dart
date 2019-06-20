class Wine {
  String name;
  String country;
  String vintage;
  String type;
  String size;
  int id;
  int owned;
  String grapes;
  String image;
  String aoo;
  double rating = 0.0;
  String comment;
  String time; //appellation of origin

  Wine(
      {this.name,
      this.type,
      this.country,
      this.vintage,
      this.id,
      this.grapes,
      this.owned,
      this.size,
      this.image,
      this.aoo,
      this.time,
      this.comment});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'country': country,
        'type': type,
        'vintage': vintage,
        'id': id,
        'grapes': grapes,
        'owned': owned,
        'size': size,
        'image': image,
        'aoo': aoo,
        'time': time,
        'rating':rating,
        'comment':comment,
      };

  Wine.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    type = json['type'];
    vintage = json['vintage'].toString();
    id = json['id'];
    grapes = json['grapes'];
    owned = json['owned'];
    size = json['size'];
    image = json['image'];
    aoo = json['aoo'];
    time = json['time'];
    rating = json['rating'];
    comment = json['comment'];
  }
}
