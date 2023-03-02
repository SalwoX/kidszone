class EmbedField {
  final String name;
  final String value;
  final bool? inline;

  EmbedField({
    required this.name,
    required this.value,
    this.inline,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
        'inline': inline,
      };
}
