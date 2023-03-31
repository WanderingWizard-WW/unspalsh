import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:unspalsh/repositories/unsplash_repository.dart';
import 'package:unspalsh/view/home/entities/unsplash_photo.dart';

part 'home_state.dart';

//Min 1, Max 30
const _defaultPhotosCount = 30;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(const HomeLoadingState()) {
    _onCreate();
  }

  Future<void> _onCreate() async {
    _loadRandomPhotos();
  }

  final UnsplashRepository _repository;

  Future<void> onRefresh() async {
    return _loadRandomPhotos();
  }

  Future<void> onSearchSubmitted(String searchQuery) async {
    try {
      emit(const HomeLoadingState());
      final photos = await _repository.searchImages(_defaultPhotosCount, searchQuery);
      emit(HomeLoadedState(photos));
    } catch (e) {
      log(e.toString());
      if (e is DioError && e.response?.statusCode == HttpStatus.notFound) {
        emit(const HomeEmptyState('No results found'));
        return;
      }
      emit(const HomeErrorState('Something went wrong, please refresh the page'));
    }
  }

  Future<void> _loadRandomPhotos() async {
    try {
      emit(const HomeLoadingState());
      final photos = await _repository.getImages(_defaultPhotosCount);
      emit(HomeLoadedState(photos));
    } catch (e) {
      log(e.toString());
      emit(const HomeErrorState('Something went wrong, please refresh the page'));
    }
  }
}
