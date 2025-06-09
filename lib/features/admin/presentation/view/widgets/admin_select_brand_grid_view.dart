import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_select_brand_list_view_item.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_brands_cubit/get_all_brands_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_brands_cubit/get_all_brands_state.dart';

class AdminSelectBrandGidView extends StatelessWidget {
  const AdminSelectBrandGidView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBrandsCubit, GetAllBrandsState>(
      builder: (context, state) {
        if(state is GetAllBrandsSuccess){
          return GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: state.allBrandsData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            itemBuilder: (context, index) {
              return AdminSelectBrandListViewItem(allBrandsData: state.allBrandsData[index],);
            },
          );
        }else if(state is GetAllBrandsFailure){
          return FailureStateWidget(errorMessage: state.errorMessage);
        }else{
          return Center(child: CircularProgressIndicator(color: Colors.white,));
        }
      },
    );
  }
}
