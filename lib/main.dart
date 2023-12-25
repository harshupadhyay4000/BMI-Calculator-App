import 'package:flutter/material.dart';
import 'package:flutter_basics/splash_screen.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 21,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('Weight Kg (No Decimal Values)'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Height in Feet'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Height in Inches '),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 17,),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;

                      var bmi = iWt / (tM * tM);

                      var msg = "";

                      if (bmi < 18.50) {
                        msg = "Underweight";
                        bgColor = Colors.blue.shade200; // You can use the color that corresponds to underweight
                      } else if (bmi >= 18.50 && bmi < 24.99) {
                        msg = "Normal Weight";
                        bgColor = Colors.green.shade200; // You can use the color that corresponds to normal weight
                      } else if (bmi >= 25 && bmi < 29.99) {
                        msg = "Overweight";
                        bgColor = Colors.orange.shade200; // You can use the color that corresponds to overweight
                      } else if (bmi >= 30 && bmi < 34.99) {
                        msg = "Obese (Class 1)";
                        bgColor = Colors.red.shade200; // You can use the color that corresponds to obese class 1
                      } else {
                        msg = "Obese (Class 2)";
                        bgColor = Colors.purple.shade200; // You can use the color that corresponds to obese class 2
                      }


                      setState(() {
                        result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please Fill the Required Details!";
                      });
                    }
                  },
                  child: Text('Calculate'),
                ),
                SizedBox(height: 11,),
                Text(
                  result,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                ),
                SizedBox(height: 20,), // Add some space before the ElevatedButton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IntroPage()),
                    );
                  },
                  child: Text('More Info.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Information on BMI'),
        backgroundColor: Colors.indigo.shade200,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/meter.png', height: 200),
            SizedBox(height: 16),
            Text(
              'Body Mass Index (BMI) Categories:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            buildCategorySection(
              context,
              'Underweight (BMI < 18.5)',
              'Possible reasons: Inadequate calorie intake, malnutrition, or underlying health conditions.',
              'Dietary Suggestions: Consult with a healthcare professional. A balanced diet with a focus on nutrient-dense foods.',
              Colors.blue.shade200,
              'https://www.healthdirect.gov.au/what-to-do-if-you-are-underweight#:~:text=You%20can%20put%20on%20weight,coffee%2C%20tea%20or%20with%20meals',
            ),
            SizedBox(height: 16),
            buildCategorySection(
              context,
              'Normal Weight (BMI 18.5 - 24.9)',
              'Maintain a balanced diet and regular exercise for overall health.',
              'https://www.who.int/europe/news-room/fact-sheets/item/a-healthy-lifestyle---who-recommendations#:~:text=Maintain%20body%20weight%20between%20the,saturated%20fats%20with%20unsaturated%20fats.',
              Colors.green.shade200,
            ),
            SizedBox(height: 16),
            buildCategorySection(
              context,
              'Overweight (BMI 25 - 29.9)',
              'Possible reasons: Overeating, lack of physical activity, or genetic factors.',
              'Dietary Suggestions: Adopt a calorie-controlled diet with an emphasis on whole foods and increased physical activity.',
              Colors.orange.shade200,
              'https://www.niddk.nih.gov/health-information/weight-management/adult-overweight-obesity/treatment',
            ),
            SizedBox(height: 16),
            buildCategorySection(
              context,
              'Obese (BMI 30 - 34.9)',
              'Possible reasons: Genetics, sedentary lifestyle, unhealthy eating habits.',
              'Dietary Suggestions: Seek guidance from a healthcare professional. Focus on a well-rounded, portion-controlled diet and regular exercise.',
              Colors.red.shade200,
              'https://my.clevelandclinic.org/health/diseases/11209-weight-control-and-obesity',
            ),
            SizedBox(height: 16),
            buildCategorySection(
              context,
              'Obese (BMI ≥ 35)',
              'Possible reasons: Severe obesity with increased health risks.',
              'Dietary Suggestions: Medical intervention is advised. Consult with healthcare professionals for personalized guidance.',
              Colors.purple.shade200,
              'https://www.medicalnewstoday.com/articles/323691',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategorySection(
      BuildContext context,
      String title,
      String description1,
      String description2,
      Color bgColor,
      [String linkText = '']
      ) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(description1),
          SizedBox(height: 8),
          Text(description2),
          if (linkText.isNotEmpty)
            Text(
              'Learn more: $linkText',
              style: TextStyle(color: Colors.black),
            ),
        ],
      ),
    );
  }
}
