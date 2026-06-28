
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService{
  static Future<void> init()async{
    Supabase.initialize(
        url: "https://qogkyohmrplxzgbqrfce.supabase.co",
        publishableKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFvZ2t5b2htcnBseHpnYnFyZmNlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI1NDMzNDQsImV4cCI6MjA5ODExOTM0NH0.55t1whQwdhVg-BdpFKrcUXJWLk3SLCwB3IT-6VLlS8A"
    );
  }
}