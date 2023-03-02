import 'dart:convert';

import 'package:http/http.dart' as http;

import 'WebhookMessage.dart' as discord;

class Webhook {
  final String url;

  Webhook(this.url);

  Future<dynamic> send(discord.WebhookMessage message) async {
    var request = await http.post(
      Uri.parse(url),
      body: jsonEncode(message.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (request.bodyBytes.isEmpty) return null;
    return jsonDecode(utf8.decode(request.bodyBytes));
  }
}
