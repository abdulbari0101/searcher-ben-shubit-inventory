
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../services/app_services.dart';


class MultiUseData{

  static final AppServices appServices = Get.find<AppServices>();

  static final SupabaseClient supabaseClient = Supabase.instance.client;


}