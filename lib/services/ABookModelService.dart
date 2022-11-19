import 'dart:convert';
// import 'dart:js';
import 'package:http/http.dart' as http;
import 'package:final_project/models/ABookModel.dart';
import 'package:final_project/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class ABookModelService extends FirebaseService with ChangeNotifier {
  ABookModelService() : super();
  List<ABookModel> products = [];

  Future<List<ABookModel>> fetchProducts() async {
    products = [];
    try {
      // final filters = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : "";
      final productsUrl = Uri.parse('$databaseUrl/products.json');
      final response = await http.get(productsUrl);
      final productsMap = json.decode(response.body) as Map<String, dynamic>;
      productsMap.forEach((productId, product) {
        products.add(
          ABookModel.fromJson({
            'id': productId,
            ...product,
          }),
        );
      });
    } catch (error) {
      print(error);
    }
    notifyListeners();
    return products;
  }

  Future<void> addProduct(ABookModel product) async {
    try {
      final url = Uri.parse('$databaseUrl/products.json');
      final response = await http.post(
        url,
        //encode biến đối tượng thành json
        body: json.encode(
          product.toJson()..addAll({}),
        ),
      );
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  Future<bool> updateProduct(ABookModel product) async {
    try {
      final url = Uri.parse('$databaseUrl/products/${product.id}.json');
      final response = await http.patch(
        url,
        body: json.encode(product.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      notifyListeners();
      return true;
    } catch (error) {
      print(error);
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteProduct(String? id) async {
    try {
      final url = Uri.parse('$databaseUrl/products/$id.json');
      final response = await http.delete(url);

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      notifyListeners();
      return true;
    } catch (error) {
      print(error);
      notifyListeners();
      return false;
    }
  }
}
