import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../components/product_item.dart';
import '../../../components/screen_title.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              SizedBox(height: 30.h),
              ScreenTitle(
                title:
                    'Artisan NP', // Simple usage without style or fontSize customization
              ),
              SizedBox(height: 50.h),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  crossAxisSpacing:
                      20.w, // Increase spacing between items horizontally
                  mainAxisSpacing:
                      30.h, // Increase spacing between items vertically
                  childAspectRatio: 1 /
                      1.2, // Adjust based on your product item's content for a better fit
                  // Alternatively, if your GridView still doesn't layout items as expected, consider using mainAxisExtent
                  // mainAxisExtent: 320.h, // Explicitly set the height of each grid item
                ),
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // To disable GridView's own scrolling
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return ProductItem(
                    product: product,
                  );
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
