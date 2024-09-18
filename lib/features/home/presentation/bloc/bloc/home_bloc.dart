import 'package:bookia/features/home/data/models/response/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/response/home_bunner_response/home_bunner_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestSellerEvent>(getBestSellerBooks);
    on<GetHomeBunnerEvent>(getHomeBunner);
  }

  BestSellerResponse? bestSellerResponse;
  HomeBunnerResponse? homeBunnerResponse;
  Future<void> getBestSellerBooks(
      GetBestSellerEvent event, Emitter<HomeState> emit) async {
    emit(BestSellerLoadingState());

    await HomeRepo.getBestSellerBooks().then((value) {
      bestSellerResponse = value;
      if (value != null) {
        emit(BestSellerLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> getHomeBunner(
      GetHomeBunnerEvent event, Emitter<HomeState> emit) async {
    emit(HomeBunnerLoadingState());

    await HomeRepo.GetHomeBunner().then((value) {
      if (value != null) {
        homeBunnerResponse = value;
        emit(HomeBunnerLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }
}
