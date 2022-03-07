import 'package:fehm/api/book.dart';
import 'package:fehm/model/api.dart';
import 'package:fehm/widgets/layout.dart';
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  void getBookList() async {
    var response = await bookList(APIParams());
    print(response.data);
  }

  @override
  initState() {
    super.initState();
    // getBookList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppLayout(child: Container()),
    );
  }
}
