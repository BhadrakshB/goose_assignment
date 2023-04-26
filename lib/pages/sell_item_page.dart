import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goose_flutter_assignment/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Providers/sell_item_handler.dart';
import '../constants.dart';
import '../features/authentication.dart';
import '../features/sell_item_features.dart';

class SellItemPage extends StatelessWidget {
  const SellItemPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      appBar: AppBar(
        leadingWidth: 35,
        toolbarHeight: 30,
        backgroundColor: UIColors.backgroundColor,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: UIColors.secondaryColor.withOpacity(0.25),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                label: "Discard",
                backgroundColor: Colors.white,
                textColor: UIColors.primaryColor,
                onTap: () {},
              ),
            ),
            Expanded(
              child: CustomButton(
                label: "Create Post",
                backgroundColor: UIColors.primaryColor,
                onTap: () {
                  context.read<SellItemHandler>().createPost(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.sell,
                    color: UIColors.primaryColor,
                    size: 34,
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Sell an item",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Herald Towers",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              LabelledField(
                label: "Title*",
                onChanged: (value) {
                  context.read<SellItemHandler>().changeTitle(value as String);
                },
              ),
              LabelledField(
                isDropdown: true,
                label: "Category*",
                onChanged: (value) {
                  context
                      .read<SellItemHandler>()
                      .changeCategory(value as String);
                },
              ),
              LabelledField(
                label: "Description*",
                minLines: 4,
                hintText:
                    "Describe the condition of the item and terms of buying...\n\"slightly used, almost new\"\n\"pickup on weekends only\"",
                onChanged: (value) {
                  context
                      .read<SellItemHandler>()
                      .changeDescription(value as String);
                },
              ),
              LabelledField(
                inNumber: true,
                label: "Price*",
                prefixIcon: const Icon(Icons.currency_rupee),
                onChanged: (value) {
                  context
                      .read<SellItemHandler>()
                      .changePrice(double.parse(value as String));
                },
              ),
              SelectedPhotoPreview(
                images: context.watch<SellItemHandler>().item.images,
              ),
              InkWell(
                onTap: () async {
                  ImagePicker picker = ImagePicker();
                  try {
                    var imageFile = await picker.pickMultiImage();
                    imageFile.elementAt(0);
                    for (XFile i in imageFile) {
                      Uint8List image = await i.readAsBytes();
                      context
                          .read<SellItemHandler>()
                          .changeImagesList(image, true);
                    }
                  } catch (error) {
                    log(error.toString());
                  }
                },
                child: Container(
                  width: double.infinity,
                  color: UIColors.secondaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: UIColors.secondaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(Icons.add),
                      ),
                      const Text(
                        "Add Photos",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
