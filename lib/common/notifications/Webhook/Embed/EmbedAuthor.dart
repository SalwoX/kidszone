class EmbedAuthor {
  final String name;
  final String? url;
  final String? iconUrl;

  EmbedAuthor({
    required this.name,
    this.url,
    this.iconUrl,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
        'icon_url': iconUrl,
      };
}
