import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:linkedinbot/methods/providers.dart';

Future close(ref) async {
  const url = 'http://localhost:5000/close';
  try {
    final response = await http.get(Uri.parse(url));

    ref.read(messageProvider.notifier).state = response.body;

    sleep(const Duration(seconds: 1));

    exit(0);
  } finally {
    exit(0);
  }
}
