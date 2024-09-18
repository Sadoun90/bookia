part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

// HomeBunner
class HomeBunnerLoadingState extends HomeState {}

class HomeBunnerLoadedState extends HomeState {}

// best seller

class BestSellerLoadingState extends HomeState {}

class BestSellerLoadedState extends HomeState {}

class HomeErrorState extends HomeState {}
