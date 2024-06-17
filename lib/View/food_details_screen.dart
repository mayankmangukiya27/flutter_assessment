import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:interview_project/AppConfig/app_config.dart';
import 'package:interview_project/AppConfig/color_config.dart';
import 'package:interview_project/Model/food_model.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

class FoodDetailsScreen extends StatelessWidget {
  Business? FoodDetails;

  FoodDetailsScreen({super.key, this.FoodDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close))),
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  FoodDetails!.imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                FoodDetails!.name.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                FoodDetails!.price.toString(),
                style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RatingStars(
                    editable: true,
                    rating: FoodDetails!.rating!,
                    color: Colors.amber,
                    iconSize: 20,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text("${FoodDetails!.reviewCount!} ratings")
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 12.0, right: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Type: ",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                itemCount: FoodDetails!.categories!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Text(FoodDetails!.categories![i].title!);
                },
              ),
              const SizedBox(
                height: 0.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 10.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: colorConfig.greenColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.shopping_cart_checkout,
                          color: colorConfig.whiteColor,
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          "Add To cart",
                          style: TextStyle(
                              color: colorConfig.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 10.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: colorConfig.greenColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "Order Now",
                          style: TextStyle(
                              color: colorConfig.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
