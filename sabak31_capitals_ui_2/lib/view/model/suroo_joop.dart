class Suroo {
  Suroo({
    required this.text,
    required this.image,
    required this.jooptor,
  });
  final String text;
  final String image;
  final List<Joop> jooptor;
}

class Joop {
  Joop({
    required this.text,
    required this.tuuraJoop,
  });
  final String text;
  final bool tuuraJoop;
}
