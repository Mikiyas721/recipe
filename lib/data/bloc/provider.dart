import 'package:flutter/material.dart';
import '../../util/abstracts/disposable.dart';

class Provider<T extends Bloc> extends InheritedWidget {
  final T bloc;

  const Provider({Key key, @required this.bloc, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static T of<T extends Bloc>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<T>>()?.bloc;
  }
}

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final T bloc;
  final void Function(T) onInit;
  final void Function(T) onDispose;
  final Widget Function(BuildContext context, T bloc) builder;

  const BlocProvider(
      {Key key,
      @required this.bloc,
      @required this.builder,
      this.onInit,
      this.onDispose})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T extends Bloc> extends State<BlocProvider<T>> {
  T bloc;

  @override
  void initState() {
    bloc = widget.bloc;
    widget.onInit?.call(bloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      bloc: bloc,
      child: Builder(builder: (BuildContext context){
        return widget.builder(context, bloc);
      }),
    );
  }

  @override
  void dispose() {
    //bloc.dispose();
    widget.onDispose?.call(bloc);
    super.dispose();
  }
}
