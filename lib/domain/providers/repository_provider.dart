import 'package:boiler_plate/data/remote/newsList/news_list_repo.dart';
import 'package:boiler_plate/data/remote/newsList/news_list_repo_impl.dart';
import 'package:boiler_plate/domain/providers/api_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsRepositoryProvider = Provider<BaseNewsListRepo>(
  (ref) => NewsListRepoImpl(
    ref.read(apiClientProvider),
  ),
);
