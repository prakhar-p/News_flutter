
class Source {
  String id;
  String name;

  //constructor
  Source({required this.id, required this.name});

  //it is factory function to map the json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
