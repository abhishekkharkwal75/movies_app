import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/homepageContoller.dart';
import 'package:provider/provider.dart';

class HomePageHelpers extends ChangeNotifier {
  showMovies(
      BuildContext context, final provider, double height, double width) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: height / 1,
          width: double.infinity,
          child: Provider.of<HomePageController>(context, listen: true)
                  .isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.result.length,
                  itemBuilder: (BuildContext context, int index) {
                    return movieBox(
                        context, height, width, provider.result[index], index);
                    // ListTile(
                    //   title: Text(provider.result[index]["director"][0]),
                    // );
                  },
                ),
        ),
      ),
    );
  }

  movieBox(BuildContext context, double height, double width, Map movies,
      int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PhysicalModel(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            elevation: 2,
            child: Container(
              height: height / 3,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: height / 4.6,
                        width: width / 6,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                movies["voting"]++;
                                print(Provider.of<HomePageController>(context,
                                        listen: false)
                                    .result[index]["voting"]);
                                notifyListeners();
                              },
                              child: Icon(
                                Icons.arrow_drop_up,
                                size: 65,
                              ),
                            ),
                            Text(
                              Provider.of<HomePageController>(context,
                                      listen: true)
                                  .result[index]["voting"]
                                  .toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                            InkWell(
                              onTap: () {
                                movies["voting"]--;
                                notifyListeners();
                              },
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 65,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                        child: Container(
                          height: height / 5,
                          width: width / 4.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // color: Colors.blueGrey.shade400,
                              image: DecorationImage(
                                  image: NetworkImage(movies["poster"]),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: height / 4.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            //  color: Colors.blueGrey.shade400,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movies["title"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Genre : ",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: width / 3.4,
                                      child: Text(
                                        movies["genre"],
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            // fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Director : ",
                                      softWrap: true,
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: width / 3.4,
                                      child: Text(
                                        movies["director"][0],
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            // fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Starring : ",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: width / 3.4,
                                      child: Text(
                                        movies["stars"][0],
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            // fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Mins | ${movies["language"]} | 2 Apr ",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${movies["pageViews"]} views | voted by ${movies["totalVoted"]} People",
                                      style: TextStyle(
                                          color: Colors.blue.shade600,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: height / 22,
                      width: width / 1.1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.blue,
                      ),
                      child: Text(
                        "Watch Trailer",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider()
      ],
    );
  }

  showCompanyInfoModelSheet(
    BuildContext context,
    double height,
    double width,
  ) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          height: height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                " Company Info",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                " Company: Geeksynergy Technologies Pvt Ltd \n Address: Sanjayanagar, Bengaluru-56 \n Phone: XXXXXXXXX09 \n Email: XXXXXX@gmail.com",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              )
            ],
          ),
        );
      },
    );
  }
}
