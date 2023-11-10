import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
            style: TextButton.styleFrom(shape: const StadiumBorder()),
            onPressed: () async {
              await launchUrl(
                Uri.parse('https://www.google.com.br'),
                mode: LaunchMode.externalApplication,
              );
            },
            child: const Text(
              'Política de Privacidade',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          )),
    );
  }
}
