import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:rabwat_alriyad_new/domain/media/repo/media_repository.dart';
import 'package:rabwat_alriyad_new/domain/media/entities/uploaded_file.dart';
import 'package:rabwat_alriyad_new/domain/media/use_cases/download_params.dart';
import 'package:rabwat_alriyad_new/domain/media/use_cases/upload_params.dart';

import '../../../core/network/failure/failure.dart';
import '../../../core/result/result.dart';
import '../data_source/media_remote_data_source.dart';

class MediaRepositoryImpl implements MediaRepository {
  final MediaRemoteDataSource _remoteDataSource;
  const MediaRepositoryImpl(
      {required MediaRemoteDataSource mediaRemoteDataSource})
      : _remoteDataSource = mediaRemoteDataSource;

  @override
  Future<Result<UploadedFile>> uploadFile(
      {required UploadParams params}) async {
    try {
      final result = await _remoteDataSource.uploadFile(params: params);
      return Right(result.toEntity());
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Result<Uint8List>> downloadFile(
      {required DownloadParams params}) async {
    try {
      final result = await _remoteDataSource.downloadFile(params: params);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
