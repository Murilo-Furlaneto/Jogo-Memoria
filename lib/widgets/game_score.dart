import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../constantes.dart';
import '../controller/game_controller.dart';

class GameScore extends StatelessWidget {
  const GameScore({Key? key, required this.modo}) : super(key: key);
  final Modo modo;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(modo == Modo.round6
                ? Icons.my_location
                : Icons.touch_app_rounded),
            const SizedBox(width: 10),
            Observer(
              builder: (_) {
                return Text(
                  controller.score.toString(),
                  style: const TextStyle(fontSize: 25),
                );
              },
            ),
          ],
        ),
        Image.asset('assets/images/host.png', width: 38, height: 60),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Sair',
              style: TextStyle(fontSize: 18),
            )),
      ],
    );
  }
}
