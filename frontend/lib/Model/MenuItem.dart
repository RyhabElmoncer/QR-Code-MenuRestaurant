class MenuItem {
  final String item;
  final String price;
  final String image;

  MenuItem({required this.item, required this.price, required this.image});

  Map<String, String> toMap() {
    return {
      'item': item,
      'price': price,
      'image': image,
    };
  }

  factory MenuItem.fromMap(Map<String, String> map) {
    return MenuItem(
      item: map['item']!,
      price: map['price']!,
      image: map['image']!,
    );
  }
}
