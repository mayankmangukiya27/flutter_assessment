import 'package:flutter/material.dart';
import 'package:interview_project/AppConfig/color_config.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: colorConfig.baseColor,
        highlightColor: colorConfig.highlightColor,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 10.0),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
              color: Colors.grey,
              height: 150.0,
              width: double.infinity,
            );
          },
        ));
  }
}
