import 'package:boiler_plate/core/core.dart';
import 'package:boiler_plate/data/remote/remote.dart';
import 'package:dartz/dartz.dart';

abstract class BaseNewsListRepo {
  Future<Either<ApiException, NewsListResponse>> getNewsList(
    String categoryName,
  );
  void getNewsListIsolate(List args);
}
