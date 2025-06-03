import '../../../data/model/get_all_brands_model/AllBrandsData.dart';

sealed class GetAllBrandsState {}

final class GetAllBrandsInitial extends GetAllBrandsState {}

final class GetAllBrandsSuccess extends GetAllBrandsState {
  final List<AllBrandsData> allBrandsData;

  GetAllBrandsSuccess({required this.allBrandsData});
}

final class GetAllBrandsLoading extends GetAllBrandsState {}

final class GetAllBrandsFailure extends GetAllBrandsState {
  final String errorMessage;

  GetAllBrandsFailure({required this.errorMessage});
}
