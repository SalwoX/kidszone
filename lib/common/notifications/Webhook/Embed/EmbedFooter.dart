class EmbedFooter {
  final String text;
  final String? iconUrl;

  EmbedFooter({
    required this.text,
    this.iconUrl,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon_url': iconUrl,
      };
}
