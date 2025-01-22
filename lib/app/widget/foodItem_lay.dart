import 'package:dubai_ecocm/app/data/ItemModel.dart';
import 'package:flutter/material.dart';

class FoodItemLay extends StatelessWidget{
  final ItemModel model;


  const FoodItemLay(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle, border:  Border.all(width: 1,color: Colors.black38),// Makes the container circular
            image: DecorationImage(
              image: NetworkImage(model.imgUrl),
              fit: BoxFit.cover, // Ensures the image fills the circle
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}