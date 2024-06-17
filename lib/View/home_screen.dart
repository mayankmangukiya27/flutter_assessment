import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_project/AppConfig/color_config.dart';
import 'package:interview_project/Controller/food_controller.dart';
import 'package:interview_project/View/food_details_screen.dart';
import 'package:interview_project/View/shimmer_widget.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: FoodController(),
        builder: (FoodController) {
          return Scaffold(
              backgroundColor: colorConfig.backgroundColor,
              appBar: AppBar(
                backgroundColor: colorConfig.backgroundColor,
                title: const Text(
                  "Restaurant & Cafe",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                centerTitle: true,
              ),
              body: FoodController.apiStatusCode.value == 404
                  ? const Center(
                      child: Text(
                        "Something went wrong",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    )
                  : FoodController.apiStatusCode.value != 200
                      ? const ShimmerWidget()
                      : FoodController.foodModelResponse == null
                          ? const ShimmerWidget()
                          : RefreshIndicator(
                              onRefresh: () async {
                               await FoodController.getFoodList();
                              },
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: FoodController
                                    .foodModelResponse!.businesses!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        useRootNavigator: true,
                                        isScrollControlled: true,
                                        isDismissible: true,
                                        enableDrag: true,
                                        context: context,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (BuildContext context) {
                                          return FoodDetailsScreen(
                                            FoodDetails: FoodController
                                                .foodModelResponse!
                                                .businesses![index],
                                          );
                                        },
                                      );
                                      // Navigator.push(context, MaterialPageRoute(builder:(context) {
                                      //  return FoodDetailsScreen(FoodDetails: FoodController. foodModelResponse!.businesses![index],);
                                      // }, ));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                          color: colorConfig.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0)),
                                            child: Image.network(
                                              FoodController.foodModelResponse!
                                                  .businesses![index].imageUrl!,
                                              height: 150,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        FoodController
                                                            .foodModelResponse!
                                                            .businesses![index]
                                                            .name
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 22),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 0,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5.0,
                                                                right: 5.0,
                                                                top: 2.0,
                                                                bottom: 2.0),
                                                        decoration: BoxDecoration(
                                                            color: colorConfig
                                                                .greenColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              FoodController
                                                                  .foodModelResponse!
                                                                  .businesses![
                                                                      index]
                                                                  .rating
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: colorConfig
                                                                      .whiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 15),
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color: colorConfig
                                                                  .whiteColor,
                                                              size: 19,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  FoodController
                                                      .foodModelResponse!
                                                      .businesses![index]
                                                      .price
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: colorConfig
                                                          .back54Color,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ));
        });
  }
}
