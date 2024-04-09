import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkedinbot/main_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//c:\users\administrator\appdata\local\programs\python\python312\scripts\pyinstaller.exe --onefile lib/methods/backend.py
  String flutterExecutablePath = Platform.resolvedExecutable;
  String flutterDirectory = Directory(flutterExecutablePath).parent.path;
  String exeFilePath = '$flutterDirectory/dist/backend.exe';
  Process.start('cmd', ['/c', 'start', '/min', exeFilePath]);

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(480, 540),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    alwaysOnTop: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setTitle('LinkedIn Connection Bot');
    await windowManager.setIcon('assets/icon.png');
    await windowManager.setAlignment(Alignment.centerRight);
    await windowManager.setResizable(false);
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkedIn Connection Bot',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
