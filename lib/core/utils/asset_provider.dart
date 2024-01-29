

import '../constants/constant_path.dart';

class _AssetsImageGen {
  const _AssetsImageGen();


  String get Logo => '$kImagesPath/TrashsetLogo.png';

}

class _AssetsSvgImagesGen {
  const _AssetsSvgImagesGen();

  String get search => '$kSvgImagesPath/search.svg';
  String get bars => '$kSvgImagesPath/bars.svg';
  String get qa => '$kSvgImagesPath/qa.svg';
  String get back => '$kSvgImagesPath/back.svg';

  
}

class Assets {
  Assets._();
  static const images = _AssetsImageGen();
  static const svgImages = _AssetsSvgImagesGen();


  


}