class Ruang {
  String location;
  String name;
  String title;
  List<double> position;

  Ruang({
    required this.location,
    required this.name,
    required this.title,
    required this.position,
  });

  factory Ruang.fromMap(Map data) => Ruang(
        name: data['name'] ?? 'No name.',
        title: data['title'] ?? 'No name.',
        location: data['location'] ?? 'No location.',
        position: data['position'] ?? [0.0],
      );
}
