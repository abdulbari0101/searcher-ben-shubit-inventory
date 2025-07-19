import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory/controller/home/home_controller.dart';
import 'package:inventory/core/common/widgets/custom_img_text.dart';
import 'package:inventory/core/common/widgets/custom_scaffold.dart';
import 'package:inventory/core/constant/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
    UpdateDatabaseController updateController =
        Get.put(UpdateDatabaseController());
    UploadDatabaseController uploadController =
        Get.put(UploadDatabaseController());
    return CustomScaffoldWithBackground(
        body: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingSm,
        vertical: AppSizes.paddingExLg,
      ),
      child: ListView(
        children: [
        Container(
          height: Get.height,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingSm,
            vertical: AppSizes.paddingExLg,
          ),
          child: Column(
            children: [
              Obx(() {
                if (updateController.loading.value || homeController.isLoading.value) {
                  return MaterialButton(onPressed: (){},child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                }else{
                return CustomText(textAlign: TextAlign.center,textDirection: TextDirection.rtl,
                  text: homeController.foundNewUpdate.value
                      ? " يوجد تحديث جديد لبيانات المخزن \n  ${(homeController.updateData.toString().split(' ')[1].split('.')[0] + ' | ' + homeController.updateData.toString().split(' ')[0])}"
                      : 'لا توجد تحديثات جديدة لبيانات المخزن',
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: homeController.foundNewUpdate.value
                          ? AppColors.primaryColor
                          : AppColors.redColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,),
                );
                }
              }),
              const CustomSizedBox(height: 40),

              const CustomSizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width,
                child: CategoryWidget(
                    gradient: const LinearGradient(colors: [
                      AppColors.firstGradientPrimaryColor,
                      AppColors.secondGradientPrimaryColor,
                      AppColors.secondGradientPrimaryColor,
                      AppColors.lightPrimaryColor,
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    fontSize: AppSizes.textRegularSize,
                    imageHeight: 100,
                    imageWidth: 100,
                    index: 0,
                    onPressed: () =>
                        homeController.goToPage(categoryList[0].title)),
              ),
             /* Expanded(
                flex: 1,
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
                            homeController.goToPage(categoryList[index].title))
                ),
              ),*/
              const CustomSizedBox(
                height: 50,
              ),
              Center(
                child: CustomText(
                  text: "اختر احدى العمليات",
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const CustomSizedBox(
                height: 20,
              ),
              Obx(() {
                if (updateController.loading.value) {
                  return CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 13.0,
                    animation: false,
                    percent: updateController.progress.value / 100,
                    center: new Text(
                      "${updateController.progress.value}%",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: new Text( textDirection: TextDirection.rtl,
                      "جاري تنزيل البيانات...",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: AppColors.primaryColor,
                  );
                } else {
                  return CustomMaterialButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () async {
                      await homeController.checkForNewUpdate();
                      bool newUpdateFound =
                          homeController.foundNewUpdate.value;
                      if(newUpdateFound) {
                        await updateController.updateDatabse();
                        homeController.foundNewUpdate.value = false;
                      }else {
                        Get.snackbar("لا توجد تحديثات جديدة", "لا توجد تحديثات جديدة لبيانات المخزن",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                      }
                    },
                    child: CustomText(
                      text: "تحديث البيانات من الانترنت",
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.whiteColor),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              }),
              const CustomSizedBox(
                height: 20,
              ),
              CustomMaterialButton(
                backgroundColor: Colors.deepPurpleAccent,
                onPressed: () {
                  uploadController.goToUploadPage();
                },
                child: CustomText(
                  text: "رفع بيانات المخزن من ملف Excel",
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.whiteColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const CustomSizedBox(
                height: 20,
              ),
              CustomMaterialButton(
                backgroundColor: Color(0xFF4CAF50),
                onPressed: () => homeController.openWebPage(
                    'https://smallpdf.com/pdf-to-excel#r=convert-to-excel'),
                child: CustomText(
                  text: "تحويل ملف pdf إلى Excel",
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.whiteColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const CustomSizedBox(
                height: 60,
              ),
              InkWell(child: Text("Developed By: Eng.Abdulbari Sultan\n +967 783 399 063",textDirection: TextDirection.ltr,textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                      )
              ),onTap: (){
                homeController.openWebPage("https://wa.me/967783399063");
              },
              ),
            ],
          ),
        ),]
      ),
    ));
  }
}
