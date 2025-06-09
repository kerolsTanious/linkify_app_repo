import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_buttom.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_text_form_filed.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_update_product_cubit/admin_update_product_cubit.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_update_product_cubit/admin_update_product_state.dart';
import 'package:linkify_app/features/home/data/model/get_all_products_by_category_id/GetAllProductsByCategoryIdData.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_cubit.dart';

class AdminUpdateProductScreenBody extends StatefulWidget {
  const AdminUpdateProductScreenBody({super.key, required this.productsData});

  @override
  State<AdminUpdateProductScreenBody> createState() =>
      _AdminUpdateProductScreenBodyState();

  final GetAllProductsByCategoryIdData productsData;
}

class _AdminUpdateProductScreenBodyState
    extends State<AdminUpdateProductScreenBody> {
  late TextEditingController nameController;
  late TextEditingController descController;
  late TextEditingController priceController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.productsData.name);
    descController =
        TextEditingController(text: widget.productsData.description);
    priceController = TextEditingController(
        text: widget.productsData.price?.split(" ").first);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: ListView(
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
                      "تعديل المنتج",
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
            CustomAuthTextFormFiled(
              textInputType: TextInputType.text,
              titleText: "اسم المنتج",
              hintText: nameController.text,
              textInputAction: TextInputAction.next,
              controller: nameController,
              validator: (value) {
                return value!.isEmpty ? 'يرجى إدخال اسم المنتج' : null;
              },
              prefixIcon: Icon(Icons.drive_file_rename_outline_outlined),
            ),
            SizedBox(height: 10.h),
            CustomAuthTextFormFiled(
              textInputType: TextInputType.text,
              titleText: "الوصف",
              hintText: descController.text,
              textInputAction: TextInputAction.next,
              controller: descController,
              validator: (value) {
                return value!.isEmpty ? 'يرجى إدخال الوصف' : null;
              },
              prefixIcon: Icon(Icons.drive_file_rename_outline_outlined),
            ),
            SizedBox(height: 10.h),
            CustomAuthTextFormFiled(
              textInputType: TextInputType.number,
              titleText: "السعر",
              hintText: priceController.text,
              textInputAction: TextInputAction.done,
              controller: priceController,
              validator: (value) {
                return value!.isEmpty ? 'يرجى إدخال السعر' : null;
              },
              prefixIcon: Icon(Icons.monetization_on_outlined),
            ),
            SizedBox(height: 50.h),
            BlocConsumer<AdminUpdateProductCubit, AdminUpdateProductState>(
              listener: (context, state) {
                if (state is AdminUpdateProductSuccess) {
                  context.pop();
                  context
                      .read<GetAllProductsByCategoryIdCubit>()
                      .getAllProductsByCategoryId(
                          categoryId: state
                                  .adminUpdateProductSuccess.data?.categoryId ??
                              "");
                  Fluttertoast.showToast(
                    msg: "تم تعديل المنتج بنجاح",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
                if (state is AdminUpdateProductFailure) {
                  Fluttertoast.showToast(
                      msg: state.error,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              builder: (context, state) {
                if (state is AdminUpdateProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                return CustomAuthButton(
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context
                          .read<AdminUpdateProductCubit>()
                          .adminUpdateProduct(
                            token: PrefsHelper.getToken(key: PrefsKey.token),
                            name: nameController.text,
                            desc: descController.text,
                            price: priceController.text,
                            productId: widget.productsData.id ?? "",
                          );
                    }
                  },
                  buttonTitle: "تعديل المنتج",
                );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
