class Images {
  int id;

  List<ImageDetails> backdrops;
  List<ImageDetails> logos;
  List<ImageDetails> posters;

  Images({
    required this.id,
    required this.backdrops,
    required this.logos,
    required this.posters,
  });
}

class ImageDetails {
  double aspectRatio;
  int height;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  ImageDetails({
    required this.aspectRatio,
    required this.height,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });
}
