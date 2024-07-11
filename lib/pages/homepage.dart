import 'package:experimental_app/widgets/transations_page.dart';
import 'package:experimental_app/widgets/homepage_appbar.dart';
import 'package:experimental_app/widgets/homepage_body.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
    Widget currentWindowWidget = const CategoriesWidget();
    var btnStyleActive = ElevatedButton.styleFrom(
      elevation: 4,
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      shadowColor: const Color.fromARGB(255, 231, 231, 231),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      )
    ); 

    var btnStyleInactive = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      )
    );

    late ButtonStyle categoriesBtnStyle;
    late ButtonStyle recentTransactionBtnStyle;

    @override
    void initState() {
      super.initState();
      categoriesBtnStyle = btnStyleActive;
      recentTransactionBtnStyle = btnStyleInactive;
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 10,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(17),
            bottomRight: Radius.circular(17)
          )
        ),
        title: const Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: HomePageAppBar(),
        ),
      ),
      body: Column(
        children: <Widget> [
          const HomePageBodyTop(),
          HomePageBodyMid(
            categoriesBtnStyle: categoriesBtnStyle, 
            recentTransactionBtnStyle: recentTransactionBtnStyle, 
            categoriesBtnAction: () {
              setState(() {
                currentWindowWidget = const CategoriesWidget();
                categoriesBtnStyle = btnStyleActive;
                recentTransactionBtnStyle = btnStyleInactive;
              });
            }, 
            recentTransactionBtnAction: () {
              setState(() {
                currentWindowWidget = const TransationsPage();
                categoriesBtnStyle = btnStyleInactive;
                recentTransactionBtnStyle = btnStyleActive;
              });
            }
          ),
          Expanded(child: currentWindowWidget)
        ],
      ),
    );
  }
}