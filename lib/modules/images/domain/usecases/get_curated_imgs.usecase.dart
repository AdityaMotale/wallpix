import 'package:wallpix/core/errors/failures.error.dart';
import 'package:dartz/dartz.dart';
import 'package:wallpix/core/usecases/img_usecase.dart';
import 'package:wallpix/modules/images/domain/domain.images.dart';

class GetCuratedImgs implements ImgUseCase<List<ImgEntity>, CuratedParms> {
  final ImgRepository repository;

  GetCuratedImgs(this.repository);

  @override
  Future<Either<Failure, List<ImgEntity>>> call(CuratedParms params) async {
    return await repository.getCuratedImgs(params.page);
  }
}