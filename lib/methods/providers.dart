import 'package:flutter_riverpod/flutter_riverpod.dart';

final infoProvider = StateProvider<String>((ref) => '');
final activeFieldsProvider = StateProvider<bool>((ref) => true);
final loggedInProvider = StateProvider<bool>((ref) => false);
final nRequestsProvider = StateProvider<int>((ref) => 0);
final emailProvider = StateProvider<String>((ref) => '');

final passwordProvider = StateProvider<String>((ref) => '');

final fieldProvider = StateProvider<String>((ref) => '');

final messageProvider = StateProvider<String>((ref) => '');
