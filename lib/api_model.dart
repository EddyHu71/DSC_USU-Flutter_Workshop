class ApiModel {
  String title;
  String body;

  ApiModel ({
    this.title,
    this.body,
  });

  factory ApiModel.fromJson(Map<String, dynamic> parsedJson) {
    return ApiModel(
      title: parsedJson['title'].toString(),
      body : parsedJson['body'].toString()
    );
  }
}