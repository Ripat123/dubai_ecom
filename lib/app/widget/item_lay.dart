import 'package:dubai_ecocm/app/data/ItemModel.dart';
import 'package:flutter/material.dart';

class ItemLay extends StatelessWidget{
  final ItemModel model;

  const ItemLay({super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            model.imgUrl,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

}