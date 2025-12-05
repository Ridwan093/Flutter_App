import 'package:flutter/material.dart';
import 'package:flutter_app/features/constants/asset_paths.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductWidget extends ConsumerWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [_buldImage(AssetPaths.productsitem, 100, 100)],
            ),
          ),
          Positioned(
            top: 98,
            child: Align(
              alignment: Alignment.center,
              child: _buldImage(AssetPaths.productIcon, 100, 150),
            ),
          ),

          Positioned(
            top: 98, // slightly below the image bottom
            child: Container(
              height: 7,
              width: 50,
              decoration: BoxDecoration(
                // color: Colors.black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buldImage(String path, double width, double height) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }
}
