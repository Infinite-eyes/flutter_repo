

import 'package:flutter/cupertino.dart';
import 'package:ui_kit/logic/bloc/product_bloc.dart';

class ProductProvider extends InheritedWidget{

  final ProductBloc productBloc;
  final Widget child;

  ProductProvider({this.productBloc,this.child}): super(child: child);

  static ProductProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: ProductProvider);

  @override
  bool updateShouldNotify(ProductProvider oldWidget) => productBloc != oldWidget.productBloc;

}