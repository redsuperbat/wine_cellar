class Wine {
  String name;
  String location;
  String vintage;
  String type;
  String size;
  String aoo;
  String country;
  int id;
  int owned;
  String grapes;
  String image;
  double rating = 0.0;
  String comment;
  String time; //appellation of origin

  Wine(
      {this.name,
      this.type,
      this.aoo,
      this.country,
      this.location,
      this.vintage,
      this.id,
      this.grapes,
      this.owned,
      this.size,
      this.image,
      this.time,
      this.comment});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'location': location,
        'type': type,
        'vintage': vintage,
        'aoo': aoo,
        'country': country,
        'id': id,
        'grapes': grapes,
        'owned': owned,
        'size': size,
        'image': image,
        'time': time,
        'rating': rating,
        'comment': comment,
      };

  Wine.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    type = json['type'];
    vintage = json['vintage'].toString();
    id = json['id'];
    grapes = json['grapes'];
    owned = json['owned'];
    size = json['size'];
    image = json['image'];
    time = json['time'];
    rating = json['rating'];
    comment = json['comment'];
    aoo = json['aoo'];
    country = json['country'];
  }
}
