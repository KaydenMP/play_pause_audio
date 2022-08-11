import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:glass_kit/glass_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

AudioPlayer audioPlayer = AudioPlayer();

String url =
    'https://msicoursematerial.s3.us-west-2.amazonaws.com/Coldplay+X+Selena+Gomez+-+Let+Somebody+Go+(Official+Video).mp3';

play() async {
  int result = await audioPlayer.play(url);
  if (result == 1) {
    // success
  }
}

pause() async {
  int result = await audioPlayer.pause();
  if (result == 1) {
    // success
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GlassContainer.frostedGlass(
              height: 250,
              width: 300,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: const Image(image: AssetImage('assets/Let somebody go.jpg'))),
          MyContainer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: ((() {
                  play();
                })),
                child: const Text('Play'),
              ),
              ElevatedButton(
                  onPressed: ((() {
                    pause();
                  })),
                  child: const Text('Pause')),
            ],
          ),
        ],
      )),
    );
  }
}


class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color baseColor = const Color.fromARGB(255, 220, 143, 143);

    return ClayContainer(
      color: baseColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ClayText("Let Somebody Go", emboss: true, size: 15),
      ),
    );
  }
}
