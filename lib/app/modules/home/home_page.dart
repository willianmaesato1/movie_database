import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_database/app/modules/home/home_controller.dart';
import 'package:movie_database/app/modules/home/home_module.dart';
import 'package:movie_database/share/utils/consts.dart';
import 'package:movie_database/share/utils/style.dart';
import 'package:movie_database/share/utils/util_data.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Filmes"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _tSearch = TextEditingController();
  HomeController homeController;

  @override
  void initState() {
    homeController = HomeModule.to.get<HomeController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputFieldSearchMovies = Container(
      padding: MEDIUM_EDGE_ALL,
      child: TextField(
        controller: _tSearch,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onChanged: (value) => homeController.searchMovies(_tSearch.text),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintText: "Nome do filme",
          helperStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.blue[800],
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 0.2,
            color: Colors.blue[800],
          ),
        ),
      ),
    );
    final divider = Divider(height: 2, color: Colors.grey.shade500);
    final listMoviesSearch = Observer(builder: (_) {
      if (homeController.movies == null) {
        return Flexible(
            child: Center(
                child: Text("Pesquisa um nome de filme para continuar")));
      }
      if (homeController.movies.error != null) {
        return Flexible(
            child: Center(child: Text("${homeController.movies.error}")));
      }

      if (homeController.movies.value == null) {
        return Flexible(child: Center(child: CircularProgressIndicator()));
      }

      if (homeController.movies.value.isEmpty) {
        return Flexible(
            child: Center(
                child: Text("Pesquisa um nome de filme para continuar")));
      }

      return Flexible(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: homeController.movies.value.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/Details_movie',
                    arguments: homeController.movies.value[index]),
                child: Card(
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Observer(builder: (_) {
                          if (homeController.movies.value[index].posterPath ==
                                  null &&
                              homeController
                                      .movies.value[index].backdropPath ==
                                  null) {
                            return Container(
                              height: 180,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/image_error_404.jpg"))),
                            );
                          }
                          return Container(
                            height: 180,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(homeController.movies
                                                .value[index].posterPath !=
                                            null
                                        ? "$search_image_movies${homeController.movies.value[index].posterPath}"
                                        : "$search_image_movies${homeController.movies.value[index].backdropPath}"))),
                          );
                        }),
                        SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  "Titulo: ${homeController.movies.value[index].originalTitle}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Observer(builder: (_) {
                                if (homeController
                                    .movies.value[index].nameGenres.isEmpty) {
                                  return SizedBox();
                                }
                                return Text(
                                    "${homeController.movies.value[index].nameGenres}"
                                        .replaceAll("[", "")
                                        .replaceAll("]", ""),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(fontSize: 16));
                              }),
                              SizedBox(height: 10),
                              Observer(builder: (_) {
                                if (homeController
                                        .movies.value[index].releaseDate ==
                                    null) {
                                  return SizedBox();
                                }
                                if (homeController.movies.value[index]
                                    .releaseDate.isEmpty) {
                                  return SizedBox();
                                }
                                return Text(
                                    "Data de lançamento: ${UtilData.showDataClient.format(DateTime.tryParse(homeController.movies.value[index].releaseDate))}",
                                    style: TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2);
                              }),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            }),
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            inputFieldSearchMovies,
            divider,
            listMoviesSearch,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
