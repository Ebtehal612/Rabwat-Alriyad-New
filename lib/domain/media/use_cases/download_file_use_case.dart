import 'dart:typed_data';

import '../../../core/result/result.dart';
import '../../../core/use_cases/base_use_case.dart';
import '../repo/media_repository.dart';
import 'download_params.dart';

class DownloadFileUseCase implements BaseUseCase<Uint8List, DownloadParams> {
  final MediaRepository _repository;

  DownloadFileUseCase(this._repository);

  @override
  Future<Result<Uint8List>> call({required DownloadParams params}) {
    return _repository.downloadFile(params: params);
  }
}
