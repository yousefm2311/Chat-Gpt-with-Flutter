class PostModel {
  String? id;
  String? object;
  int? created;
  String? model;
  List<ModelList>? choices = [];
  PostModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    object = json["object"];
    created = json["created"];
    model = json["model"];
    json["choices"].forEach((element) {
      choices!.add(ModelList.fromJson(element));
    });
  }
}
class ModelList {
  String? text;
  int? index;
  ModelList.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    index = json["index"];
  }
}
