import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_todo/scoped_models/app_model.dart';
import 'package:flutter_todo/widgets/ui_elements/loading_modal.dart';
import 'package:flutter_todo/pages/register/register_page.dart' as FormData;
import 'package:flutter_todo/widgets/helpers/confirm_dialog.dart';
import 'package:charts_flutter/flutter.dart'as charts;


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
  Widget _buildUser() {
    return UserAccountsDrawerHeader(
      accountName: new Text("Andrew Hamlett "),
      accountEmail: new Text("Ham80234@gmail.com"),
      currentAccountPicture: CircleAvatar(

        backgroundImage: NetworkImage('https://scontent-msp1-1.xx.fbcdn.net/v/t1.0-9/27540478_1997816626898586_1480459046183815724_n.jpg?_nc_cat=107&_nc_ht=scontent-msp1-1.xx&oh=6a9de26b68fadd05c329faba70a1dbda&oe=5D703F5F'),
      ),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage('https://d2r55xnwy6nx47.cloudfront.net/uploads/2018/11/UniversalCoverings_2880x1220.gif')
        )
      ));

  }
  Widget _buildguage() {

    return new Center(
  child: Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          
          title: Text('Goal Progress'),
          subtitle: Text('Click each Chunk to see the goal'),
        ),
        Container(
        child: GaugeChart.withSampleData(),
        width: 150.0,
        height: 250.0,
        ),
       
          
       
      ],
    ),
  ),
    );
    


      


  }
  Widget _buildBasicInfo() {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: < Widget > [
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Stats: '),
              subtitle: Text('Weight: 200 lbs, Height: 5\' 10'),
            ),

          ],
        ),
      ),
    );
  }
  Widget _buildChart() {
    return new Card(
      child: Container(
        child: PieOutsideLabelChart.withSampleData(),
        width: 150.0,
        height: 250.0,
      )
    );
  }
  Widget _buildPageContent(AppModel model) {
    return Scaffold(
      appBar: _buildAppBar(context, model),
      body: ListView(
        children: < Widget > [
          _buildUser(),
          _buildguage(),
          _buildBasicInfo(),
          _buildChart()

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
class GaugeChart extends StatelessWidget {
  final List < charts.Series > seriesList;
  final bool animate;
  final double pi = 3.1415;
  GaugeChart(this.seriesList, {
    this.animate
  });

  /// Creates a [PieChart] with sample data and no transition.
  factory GaugeChart.withSampleData() {
    return new GaugeChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
      animate: animate,
      // Configure the width of the pie slices to 30px. The remaining space in
      // the chart will be left as a hole in the center. Adjust the start
      // angle and the arc length of the pie so it resembles a gauge.
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 30, startAngle: 4 / 5 * pi, arcLength: 7 / 5 * pi));
  }

  /// Create one series with sample hard coded data.
  static List < charts.Series < GaugeSegment, String >> _createSampleData() {
    final data = [
      new GaugeSegment('Low', 75),
      new GaugeSegment('Acceptable', 100),
      new GaugeSegment('High', 50),
      new GaugeSegment('Highly Unusual', 5),
    ];

    return [
      new charts.Series < GaugeSegment, String > (
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: data,
      )
    ];
  }
}

/// Sample data type.
class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}


class PieOutsideLabelChart extends StatelessWidget {
  final List < charts.Series > seriesList;
  final bool animate;

  PieOutsideLabelChart(this.seriesList, {
    this.animate
  });

  /// Creates a [PieChart] with sample data and no transition.
  factory PieOutsideLabelChart.withSampleData() {
    return new PieOutsideLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
      animate: animate,
      // Add an [ArcLabelDecorator] configured to render labels outside of the
      // arc with a leader line.
      //
      // Text style for inside / outside can be controlled independently by
      // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
      //
      // Example configuring different styles for inside/outside:
      //       new charts.ArcLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
        new charts.ArcLabelDecorator(
          labelPosition: charts.ArcLabelPosition.outside)
      ]));
  }

  /// Create one series with sample hard coded data.
  static List < charts.Series < LinearSales, int >> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series < LinearSales, int > (
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}