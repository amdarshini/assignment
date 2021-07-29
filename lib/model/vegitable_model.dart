class FruitModel {
  String name;
  int id;
  String price;
  int available;
  int totalAvailable;
  String category;
  String vendor;
  String imagUrl;

  FruitModel(
      {this.name,
      this.id,
      this.price,
      this.available,
      this.totalAvailable,
      this.category,
      this.vendor,
      this.imagUrl});
}

List<FruitModel> vegetable = [
  FruitModel(
      name: "Potato",
      id: 1,
      price: "30",
      available: 1,
      totalAvailable: 10,
      vendor: "Organic farms",
      category: "Vegtables",
      imagUrl:
          "https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=6&m=157430678&s=612x612&w=0&h=3A77PeFuUUqoC4EVZaydkd6tSakZSWO61T21bMn4KLQ="),
  FruitModel(
      name: "Drumsticks",
      id: 2,
      price: "20",
      available: 0,
      totalAvailable: 0,
      vendor: "Mallikarjuna farms",
      category: "Vegtables",
      imagUrl: "https://static.toiimg.com/photo/69928440.cms"),
];
