import 'package:fun_box/config/default_config.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/model/config_record.dart';
import 'package:domain/usecase/get_config_use_case.dart';

class Configurations {

  static String _imageUrl = DefaultConfig.secureImageUrl;
  static String _imageSize = DefaultConfig.imageSize;

  final GetConfigUseCase _useCase = GetIt.instance.get<GetConfigUseCase>();

  Future<void> getConfig() async {
    var response = await _useCase.getConfig();
    var config = ConfigRecord.fromJson(response);
    var length = 0;
    _imageUrl = config.images?.secureBaseUrl ?? DefaultConfig.secureImageUrl;
    if (config.images?.logoSizes != null) {
      length = config.images?.logoSizes!.length ?? 0;
      if (length > 0) {
        _imageSize =
            config.images?.logoSizes![length - 2] ?? DefaultConfig.imageSize;
      }
    }
  }

  static String get imageUrl => _imageUrl;

  static String get imageSize => _imageSize;
}
