import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppServices extends GetxService {
  Future<AppServices> init() async {
// Initialize Supabase

    await Supabase.initialize(
      url:  '',// TODO: Add your Supabase URL anonKey: '',// TODO: Add your Supabase Anon Key ); // Obtain shared preferences final SharedPreferences prefs = await Sh
      anonKey: '',// TODO: Add your Supabase Anon Key prefs = await SharedPreferences.getInstance(); } static AppServices get to => Get.find(); } 
    );

    return this;
  }

}
