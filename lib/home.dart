import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_marvel_comics/bloc/charactersbloc.dart';
import 'package:the_marvel_comics/color_schemes.g.dart';
import 'package:the_marvel_comics/widgetlottie.dart';
import 'package:the_marvel_comics/widgetmakegrid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? _debounce;
  CharactersBloc bloc = CharactersBloc();
  TextEditingController nameStartsWith = TextEditingController();
  ValueNotifier<bool> search = ValueNotifier(false);

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  void dispose() {
    bloc.flush();
    _debounce?.cancel();
    super.dispose();
  }

  getdata() async {
    await bloc.fetch(nameStartsWith: nameStartsWith.text);
  }

  @override
  Widget build(BuildContext context) {
    Widget searchWidget() {
      return TextFormField(
        style: TextStyle(color: Colors.white),
        controller: nameStartsWith,
        decoration: InputDecoration(
          label: Text('Search...', style: bodyStyle),
        ),
        onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(const Duration(milliseconds: 1000), () {
            if (value.isNotEmpty) {
              bloc.fetch(nameStartsWith: value);
            }
          });
        },
      );
    }

    return GestureDetector(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primarycolor,
          appBar: AppBar(
              backgroundColor: primarycolor,
              title: ValueListenableBuilder(
                valueListenable: search,
                builder: (BuildContext context, value, Widget? child) {
                  return value
                      ? searchWidget()
                      : Text('Marvel', style: headlineStyle);
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    search.value = !search.value;
                    if (search.value == false) {
                      nameStartsWith.clear();
                      getdata();
                    }
                  },
                  icon: ValueListenableBuilder(
                    valueListenable: search,
                    builder: (BuildContext context, value, Widget? child) {
                      return Icon(
                        value ? Icons.clear : Icons.search,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ]),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text('Marvel Characters', style: titleStyle),
                Expanded(
                  child: StreamBuilder(
                    stream: bloc.streamCharacters,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return makeGrid(snapshot.data);
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(snapshot.error.toString(),
                                style: bodyStyle));
                      } else {
                        return lottieAsset(jsonName: 'batman');
                      }
                    },
                  ),
                ),
                Text('Data provided by Marvel @2023 MARVEL', style: buttonStyle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
