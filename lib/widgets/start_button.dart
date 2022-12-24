import 'package:flutter/material.dart';
import 'package:jogo_memoria/theme.dart';

class StartButton extends StatelessWidget {
  const StartButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.action})
      : super(key: key);

  final String title;
  final Color color;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: OutlinedButton(
        style: Round6Theme.outlineButtonStyle(color: color),
        onPressed: () => action(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
