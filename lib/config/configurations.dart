import 'package:flutter/cupertino.dart';
import 'package:fun_box/config/default_config.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/model/config_record.dart';
import 'package:domain/usecase/get_config_use_case.dart';

class Configurations {
  static String _configStatus = AppConstants.localConfig;
  static String _imageUrl = DefaultConfig.secureImageUrl;
  static String _imageSize = DefaultConfig.imageSize;

  final GetConfigUseCase _useCase = GetIt.instance.get<GetConfigUseCase>();

  Future<void> getConfig() async {
    try {
      var response = await _useCase.getConfig();
      var config = ConfigRecord.fromJson(response);
      var imageLength = 0;
      _configStatus = AppConstants.remoteConfig;
      _imageUrl = config.images?.secureBaseUrl ?? DefaultConfig.secureImageUrl;
      if (config.images?.logoSizes != null) {
        imageLength = config.images?.logoSizes!.length ?? 0;
        if (imageLength > 0) {
          _imageSize = config.images?.logoSizes![imageLength - 2] ??
              DefaultConfig.imageSize;
        }
      }
    } catch (exception) {
      debugPrint('Error ${exception.toString()}');
    }
  }

  static String get configStatus => _configStatus;

  static String get imageUrl => _imageUrl;

  static String get imageSize => _imageSize;

}
