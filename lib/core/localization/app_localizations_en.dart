// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String choose(String item) {
    return 'Choose $item';
  }

  @override
  String mustEnter(String item) {
    return 'You must enter $item';
  }

  @override
  String get comparingPhoto => 'Comparing Photo';

  @override
  String get titlePrefixMrs => 'Mrs.';

  @override
  String get date => 'Date';

  @override
  String get password => 'Password';

  @override
  String get nationalId => 'National ID';

  @override
  String get identityNumberValidation => 'Invalid National ID';

  @override
  String get email => 'Email';

  @override
  String get invalidEmail => 'Invalid Email';

  @override
  String get otpValidation => 'OTP must be 4 digits';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get explanation => 'Explanation';

  @override
  String get homeworkSolution => 'Homework Solution';

  @override
  String get practice => 'Practice';

  @override
  String get revision => 'Revision';

  @override
  String get other => 'Other';

  @override
  String get successfullyDownloaded => 'File downloaded successfully';

  @override
  String get downloading => 'Downloading...';

  @override
  String get invalidPhoneNumber => 'Invalid Phone Number';

  @override
  String get within => 'Within';

  @override
  String get workingNow => 'Working now';

  @override
  String get ended => 'Ended';

  @override
  String nSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      one: '1 second',
    );
    return '$_temp0';
  }

  @override
  String nMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String nHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      one: '1 hour',
    );
    return '$_temp0';
  }

  @override
  String nDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String nMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months',
      one: '1 month',
    );
    return '$_temp0';
  }

  @override
  String nYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years',
      one: '1 year',
    );
    return '$_temp0';
  }

  @override
  String get serverError => 'Server Error';

  @override
  String get badCertificate => 'Bad Certificate';

  @override
  String get requestCancelled => 'Request Cancelled';

  @override
  String get connectionError => 'No Internet Connection';

  @override
  String get connectionTimeout => 'Connection Timeout';

  @override
  String get receiveTimeout => 'Receive Timeout';

  @override
  String get sendTimeout => 'Send Timeout';

  @override
  String get unknownError => 'Unknown Error';

  @override
  String get welcome => 'Welcome';

  @override
  String get weekAgo => 'Week ago';

  @override
  String get weeksAgo => 'Weeks ago';

  @override
  String get today => 'Today';

  @override
  String get home => 'Home Page';

  @override
  String get livestockTitle => 'Best Quality Livestock with Highest Standards';

  @override
  String get livestockSubtitle =>
      'We provide you with the finest livestock from quality and health sources';

  @override
  String get viewAllLivestock => 'Browse Livestock Now';

  @override
  String get morethanXanimalsavailable => 'More than 5000+ animals available';

  @override
  String get availableNow => 'Available Now';

  @override
  String get satisfiedcustomer => 'Satisfied customer';

  @override
  String get qualityGuarantee => 'Quality Guarantee';

  @override
  String get continuoussupport => 'Continuous Support';

  @override
  String get livestockByType => 'Classification by Type';

  @override
  String get viewAll => 'View All';

  @override
  String get naeemi => 'Naeemi';

  @override
  String get najdi => 'Najdi';

  @override
  String get harri => 'Harri';

  @override
  String get tyus => 'Tyus';

  @override
  String get featuredLivestock => 'Featured Livestock';

  @override
  String get specialOffers => 'Special Livestock Offers';

  @override
  String get localcow => 'Local Cow';

  @override
  String get years => 'Years';

  @override
  String get months => 'Months';

  @override
  String get saudiRiyal => 'Saudi Riyal';

  @override
  String get contactNow => 'Contact Now';

  @override
  String get sar => 'SAR';

  @override
  String get profile => 'Profile';

  @override
  String get products => 'Products';

  @override
  String get rabwatalriyad => 'Rabwat Alriyad';

  @override
  String get thebestinKingdom => 'The Best in Kingdom';

  @override
  String get whyChooseUs => 'Why Choose Us';

  @override
  String get whyChooseUsSubtitle =>
      'We provide you with the best livestock purchasing experience';

  @override
  String get guaranteedQuality => '100% Guaranteed Quality';

  @override
  String get guaranteedQualityDesc =>
      'All our animals pass rigorous veterinary examinations and enjoy the highest standards of quality and health';

  @override
  String get competitivePrices => 'Competitive Prices';

  @override
  String get competitivePricesDesc =>
      'We offer you the best prices in the market';

  @override
  String get support247 => '24/7 Technical Support';

  @override
  String get support247Desc =>
      'Our team is available 24/7 to answer your questions and help you choose the most suitable option.';

  @override
  String get fastDelivery => 'Fast and Safe Delivery';

  @override
  String get fastDeliveryDesc =>
      'We provide professional delivery service to all regions of the Kingdom with guaranteed speed of arrival';

  @override
  String get healthGuarantee => 'Comprehensive Health Guarantee';

  @override
  String get healthGuaranteeDesc =>
      'We provide health guarantee for all animals on all types of animals sold';

  @override
  String get specialOffer => 'Special Offer';

  @override
  String get discountUpTo => '15% discount on all sacrifices';

  @override
  String get offerDescription =>
      'Limited offer for a limited time. Book now and get a special discount when you buy today';

  @override
  String get daysLeft => 'Days';

  @override
  String get hoursLeft => 'Hours';

  @override
  String get benefitNow => 'Benefit from the offer now';

  @override
  String get endsin => 'Ends in';

  @override
  String get piece => 'Piece';

  @override
  String get remaining => 'Remaining';

  @override
  String get sheep => 'Sheep';

  @override
  String get contactus => 'Contact Us';

  @override
  String get swakni => 'Swakni';

  @override
  String get hashee => 'Hashee';

  @override
  String get all => 'All';

  @override
  String get camels => 'Camels';

  @override
  String get cows => 'Cows';

  @override
  String get goats => 'Goats';

  @override
  String get eidExclusiveOffers => 'Eid Exclusive Offers';

  @override
  String get bookNowDiscount =>
      'Book now and get up to 15% discount on selected sacrifices';

  @override
  String get bookYourSacrifice => 'Book your sacrifice now';

  @override
  String get offerValidUntil => 'Offer valid while stocks last';

  @override
  String get days => 'Days';

  @override
  String get hours => 'Hours';

  @override
  String get minutes => 'Minutes';

  @override
  String get seconds => 'Seconds';

  @override
  String get addtocart => 'Add to cart';

  @override
  String get cart => 'Cart';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get connectWithUsDirectly => 'Connect with us directly';

  @override
  String get whatsapp => 'WhatsApp';

  @override
  String get instantChat => 'Instant and fast chat';

  @override
  String get additionalContactMethods => 'Additional contact methods';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get followUs => 'Follow us';

  @override
  String get instagram => 'Instagram';

  @override
  String get snapchat => 'Snapchat';

  @override
  String get sendMessage => 'Send us a message';

  @override
  String get fullName => 'Full Name';

  @override
  String get enterFullName => 'Enter your full name';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get inquiryType => 'Inquiry Type';

  @override
  String get selectInquiryType => 'Select inquiry type';

  @override
  String get message => 'Message';

  @override
  String get writeMessageHere => 'Write your message here...';

  @override
  String get sendMessageButton => 'Send Message';

  @override
  String get priceLabel => 'Price';

  @override
  String get additions => 'Additions';

  @override
  String get payNow => 'Pay Now';

  @override
  String get liver => 'Lamb Liver';

  @override
  String get trotters => 'Lamb Trotters';

  @override
  String get tripe => 'Lamb Tripe';

  @override
  String get addToOrder => 'Add to Order';

  @override
  String get priceColon => 'Price: ';

  @override
  String itemAdded(String item) {
    return '$item added to your order';
  }

  @override
  String get additionsSummary => 'Liver, Trotters, Tripe';

  @override
  String get orderCompletion => 'Order Completion';

  @override
  String get detailedAddress => 'Detailed Address';

  @override
  String get enterDetailedAddress => 'Enter detailed address';

  @override
  String get discountCode => 'Discount Code';

  @override
  String get enterDiscountCode => 'Enter discount code';

  @override
  String get choosePaymentMethod => 'Choose Payment Method';

  @override
  String get bankTransfer => 'Bank Transfer';

  @override
  String get attachReceipt => 'Attach receipt image';

  @override
  String get cashOnDelivery => 'Cash on Delivery';

  @override
  String get sendOrder => 'Send Order';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get proceedToPayment => 'Proceed to Payment';

  @override
  String get quantity => 'Quantity';

  @override
  String get total => 'Total';

  @override
  String get cartEmpty => 'Your cart is empty';

  @override
  String get emailHint => 'example@email.com';

  @override
  String get mobileHint => '05xxxxxxxx';

  @override
  String get totalamountrequired => 'Total amount required';
}
