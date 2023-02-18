import 'package:flutter/material.dart';
import 'package:the_marvel_comics/color_schemes.g.dart';
import 'package:the_marvel_comics/model/charactermodel.dart';
import 'package:the_marvel_comics/widgetcachedimage.dart';

class CharactersDetail extends StatefulWidget {
  final CharactersModel character;
  const CharactersDetail(this.character, {super.key});

  @override
  State<CharactersDetail> createState() => _CharactersDetailState();
}

class _CharactersDetailState extends State<CharactersDetail> {
  CharactersModel data = CharactersModel();

  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    data = widget.character;
  }

  @override
  Widget build(BuildContext context) {
    Widget makeSubData(dynamic data) {
      return Expanded(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(data[index].name),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Resource URI:',
                            style: subHeadlineStyle,
                          ),
                          Text(data[index].resourceURI),
                        ],
                      ),
                      actions: [
                        FilledButton.tonal(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              minLeadingWidth: 10,
              dense: true,
              leading: Text(
                '${index + 1}',
                style: bodyStyle,
              ),
              title: Text(
                data[index].name!,
                style: bodyStyle,
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 16,
              ),
            );
          },
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primarycolor,
          centerTitle: true,
          title: Text(
            data.name!,
            style: headlineStyle,
          ),
        ),
        backgroundColor: primarycolor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        cachednetwork(
                          data.thumbnail!,
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(width: 16),
                        Flexible(
                          child: Text(
                            data.description!,
                            style: subHeadlineStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Comics',
                  style: headlineStyle,
                ),
                makeSubData(data.comics!.items),
                Text('Series', style: headlineStyle),
                makeSubData(data.series!.items),
                Text(
                  'Stories',
                  style: headlineStyle,
                ),
                makeSubData(data.stories!.items),
              ],
            )),
      ),
    );
  }
}
