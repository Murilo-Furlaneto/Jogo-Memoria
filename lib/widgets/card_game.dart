import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogo_memoria/models/game_opcao.dart';
import 'package:provider/provider.dart';

import '../constantes.dart';
import '../controller/game_controller.dart';
import '../theme.dart';

class CardGame extends StatefulWidget {
  const CardGame({
    Key? key,
    required this.modo,
    required this.gameOpcao,
  }) : super(key: key);

  final Modo modo;
  final GameOpcao gameOpcao;

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    super.dispose();
    animation.dispose();
  }

  flipCard() {
    final game = context.read<GameController>();
    if (!animation.isAnimating &&
        !widget.gameOpcao.matched &&
        !widget.gameOpcao.selected &&
        !game.jogadaCompleta) {
      // vira a carta
      animation.forward();
      game.escolher(widget.gameOpcao, resetCard);
    }
  }

  resetCard() {
    animation.reverse();
  }

  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      return AssetImage(
          'assets/images/${widget.gameOpcao.opcao.toString()}.png');
    } else {
      return widget.modo == Modo.normal
          ? const AssetImage('assets/images/card_normal.png')
          : const AssetImage('assets/images/card_round.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, _) {
          final angulo = animation.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angulo);

          return GestureDetector(
            onTap: () => flipCard(),
            child: Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.modo == Modo.normal
                        ? Colors.white
                        : Round6Theme.color,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: getImage(angulo), fit: BoxFit.cover),
                ),
              ),
            ),
          );
        });
  }
}
