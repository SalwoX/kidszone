import 'EmbedAuthor.dart' as discord;
import 'EmbedField.dart' as discord;
import 'EmbedFooter.dart' as discord;
import 'EmbedImage.dart' as discord;

class Embed {
  final int? color;
  final discord.EmbedAuthor? author;
  final String? title;
  final String? url;
  final String? description;
  final List<discord.EmbedField>? fields;
  final discord.EmbedImage? image;
  final discord.EmbedImage? thunmbnail;
  final discord.EmbedFooter? footer;
  final DateTime? timeStamp;

  Embed({
    this.color,
    this.author,
    this.title,
    this.url,
    this.description,
    this.fields,
    this.image,
    this.thunmbnail,
    this.footer,
    this.timeStamp,
  });

  Map<String, dynamic> toJson() => {
        'color': color,
        'author': author,
        'title': title,
        'url': url,
        'description': description,
        'fields': fields,
        'image': image,
        'thunmbnail': thunmbnail,
        'footer': footer,
        'timeStamp': timeStamp?.toIso8601String(),
      };
}
