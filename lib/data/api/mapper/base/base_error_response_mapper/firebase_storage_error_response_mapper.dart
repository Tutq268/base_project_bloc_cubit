import 'package:data_on/data/api/mapper/base/base_error_response_mapper.dart';
import 'package:data_on/foundation/extension/exceptions/server_error.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FirebaseStorageErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? json) {
    return ServerError(
      generalServerStatusCode: json?['error']['code'] as int?,
      generalMessage: json?['error']['message'] as String?,
    );
  }
}
