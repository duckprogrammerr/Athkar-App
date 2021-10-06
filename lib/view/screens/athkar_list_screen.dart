import 'package:athkarapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:athkarapp/viewmodel/athkar_list_viewmodel.dart';
import 'package:flutter/widgets.dart';

class AthkarList extends StatefulWidget {
  final String category;
  AthkarList({required this.category});
  _AthkarListState createState() => _AthkarListState();
}

class _AthkarListState extends State<AthkarList> {
  AthkarListViewModel athkarListViewModel = AthkarListViewModel();
  int counter = 0;
  int pageChanged = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  initState() {
    super.initState();
    athkarListViewModel.getAthkarsByCategory(widget.category);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: PageView(
                onPageChanged: (i) => setState(() {
                      pageChanged = i;
                      counter = 0;
                    }),
                controller: pageController,
                children: athkarListViewModel.athkarList.map(
                  (e) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 20),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: Text(
                              e.zekr,
                              textDirection: TextDirection.rtl,
                              style: AppStyle.TitleTextStyle,
                            ),
                          ),
                          // description and reference of zekr
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text("${e.des} \n\n ${e.reference}",
                                style: AppStyle.SubTitleTextStyle,
                                textDirection: TextDirection.rtl),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                child: Text(
                                  "$counter / ${e.count}",
                                  style: AppStyle.TitleTextStyle,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppStyle.kPrimaryColor),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(width: 1, color: Colors.grey),
                                  ),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(30),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    CircleBorder(),
                                  ),
                                ),
                                onPressed: () {
                                  if (pageChanged !=
                                      athkarListViewModel.athkarList.length) {
                                    setState(() => counter++);
                                    if (counter == int.parse(e.count)) {
                                      changePage();
                                    }
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ).toList()),
          ),
        ),
      ),
    );
  }

  void changePage() {
    pageController.animateToPage(
      ++pageChanged,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }
}
