import 'package:final_project/models/ABookModel.dart';
import 'package:final_project/services/ABookModelService.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class ABookFormEditPage extends StatefulWidget {
  ABookModel aBookModel;
  ABookFormEditPage({Key? key, required this.aBookModel}) : super(key: key);

  @override
  State<ABookFormEditPage> createState() => _ABookFormEditPageState();
}

class _ABookFormEditPageState extends State<ABookFormEditPage> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  final _formKey = GlobalKey<FormState>();
  //Lấy value của field qua controller
  final valueController = TextEditingController();
  final valueControllerPrice = TextEditingController();
  final valueControllerDetail = TextEditingController();
  final valueControllerImage = TextEditingController();
  void initState() {
    super.initState();
    valueController.text = widget.aBookModel.title;
    valueControllerPrice.text = widget.aBookModel.price;
    valueControllerDetail.text = widget.aBookModel.detail;
    valueControllerImage.text = widget.aBookModel.img;
    if (widget.aBookModel.option == "Kinh dị") {
      _character = SingingCharacter.lafayette;
    } else {
      _character = SingingCharacter.jefferson;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chỉnh sửa sản phẩm'),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: valueController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Tên sách',
                    ),
                    // Kiểm tra ràng buộc
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: valueControllerPrice,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Giá sách',
                    ),
                    // Kiểm tra ràng buộc
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: valueControllerDetail,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Chi tiết',
                    ),
                    // Kiểm tra ràng buộc
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: valueControllerImage,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Hình ảnh',
                    ),
                    // Kiểm tra ràng buộc
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Kinh dị'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.lafayette,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Trinh thám'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.jefferson,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //Gọi từng validator của từng field
                    if (_formKey.currentState!.validate()) {
                      if (_character == SingingCharacter.lafayette) {
                        ABookModelService().updateProduct(ABookModel(
                            id: widget.aBookModel.id,
                            img: valueControllerImage.text,
                            title: valueController.text,
                            price: valueControllerPrice.text,
                            detail: valueControllerDetail.text,
                            option: "Kinh dị"));
                      } else {
                        ABookModelService().updateProduct(ABookModel(
                            id: widget.aBookModel.id,
                            img: valueControllerImage.text,
                            title: valueController.text,
                            price: valueControllerPrice.text,
                            detail: valueControllerDetail.text,
                            option: "Trinh thám"));
                      }

                      Navigator.of(context).pushNamed('/');
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            )));
  }
}
