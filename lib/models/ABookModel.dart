import 'package:flutter/cupertino.dart';

class ABookModel {
  String? id;
  String img, title, price, detail;
  ValueNotifier<bool> status = ValueNotifier(false);
  String option;

  ABookModel({
    required this.img,
    required this.title,
    required this.price,
    required this.detail,
    required this.option,
    this.id,
  });
  //Đối tượng muốn lưu là ABookModel mà trên có cơ sở dữ liệu là {} nên chuyển dữ liệu về json
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'detail': detail,
      'img': img,
      'option': option,
      'id': id,
    };
  }

  static ABookModel fromJson(Map<String, dynamic> json) {
    return ABookModel(
      title: json['title'],
      price: json['price'],
      detail: json['detail'],
      img: json['img'],
      option: json['option'],
      id: json['id'],
    );
  }
}
