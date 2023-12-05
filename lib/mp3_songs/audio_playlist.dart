import 'package:flutter/material.dart';

import 'package:thandri_sannidhi/mp3_songs/mp3_song_details.dart';
import 'package:thandri_sannidhi/mp3_songs/mp3_songs.dart';

class AudioPlaylist extends StatefulWidget {
  const AudioPlaylist({super.key});

  @override
  State<AudioPlaylist> createState() => _AudioPlaylistState();
}

class _AudioPlaylistState extends State<AudioPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Audio Songs"),
        backgroundColor: const Color.fromARGB(255, 54, 1, 63),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: mp3songs.length,
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 54, 1, 63),
                ),
                child: ListTile(
                  title: Text(
                    mp3songs[index].name,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  subtitle: Text(
                    mp3songs[index].album,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 54, 1, 63),
                      ),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.play_arrow,
                    size: 26,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Mo3SongShowDetails(index: index)));
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
