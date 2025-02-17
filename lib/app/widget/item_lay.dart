import 'package:dubai_ecocm/app/data/ItemModel.dart';
import 'package:dubai_ecocm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemLay extends StatelessWidget{
  final ItemModel model;

  const ItemLay({super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(Routes.ITEM_VIEW);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                model.imgUrl,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

}