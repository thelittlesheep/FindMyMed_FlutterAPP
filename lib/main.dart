import 'package:flutter/material.dart';
import 'package:frametest/routes/Routes.dart';
import 'package:frametest/screens/medandfood/chinesemed_editing.dart';
import 'package:frametest/screens/medandfood/food_editing.dart';
import 'package:frametest/screens/profile/profile.dart';
import 'package:frametest/screens/medandfood/medandfood.dart';
import 'package:frametest/screens/interaction/interaction.dart';
import 'package:frametest/screens/profile/profile_editing.dart';
import 'package:frametest/screens/search/search.dart';
import 'package:frametest/screens/setting/setting.dart';
import 'package:frametest/screens/about/about.dart';
import 'package:frametest/screens/wrapper.dart';
import 'package:frametest/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:frametest/models/user.dart';
import 'package:frametest/screens/medandfood/westmed_editing.dart';

void main() {
  runApp(Findmymed());
}

class Findmymed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.profile: (context) => ProfilePage(),
          Routes.profileEditing: (context) => ProfileEditing(),
          Routes.medandfood: (context) => MedandFoodPage(),
          Routes.interaction: (context) => InteractionPage(),
          Routes.setting: (context) => SettingPage(),
          Routes.about: (context) => AboutPage(),
          Routes.westmedicineEditing: (context) => WestmedicineEditing(),
          Routes.chinesemedicineEditing: (context) => ChinesemedicineEditing(),
          Routes.foodEditing: (context) => FoodEditing(),
          Routes.search: (context) => SearchPage(),
        },
        home: SafeArea(child: Wrapper()),
      ),
    );
  }
}
