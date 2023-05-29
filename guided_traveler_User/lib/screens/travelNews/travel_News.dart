import 'package:flutter/material.dart';
import 'package:guided_traveler/components/custom_Text.dart';
import 'package:guided_traveler/utils/app_Colors.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed_plus/webfeed_plus.dart';
import 'package:guided_traveler/utils/util_Functions.dart';

class travelNews extends StatefulWidget {
  const travelNews({super.key});

  @override
  _travelNewsState createState() => _travelNewsState();
}

class _travelNewsState extends State<travelNews> {
  //initializing http package
  var client = http.Client();

  Future myRssFeed() async {
    //Making a http get request from my hashnode blog
    var response = await client
        .get(Uri.parse('https://srilankatravelnews.wordpress.com/feed/'));
    var channel = RssFeed.parse(response.body);
    final item = channel.items;
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomText(
            'Travel News',
            fontSize: 24,
            color: Colors.white,
          ),
          elevation: 10.0,
          leading: IconButton(
              onPressed: () {
                utillFunction.goBack(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: StreamBuilder(
        stream: myRssFeed().asStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: () {
                    _launchURL(snapshot, index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(width: 1),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              color: Colors.black),
                        ]),
                    child: Column(
                      children: [
                        CustomText(
                          snapshot.data[index].title,
                          textAlign: TextAlign.left,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.alarm, size: 15),
                            const SizedBox(width: 10),
                            CustomText(snapshot.data[index].pubDate.toString(),
                                color: const Color.fromARGB(255, 158, 158, 158),
                                fontSize: 12),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(AsyncSnapshot<dynamic> snapshot, int index) async {
    final Uri uri = Uri.parse('${snapshot.data[index].link}');
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }
}
