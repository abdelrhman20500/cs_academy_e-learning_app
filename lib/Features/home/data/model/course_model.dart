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
      id: data["id"]?.toString() ?? '',
      title: data["title"]?.toString() ?? '',
      desc: (data["desc"] ?? data["description"])?.toString() ?? '',
      price: data["price"] ?? 0,
      image: data["image"]?.toString() ?? '',
    );
  }
}
