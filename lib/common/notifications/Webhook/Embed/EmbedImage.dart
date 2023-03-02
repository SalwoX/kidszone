class EmbedImage {
  final String url;

  EmbedImage({
    required this.url,
  });

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}
