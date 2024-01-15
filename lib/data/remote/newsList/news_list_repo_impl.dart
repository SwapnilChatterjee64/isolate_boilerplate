import 'dart:isolate';

import 'package:boiler_plate/core/core.dart';
import 'package:boiler_plate/data/remote/remote.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsListRepoImpl implements BaseNewsListRepo {
  final ApiClient _apiClient;

  NewsListRepoImpl(this._apiClient);
  @override
  Future<Either<ApiException, NewsListResponse>> getNewsList(
    String categoryName,
  ) async {
    final resultPort = ReceivePort("GetNewsList");
    try {
      await Isolate.spawn(
        getNewsListIsolate,
        [
          resultPort.sendPort,
          ApiClient.TOP_HEADLINES,
          '8a3270cf65eb49da932ca43ec3db95aa',
          categoryName
        ],
        errorsAreFatal: true,
        onError: resultPort.sendPort,
        onExit: resultPort.sendPort,
        debugName: 'GetNewsList',
      );
    } catch (e) {
      print(e);
      resultPort.close();
    }
    final response = await resultPort.first;
    resultPort.close();

    return response as Either<ApiException, NewsListResponse>;
  }

  @override
  Future<bool> getNewsListIsolate(List args) async {
    final SendPort sendPort = args[0] as SendPort;
    final String path = args[1] as String;
    final String key = args[2] as String;
    final String categoryName = args[3] as String;
    try {
      final response = await _apiClient.get(
        "/$path?country=in&apiKey=$key&category=$categoryName",
      );

      final parsedData = NewsListResponse.fromJson(response.data!);
      final data = Right<ApiException, NewsListResponse>(parsedData);
      // print(data);
      Isolate.exit(sendPort, data);
    } catch (e) {
      print(e);
      final data =
          Left<ApiException, NewsListResponse>(ApiException(e.toString()));
      Isolate.exit(sendPort, data);
    }
  }
}
