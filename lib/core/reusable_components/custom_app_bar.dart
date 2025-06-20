import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/search_cubit/search_state.dart';

import '../../features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../prefs.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String query = "";
    return Padding(
      padding: REdgeInsets.only(
        right: 15,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Row(
            children: [
              Image.asset(
                AssetsManager.logoTrans,
                width: 50.w,
                height: 50.h,
              ),
              SizedBox(width: 10.w),
              BlocConsumer<SearchCubit, SearchState>(
                listener: (context, state) {
                  if (state is SearchSuccess) {
                    context.push(
                      RoutesManager.kSearchResult,
                      extra: state.searchResponse,
                    );
                  }
                  if(state is SearchFailure){
                    Fluttertoast.showToast(
                        msg: state.errorMessage,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorManager.mainColor,
                            width: 1.5.w,
                          ),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Center(
                          child: TextField(
                            style: TextStyle(fontSize: 18.sp),
                            decoration: InputDecoration(
                              hintText: 'ابحث عن منتج...',
                              hintStyle: TextStyle(
                                color: ColorManager.texColor,
                                fontSize: 20.sp,
                              ),
                              border: InputBorder.none,
                              icon: Center(
                                  child: CircularProgressIndicator(
                                color: ColorManager.mainColor,
                              )),
                            ),
                            onChanged: (value) {
                              query = value;
                            },
                          ),
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.mainColor,
                          width: 1.5.w,
                        ),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Center(
                        child: TextField(
                          style: TextStyle(fontSize: 18.sp),
                          decoration: InputDecoration(
                            hintText: 'ابحث عن منتج...',
                            hintStyle: TextStyle(
                              color: ColorManager.texColor,
                              fontSize: 20.sp,
                            ),
                            border: InputBorder.none,
                            icon: IconButton(
                              onPressed: () {
                                context.read<SearchCubit>().search(
                                      token: PrefsHelper.getToken(
                                          key: PrefsKey.token),
                                      query: query,
                                    );
                              },
                              icon: Icon(Icons.search_outlined),
                              color: ColorManager.mainColor,
                            ),
                          ),
                          onChanged: (value) {
                            query = value;
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  context.read<AddToCartCubit>().getCart(
                      token: PrefsHelper.getToken(key: PrefsKey.token));
                  context.push(RoutesManager.kCartScreen);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorManager.mainColor,
                  weight: 30.w,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
