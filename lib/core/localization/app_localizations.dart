import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose {item}'**
  String choose(String item);

  /// No description provided for @mustEnter.
  ///
  /// In en, this message translates to:
  /// **'You must enter {item}'**
  String mustEnter(String item);

  /// No description provided for @comparingPhoto.
  ///
  /// In en, this message translates to:
  /// **'Comparing Photo'**
  String get comparingPhoto;

  /// No description provided for @titlePrefixMrs.
  ///
  /// In en, this message translates to:
  /// **'Mrs.'**
  String get titlePrefixMrs;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @nationalId.
  ///
  /// In en, this message translates to:
  /// **'National ID'**
  String get nationalId;

  /// No description provided for @identityNumberValidation.
  ///
  /// In en, this message translates to:
  /// **'Invalid National ID'**
  String get identityNumberValidation;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid Email'**
  String get invalidEmail;

  /// No description provided for @otpValidation.
  ///
  /// In en, this message translates to:
  /// **'OTP must be 4 digits'**
  String get otpValidation;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @explanation.
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get explanation;

  /// No description provided for @homeworkSolution.
  ///
  /// In en, this message translates to:
  /// **'Homework Solution'**
  String get homeworkSolution;

  /// No description provided for @practice.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get practice;

  /// No description provided for @revision.
  ///
  /// In en, this message translates to:
  /// **'Revision'**
  String get revision;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @successfullyDownloaded.
  ///
  /// In en, this message translates to:
  /// **'File downloaded successfully'**
  String get successfullyDownloaded;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get downloading;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid Phone Number'**
  String get invalidPhoneNumber;

  /// No description provided for @within.
  ///
  /// In en, this message translates to:
  /// **'Within'**
  String get within;

  /// No description provided for @workingNow.
  ///
  /// In en, this message translates to:
  /// **'Working now'**
  String get workingNow;

  /// No description provided for @ended.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get ended;

  /// No description provided for @nSeconds.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 second} other{{count} seconds}}'**
  String nSeconds(int count);

  /// No description provided for @nMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 minute} other{{count} minutes}}'**
  String nMinutes(int count);

  /// No description provided for @nHours.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 hour} other{{count} hours}}'**
  String nHours(int count);

  /// No description provided for @nDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}}'**
  String nDays(int count);

  /// No description provided for @nMonths.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month} other{{count} months}}'**
  String nMonths(int count);

  /// No description provided for @nYears.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 year} other{{count} years}}'**
  String nYears(int count);

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get serverError;

  /// No description provided for @badCertificate.
  ///
  /// In en, this message translates to:
  /// **'Bad Certificate'**
  String get badCertificate;

  /// No description provided for @requestCancelled.
  ///
  /// In en, this message translates to:
  /// **'Request Cancelled'**
  String get requestCancelled;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get connectionError;

  /// No description provided for @connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection Timeout'**
  String get connectionTimeout;

  /// No description provided for @receiveTimeout.
  ///
  /// In en, this message translates to:
  /// **'Receive Timeout'**
  String get receiveTimeout;

  /// No description provided for @sendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Send Timeout'**
  String get sendTimeout;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown Error'**
  String get unknownError;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @weekAgo.
  ///
  /// In en, this message translates to:
  /// **'Week ago'**
  String get weekAgo;

  /// No description provided for @weeksAgo.
  ///
  /// In en, this message translates to:
  /// **'Weeks ago'**
  String get weeksAgo;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get home;

  /// No description provided for @livestockTitle.
  ///
  /// In en, this message translates to:
  /// **'Best Quality Livestock with Highest Standards'**
  String get livestockTitle;

  /// No description provided for @livestockSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We provide you with the finest livestock from quality and health sources'**
  String get livestockSubtitle;

  /// No description provided for @viewAllLivestock.
  ///
  /// In en, this message translates to:
  /// **'Browse Livestock Now'**
  String get viewAllLivestock;

  /// No description provided for @morethanXanimalsavailable.
  ///
  /// In en, this message translates to:
  /// **'More than 5000+ animals available'**
  String get morethanXanimalsavailable;

  /// No description provided for @availableNow.
  ///
  /// In en, this message translates to:
  /// **'Available Now'**
  String get availableNow;

  /// No description provided for @satisfiedcustomer.
  ///
  /// In en, this message translates to:
  /// **'Satisfied customer'**
  String get satisfiedcustomer;

  /// No description provided for @qualityGuarantee.
  ///
  /// In en, this message translates to:
  /// **'Quality Guarantee'**
  String get qualityGuarantee;

  /// No description provided for @continuoussupport.
  ///
  /// In en, this message translates to:
  /// **'Continuous Support'**
  String get continuoussupport;

  /// No description provided for @livestockByType.
  ///
  /// In en, this message translates to:
  /// **'Classification by Type'**
  String get livestockByType;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @naeemi.
  ///
  /// In en, this message translates to:
  /// **'Naeemi'**
  String get naeemi;

  /// No description provided for @najdi.
  ///
  /// In en, this message translates to:
  /// **'Najdi'**
  String get najdi;

  /// No description provided for @harri.
  ///
  /// In en, this message translates to:
  /// **'Harri'**
  String get harri;

  /// No description provided for @tyus.
  ///
  /// In en, this message translates to:
  /// **'Tyus'**
  String get tyus;

  /// No description provided for @featuredLivestock.
  ///
  /// In en, this message translates to:
  /// **'Featured Livestock'**
  String get featuredLivestock;

  /// No description provided for @specialOffers.
  ///
  /// In en, this message translates to:
  /// **'Special Livestock Offers'**
  String get specialOffers;

  /// No description provided for @localcow.
  ///
  /// In en, this message translates to:
  /// **'Local Cow'**
  String get localcow;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get years;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get months;

  /// No description provided for @saudiRiyal.
  ///
  /// In en, this message translates to:
  /// **'Saudi Riyal'**
  String get saudiRiyal;

  /// No description provided for @contactNow.
  ///
  /// In en, this message translates to:
  /// **'Contact Now'**
  String get contactNow;

  /// No description provided for @sar.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get sar;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @rabwatalriyad.
  ///
  /// In en, this message translates to:
  /// **'Rabwat Alriyad'**
  String get rabwatalriyad;

  /// No description provided for @thebestinKingdom.
  ///
  /// In en, this message translates to:
  /// **'The Best in Kingdom'**
  String get thebestinKingdom;

  /// No description provided for @whyChooseUs.
  ///
  /// In en, this message translates to:
  /// **'Why Choose Us'**
  String get whyChooseUs;

  /// No description provided for @whyChooseUsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We provide you with the best livestock purchasing experience'**
  String get whyChooseUsSubtitle;

  /// No description provided for @guaranteedQuality.
  ///
  /// In en, this message translates to:
  /// **'100% Guaranteed Quality'**
  String get guaranteedQuality;

  /// No description provided for @guaranteedQualityDesc.
  ///
  /// In en, this message translates to:
  /// **'All our animals pass rigorous veterinary examinations and enjoy the highest standards of quality and health'**
  String get guaranteedQualityDesc;

  /// No description provided for @competitivePrices.
  ///
  /// In en, this message translates to:
  /// **'Competitive Prices'**
  String get competitivePrices;

  /// No description provided for @competitivePricesDesc.
  ///
  /// In en, this message translates to:
  /// **'We offer you the best prices in the market'**
  String get competitivePricesDesc;

  /// No description provided for @support247.
  ///
  /// In en, this message translates to:
  /// **'24/7 Technical Support'**
  String get support247;

  /// No description provided for @support247Desc.
  ///
  /// In en, this message translates to:
  /// **'Our team is available 24/7 to answer your questions and help you choose the most suitable option.'**
  String get support247Desc;

  /// No description provided for @fastDelivery.
  ///
  /// In en, this message translates to:
  /// **'Fast and Safe Delivery'**
  String get fastDelivery;

  /// No description provided for @fastDeliveryDesc.
  ///
  /// In en, this message translates to:
  /// **'We provide professional delivery service to all regions of the Kingdom with guaranteed speed of arrival'**
  String get fastDeliveryDesc;

  /// No description provided for @healthGuarantee.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive Health Guarantee'**
  String get healthGuarantee;

  /// No description provided for @healthGuaranteeDesc.
  ///
  /// In en, this message translates to:
  /// **'We provide health guarantee for all animals on all types of animals sold'**
  String get healthGuaranteeDesc;

  /// No description provided for @specialOffer.
  ///
  /// In en, this message translates to:
  /// **'Special Offer'**
  String get specialOffer;

  /// No description provided for @discountUpTo.
  ///
  /// In en, this message translates to:
  /// **'15% discount on all sacrifices'**
  String get discountUpTo;

  /// No description provided for @offerDescription.
  ///
  /// In en, this message translates to:
  /// **'Limited offer for a limited time. Book now and get a special discount when you buy today'**
  String get offerDescription;

  /// No description provided for @daysLeft.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get daysLeft;

  /// No description provided for @hoursLeft.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hoursLeft;

  /// No description provided for @benefitNow.
  ///
  /// In en, this message translates to:
  /// **'Benefit from the offer now'**
  String get benefitNow;

  /// No description provided for @endsin.
  ///
  /// In en, this message translates to:
  /// **'Ends in'**
  String get endsin;

  /// No description provided for @piece.
  ///
  /// In en, this message translates to:
  /// **'Piece'**
  String get piece;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// No description provided for @sheep.
  ///
  /// In en, this message translates to:
  /// **'Sheep'**
  String get sheep;

  /// No description provided for @contactus.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactus;

  /// No description provided for @swakni.
  ///
  /// In en, this message translates to:
  /// **'Swakni'**
  String get swakni;

  /// No description provided for @hashee.
  ///
  /// In en, this message translates to:
  /// **'Hashee'**
  String get hashee;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @camels.
  ///
  /// In en, this message translates to:
  /// **'Camels'**
  String get camels;

  /// No description provided for @cows.
  ///
  /// In en, this message translates to:
  /// **'Cows'**
  String get cows;

  /// No description provided for @goats.
  ///
  /// In en, this message translates to:
  /// **'Goats'**
  String get goats;

  /// No description provided for @eidExclusiveOffers.
  ///
  /// In en, this message translates to:
  /// **'Eid Exclusive Offers'**
  String get eidExclusiveOffers;

  /// No description provided for @bookNowDiscount.
  ///
  /// In en, this message translates to:
  /// **'Book now and get up to 15% discount on selected sacrifices'**
  String get bookNowDiscount;

  /// No description provided for @bookYourSacrifice.
  ///
  /// In en, this message translates to:
  /// **'Book your sacrifice now'**
  String get bookYourSacrifice;

  /// No description provided for @offerValidUntil.
  ///
  /// In en, this message translates to:
  /// **'Offer valid while stocks last'**
  String get offerValidUntil;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get seconds;

  /// No description provided for @addtocart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addtocart;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @connectWithUsDirectly.
  ///
  /// In en, this message translates to:
  /// **'Connect with us directly'**
  String get connectWithUsDirectly;

  /// No description provided for @whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsapp;

  /// No description provided for @instantChat.
  ///
  /// In en, this message translates to:
  /// **'Instant and fast chat'**
  String get instantChat;

  /// No description provided for @additionalContactMethods.
  ///
  /// In en, this message translates to:
  /// **'Additional contact methods'**
  String get additionalContactMethods;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @followUs.
  ///
  /// In en, this message translates to:
  /// **'Follow us'**
  String get followUs;

  /// No description provided for @instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get instagram;

  /// No description provided for @snapchat.
  ///
  /// In en, this message translates to:
  /// **'Snapchat'**
  String get snapchat;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send us a message'**
  String get sendMessage;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterFullName;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @inquiryType.
  ///
  /// In en, this message translates to:
  /// **'Inquiry Type'**
  String get inquiryType;

  /// No description provided for @selectInquiryType.
  ///
  /// In en, this message translates to:
  /// **'Select inquiry type'**
  String get selectInquiryType;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @writeMessageHere.
  ///
  /// In en, this message translates to:
  /// **'Write your message here...'**
  String get writeMessageHere;

  /// No description provided for @sendMessageButton.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessageButton;

  /// No description provided for @priceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get priceLabel;

  /// No description provided for @additions.
  ///
  /// In en, this message translates to:
  /// **'Additions'**
  String get additions;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @liver.
  ///
  /// In en, this message translates to:
  /// **'Lamb Liver'**
  String get liver;

  /// No description provided for @trotters.
  ///
  /// In en, this message translates to:
  /// **'Lamb Trotters'**
  String get trotters;

  /// No description provided for @tripe.
  ///
  /// In en, this message translates to:
  /// **'Lamb Tripe'**
  String get tripe;

  /// No description provided for @addToOrder.
  ///
  /// In en, this message translates to:
  /// **'Add to Order'**
  String get addToOrder;

  /// No description provided for @priceColon.
  ///
  /// In en, this message translates to:
  /// **'Price: '**
  String get priceColon;

  /// No description provided for @itemAdded.
  ///
  /// In en, this message translates to:
  /// **'{item} added to your order'**
  String itemAdded(String item);

  /// No description provided for @additionsSummary.
  ///
  /// In en, this message translates to:
  /// **'Liver, Trotters, Tripe'**
  String get additionsSummary;

  /// No description provided for @orderCompletion.
  ///
  /// In en, this message translates to:
  /// **'Order Completion'**
  String get orderCompletion;

  /// No description provided for @detailedAddress.
  ///
  /// In en, this message translates to:
  /// **'Detailed Address'**
  String get detailedAddress;

  /// No description provided for @enterDetailedAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter detailed address'**
  String get enterDetailedAddress;

  /// No description provided for @discountCode.
  ///
  /// In en, this message translates to:
  /// **'Discount Code'**
  String get discountCode;

  /// No description provided for @enterDiscountCode.
  ///
  /// In en, this message translates to:
  /// **'Enter discount code'**
  String get enterDiscountCode;

  /// No description provided for @choosePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose Payment Method'**
  String get choosePaymentMethod;

  /// No description provided for @bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get bankTransfer;

  /// No description provided for @attachReceipt.
  ///
  /// In en, this message translates to:
  /// **'Attach receipt image'**
  String get attachReceipt;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cashOnDelivery;

  /// No description provided for @sendOrder.
  ///
  /// In en, this message translates to:
  /// **'Send Order'**
  String get sendOrder;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// No description provided for @proceedToPayment.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Payment'**
  String get proceedToPayment;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @cartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get cartEmpty;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get emailHint;

  /// No description provided for @mobileHint.
  ///
  /// In en, this message translates to:
  /// **'05xxxxxxxx'**
  String get mobileHint;

  /// No description provided for @totalamountrequired.
  ///
  /// In en, this message translates to:
  /// **'Total amount required'**
  String get totalamountrequired;

  /// No description provided for @orderAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'Your order added to cart'**
  String get orderAddedToCart;

  /// No description provided for @shopnow.
  ///
  /// In en, this message translates to:
  /// **'Shop now'**
  String get shopnow;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @ordernow.
  ///
  /// In en, this message translates to:
  /// **'Order now'**
  String get ordernow;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
