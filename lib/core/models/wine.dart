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
  double rating;
  String comment;
  double price;
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
      this.owned = 1,
      this.size,
      this.image,
      this.time,
      this.comment,
      this.price,
      this.rating = 0.0});

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
        'price':price
      };

  Wine.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    type = json['type'];
    vintage = '${json['vintage']}';
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
    price = json['price'];
  }
}
