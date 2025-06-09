import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_product_list_view_item.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/category_list_view_item.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_state.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_state.dart';

class AdminUpdateProductBody extends StatefulWidget {
  const AdminUpdateProductBody({super.key, required this.brandId});

  final String brandId;

  @override
  State<AdminUpdateProductBody> createState() => _AdminUpdateProductBodyState();
}

class _AdminUpdateProductBodyState extends State<AdminUpdateProductBody> {
  int? selectedCategoryIndex;
  late String categoryId;

  @override
  void initState() {
    super.initState();
    context
        .read<GetCategoriesBrandIdCubit>()
        .getCategoriesByBrandId(brandId: widget.brandId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
                Center(
                  child: Text(
                    "تحديث المنتجات",
                    style: Styles.textStyle24.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'اختر الفئة:',
            style: Styles.textStyle18.copyWith(color: Colors.white),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 50.h,
            child: BlocBuilder<GetCategoriesBrandIdCubit,
                GetCategoriesBrandIdState>(
              builder: (context, state) {
                if (state is GetCategoriesBrandIdSuccess) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.getCategoriesByBrandData.length,
                    itemBuilder: (context, index) {
                      return CategoryListViewItem(
                        data: state.getCategoriesByBrandData,
                        index: index,
                        onTap: () {
                          selectedCategoryIndex = index;
                          categoryId =
                              state.getCategoriesByBrandData[index].id ?? "";
                          context
                              .read<GetAllProductsByCategoryIdCubit>()
                              .getAllProductsByCategoryId(
                                  categoryId: categoryId);
                          setState(() {});
                        },
                        isSelected: selectedCategoryIndex == index,
                      );
                    },
                  );
                } else if (state is GetCategoriesBrandIdFailure) {
                  return FailureStateWidget(errorMessage: state.errorMessage);
                }
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              },
            ),
          ),
          SizedBox(height: 10.h),
          BlocBuilder<GetAllProductsByCategoryIdCubit,
              GetAllProductsByCategoryIdState>(
            builder: (context, state) {
              if (state is GetAllProductsByCategoryIdSuccess) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 190 / 260),
                    scrollDirection: Axis.vertical,
                    itemCount: state.getAllProductsByCategoryIdData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: REdgeInsets.all(5),
                        child: AdminProductListViewItem(
                          productData:
                              state.getAllProductsByCategoryIdData[index],
                          index: index,
                          icon: InkWell(
                            onTap: () => context.push(
                              RoutesManager.kAdminUpdateProductScreen,
                              extra:
                                  state.getAllProductsByCategoryIdData[index],
                            ),
                            child: Icon(
                              Icons.edit_note_sharp,
                              color: Colors.green[700],
                              size: 35.sp,
                            ),
                          ),
                          onTap: () => context.push(
                            RoutesManager.kAdminUpdateProductScreen,
                            extra: state.getAllProductsByCategoryIdData[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is GetAllProductsByCategoryIdFailure) {
                return FailureStateWidget(errorMessage: state.errorMessage);
              } else if (state is GetAllProductsByCategoryIdLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
