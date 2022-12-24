import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jogo_memoria/controller/game_controller.dart';
import 'package:jogo_memoria/repositories/recordes_repository.dart';
import 'package:jogo_memoria/theme.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() async {
  //  inicializando o Hive
  await Hive.initFlutter();

  runApp(MultiProvider(providers: [
    Provider<RecordesRepository>(
      create: (_) => RecordesRepository(),
    ),
    ProxyProvider<RecordesRepository, GameController>(
      update: (_, repo, __) => GameController(recordesRepository: repo),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Round 6 Memory',
      theme: Round6Theme.theme,
      home: const HomePage(),
    );
  }
}
