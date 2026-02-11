// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String choose(String item) {
    return 'اختر $item';
  }

  @override
  String mustEnter(String item) {
    return 'يجب إدخال $item';
  }

  @override
  String get comparingPhoto => 'مقارنة الصورة';

  @override
  String get titlePrefixMrs => 'السيدة';

  @override
  String get date => 'التاريخ';

  @override
  String get password => 'كلمة المرور';

  @override
  String get nationalId => 'رقم الهوية';

  @override
  String get identityNumberValidation => 'رقم الهوية غير صحيح';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get invalidEmail => 'بريد إلكتروني غير صحيح';

  @override
  String get otpValidation => 'رمز التحقق يجب أن يكون ٤ أرقام';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get explanation => 'شرح';

  @override
  String get homeworkSolution => 'حل الواجب';

  @override
  String get practice => 'تمرين';

  @override
  String get revision => 'مراجعة';

  @override
  String get other => 'أخرى';

  @override
  String get successfullyDownloaded => 'تم تحميل الملف بنجاح';

  @override
  String get downloading => 'جار التحميل...';

  @override
  String get invalidPhoneNumber => 'رقم الهاتف غير صحيح';

  @override
  String get within => 'خلال';

  @override
  String get workingNow => 'يعمل الآن';

  @override
  String get ended => 'انتهى';

  @override
  String nSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ثواني',
      one: 'ثانية واحدة',
    );
    return '$_temp0';
  }

  @override
  String nMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دقائق',
      one: 'دقيقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String nHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ساعات',
      one: 'ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String nDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أيام',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String nMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أشهر',
      one: 'شهر واحد',
    );
    return '$_temp0';
  }

  @override
  String nYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سنوات',
      one: 'سنة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get serverError => 'خطأ في الخادم';

  @override
  String get badCertificate => 'شهادة غير صالحة';

  @override
  String get requestCancelled => 'تم إلغاء الطلب';

  @override
  String get connectionError => 'لا يوجد اتصال بالإنترنت';

  @override
  String get connectionTimeout => 'انتهت مهلة الاتصال';

  @override
  String get receiveTimeout => 'انتهت مهلة الاستقبال';

  @override
  String get sendTimeout => 'انتهت مهلة الإرسال';

  @override
  String get unknownError => 'خطأ غير معروف';

  @override
  String get welcome => 'مرحبا';

  @override
  String get weekAgo => 'قبل اسبوع';

  @override
  String get weeksAgo => 'قبل اسابيع';

  @override
  String get today => 'اليوم';

  @override
  String get home => 'الرئيسية';

  @override
  String get livestockTitle => 'أجود أنواع الذبائح بأعلى جودة';

  @override
  String get livestockSubtitle =>
      'نوفر لك أجود أنواع الذبائح من مصادر الجودة والصحة';

  @override
  String get viewAllLivestock => 'تصفح الذبائح الآن';

  @override
  String get morethanXanimalsavailable => 'أكثر من 5000+ حيوان متاح';

  @override
  String get availableNow => 'متوفر الآن';

  @override
  String get satisfiedcustomer => 'عميل راضي';

  @override
  String get qualityGuarantee => 'ضمان الجودة';

  @override
  String get continuoussupport => 'دعم متواصل';

  @override
  String get livestockByType => 'تصنيف حسب النوع';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get naeemi => 'نعيمي';

  @override
  String get najdi => 'نجدي';

  @override
  String get harri => 'حري';

  @override
  String get tyus => 'تيوس';

  @override
  String get featuredLivestock => 'الماشية المميزة';

  @override
  String get specialOffers => 'عروض مميزة من الماشية';

  @override
  String get localcow => 'عجل بلدي';

  @override
  String get years => 'سنة';

  @override
  String get months => 'شهر';

  @override
  String get saudiRiyal => 'ريال سعودي';

  @override
  String get contactNow => 'تواصل الآن';

  @override
  String get sar => 'ر.س';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get products => 'المنتجات';

  @override
  String get rabwatalriyad => 'ربوة الرياض';

  @override
  String get thebestinKingdom => 'الأفضل في المملكة';

  @override
  String get whyChooseUs => 'لماذا نختارنا';

  @override
  String get whyChooseUsSubtitle => 'نقدم لك أفضل تجربة شراء للذبائح';

  @override
  String get guaranteedQuality => 'جودة مضمونة 100%';

  @override
  String get guaranteedQualityDesc =>
      'جميع حيواناتنا تخضع لفحوصات بيطرية دقيقة ونضمن لك أعلى معايير الجودة والصحة';

  @override
  String get competitivePrices => 'أسعار تنافسية';

  @override
  String get competitivePricesDesc => 'نوفر لك أفضل الأسعار في السوق';

  @override
  String get support247 => 'دعم فني 24/7';

  @override
  String get support247Desc =>
      'فريقنا متاح على مدار الساعة للإجابة على استفساراتك ومساعدتك في اختيار الأنسب';

  @override
  String get fastDelivery => 'توصيل سريع وآمن';

  @override
  String get fastDeliveryDesc =>
      'نوفر خدمة توصيل احترافية لجميع مناطق المملكة مع ضمان سرعة الوصول';

  @override
  String get healthGuarantee => 'ضمان صحي شامل';

  @override
  String get healthGuaranteeDesc =>
      'نقدم ضمان صحي لجميع الحيوانات على جميع أنواع الحيوانات المباعة';

  @override
  String get specialOffer => 'عرض خاص';

  @override
  String get discountUpTo => 'خصم 15% على جميع الأضاحي';

  @override
  String get offerDescription =>
      'عرض محدود لفترة محدودة احجز الآن واحصل على خصم مميز عند الشراء اليوم';

  @override
  String get daysLeft => 'أيام';

  @override
  String get hoursLeft => 'ساعة';

  @override
  String get benefitNow => 'استفد من العرض الآن';

  @override
  String get endsin => 'ينتهي خلال';

  @override
  String get piece => 'قطعة';

  @override
  String get remaining => 'متبقي';

  @override
  String get sheep => 'غنم';

  @override
  String get contactus => 'تواصل معنا';

  @override
  String get swakni => 'سواكني';

  @override
  String get hashee => 'حاشي';

  @override
  String get all => 'الكل';

  @override
  String get camels => 'إبل';

  @override
  String get cows => 'أبقار';

  @override
  String get goats => 'ماعز';

  @override
  String get eidExclusiveOffers => 'عروض العيد الحصرية';

  @override
  String get bookNowDiscount =>
      'احجز الآن واحصل على خصم يصل إلى 15% على مجموعة مختارة من الأضاحي';

  @override
  String get bookYourSacrifice => 'احجز أضحيتك الآن';

  @override
  String get offerValidUntil => 'العرض ساري حتى نفاذ الكمية';

  @override
  String get days => 'أيام';

  @override
  String get hours => 'ساعات';

  @override
  String get minutes => 'دقائق';

  @override
  String get seconds => 'ثواني';

  @override
  String get addtocart => 'أضف إلى السلة';

  @override
  String get cart => 'السلة';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get connectWithUsDirectly => 'تواصل معنا مباشرة';

  @override
  String get whatsapp => 'واتساب';

  @override
  String get instantChat => 'تواصل فوري وسريع';

  @override
  String get additionalContactMethods => 'طرق تواصل إضافية';

  @override
  String get emailAddress => 'البريد الإلكتروني';

  @override
  String get followUs => 'تابعنا';

  @override
  String get instagram => 'انستقرام';

  @override
  String get snapchat => 'سناب شات';

  @override
  String get sendMessage => 'أرسل لنا رسالة';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get enterFullName => 'أدخل اسمك الكامل';

  @override
  String get mobileNumber => 'رقم الجوال';

  @override
  String get inquiryType => 'نوع الاستفسار';

  @override
  String get selectInquiryType => 'اختر نوع الاستفسار';

  @override
  String get message => 'الرسالة';

  @override
  String get writeMessageHere => 'اكتب رسالتك هنا...';

  @override
  String get sendMessageButton => 'إرسال الرسالة';

  @override
  String get priceLabel => 'السعر';

  @override
  String get additions => 'الإضافات';

  @override
  String get payNow => 'ادفع الان';

  @override
  String get liver => 'كبدة غنم';

  @override
  String get trotters => 'كوارع غنم';

  @override
  String get tripe => 'كرشة غنم';

  @override
  String get addToOrder => 'اضف الي الطلب';

  @override
  String get priceColon => 'السعر: ';

  @override
  String itemAdded(String item) {
    return 'تم إضافة $item إلى طلبك';
  }

  @override
  String get additionsSummary => 'كبدة، كوارع، كرشة';

  @override
  String get orderCompletion => 'إتمام الطلب';

  @override
  String get detailedAddress => 'العنوان بالتفصيل';

  @override
  String get enterDetailedAddress => 'أدخل العنوان بالتفصيل';

  @override
  String get discountCode => 'كود الخصم';

  @override
  String get enterDiscountCode => 'أدخل كود الخصم';

  @override
  String get choosePaymentMethod => 'اختر وسيلة الدفع';

  @override
  String get bankTransfer => 'تحويل بنكي';

  @override
  String get attachReceipt => 'ارفق صورة الايصال';

  @override
  String get cashOnDelivery => 'دفع عند الاستلام';

  @override
  String get sendOrder => 'ارسال الطلب';

  @override
  String get totalAmount => 'المجموع';

  @override
  String get proceedToPayment => 'الإنتقال للدفع';

  @override
  String get quantity => 'الكمية';

  @override
  String get total => 'الاجمالي';

  @override
  String get cartEmpty => 'سلة التسوق فارغة';

  @override
  String get emailHint => 'example@email.com';

  @override
  String get mobileHint => '٠٥xxxxxxxx';

  @override
  String get totalamountrequired => 'المبلغ الإجمالي المطلوب';
}
