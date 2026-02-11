class DownloadParams {
  final String url;
  final String fileName;
  final bool isClosable;
  final void Function(int, int)? onProgress;

  DownloadParams({
    required this.url,
    required this.fileName,
    this.isClosable = true,
    this.onProgress,
  });
}
