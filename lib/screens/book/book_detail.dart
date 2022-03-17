import 'package:fehm/config/navigation.dart';
import 'package:fehm/config/theme.dart';
import 'package:fehm/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBar: AppBar(
        leading: BackButton(
            onPressed: () => AppRouter.goBack(), color: Colors.black),
        backgroundColor: AppTheme.primaryColor,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 15.0, bottom: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network("https://via.placeholder.com/1600"),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: Text("Name of the book",
                      style: GoogleFonts.averageSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Row(
                  children: [
                    const Text("By"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Author name"),
                      style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text("Sum by"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sum name"),
                      style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: const [
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
                          icon: const Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.star),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: const [
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
