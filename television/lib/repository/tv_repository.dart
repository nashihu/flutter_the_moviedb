import 'package:model/model.dart';
import 'package:network/network.dart';

abstract class TVRepository {
  Future<Either<Failure, List<TV>>> getOnTheAir(int page);
  Future<Either<Failure, List<TV>>> getPopular(int page);
  Future<Either<Failure, TVDetail>> getDetailTV(int id);
}

class TVRepositoryImpl extends TVRepository {
  ApiHelper apiHelper;
  TVRepositoryImpl(this.apiHelper);
  @override
  Future<Either<Failure, List<TV>>> getOnTheAir(int page) {
    return apiHelper.get(
      path: Urls.tvOnAir(page),
      success: (result) {
        return Right(
            (result['results'] as List).map((e) => TV.fromJson(e)).toList());
      },
      failure: (error) => Left(error),
    );
  }

  @override
  Future<Either<Failure, List<TV>>> getPopular(int page) {
    return apiHelper.get(
      path: Urls.tvPopular(page),
      success: (result) {
        return Right(
            (result['results'] as List).map((e) => TV.fromJson(e)).toList());
      },
      failure: (error) => Left(error),
    );
  }

  @override
  Future<Either<Failure, TVDetail>> getDetailTV(int id) {
    return apiHelper.get(
      path: Urls.tvDetail(id),
      success: (result) {
        return Right((TVDetail.fromJson(result)));
      },
      failure: (error) => Left(error),
    );
  }
}
