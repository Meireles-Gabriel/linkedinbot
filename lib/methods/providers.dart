import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageProvider = StateProvider<String>((ref) => '');
final activeFieldsProvider = StateProvider<bool>((ref) => true);
