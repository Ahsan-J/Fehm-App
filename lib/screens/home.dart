import 'dart:convert';

import 'package:fehm/blocs/auth_bloc/auth_bloc.dart';
import 'package:fehm/config/navigation.dart';
import 'package:fehm/model/audio.dart';
import 'package:fehm/model/user.dart';
import 'package:fehm/widgets/audio_control.dart';
import 'package:fehm/widgets/layout.dart';
import 'package:fehm/widgets/playlist_item.dart';
import 'package:fehm/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? activeUrl;

  void onItemPress(Audio item) {
    setState(() {
      activeUrl = item.url;
    });
  }

  getAuthUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(jsonDecode(prefs.getString("auth_user") ?? "{}"));
    if (user.id == null) {
      AppRouter.replace("/login");
    } else {
      BlocProvider.of<AuthBloc>(context).add(SetAuthUser(user: user));
    }
  }

  @override
  initState() {
    super.initState();
    getAuthUser();
  }

  @override
  Widget build(BuildContext context) {
    print(activeUrl);
    return SafeArea(
      child: AppLayout(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 3.0),
                      child: TextInput(
                          placeholder: "Search", icon: Icons.search))),
              IconButton(icon: const Icon(Icons.menu), onPressed: () {})
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                PlayListItem(
                    onPlay: onItemPress,
                    audioItem: Audio(
                        url:
                            '${dotenv.env["BASE_URL"]}/audio/stream/74f9e4b329111020c2177110c92d922e2f.mp3')),
              ],
            )),
          ),
          Container(
              child: activeUrl != null
                  ? AudioControls(name: "Name of the book", url: activeUrl)
                  : null)
        ],
      )),
    );
  }
}
