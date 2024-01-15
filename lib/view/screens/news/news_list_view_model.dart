import 'package:boiler_plate/core/core.dart';
import 'package:boiler_plate/data/remote/remote.dart';
import 'package:boiler_plate/domain/providers/providers.dart';
import 'package:boiler_plate/helpers/base_screen_view.dart';
import 'package:boiler_plate/helpers/base_view_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsListViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => NewsListViewModel(
    ref.read(newsRepositoryProvider),
  ),
);

class NewsListViewModel extends BaseViewModel<BaseScreenView> {
  final BaseNewsListRepo _newsListRepo;
  NewsListResponse? _newsListResponse;
  NewsListResponse? get newsListResponse => _newsListResponse;
  NewsListViewModel(this._newsListRepo);
  Future<void> initialise() async {
    await _newsListRepo.getNewsList(AppConstants.entertainment).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) {
            _newsListResponse = r;
          }),
        );
    toggleLoading();
  }
}
