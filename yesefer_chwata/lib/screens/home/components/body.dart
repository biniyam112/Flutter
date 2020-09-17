import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:yesefer_chwata/models/sound_tile.dart';

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SoundTile> soundTiles = [
      SoundTile(
        soundTitle: 'Intro Sound',
        soundPath: 'assets/music/intro_audio.mp3',
      ),
      SoundTile(
        soundTitle: 'wrong answer',
        soundPath: 'assets/music/wrong_answer.mp3',
      ),
      SoundTile(
        soundTitle: 'Correct answer',
        soundPath: 'assets/music/right_answer.mp3',
      ),
      SoundTile(
        soundTitle: 'Applause',
        soundPath: 'assets/music/applause.mp3',
      ),
      SoundTile(
        soundTitle: 'right plus applause',
        soundPath: 'assets/music/right_applause.mp3',
      ),
      SoundTile(
        soundTitle: 'ende mahlet',
        soundPath: 'assets/music/just_ende.mp3',
      ),
      SoundTile(
        soundTitle: 'applause plus ende mahlet',
        soundPath: 'assets/music/ende_mahlt.mp3',
      ),
      SoundTile(
        soundTitle: 'first time',
        soundPath:
            'assets/music/Kygo _ Ellie Goulding - First Time (Official Vid OlH1RCs96JA.m4a',
      ),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text(
                'Play it!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 76,
                child: GridView.builder(
                  itemCount: soundTiles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) => SoundPlayerWithTitle(
                    soundPath: soundTiles[index].soundPath,
                    soundTitle: soundTiles[index].soundTitle,
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class SoundPlayerWithTitle extends StatefulWidget {
  SoundPlayerWithTitle({
    Key key,
    this.soundPath,
    this.soundTitle,
  }) : super(key: key);
  final String soundPath, soundTitle;

  @override
  _SoundPlayerWithTitleState createState() => _SoundPlayerWithTitleState(
        soundPath: soundPath,
        soundTitle: soundTitle,
      );
}

class _SoundPlayerWithTitleState extends State<SoundPlayerWithTitle> {
  bool _isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();
  final String soundPath, soundTitle;
  @override
  _SoundPlayerWithTitleState({
    this.soundPath,
    this.soundTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (_isPlaying == false) {
                assetsAudioPlayer.open(
                  Audio(soundPath),
                );
                assetsAudioPlayer.isPlaying.listen((event) {
                  if (event == false) {
                    setState(() {
                      // _isPlaying = false;
                    });
                  }
                });
                setState(() {
                  _isPlaying = !_isPlaying;
                });
              } else {
                // assetsAudioPlayer.playOrPause();
                assetsAudioPlayer.stop();
                setState(() {
                  _isPlaying = !_isPlaying;
                });
              }
            },
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  Text(
                    _isPlaying ? "pause" : "play",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    soundTitle.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
