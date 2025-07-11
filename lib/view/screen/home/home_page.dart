import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/controller/home/home_controller.dart';
import 'package:inventory/core/common/widgets/custom_scaffold.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:inventory/core/constant/app_lables.dart';
import '../../../controller/update/update_database_controller.dart';
import '../../../controller/upload/uplaod_controller.dart';
import '../../../core/common/widgets/custom_material_button.dart';
import '../../../core/common/widgets/custom_sized_box.dart';
import '../../../core/common/widgets/custom_text.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../data/static/home/category_list.dart';
import '../../widget/category_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    UpdateDatabaseController updateController = Get.put(UpdateDatabaseController());
    UploadDatabaseController uploadController = Get.put(UploadDatabaseController());
    return CustomScaffoldWithBackground(
        body: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingSm,
        vertical: AppSizes.paddingExLg,
      ),
      child: Column(
        children: [
          const CustomSizedBox(height: 20),
          Center(
            child: CustomText(
              text: AppLabels.category_page_title,
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const CustomSizedBox(
            height: 20,
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: categoryList.length,
                //gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (_, int index) => CategoryWidget(
                    gradient: const LinearGradient(colors: [
                      AppColors.firstGradientPrimaryColor,
                      AppColors.secondGradientPrimaryColor,
                      AppColors.secondGradientPrimaryColor,
                      AppColors.lightPrimaryColor,
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    fontSize: AppSizes.textRegularSize,
                    imageHeight: 100,
                    imageWidth: 100,
                    index: index,
                    onPressed: () =>
                        homeController.goToPage(categoryList[index].title))),
          ),
          /*const CustomSizedBox(
            height: 20,
          ),
          CustomMaterialButton(

            backgroundColor: AppColors.primaryColor,
            onPressed: ()=>updateController.updateDatabse(),
            child: CustomText(
              text: "تحميل بيانات المخزن من ملف خارجي",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.whiteColor
              ),
              textAlign: TextAlign.center,
            ),
          ),*/
          const CustomSizedBox(
            height: 20,
          ),
          CustomMaterialButton(
            backgroundColor: Colors.deepPurpleAccent,
            onPressed: ()=>uploadController.goToUploadPage(),
            child: CustomText(
              text: "رفع بيانات المخزن من ملف Excel",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.whiteColor
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const CustomSizedBox(
            height: 20,
          ),
          CustomMaterialButton(
            backgroundColor: Color(0xFF4CAF50),
            onPressed: ()=> homeController.openWebPage('https://smallpdf.com/pdf-to-excel#r=convert-to-excel'),
            child: CustomText(
              text: "تحويل ملف pdf إلى Excel",
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.whiteColor
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ));
  }
}
