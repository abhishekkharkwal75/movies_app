import 'package:flutter/material.dart';
import 'package:movie_app/controller/homepageContoller.dart';
import 'package:movie_app/view/AutenticationPage/login.page.dart';
import 'package:movie_app/view/HomePage/homepage.helpers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then(
        (value) => Provider.of<HomePageController>(context, listen: false).getMovies(context));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageController>(context, listen: false);
    final homePageProvider = Provider.of<HomePageHelpers>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF5F9FF),
          title: Text(
            "Movies",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1,
          leading: InkWell(
            onTap: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                homePageProvider.showCompanyInfoModelSheet(context, height, width);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xffF5F9FF),
        body: homePageProvider.showMovies(context, provider, height, width));
  }
}
