import 'package:bookia/features/auth/data/models/response/get_wishlist_response/get_wishlist_response.dart';
import 'package:bookia/features/home/data/models/response/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/response/get_cart_response/get_cart_response.dart';
import 'package:bookia/features/home/data/models/response/home_bunner_response/home_bunner_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestSellerEvent>(getBestSellerBooks);
    on<GetHomeBunnerEvent>(getHomeBunner);
    on<AddToWishlistEvent>(addToWishlist);
    on<GetWishlistEvent>(getWishlist);
    on<RemoveFromWishlistEvent>(removeFromWishlist);
    on<GetCartEvent>(getCart);
    on<RemoveFromCartEvent>(removeFromCart);
    on<AddToCartEvent>(addToCart);
  }

  BestSellerResponse? bestSellerResponse;
  HomeBunnerResponse? homeBunnerResponse;
  GetWishlistResponse? getWishlistResponse;
  GetCartResponse? getCartResponse;

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

  Future<void> addToWishlist(
      AddToWishlistEvent event, Emitter<HomeState> emit) async {
    emit(AddToWishlistLoadingState());

    await HomeRepo.addToWishlist(productId: event.productId).then((value) {
      if (value != null) {
        emit(AddToWishlistLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> removeFromWishlist(
      RemoveFromWishlistEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromWishlistLoadingState());

    await HomeRepo.removeFromWishlist(productId: event.productId).then((value) {
      if (value != null) {
        emit(RemoveFromWishlistLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> getWishlist(
      GetWishlistEvent event, Emitter<HomeState> emit) async {
    emit(GetWishlistLoadingState());
    await HomeRepo.getWishlist().then((value) {
      if (value != null) {
        getWishlistResponse = value;
        emit(GetWishlistLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  // cart

  Future<void> getCart(GetCartEvent event, Emitter<HomeState> emit) async {
    emit(GetCartLoadingState());
    await HomeRepo.getCart().then((value) {
      if (value != null) {
        getCartResponse = value;
        emit(GetCartLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> addToCart(AddToCartEvent event, Emitter<HomeState> emit) async {
    emit(AddToCartLoadingState());

    await HomeRepo.addToCart(productId: event.productId).then((value) {
      if (value != null) {
        emit(AddToCartLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> removeFromCart(
      RemoveFromCartEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromCartLoadingState());

    await HomeRepo.removeFromCart(CartId: event.CartItemId).then((value) {
      if (value != null) {
        emit(RemoveFromCartLoadedState());
      } else {
        emit(HomeErrorState());
      }
    });
  }
}
