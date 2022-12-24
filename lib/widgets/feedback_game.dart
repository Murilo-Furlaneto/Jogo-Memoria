import 'package:flutter/material.dart';
import 'package:jogo_memoria/controller/game_controller.dart';
import 'package:jogo_memoria/widgets/start_button.dart';
import 'package:provider/provider.dart';

import '../constantes.dart';

class FeedbackGame extends StatelessWidget {
  const FeedbackGame({Key? key, required this.resultado}) : super(key: key);

  final Resultado resultado;

  String getResultado() {
    return resultado == Resultado.aprovado ? 'aprovado' : 'eliminado';
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${getResultado().toUpperCase()}!',
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset('assets/images/${getResultado()}.png'),
          ),
          resultado == Resultado.eliminado
              ? StartButton(
                  title: 'Tentar novamente',
                  color: Colors.white,
                  action: () => controller.restartGame(),
                )
              : StartButton(
                  title: 'Próximo Nível',
                  color: Colors.white,
                  action: () => controller.nextLevel(),
                ),
        ],
      ),
    );
  }
}
