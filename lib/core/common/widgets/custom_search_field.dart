import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inventory/core/common/widgets/custom_divider.dart';
import 'package:inventory/core/common/widgets/custom_material_button.dart';
import 'package:inventory/core/common/widgets/custom_sized_box.dart';
import 'package:inventory/core/constant/app_lables.dart';
import 'package:inventory/core/constant/app_sizes.dart';
import 'package:inventory/core/constant/app_svgs.dart';
import 'custom_shadow_container.dart';
import 'custom_svg.dart';
import 'custom_text.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.onChange, this.controller,  this.focusNode});
final void Function(String) onChange;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.buttonHeight.h,
      child: Row(
        children: <Widget>[
          Expanded(
            child: CustomShadowContainer(
              child: TextFormField(
                onChanged: onChange,
                onTapOutside: (PointerDownEvent _) =>
                    FocusScope.of(context).unfocus(),
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: AppSizes.textLightSize,
                    ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.search_normal),
                  hintText: AppLabels.searchProduct,
                  hintStyle: TextStyle(
                    fontSize: AppSizes.textLightSize,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.0, color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.0, color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.0, color: Colors.transparent),
                  ),
                ),
              controller: controller,
              focusNode: focusNode ,),
            ),
          ),
        ],
      ),
    );
  }
}
