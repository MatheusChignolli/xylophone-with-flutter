import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    const keys = [
      {'key': 1, 'backgroundColor': Colors.red},
      {'key': 2, 'backgroundColor': Colors.orange},
      {'key': 3, 'backgroundColor': Colors.yellow},
      {'key': 4, 'backgroundColor': Colors.green},
      {'key': 5, 'backgroundColor': Colors.blueGrey},
      {'key': 6, 'backgroundColor': Colors.blue},
      {'key': 7, 'backgroundColor': Colors.purple},
    ];

    void _onPressed(int key) async {
      await player.stop();

      await player.play(
        AssetSource('note$key.wav'),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: keys
                .map(
                  (key) => Expanded(
                    child: FilledButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          key['backgroundColor'],
                        ),
                      ),
                      onPressed: () => _onPressed(key['key']),
                      child: Text(''),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
