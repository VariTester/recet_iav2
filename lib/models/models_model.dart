

class ModelsModel{
  final String id;
  final int created;
  final String root;
  ModelsModel({this.id,this.root,this.created,
  });
  factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
    id: json["id"],
    root: json["root"],
    created: json["created"],
  );

  static List<ModelsModel> modelsFromSnapshoot (List modelSnapshot){
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }

}
 