import 'package:data_on/data/api/mapper/base/base_error_response_mapper.dart';
import 'package:data_on/foundation/extension/exceptions/server_error.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LineErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? json) {
    return ServerError(generalMessage: json?['error_description'] as String?);
  }
}
