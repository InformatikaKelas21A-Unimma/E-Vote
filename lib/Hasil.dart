import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class hasil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<YourDataClass> dataList = [
      YourDataClass(label: 'PARTAI PDI', value: 40),
      YourDataClass(label: 'PARTAI Demokrat', value: 20),
      YourDataClass(label: 'PARTAI Gerindra', value: 60),
      YourDataClass(label: 'PARTAI PKB', value: 10),
      // Tambahkan data lain jika diperlukan
    ];

    int totalDukungan =
        dataList.map((data) => data.value).reduce((a, b) => a + b);

    List<charts.Series<YourDataClass, String>> seriesList = [
      charts.Series<YourDataClass, String>(
        id: 'Sample',
        domainFn: (YourDataClass data, _) => data.label,
        measureFn: (YourDataClass data, _) => data.value,
        data: dataList,
        labelAccessorFn: (YourDataClass data, _) =>
            '${data.label}: ${data.value}',
      ),
    ];

    List<charts.Series<YourDataClass, String>> ageSeriesList = [
      charts.Series<YourDataClass, String>(
        id: 'Age',
        domainFn: (YourDataClass data, _) => data.label,
        measureFn: (YourDataClass data, _) => data.value,
        data: [
          YourDataClass(label: '18-30 tahun', value: 30),
          YourDataClass(label: '31-50 tahun', value: 50),
          YourDataClass(label: '51 tahun ke atas', value: 20),
        ],
        labelAccessorFn: (YourDataClass data, _) =>
            '${data.label}: ${data.value}%',
      ),
    ];

    List<charts.Series<YourDataClass, String>> regionSeriesList = [
      charts.Series<YourDataClass, String>(
        id: 'Region',
        domainFn: (YourDataClass data, _) => data.label,
        measureFn: (YourDataClass data, _) => data.value,
        data: [
          YourDataClass(label: 'Region 1', value: 30),
          YourDataClass(label: 'Region 2', value: 20),
          YourDataClass(label: 'Region 3', value: 40),
          YourDataClass(label: 'Region 4', value: 10),
        ],
        labelAccessorFn: (YourDataClass data, _) =>
            '${data.label}: ${data.value}%',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
        backgroundColor: Color(0xFF2C3E50),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Total Dukungan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Jumlah Pendukung: $totalDukungan',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  child: charts.BarChart(
                    seriesList,
                    animate: true,
                    barRendererDecorator: charts.BarLabelDecorator<String>(),
                    domainAxis: charts.OrdinalAxisSpec(
                      renderSpec: charts.SmallTickRendererSpec(
                        labelRotation: 45,
                        labelStyle: charts.TextStyleSpec(
                          fontSize: 12,
                          color: charts.MaterialPalette.gray.shade700,
                        ),
                      ),
                    ),
                    primaryMeasureAxis: charts.NumericAxisSpec(
                      renderSpec: charts.GridlineRendererSpec(
                        labelStyle: charts.TextStyleSpec(
                          fontSize: 10,
                          color: charts.MaterialPalette.gray.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Demografi Gender',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.male, size: 40),
                        SizedBox(height: 8),
                        Text(
                          'Laki-laki',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '60%',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.female, size: 40),
                        SizedBox(height: 8),
                        Text(
                          'Perempuan',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '40%',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  child: charts.BarChart(
                    ageSeriesList,
                    animate: true,
                    barRendererDecorator: charts.BarLabelDecorator<String>(),
                    domainAxis: charts.OrdinalAxisSpec(
                      renderSpec:
                          charts.SmallTickRendererSpec(labelRotation: 0),
                    ),
                    primaryMeasureAxis: charts.NumericAxisSpec(
                      renderSpec: charts.GridlineRendererSpec(
                        labelStyle: charts.TextStyleSpec(
                          fontSize: 10,
                          color: charts.MaterialPalette.gray.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sebaran Wilayah',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  child: charts.BarChart(
                    regionSeriesList,
                    animate: true,
                    barRendererDecorator: charts.BarLabelDecorator<String>(),
                    domainAxis: charts.OrdinalAxisSpec(
                      renderSpec:
                          charts.SmallTickRendererSpec(labelRotation: 0),
                    ),
                    primaryMeasureAxis: charts.NumericAxisSpec(
                      renderSpec: charts.GridlineRendererSpec(
                        labelStyle: charts.TextStyleSpec(
                          fontSize: 10,
                          color: charts.MaterialPalette.gray.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class YourDataClass {
  final String label;
  final int value;

  YourDataClass({required this.label, required this.value});
}
