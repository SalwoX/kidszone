import 'dart:convert';

import 'package:dio/dio.dart';

import '../infrastructure/work_context.dart' as wctx;
import 'Webhook/Embed/Embed.dart';
import 'Webhook/Webhook.dart';
import 'Webhook/WebhookMessage.dart';

class Notifications {
  void sendMessage(FormatException? e, String? msg, dynamic data) async {
    var webhook = Webhook('https://com/api/webhooks/906889431770869761/Lzdr4eLGKz4YMH5SZC7SPZeBMOkcSEHRDK2QEwffYWEgLXwWYxhmVoPk3D-S7Wijii_6');
    var embeds = <Embed>[];
    if (msg != null) {
      embeds.add(Embed(
        title: 'Message',
        description: '```ml\n${e?.message}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
    }

    if (e != null) {
      embeds.add(Embed(
        title: 'Message',
        description: '```ml\n${e.message}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'Source',
        description: '```ml\n${e.source}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'offset',
        description: '```ml\n${e.offset}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
    }
    embeds.add(Embed(
      title: 'Data',
      description: '```ml\n${jsonEncode(data)}```',
      color: 65280,
      timeStamp: DateTime.now().toUtc(),
    ));

    var message = WebhookMessage(
      username: 'Mobile',
      avatarUrl: 'https://cdn2.iconfinder.com/data/icons/software-development-linear-black/2048/5397_-_Bug_in_Code-512.png',
      content: '```ml\nApplication:Kidszone-Mobile \nAd Soyad: ${wctx.WorkContext.nameSurname}\nPhone:${wctx.WorkContext.userModel?.phoneNumber.toString()}\ntoken:${wctx.WorkContext.userModel?.token}```',
      tts: true,
      embeds: embeds,
    );
    await webhook.send(message);
  }

  void sendMessageDioError(DioError? e, String? msg, dynamic data) async {
    var webhook = Webhook('https://com/api/webhooks/906889431770869761/Lzdr4eLGKz4YMH5SZC7SPZeBMOkcSEHRDK2QEwffYWEgLXwWYxhmVoPk3D-S7Wijii_6');
    var embeds = <Embed>[];
    if (msg != null) {
      embeds.add(Embed(
        title: 'Message',
        description: '```ml\n${e?.message}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
    }

    if (e != null) {
      embeds.add(Embed(
        title: 'Message',
        description: '```ml\n${e.message}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'Response',
        description: '```ml\n${e.response}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'url',
        description: '```ml\n${e.response?.realUri}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'requestOptions',
        description: '```ml\n${e.response?.requestOptions.data}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'type',
        description: '```ml\n${e.type}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'error',
        description: '```ml\n${e.error}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'stackTrace',
        description: '```ml\n${e.stackTrace}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'Custom',
        description: '```ml\n${e.toString()}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
    }
    embeds.add(Embed(
      title: 'Data',
      description: '```ml\n${jsonEncode(data)}```',
      color: 65280,
      timeStamp: DateTime.now().toUtc(),
    ));

    var message = WebhookMessage(
      username: 'Mobile',
      avatarUrl: 'https://cdn2.iconfinder.com/data/icons/software-development-linear-black/2048/5397_-_Bug_in_Code-512.png',
      content: '```ml\nApplication:Kidszone-Mobile \nAd Soyad: ${wctx.WorkContext.nameSurname}\nPhone:${wctx.WorkContext.userModel?.phoneNumber.toString()}\ntoken:${wctx.WorkContext.userModel?.token}```',
      tts: true,
      embeds: embeds,
    );
    await webhook.send(message);
  }

  void sendMessageArgumentError(ArgumentError? e, String? msg, dynamic data) async {
    var webhook = Webhook('https://com/api/webhooks/906889431770869761/Lzdr4eLGKz4YMH5SZC7SPZeBMOkcSEHRDK2QEwffYWEgLXwWYxhmVoPk3D-S7Wijii_6');
    var embeds = <Embed>[];
    if (msg != null) {
      embeds.add(Embed(
        title: 'Message',
        description: '```ml\n${e?.message}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
    }

    if (e != null) {
      embeds.add(Embed(
        title: 'Message',
        description: '```ml\n${e.message}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'invalidValue',
        description: '```ml\n${e.invalidValue}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'name',
        description: '```ml\n${e.name}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'stackTrace',
        description: '```ml\n${e.stackTrace}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
      embeds.add(Embed(
        title: 'Custom',
        description: '```ml\n${e.toString()}```',
        color: 65280,
        timeStamp: DateTime.now().toUtc(),
      ));
    }
    embeds.add(Embed(
      title: 'Data',
      description: '```ml\n${jsonEncode(data)}```',
      color: 65280,
      timeStamp: DateTime.now().toUtc(),
    ));

    var message = WebhookMessage(
      username: 'Mobile',
      avatarUrl: 'https://cdn2.iconfinder.com/data/icons/software-development-linear-black/2048/5397_-_Bug_in_Code-512.png',
      content: '```ml\nApplication:Kidszone-Mobile \nAd Soyad: ${wctx.WorkContext.nameSurname}\nPhone:${wctx.WorkContext.userModel?.phoneNumber.toString()}\ntoken:${wctx.WorkContext.userModel?.token}```',
      tts: true,
      embeds: embeds,
    );
    await webhook.send(message);
  }
}
