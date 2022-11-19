import 'package:final_project/ABook.dart';
import 'package:final_project/models/ABookModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ABookList extends StatefulWidget {
  List<ABookModel> aBookModels;

  ABookList({Key? key, required this.aBookModels}) : super(key: key);

  @override
  State<ABookList> createState() => _ABookListState();
}

class _ABookListState extends State<ABookList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.aBookModels.length,
            itemBuilder: (context, index) {
              return ABook(aBookModel: widget.aBookModels[index]);
            },
          ),
        ),
      ],
    );
  }
}
