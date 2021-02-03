import 'package:flutter/material.dart';
import '../../util/abstracts/disposable.dart';

class Provider<T> extends InheritedWidget {
  final T bloc;

  const Provider({Key key, @required this.bloc, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static T of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<T>>()?.bloc;
  }
}

class BlocProvider<T extends Disposable> extends StatefulWidget {
  final T bloc;
  final Widget Function(BuildContext context, T bloc) builder;

  const BlocProvider({Key key, @required this.bloc, @required this.builder})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T extends Disposable> extends State<BlocProvider<T>> {
  T bloc;

  @override
  void initState() {
    bloc = widget.bloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(bloc: bloc, child: widget.builder(context, bloc));
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
