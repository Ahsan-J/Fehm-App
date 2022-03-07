import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioControls extends StatefulWidget {
  final String? name;
  final String? url;
  final Function? onPlay;
  final Function? onNext;
  final Function? onPrevious;
  final Function? onRepeat;
  final Function? onShuffle;
  final Function? onComplete;
  final Function? onPause;

  const AudioControls(
      {Key? key,
      this.name,
      this.url,
      this.onPlay,
      this.onPause,
      this.onNext,
      this.onPrevious,
      this.onRepeat,
      this.onShuffle,
      this.onComplete})
      : super(key: key);

  @override
  _AudioControlsState createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration length = const Duration();

  Duration position = const Duration();

  bool playing = false;

  @override
  void initState() {
    super.initState();
    audioPlayer.onDurationChanged.listen((Duration value) {
      setState(() {
        length = value;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration value) {
      setState(() {
        position = value;
      });
    });
    onPlay();
  }

  void onPlay() async {
    if (playing) {
      await audioPlayer.stop();
    }

    if (widget.url == null) return;
    var res = await audioPlayer.play(widget.url ?? "");
    if (res == 1) {
      setState(() {
        playing = true;
      });
    }
    if (widget.onPlay != null) widget.onPlay!(audioPlayer);
  }

  void onPause() async {
    var res = await audioPlayer.pause();
    if (res == 1) {
      setState(() {
        playing = false;
      });
    }

    if (widget.onPause != null) widget.onPause!(audioPlayer);
  }

  void onNext() async {
    await audioPlayer.stop();

    if (widget.onNext != null) widget.onNext!(audioPlayer);
  }

  void onPrevious() async {
    await audioPlayer.stop();

    if (widget.onPrevious != null) widget.onPrevious!(audioPlayer);
  }

  void onShuffle() async {
    await audioPlayer.stop();

    if (widget.onShuffle != null) widget.onShuffle!(audioPlayer);
  }

  void onRepeat() async {
    if (widget.onRepeat != null) widget.onRepeat!(audioPlayer);
  }

  Widget renderSlider() {
    return Slider.adaptive(
        min: 0.0,
        value: position.inSeconds.toDouble(),
        max: length.inSeconds.toDouble(),
        onChanged: (double value) {
          audioPlayer.seek(Duration(seconds: value.toInt()));
        });
  }

  void onStateChange(AudioControls oldWidget) async {
    if (widget.url != oldWidget.url) {
      onPlay();
    }
  }

  @override
  void didUpdateWidget(covariant AudioControls oldWidget) {
    onStateChange(oldWidget);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        widget.name != null
            ? Container(
                color: Colors.black12,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Text(
                  widget.name ?? "",
                  style: GoogleFonts.averageSans(
                    fontSize: 20.0,
                    letterSpacing: 1.8,
                  ),
                ),
              )
            : Container(),
        renderSlider(),
        Row(
          children: [
            Expanded(
                child: IconButton(
              icon: const Icon(Icons.shuffle),
              onPressed: onShuffle,
            )),
            Expanded(
                child: IconButton(
              icon: const Icon(Icons.skip_previous),
              onPressed: onPrevious,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(playing == true ? Icons.pause : Icons.play_arrow),
              onPressed: playing == true ? onPause : onPlay,
            )),
            Expanded(
                child: IconButton(
              icon: const Icon(Icons.skip_next),
              onPressed: onNext,
            )),
            Expanded(
                child: IconButton(
              icon: const Icon(Icons.repeat),
              onPressed: onRepeat,
            )),
          ],
        ),
      ],
    );
  }
}
