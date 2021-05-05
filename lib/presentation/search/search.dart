import 'package:domain/model/movies_shows_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_box/bloc/search/movies_shows_search_bloc.dart';
import 'package:fun_box/bloc/search/movies_shows_search_event.dart';
import 'package:fun_box/bloc/search/movies_shows_search_state.dart';
import 'package:fun_box/presentation/common/common_error_ui.dart';
import 'package:fun_box/presentation/common/common_widgets.dart';
import 'package:fun_box/presentation/details/movie_show_details.dart';
import 'package:fun_box/utils/app_constants.dart';
import 'package:get_it/get_it.dart';

import '../ui_constants.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final MoviesShowsSearchBloc _moviesShowsSearchBloc =
      GetIt.instance.get<MoviesShowsSearchBloc>();
  var _searchController = TextEditingController();
  List<Results> _moviesShowsSuggestion = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchListener);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider(create: (BuildContext context) => _moviesShowsSearchBloc);
    return BlocBuilder(
        bloc: _moviesShowsSearchBloc,
        builder: (context, state) {
          if (state is InitialMoviesShowsSearchState) {
            return _initState();
          } else if (state is ProgressMoviesShowsSearchState) {
            return _progressState();
          } else if (state is SuccessSuggestionsMoviesShowsState) {
            _moviesShowsSuggestion.clear();
            for (int i = 0; i < state.record.results!.length; i++) {
              if (state.record.results![i].mediaType != AppConstants.person) {
                _moviesShowsSuggestion.add(state.record.results![i]);
              }
            }
            return _suggestionState(_moviesShowsSuggestion);
          } else if (state is ErrorMoviesShowsSearchState) {
            return _errorState();
          } else {
            return _initState();
          }
        });
  }

  Widget _initState() {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: Row(
                children: [_backButton(), _searchView(), _clearSearchButton()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _progressState() {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: Row(
                children: [_backButton(), _searchView(), _clearSearchButton()],
              ),
            ),
            CommonProgressBar()
          ],
        ),
      ),
    );
  }

  Widget _suggestionState(List<Results> suggestions) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: Row(
                children: [_backButton(), _searchView(), _clearSearchButton()],
              ),
            ),
            _showSuggestions(context, suggestions)
          ],
        ),
      ),
    );
  }

  Widget _errorState() {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: Row(
                children: [_backButton(), _searchView(), _clearSearchButton()],
              ),
            ),
            ErrorUI()
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return GestureDetector(
      onTap: () => _navigateToPreviousScreen(context),
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_back_rounded,
            size: 30.0,
          ),
        ),
      ),
    );
  }

  Widget _clearSearchButton() {
    return GestureDetector(
      onTap: () => _clearSearch(),
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, right: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.clear_rounded,
            size: 30.0,
          ),
        ),
      ),
    );
  }

  Widget _searchView() {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: TextField(
              controller: _searchController,
              style: TextStyle(
                  fontFamily: UIConstants.fontFamilyMetropolis,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 18.0),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: UIConstants.searchHint))),
    );
  }

  Widget _showSuggestions(BuildContext context, List<Results> suggestionList) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 100;
    if (suggestionList.isEmpty) {
      return Container();
    } else {
      return Container(
        width: width,
        height: height,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: suggestionList.length,
            itemBuilder: (context, index) {
              return _suggestionCell(context, suggestionList[index]);
            }),
      );
    }
  }

  Widget _showSearchResult(BuildContext context, List<Results> searchResults) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 100;
    if (searchResults.isEmpty) {
      return Container();
    } else {
      return Container(
        width: width,
        height: height,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResults[index].name ?? searchResults[index].title ?? ''),
              );
            }),
      );
    }
  }

  Widget _suggestionCell(BuildContext context, Results results) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context, results),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 16.0, bottom: 16.0),
          child: Text(
            results.name ?? results.title ?? '',
            style: TextStyle(
                fontFamily: UIConstants.fontFamilyMetropolis,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 16.0),
          ),
        ),
      ),
    );
  }

  void _searchListener() {
    if (_searchController.text.length >= 3) {
      _moviesShowsSearchBloc.add(
          MoviesShowsSearchEvent(event: AppConstants.progress, searchTerm: ''));
      _moviesShowsSearchBloc.add(MoviesShowsSearchEvent(
          event: AppConstants.suggestions, searchTerm: _searchController.text));
    }
  }

  void _clearSearch() {
    _searchController.text = '';
  }

  void _navigateToDetails(BuildContext context, Results results) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MovieShowDetails(
        type: results.mediaType!,
        id: results.id!.toDouble(),
      );
    }));
  }

  void _navigateToPreviousScreen(BuildContext context) {
    Navigator.pop(context);
  }
}
