// استيراد المكتبة الأساسية لـ Flutter
import 'package:flutter/material.dart';

// نقطة البداية للتطبيق
void main() {
  runApp(const MyApp());
}

// الويدجت الرئيسي للتطبيق
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // عنوان التطبيق
      title: 'نموذج إدخال',
      // تعريف سمات التطبيق
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B4CE6),
          primary: const Color(0xFF6B4CE6),
          secondary: const Color(0xFF4CC9F0),
        ),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      // تحديد الصفحة الرئيسية
      home: const MyFormPage(),
      // تعيين اللغة العربية كلغة افتراضية
      locale: const Locale('ar', 'SA'),
    );
  }
}

// صفحة النموذج - ويدجت متغير الحالة
class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

// حالة صفحة النموذج - تحتوي على المنطق والحالة
class _MyFormPageState extends State<MyFormPage> {
  // مفتاح فريد للنموذج للتحقق من صحة البيانات
  final _formKey = GlobalKey<FormState>();
  // إنشاء 4 متحكمات للحقول النصية
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  // دالة للتنظيف عند إغلاق الصفحة
  @override
  void dispose() {
    // تحرير الموارد المستخدمة في المتحكمات
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // خلفية متدرجة للتطبيق
      backgroundColor: const Color(0xFFF5F5F5),
      // شريط التطبيق العلوي
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'نموذج إدخال البيانات',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      // محتوى الصفحة
      body: Directionality(
        // تعيين اتجاه النص من اليمين إلى اليسار
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Colors.white,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              // نموذج لتجميع حقول الإدخال
              child: Form(
                key: _formKey,
                child: Column(
                  // توسيط المحتوى عموديًا
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    // إنشاء 4 حقول نصية بشكل ديناميكي
                    ...List.generate(4, (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      // حقل النص مع التنسيق
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _controllers[index],
                          decoration: InputDecoration(
                            labelText: 'حقل النص ${index + 1}',
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                            // تنسيق حدود الحقل
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
                    // مسافة بين الحقول والزر
                    const SizedBox(height: 30),
                    // زر الإجراء
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // التحقق من صحة النموذج عند الضغط
                          if (_formKey.currentState!.validate()) {
                            // يمكن إضافة الإجراء هنا
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'إرسال',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
