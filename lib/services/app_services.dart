import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppServices extends GetxService {
  Future<AppServices> init() async {
// Initialize Supabase

    await Supabase.initialize(
      url:  'https://fjfxezhxdgeaekocvbpp.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqZnhlemh4ZGdlYWVrb2N2YnBwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE1MzYwNTcsImV4cCI6MjA2NzExMjA1N30.YueglhcgUBhO_4wNoa2GbCsES0Zoa15XmXujeqZMN3c',
    );

    return this;
  }

}
