import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_buttom.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_text_form_filed.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/category_list_view_item.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_add_product_cubit/admin_add_product_cubit.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_add_product_cubit/admin_add_product_state.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_state.dart';
import 'package:permission_handler/permission_handler.dart';

class AdminAddProductBody extends StatefulWidget {
  const AdminAddProductBody({super.key, required this.brandId});

  @override
  State<AdminAddProductBody> createState() => _AddProductPageState();

  final String brandId;
}

class _AddProductPageState extends State<AdminAddProductBody> {
  late TextEditingController nameController;
  late TextEditingController descController;
  late TextEditingController quantityController;
  late TextEditingController priceController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? imageFile;

  int? selectedCategoryIndex;

  late String categoryId;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descController = TextEditingController();
    quantityController = TextEditingController();
    priceController = TextEditingController();

    context
        .read<GetCategoriesBrandIdCubit>()
        .getCategoriesByBrandId(brandId: widget.brandId);
  }

  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    if (await Permission.photos.request().isGranted ||
        await Permission.storage.request().isGranted) {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          imageFile = File(image.path);
        });
      } else {
        print("لم يتم اختيار صورة");
      }
    } else {
      print("الصلاحية مرفوضة");
    }
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      if (imageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('يرجى اختيار صورة')),
        );
        return;
      }

      print('Uploading image path: ${imageFile?.path}');
      print('Uploading file name: ${imageFile?.path.split('/').last}');

      context.read<AdminAddProductCubit>().adminAddProduct(
        token: PrefsHelper.getToken(key: PrefsKey.token),
        name: nameController.text,
        desc: descController.text,
        image: imageFile!,
        categoryId: categoryId,
        brandId: widget.brandId,
        price: priceController.text,
        quantity: quantityController.text,
      );
    }
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
                      "إضافة منتج جديد",
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
            SizedBox(height: 20.h),
            CustomAuthTextFormFiled(
              textInputType: TextInputType.text,
              titleText: "اسم المنتج",
              hintText: "اسم المنتج",
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
              hintText: "الوصف",
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
              titleText: "الكمية",
              hintText: "الكمية",
              textInputAction: TextInputAction.next,
              controller: quantityController,
              validator: (value) {
                return value!.isEmpty ? 'يرجى إدخال الكمية' : null;
              },
              prefixIcon: Icon(Icons.format_list_numbered),
            ),
            SizedBox(height: 10.h),
            CustomAuthTextFormFiled(
              textInputType: TextInputType.number,
              titleText: "السعر",
              hintText: "السعر",
              textInputAction: TextInputAction.done,
              controller: priceController,
              validator: (value) {
                return value!.isEmpty ? 'يرجى إدخال السعر' : null;
              },
              prefixIcon: Icon(Icons.monetization_on_outlined),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: pickImage,
              child: imageFile == null
                  ? Container(
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('اختر صورة')),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        imageFile!,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            SizedBox(height: 50.h),
            BlocConsumer<AdminAddProductCubit, AdminAddProductState>(
              listener: (context, state) {
                if (state is AdminAddProductSuccess) {
                  Fluttertoast.showToast(
                      msg: "تم إضافة المتنج بنجاح",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  context.pop();
                }
                if (state is AdminAddProductFailure) {
                  print("error == >${state.error}");
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
                if (state is AdminAddProductLoading) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                }
                return CustomAuthButton(
                  onTap: submitForm,
                  buttonTitle: "إضافة المنتج",
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
