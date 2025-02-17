import 'package:dubai_ecocm/app/data/storeModel.dart';
import 'package:get/get.dart';

class ItemViewController extends GetxController {

  var stores = <StoreModel>[
    StoreModel(
      name: "Snoomart",
      image: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-06%2F319c9536-3e20-4c53-b80a-8fa30e6fb931_output.png%3Fformat%3Dwebp&w=1920&q=75",
      deliveryTime: "21 mins",
      is24x7: true,
    ),
    StoreModel(
      name: "Al Meera",
      image: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-12%2F358658ea-cc9c-4de1-bf57-9e48a1c185db_output.png%3Fformat%3Dwebp&w=1920&q=75",
      deliveryTime: "1 Hour",
      is24x7: false,
    ),
    StoreModel(
      name: "Monoprix",
      image: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2Fheader_image%2F2023-06%2FCnmjHvgvUJ.png%3Fformat%3Dwebp&w=1920&q=75",
      deliveryTime: "44 mins",
      is24x7: true,
    ),
    StoreModel(
      name: "Carrefour",
      image: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2Fheader_image%2F2022-10%2FHxZ4M6tw4w.png%3Fformat%3Dwebp&w=1920&q=75",
      deliveryTime: "50 mins",
      is24x7: false,
    ),
    StoreModel(
      name: "Lulu Hypermarket",
      image: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2Fheader_image%2F2022-10%2Fdc6pibKcKM.png%3Fformat%3Dwebp&w=1920&q=75",
      deliveryTime: "58 mins",
      is24x7: false,
    ),
    StoreModel(
      name: "Shaklaan Food",
      image: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F6a15acb5-ec22-4507-8c89-eb206460adad_output.png%3Fformat%3Dwebp&w=1920&q=75",
      deliveryTime: "41 mins",
      is24x7: true,
    ),
    StoreModel(
      name: "Bangla Food",
      image: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2Fheader_image%2F2022-11%2FBBnpvdPLvy.png%3Fformat%3Dwebp&w=1920&q=75",
      deliveryTime: "20 mins",
      is24x7: true,
    ),
    StoreModel(
      name: "Arabian Food",
      image: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-10%2F90c3a1c3-394e-451c-b50b-9210c4a2f7b8_output.png%3Fformat%3Dwebp&w=1920&q=75",
      deliveryTime: "56 mins",
      is24x7: true,
    ),

  ].obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
