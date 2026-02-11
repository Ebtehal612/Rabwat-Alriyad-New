import 'dart:typed_data';
import '../entities/uploaded_file.dart';
import '../../../core/result/result.dart';
import '../use_cases/upload_params.dart';
import '../use_cases/download_params.dart';
abstract class MediaRepository {
  Future<Result<UploadedFile>> uploadFile({required UploadParams params});
  Future<Result<Uint8List>> downloadFile({required DownloadParams params});
}
