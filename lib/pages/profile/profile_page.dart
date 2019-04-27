import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_todo/scoped_models/app_model.dart';
import 'package:flutter_todo/widgets/ui_elements/loading_modal.dart';
import 'package:flutter_todo/widgets/helpers/confirm_dialog.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class ProfilePage extends StatefulWidget {
  final AppModel model;

  ProfilePage(this.model);



  @override
  State < StatefulWidget > createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State < ProfilePage > {
  Widget _buildAppBar(BuildContext context, AppModel model) {
    return AppBar(
      title: Text('Profile'),
      backgroundColor: Colors.blue,
      actions: < Widget > [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () async {
            bool confirm = await ConfirmDialog.show(context);

            if (confirm) {
              Navigator.pop(context);

              model.logout();
            }
          },
        ),
      ],
    );
  }
  Widget _buildPageContent(AppModel model) {
    return Scaffold(
      appBar: _buildAppBar(context, model),
      body: ListView(
        children: < Widget > [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://i.kinja-img.com/gawker-media/image/upload/s--Tg_qqR3r--/c_scale,f_auto,fl_progressive,q_80,w_800/dnmtn4ksijwyep0xmljk.jpg'),
            ),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage('https://t3.ftcdn.net/jpg/01/78/34/70/500_F_178347098_eyLewi5tGf2OheQfrLzku0fc2vT0rzsL.jpgr')
              )
            )),
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: < Widget > [
                  const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('John Smith'),
                      subtitle: Text('JohnSmith@gmail.com'),
                    ),
                    ButtonTheme.bar( // make buttons use the appropriate styles for cards
                      child: ButtonBar(
                        children: < Widget > [
                          new Text("Weight: 168 lbs"),
                          new Text("Height: 5' 10")
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          new Card(
          child: Container(
       child:  DonutAutoLabelChart.withSampleData(),
       width: 150.0,
       height: 250.0,
            )
          )
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant < AppModel > (
      builder: (BuildContext context, Widget child, AppModel model) {
        return _buildPageContent(model);
      },
    );
  }
}


/// Bar chart example


class DonutAutoLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutAutoLabelChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutAutoLabelChart.withSampleData() {
    return new DonutAutoLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        //
        // [ArcLabelDecorator] will automatically position the label inside the
        // arc if the label will fit. If the label will not fit, it will draw
        // outside of the arc with a leader line. Labels can always display
        // inside or outside using [LabelPosition].
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //       new charts.ArcLabelDecorator(
        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 60,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.goal,
        measureFn: (LinearSales sales, _) => sales.progress,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.goal}: ${row.progress}',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int goal;
  final int progress;

  LinearSales(this.goal, this.progress);
}