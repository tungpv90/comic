import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:comic/public.dart';
import 'package:comic/stream/BlocProvider.dart';
import 'package:comic/stream/CounterWidget.dart';
import 'package:comic/stream/CounterStream.dart';
import 'package:comic/stream/IncrementBloc.dart';
import 'package:comic/widget/loading_indicator.dart';

class BlocScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bloc"),
          elevation: 0,
        ),
        body: BlocProvider<IncrementBloc>(
          bloc: IncrementBloc(),
          child: CounterWidget(),
        ));
  }
}
