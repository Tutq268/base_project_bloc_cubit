import 'package:data_on/data/api/mapper/base/base_error_response_mapper.dart';
import 'package:data_on/foundation/extension/exceptions/server_error.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class JsonObjectErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? data) {
    return ServerError(
      generalServerStatusCode: data?['error']?['status_code'] as int?,
      generalServerErrorId: data?['error']?['error_code'] as String?,
      generalMessage: data?['error']?['message'] as String?,
    );
  }
}
