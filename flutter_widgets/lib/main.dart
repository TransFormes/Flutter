import 'package:flutter/material.dart';
import './complex_tabbarview_widget.dart';
import './index.dart';
import './tabber_widget.dart';
import './text_field_form_widget.dart';
import './appBar_widget.dart';
import './baseLine_widget.dart';
import './button_wdiget.dart';
import './constrainedBox_widget.dart';
import './container_widget.dart';
import './customScrollView_widget.dart';
import './fittedBxo_widget.dart';
import './fractionallySizedBox_widget.dart';
import './gridView_widget.dart';
import './listView_widget.dart';
import './myInherited_widget.dart';
import './stack_widget.dart';
import './text_inage_icon_widget.dart';
import './textFieldKeyBoardFix_wdiget.dart';
import './flex_widget.dart';
import './row_column_widget.dart';
import './wrap_widget.dart';
import './alerDialog_widget.dart';
import './buttomSheet_widget.dart';
import './context_test_widget.dart';
import './customAppBar_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter 组件",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      routes: {
        '/ComplexTabBarView': (context) => ComplexTabBarViewWidget(),
        '/TabBar': (context) => TabBarWidget(),
        '/TextField': (context) => TextFieldWidget(),
        '/AppBar': (context) => AppBarWidget(),
        '/Baseline': (context) => BaselineWidget(),
        '/Button': (context) => ButtonWidget(),
        '/ConstrainedBox': (context) => ConstrainedBoxWidget(),
        '/Container': (context) => ContainerWidget(),
        '/CustomScrollView': (context) => CustomScrollViewWidget(),
        '/FittedBox': (context) => FittedBoxWidget(),
        '/FractionallySizedBox': (context) => FractionallySizedBoxWidget(),
        '/GridView': (context) => GridViewWidget(),
        '/ListView': (context) => ListViewWidget(),
        '/InheritedWidget': (context) => MyTree(),
        '/Stack': (context) => StackWidget(),
        '/TextImageIcon': (context) => TextImageIconWidget(),
        '/TextFieldKeyboardFix': (context) => TextFieldKeyBoardFix(),
        '/Flex': (context) => FlexWidget(),
        '/Row Column': (context) => RowColumnWidget(),
        '/Wrap': (context) => WrapWidget(),
        '/AlertDialogWidget': (context) => AlertDialogWidget(),
        '/BottomSheetWidget': (context) => BottomSheetWidget(),
        '/Context': (context) => ContextTest(),
        // 页面会报错 
        //'/CustomAppBar': (context) => CustomAppBarWidget(),
      },
      home: IndexPage(title: "flutter 组件详解"),
    );
  }
}