// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goose_flutter_assignment/Providers/sell_item_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class LabelledField extends StatefulWidget {
  final String label;
  final Function(Object?) onChanged;
  final bool isDropdown;
  final int minLines;
  final Icon? prefixIcon;
  final String? hintText;
  final bool inNumber;
  const LabelledField({
    super.key,
    required this.label,
    required this.onChanged,
    this.isDropdown = false,
    this.minLines = 1,
    this.prefixIcon,
    this.hintText,
    this.inNumber = false,
  });

  @override
  State<LabelledField> createState() => _LabelledFieldState();
}

class _LabelledFieldState extends State<LabelledField> {
  String dropDownValue = 'Household';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          widget.isDropdown
              ? Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: UIColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    menuMaxHeight: 100,
                    value: dropDownValue,
                    dropdownColor: UIColors.secondaryColor,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: 'Household',
                        child: Text("Household"),
                      ),
                      DropdownMenuItem(
                        value: 'Electical Appliances',
                        child: Text("Electical Appliances"),
                      ),
                      DropdownMenuItem(
                        value: 'Car Accessories',
                        child: Text("Car Accessories"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        widget.onChanged(value);
                      });
                    },
                  ),
                )
              : TextField(
                  keyboardType: widget.inNumber ? TextInputType.number : null,
                  minLines: widget.minLines,
                  maxLines: widget.minLines == 1 ? widget.minLines : 20,
                  onChanged: (value) {
                    widget.onChanged(value);
                  },
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                    prefixIcon: widget.prefixIcon,
                    prefixIconColor: Colors.grey,
                    fillColor: UIColors.secondaryColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent)),
                  ),
                )
        ],
      ),
    );
  }
}

class SelectedPhotoPreview extends StatelessWidget {
  final List<Uint8List>? images;
  const SelectedPhotoPreview({
    Key? key,
    required this.images,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: images != null || (images?.isNotEmpty ?? false)
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.memory(images!.elementAt(index),),
                    ),
                    IconButton(
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      padding: const EdgeInsets.all(0),
                      constraints:const  BoxConstraints(),
                      icon: Icon(
                        Icons.cancel,
                        color: UIColors.secondaryColor,
                      ),
                      onPressed: () {
                        context
                            .read<SellItemHandler>()
                            .changeImagesList(images!.elementAt(index), false);
                      },
                    )
                  ],
                ),
              ),
            )
          : const Center(child: Text("No photos selected")),
    );
  }
}
