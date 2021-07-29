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
 List<FruitModel> fruitsOnly = [
  
  FruitModel(
      name: "Banana",
      id: 2,
      price: "50",
      available: 1,
      totalAvailable: 1,
      vendor: "Himachal Pvt Ltd",
      category: "Fruits",
      imagUrl:
          "https://www.gannett-cdn.com/-mm-/cec01b6067e6a621611069b751341797d19f809f/c=0-218-4288-2630/local/-/media/2017/04/26/Brevard/B9327244777Z.1_20170426084937_000_GI3I4LULC.1-0.jpg"),
 
  FruitModel(
      name: "Orange",
      id: 4,
      price: "25",
      totalAvailable: 1,
      available: 1,
      vendor: "Nagpur farms",
      category: "Fruits",
      imagUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Oranges_-_whole-halved-segment.jpg/1200px-Oranges_-_whole-halved-segment.jpg"),
];
