enum ClassTypeEnum {
  classroom(1, "Sınıf"),
  study(2, "Etüt");

  final int id;
  final String text;
  const ClassTypeEnum(this.id, this.text);
  int getId() {
    return this.id;
  }

  String getDescription() {
    return this.text;
  }
}
