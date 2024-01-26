

import '../constants/constant_path.dart';

class _AssetsImagesGen {
  const _AssetsImagesGen();


  String get myaibot => '$kImagesPath/myaibot.png';
  String get mylessonplan => '$kImagesPath/mylessonplan.png';
  String get myqas => '$kImagesPath/myqas.png';
  String get routine => '$kImagesPath/routine.png';
  String get measure => '$kImagesPath/scale.png';
  String get image_text => '$kImagesPath/image_text.png';

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
  static const images = _AssetsImagesGen();
  static const svgImages = _AssetsSvgImagesGen();


  


}