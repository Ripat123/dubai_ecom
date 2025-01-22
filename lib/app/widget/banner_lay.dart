import 'package:dubai_ecocm/app/data/ItemModel.dart';
import 'package:flutter/material.dart';

class BannerLay extends StatelessWidget {
  final ItemModel model;

  const BannerLay(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(20),
      child: Image.network(
        model.imgUrl,
        fit: BoxFit.cover,
      ),),
    );
  }
}
