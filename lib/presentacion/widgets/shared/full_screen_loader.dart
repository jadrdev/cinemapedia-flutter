import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessage() {
    final messanges = <String>[
    'Cargando peliculas...',
    'Comprando las entradas',
    'Comprando Palomitas',
    'Cargando Populares',
    'Llamando a la piba',
    'Ya mero.....',
    'WTF ????',
  ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messanges[step];
    }).take(messanges.length);
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Espere por favor...'),
        const SizedBox(height: 20),
        const CircularProgressIndicator(),
        const SizedBox(height: 20),
        StreamBuilder(
          stream: getLoadingMessage(), 
          builder: (context, snapshot) {
            if(!snapshot.hasData) return const Text('Cargando....');
            return Text(snapshot.data!);
          }
        ),
      ],
    ));
  }
}
