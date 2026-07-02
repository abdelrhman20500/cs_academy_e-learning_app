class CourseVideoModel{
  final String id;
  final String title;
  final String desc;
  final String urlVideo;

  CourseVideoModel({required this.id, required this.title, required this.desc, required this.urlVideo});
  factory CourseVideoModel.fromSupabase(Map<String, dynamic> map){
    return CourseVideoModel(
        id: map["id"]?.toString() ?? '',
        title: map["title"]?.toString() ?? '',
        desc: (map["desc"] ?? map["description"])?.toString() ?? '',
        urlVideo: (map["video_url"] ?? map["url_video"] ?? map["url"])?.toString() ?? ''
    );
  }
}