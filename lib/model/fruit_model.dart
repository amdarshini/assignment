class FruitModel {
  String name;
  int id;
  String price;
  int available;
  int totalAvailable;
  String category;
  String vendor;
  int type;
  String imagUrl;

  FruitModel(
      {this.name,
      this.id,
      this.price,
      this.available,
      this.totalAvailable,
      this.category,
      this.vendor,
      this.type,
      this.imagUrl});
}

List<FruitModel> fruits= [
  FruitModel(
      name: "Potato",
      id: 1,
      price: "30",
      available: 1,
      totalAvailable: 10,
      vendor: "Organic farms",
      category: "Vegtables",
      type: 2,
      imagUrl:
          "https://media.istockphoto.com/photos/three-potatoes-picture-id157430678?k=6&m=157430678&s=612x612&w=0&h=3A77PeFuUUqoC4EVZaydkd6tSakZSWO61T21bMn4KLQ="),
  FruitModel(
      name: "Banana",
      id: 2,
      price: "50",
      available: 1,
      totalAvailable: 45,
      vendor: "Himachal Pvt Ltd",
      category: "Fruits",
      type: 1,
      imagUrl:
          "https://www.gannett-cdn.com/-mm-/cec01b6067e6a621611069b751341797d19f809f/c=0-218-4288-2630/local/-/media/2017/04/26/Brevard/B9327244777Z.1_20170426084937_000_GI3I4LULC.1-0.jpg"),
  FruitModel(
      name: "Drumsticks",
      id: 3,
      price: "20",
      available: 0,
      totalAvailable: 0,
      vendor: "Mallikarjuna farms",
      category: "Vegtables",
      type: 2,
      imagUrl: "https://static.toiimg.com/photo/69928440.cms"),
  FruitModel(
      name: "Orange",
      id: 4,
      price: "25",
      totalAvailable: 9,
      available: 1,
      vendor: "Nagpur farms",
      category: "Fruits",
      type: 1,
      imagUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Oranges_-_whole-halved-segment.jpg/1200px-Oranges_-_whole-halved-segment.jpg"),
];
