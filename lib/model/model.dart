class Ruang {
  String location;
  String name;
  String title;
  String photoPerson;
  String photoLocation;
  String jadwalPelayanan;
  List<double> position;
  List<String> pelayanan;

  Ruang({
    required this.location,
    required this.name,
    required this.title,
    required this.photoPerson,
    required this.photoLocation,
    required this.jadwalPelayanan,
    required this.position,
    required this.pelayanan,
  });

  factory Ruang.fromMap(Map data) => Ruang(
        name: data['name'] ?? 'No name.',
        title: data['title'] ?? 'No name.',
        location: data['location'] ?? 'No location.',
        photoPerson: data['photoPerson'] ?? 'assets/person/null.png',
        photoLocation: data['photoLocation'] ?? 'assets/location/null.png.',
        jadwalPelayanan: data['jadwalPelayanan'] ?? 'Belum Ada Jadwal',
        position: data['position'] ?? [0.0],
        pelayanan: data['pelayanan'] ?? ['Belum Ada Pelayanan'],
      );
}
