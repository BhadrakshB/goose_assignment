import 'dart:developer';
import 'dart:typed_data';
import 'dart:convert' as json;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellItemHandler extends ChangeNotifier {
  Product item = Product();

  void changeTitle(String value) {
    item.title = value;
    notifyListeners();
  }

  void changeCategory(String value) {
    item.category = value;
    notifyListeners();
  }

  void changeDescription(String value) {
    item.description = value;
    notifyListeners();
  }

  void changePrice(double value) {
    item.price = value;
    notifyListeners();
  }

  void changeImagesList(Uint8List value, bool add) {
    add ? item.addImage(value) : item.delImage(value);
    notifyListeners();
  }

  void discard() {}

  void createPost() {
    if (item.hasMissingFields()) {
      log("Please fill every field to post your item");
    } else {
      try{
        final firestoreInstance = FirebaseFirestore.instance;
      firestoreInstance.collection('items_to_sell').add(item.mappedData());
      } catch (error) {
        log(error.toString());
      }
    }
  }
}

class Product {
  String? title;
  String? category;
  String? description;
  double? price;
  List<Uint8List>? images;

  Product(
      {this.title, this.category, this.description, this.price, this.images});

  Map<String, dynamic> mappedData() {
    return {
      'Category': category,
      'Description': description,
      'Price': price,
      'Title': title,
      'Photos': images,
    };  }

  bool hasMissingFields() {
    return title != null &&
        category != null &&
        description != null &&
        price != null &&
        images != null;
  }

  void addImage(Uint8List value) {
    images == null ? images = [value] : images!.add(value);
  }

  void delImage(Uint8List value) {
    images != null
        ? images!.length == 1
            ? images = null
            : images = images!.where((element) => element != value).toList()
        : null;
  }
}
