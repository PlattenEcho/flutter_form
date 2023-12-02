class Mahasiswa {
  final int id;
  final String nama;
  final String nim;
  final String email;

  Mahasiswa(
      {required this.id,
      required this.nama,
      required this.nim,
      required this.email});

  Mahasiswa.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        nama = item["nama"],
        nim = item["nim"],
        email = item["email"];

  Map<String, Object> toMap() {
    return {'id': id, 'nama': nama, 'nim': nim, 'email': email};
  }
}
