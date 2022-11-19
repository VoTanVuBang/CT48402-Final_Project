import 'package:final_project/models/ABookModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ABookDetailPage extends StatefulWidget {
  ABookModel aBookModel;

  ABookDetailPage({Key? key, required this.aBookModel}) : super(key: key);

  @override
  State<ABookDetailPage> createState() => _ABookDetailPageState();
}

class _ABookDetailPageState extends State<ABookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Column(children: [
        Image.network(widget.aBookModel.img),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.aBookModel.title),
            //Lắng nghe sự thay đổi của icon favourite!!
            ValueListenableBuilder(
                valueListenable: widget.aBookModel.status,
                builder: ((context, bool value, child) {
                  return IconButton(
                    onPressed: () {
                      widget.aBookModel.status.value = !value;
                    },
                    icon: Icon(value ? Icons.favorite : Icons.favorite_border),
                  );
                }))
          ],
        ),
        Text(widget.aBookModel.price),
        Text(widget.aBookModel.detail)
      ]),
    );
  }
}
