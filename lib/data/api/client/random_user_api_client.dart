import 'package:data_on/data/api/client/base/dio_builder.dart';
import 'package:data_on/data/api/client/base/rest_api_client.dart';
import 'package:data_on/data/constant/server/url_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RandomUserApiClient extends RestApiClient {
  RandomUserApiClient()
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: UrlConstants.randomUserBaseUrl),
          ),
        );
}
