import 'package:data_on/data/api/mapper/base/base_success_response_mapper.dart';
import 'package:data_on/data/api/model/base/records_response.dart';
import 'package:data_on/data/model/typedef.dart';

class RecordsJsonArrayResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, RecordsListResponse<T>> {
  @override
  // ignore: avoid-dynamic
  RecordsListResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? RecordsListResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}
