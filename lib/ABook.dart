import 'package:final_project/models/ABookModel.dart';
import 'package:final_project/services/ABookModelService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ABook extends StatefulWidget {
  ABookModel aBookModel;

  ABook({Key? key, required this.aBookModel}) : super(key: key);

  @override
  State<ABook> createState() => _ABookState();
}

class _ABookState extends State<ABook> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed("/detail", arguments: widget.aBookModel);
        },
        child: Column(
          children: [
            Image.network(widget.aBookModel.img),
            Text(widget.aBookModel.title),
            Text(widget.aBookModel.price),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  //2 places mà muốn lấy biến thì widget.
                  onPressed: () {
                    ABookModelService().deleteProduct(widget.aBookModel.id);
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Text('Xóa', style: TextStyle(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/edit', arguments: widget.aBookModel);
                  },
                  child: Text('Chỉnh sửa', style: TextStyle(color: Colors.red)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
