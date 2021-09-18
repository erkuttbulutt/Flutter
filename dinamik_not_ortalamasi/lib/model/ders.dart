class Ders {
  final String ad;
  final double harfDegeri, krediDegeri;

  Ders({required this.ad, required this.harfDegeri, required this.krediDegeri});

  @override
  String toString() {
    return "$ad $harfDegeri $krediDegeri";
  }
}
