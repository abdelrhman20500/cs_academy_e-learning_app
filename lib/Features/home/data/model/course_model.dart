class CourseModel {
  final String id;
  final String title;
  final String desc;
  final num price;
  final String image;

  CourseModel(
      {required this.id,
      required this.title,
      required this.desc,
      required this.price,
      required this.image});

  factory CourseModel.fromJson(Map<String, dynamic> data) {
    return CourseModel(
      id: data["id"],
      title: data["title"],
      desc: data["desc"],
      price: data["price"],
      image: data["image"],
    );
  }
}
