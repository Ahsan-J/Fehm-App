import 'package:fehm/config/navigation.dart';
import 'package:fehm/config/theme.dart';
import 'package:fehm/widgets/audio_control.dart';
import 'package:fehm/widgets/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBar: AppBar(
        leading: BackButton(
            onPressed: () => AppRouter.goBack(), color: Colors.black),
        backgroundColor: AppTheme.primaryColor,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 30.0, right: 30.0, top: 15.0, bottom: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network("https://via.placeholder.com/1600"),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: Text("Name of the book",
                      style: GoogleFonts.averageSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Row(
                  children: [
                    Text("By"),
                    TextButton(
                      onPressed: () {},
                      child: Text("Author name"),
                      style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Sum by"),
                    TextButton(
                      onPressed: () {},
                      child: Text("Sum name"),
                      style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Text("#TagLines"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // IconButton(icon: Icon(AntDesign.hearto), padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0), constraints: BoxConstraints(), onPressed: () {}),
                        // IconButton(icon: Icon(AntDesign.plus),padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0), constraints: BoxConstraints(), onPressed: () {})
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // AudioControls(),
        ],
      ),
    );
  }
}
