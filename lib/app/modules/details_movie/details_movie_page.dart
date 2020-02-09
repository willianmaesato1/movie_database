import 'package:flutter/material.dart';
import 'package:movie_database/share/models/movie_model.dart';
import 'package:movie_database/share/utils/consts.dart';
import 'package:movie_database/share/utils/style.dart';
import 'package:movie_database/share/utils/util_data.dart';

class DetailsMoviePage extends StatefulWidget {
  final MovieModel movieModel;

  const DetailsMoviePage({Key key, this.movieModel}) : super(key: key);

  @override
  _DetailsMoviePageState createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          widget.movieModel.posterPath == null &&
                  widget.movieModel.backdropPath == null
              ? Container(
                  height: queryData.size.height * 0.5,
                  width: queryData.size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("assets/images/image_error_404.jpg"))),
                )
              : Container(
                  height: queryData.size.height * 0.5,
                  width: queryData.size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.movieModel.posterPath !=
                                  null
                              ? "$search_image_movies${widget.movieModel.posterPath}"
                              : "$search_image_movies${widget.movieModel.backdropPath}"))),
                ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: SMALL_EDGE_ALL,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                            text: 'Titulo:  ',
                            style: STYLE_TITLE,
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${widget.movieModel.originalTitle}",
                                  style: STYLE_TEXT_MOVIE),
                              widget.movieModel.releaseDate == null
                                  ? TextSpan()
                                  : widget.movieModel.releaseDate.isEmpty
                                      ? TextSpan()
                                      : TextSpan(
                                          text:
                                              " - ${UtilData.showDataClient.format(DateTime.tryParse(widget.movieModel.releaseDate))}",
                                          style: STYLE_TEXT_MOVIE)
                            ]),
                      ),
                      SizedBox(height: 10),
                      widget.movieModel.nameGenres == null
                          ? SizedBox()
                          : widget.movieModel.nameGenres.isEmpty
                              ? SizedBox()
                              : RichText(
                                  text: TextSpan(
                                      text: 'Gêneros:\n',
                                      style: STYLE_TITLE,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                "${widget.movieModel.nameGenres}"
                                                    .replaceAll("]", "")
                                                    .replaceAll("[", ""),
                                            style: STYLE_TEXT_MOVIE)
                                      ]),
                                ),
                      SizedBox(height: 10),
                      widget.movieModel.overview == null
                          ? SizedBox()
                          : widget.movieModel.overview.isEmpty
                              ? SizedBox()
                              : RichText(
                                  text: TextSpan(
                                      text: 'Resumo: \n',
                                      style: STYLE_TITLE,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '${widget.movieModel.overview}',
                                            style: STYLE_TEXT_MOVIE)
                                      ]),
                                ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
