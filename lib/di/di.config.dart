// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/usecase/cast/movie_cast_use_case.dart' as _i4;
import 'package:domain/usecase/cast/show_cast_use_case.dart' as _i5;
import 'package:domain/usecase/details/movie_details_use_case.dart' as _i7;
import 'package:domain/usecase/details/show_details_use_case.dart' as _i8;
import 'package:domain/usecase/person/person_credits_use_case.dart' as _i14;
import 'package:domain/usecase/person/person_info_use_case.dart' as _i13;
import 'package:domain/usecase/trending/trending_movies_use_case.dart' as _i16;
import 'package:domain/usecase/trending/trending_people_use_case.dart' as _i18;
import 'package:domain/usecase/trending/trending_shows_use_case.dart' as _i17;
import 'package:domain/usecase/video/movie_trailer_use_case.dart' as _i10;
import 'package:domain/usecase/video/show_trailer_use_case.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/all/trending_bloc.dart' as _i15;
import '../bloc/cast/movie_show_cast_bloc.dart' as _i3;
import '../bloc/details/movie_show_details_bloc.dart' as _i6;
import '../bloc/person/person_details_bloc.dart' as _i12;
import '../bloc/video/movie_show_trailer_bloc.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.MovieShowCastBloc>(() => _i3.MovieShowCastBloc(
      get<_i4.MovieCastUseCase>(), get<_i5.ShowCastUseCase>()));
  gh.factory<_i6.MovieShowDetailsBloc>(() => _i6.MovieShowDetailsBloc(
      get<_i7.MovieDetailsUseCase>(), get<_i8.ShowDetailsUseCase>()));
  gh.factory<_i9.MovieShowTrailerBloc>(() => _i9.MovieShowTrailerBloc(
      get<_i10.MovieTrailerUseCase>(), get<_i11.ShowTrailerUseCase>()));
  gh.factory<_i12.PersonDetailsBloc>(() => _i12.PersonDetailsBloc(
      get<_i13.PersonInfoUseCase>(), get<_i14.PersonCreditsUseCase>()));
  gh.factory<_i15.TrendingBloc>(() => _i15.TrendingBloc(
      get<_i16.TrendingMoviesUseCase>(),
      get<_i17.TrendingShowsUseCase>(),
      get<_i18.TrendingPeopleUseCase>()));
  return get;
}
