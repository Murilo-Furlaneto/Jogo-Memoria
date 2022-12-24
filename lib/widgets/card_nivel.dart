import 'package:flutter/material.dart';
import 'package:jogo_memoria/controller/game_controller.dart';
import 'package:jogo_memoria/models/game_play.dart';
import 'package:jogo_memoria/theme.dart';
import 'package:provider/provider.dart';
import '../constantes.dart';
import '../pages/game_page.dart';

class CardNivel extends StatelessWidget {
  const CardNivel({Key? key, required this.gamePlay}) : super(key: key);

  final GamePlay gamePlay;

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gameplay: gamePlay);

    
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GamePage(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 90,
        width: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
              color: gamePlay.modo == Modo.normal
                  ? Colors.white
                  : Round6Theme.color,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: gamePlay.modo == Modo.normal
                ? Colors.transparent
                : Round6Theme.color.withOpacity(.6)),
        child: Center(
          child: Text(
            gamePlay.nivel.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
