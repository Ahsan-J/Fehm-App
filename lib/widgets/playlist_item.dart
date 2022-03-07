import 'package:fehm/config/navigation.dart';
import 'package:fehm/model/audio_specs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayListItem extends StatelessWidget {
  Function? onPlay;
  AudioSpecs? audioItem;

  PlayListItem({Key? key, this.onPlay, this.audioItem}) : super(key: key);

  void onMenuSelection(String result) {
    if (result == "play") {
      onPlay!(audioItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: GestureDetector(
            onTap: () => AppRouter.push('/detail'),
            child: Row(
              children: [
                const Icon(Icons.book),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: const Text("Name of the book"))),
                PopupMenuButton<String>(
                  onSelected: onMenuSelection,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'play',
                      child: Text('Play'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'add_queue',
                      child: Text('Add to playlist'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'favorite',
                      child: Text('Mark as favorite'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'details',
                      child: Text('Details'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                )
              ],
            )));
  }
}
