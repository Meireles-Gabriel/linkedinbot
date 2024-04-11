import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:linkedinbot/methods/providers.dart';

Future login(ref) async {
  String url = 'http://localhost:5000/login/${ref.watch(emailProvider)}/${ref.watch(passwordProvider)}';
  ref.read(infoProvider.notifier).state = 'Entrando...';
  await http.get(Uri.parse(url));
  if (!ref.watch(activeFieldsProvider)) {
    return search(ref);
  }else{
    return home(ref);
  }
}

Future search(ref) async {
  String url = 'http://localhost:5000/search/${ref.watch(fieldProvider)}';
  ref.read(infoProvider.notifier).state = 'Pesquisando...';
  await http.get(Uri.parse(url));
  if (!ref.watch(activeFieldsProvider)) {
     return send(ref);
  } else {
    return home(ref);
  }
}

Future send(ref) async {
  String url = 'http://localhost:5000/send/${ref.watch(messageProvider)}';
  ref.read(infoProvider.notifier).state = 'Enviando Pedidos...';
  var response = await http.get(Uri.parse(url));
  if (response.body == ''){
  ref.read(nRequestsProvider.notifier).state = ref.watch(nRequestsProvider) + 1;}
  if (!ref.watch(activeFieldsProvider)) {
     return send(ref);
  } else {
    return home(ref);
  }
}
Future home(ref) async {
  const url = 'http://localhost:5000/home';
  ref.read(infoProvider.notifier).state = 'Pausando...';
  await http.get(Uri.parse(url));
}

