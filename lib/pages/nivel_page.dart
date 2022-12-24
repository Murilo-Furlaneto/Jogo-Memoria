import 'package:flutter/material.dart';
import 'package:jogo_memoria/game_settings.dart';
import 'package:jogo_memoria/models/game_play.dart';

import '../constantes.dart';
import '../widgets/card_nivel.dart';

class NivelPage extends StatelessWidget {
  const NivelPage({Key? key, required this.modo}) : super(key: key);

  final Modo modo;

  @override
  Widget build(BuildContext context) {
    final niveis = GameSettings.niveis
        .map((n) => CardNivel(gamePlay: GamePlay(modo: modo, nivel: n)))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nível do jogo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: niveis,
        ),
      ),
    );
  }
}
