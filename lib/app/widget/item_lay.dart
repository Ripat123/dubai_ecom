import 'package:dubai_ecocm/app/data/ItemModel.dart';
import 'package:flutter/material.dart';

class ItemLay extends StatelessWidget{
  final ItemModel model;

  const ItemLay({Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(

        children: [
          Image.network(model.imgUrl),
          Padding(padding: EdgeInsets.all(8),
          child: Text(model.title),)
        ],
      ),
    );
  }

}