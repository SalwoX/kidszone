import 'Embed/Embed.dart' as discord;

class WebhookMessage {
  final String? username;
  final String? avatarUrl;
  final String? content;
  final List<discord.Embed>? embeds;
  final bool? tts;

  WebhookMessage({
    this.username,
    this.avatarUrl,
    this.content,
    this.embeds,
    this.tts,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'avatar_url': avatarUrl,
        'content': content,
        'embeds': embeds?.map((x) => x.toJson()).toList(),
        'tts': tts,
      };
}
