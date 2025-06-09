import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_product_list_view_item.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/category_list_view_item.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_delete_product_cubit/admin_delete_product_cubit.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_delete_product_cubit/admin_delete_product_state.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_state.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_state.dart';

import '../../../../home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_cubit.dart';

class AdminDeleteProductBody extends StatefulWidget {
  const AdminDeleteProductBody({super.key, required this.brandId});

  @override
  State<AdminDeleteProductBody> createState() => _AdminDeleteProductBodyState();

  final String brandId;
}

class _AdminDeleteProductBodyState extends State<AdminDeleteProductBody> {
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
                    "حذف منتج",
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
                          icon: BlocConsumer<AdminDeleteProductCubit,
                              AdminDeleteProductState>(
                            listener: (context, deleteState) {
                              if (deleteState is AdminDeleteProductSuccess &&
                                  state.getAllProductsByCategoryIdData[index]
                                          .id ==
                                      deleteState.productId) {
                                Fluttertoast.showToast(
                                  msg: StringsManager.adminDeleteItemSuccess,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                context
                                    .read<GetAllProductsByCategoryIdCubit>()
                                    .getAllProductsByCategoryId(
                                      categoryId: state
                                              .getAllProductsByCategoryIdData[
                                                  index]
                                              .categoryId
                                              ?.id ??
                                          '',
                                    );
                              }
                              if (deleteState is AdminDeleteProductFailure &&
                                  state.getAllProductsByCategoryIdData[index]
                                          .id ==
                                      deleteState.productId) {
                                Fluttertoast.showToast(
                                  msg: deleteState.error,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              }
                            },
                            builder: (context, deleteState) {
                              if (deleteState is AdminDeleteProductLoading &&
                                  state.getAllProductsByCategoryIdData[index]
                                          .id ==
                                      deleteState.productId) {
                                return CircularProgressIndicator(
                                  color: ColorManager.mainColor,
                                );
                              }
                              return InkWell(
                                onTap: () => context
                                    .read<AdminDeleteProductCubit>()
                                    .adminDeleteProduct(
                                      token: PrefsHelper.getToken(
                                          key: PrefsKey.token),
                                      productId: state
                                              .getAllProductsByCategoryIdData[
                                                  index]
                                              .id ??
                                          "",
                                    ),
                                child: Icon(
                                  Icons.delete,
                                  size: 35.sp,
                                  color: Colors.red[900],
                                ),
                              );
                            },
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
