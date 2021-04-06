// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/usecase/details/movie_details_use_case.dart' as _i4;
import 'package:domain/usecase/details/show_details_use_case.dart' as _i5;
import 'package:domain/usecase/trending/trending_movies_use_case.dart' as _i7;
import 'package:domain/usecase/trending/trending_people_use_case.dart' as _i9;
import 'package:domain/usecase/trending/trending_shows_use_case.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/all/trending_bloc.dart' as _i6;
import '../bloc/details/movie_show_details_bloc.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.MovieShowDetailsBloc>(() => _i3.MovieShowDetailsBloc(
      get<_i4.MovieDetailsUseCase>(), get<_i5.ShowDetailsUseCase>()));
  gh.factory<_i6.TrendingBloc>(() => _i6.TrendingBloc(
      get<_i7.TrendingMoviesUseCase>(),
      get<_i8.TrendingShowsUseCase>(),
      get<_i9.TrendingPeopleUseCase>()));
  return get;
}
