import 'package:dio/dio.dart';

class UploadParams {
  final String path;
  final void Function(int, int)? onProgress;
  final CancelToken? cancelToken;

  UploadParams({
    required this.path,
    this.onProgress,
    this.cancelToken,
  });
}
