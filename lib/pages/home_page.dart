import 'package:flutter/material.dart';
import 'package:jogo_memoria/constantes.dart';
import 'package:jogo_memoria/pages/nivel_page.dart';
import 'package:jogo_memoria/theme.dart';
import 'package:jogo_memoria/widgets/logo.dart';
import 'package:jogo_memoria/widgets/recordes.dart';
import 'package:jogo_memoria/widgets/start_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  selecionarNivel(Modo modo, BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NivelPage(modo: modo),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
                title: 'Modo Normal',
                color: Colors.white,
                action: () => selecionarNivel(Modo.normal, context)),
            StartButton(
                title: 'Modo Round 6',
                color: Round6Theme.color,
                action: () => selecionarNivel(Modo.round6, context)),
            const SizedBox(height: 60),
            const Recordes(),
          ],
        ),
      ),
    );
  }
}
