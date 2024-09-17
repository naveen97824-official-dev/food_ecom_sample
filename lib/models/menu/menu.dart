class Menu {
  String? avatar;
  String? name;
  double? price;
  bool? isFav;

  Menu({this.avatar, this.name, this.price, this.isFav});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        avatar: json['avatar'] as String?,
        name: json['name'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        isFav: json['isFav'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'avatar': avatar,
        'name': name,
        'price': price,
        'isFav': isFav,
      };
}
