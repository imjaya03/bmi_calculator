import 'package:flutter/material.dart';
import './screens/input_screen.dart';
import 'package:provider/provider.dart';
import './blocs/bmi_bloc.dart';
import './screens/results_screen.dart';
import './screens/landing_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => BmiBloc()),
      ],
      child: StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'BMI Calculator'.toUpperCase(),
            debugShowCheckedModeBanner: false,
            theme: _buildThemeData(),
            initialRoute: LandingScreen.routeName,
            routes: {
              LandingScreen.routeName: (ctx) => LandingScreen(),
              InputScreen.routeName: (ctx) => InputScreen(),
              ResultsScreen.routeName: (ctx) => ResultsScreen(),
            },
          );
        },
      ),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData.dark().copyWith(
      primaryColor: Color(0XFF0A0E21),
      accentColor: Color(0xFFEB1555),
      scaffoldBackgroundColor: Color(0XFF0A0E21),
      buttonTheme: ButtonThemeData(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          // backgroundColor: Color(0xFFEB1555),
          ),
      appBarTheme: AppBarTheme(),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        thumbColor: Color(0xFFEB1555),
        overlayColor: Color(0x29EB1555),
        inactiveTrackColor: Colors.grey,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
      ),
    );
  }
}

/*


        activeColor: Color(0xFFEB1555),
        inactiveColor: Color(0xFF8D8E98),

*/
