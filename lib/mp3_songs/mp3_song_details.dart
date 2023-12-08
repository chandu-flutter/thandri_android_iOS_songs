import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:thandri_sannidhi/mp3_songs/mp3_songs.dart';

class Mo3SongShowDetails extends StatefulWidget {
  final int index;

  const Mo3SongShowDetails({super.key, required this.index});

  @override
  State<Mo3SongShowDetails> createState() => _Mo3SongShowDetailsState();
}

class _Mo3SongShowDetailsState extends State<Mo3SongShowDetails> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        title: Text(mp3songs[widget.index].name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://chirip.in/net/shalem.jpg',
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  mp3songs[widget.index].name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 54, 1, 63),
                    fontFamily: 'Sree',
                  ),
                ),
                Text(
                  mp3songs[widget.index].album,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Slider(
                    value: position.inSeconds.toDouble(),
                    activeColor: const Color.fromARGB(255, 54, 1, 63),
                    inactiveColor: Colors.grey,
                    thumbColor: const Color.fromARGB(255, 54, 1, 63),
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(
                        seconds: value.toInt(),
                      );
                      await audioPlayer.seek(position);

                      await audioPlayer.resume();
                    }),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(4, 4),
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(-4, -4),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: const Color.fromARGB(255, 54, 1, 63),
                    ),
                    iconSize: 50,
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.play(UrlSource(
                          mp3songs[widget.index].link,
                        ));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
