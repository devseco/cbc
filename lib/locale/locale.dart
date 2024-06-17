import 'package:get/get.dart';

class locale extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'ar': {
      '0': 'خصومات',
      '1':'تسجيل دخول',
      '2':'مرحبا بك',
      '3':'رقم الهاتف',
      '4':'كلمة السر',
      '5':'انشاء حساب الآن',
      '6': 'الرجاء ادخال معلوماتك',
      '7': 'تذكر كلمة السر',
      '8': 'من خلال إنشاء حساب، فإنك توافق\nعلى شروط الخدمة وسياسة الخصوصية الخاصة بنا',
      '9': 'بحث عن المنتجات ...',
      '10': 'الاقسام',
      '11': 'عرض الكل',
      '12': 'احدث المنتجات',
      '13': 'نسيت كلمة السر ؟',
      '14': "الرئيسية",
      '15': "الاقسام",
      '16': "السلة",
      '17': "الحساب",
      '18': 'د.ع',
      '19': 'اضافة الى السلة',
      '20': 'لا توجد بيانات',
      '21': 'اتصل بنا',
      '22': 'تغيير اللغة',
      '23': 'تسجيل خروج',
      '24': 'رقم الهاتف او كلمة المرور غير صحيحة',
      '25': 'حدث خطآ غير متوقع',
      '26': 'تغيير الوضع',
      '27': 'البحث عن قسم',
      '28': 'عرض',
      '29': 'تمت العملية بنجاح',
      '30': 'تم اضافة المنتج الى سلة المشتريات',
      '31': 'انهاء الشراء',
      '32': 'العنصر موجود',
      '33': 'لقد قمت باضافة المنتج مسبقآ الى السلة',
      '34': 'المبلغ الكلي',
      '35': 'حذف الكل',
      '36': 'اختار طريقة الدفع',
      '37': 'يرجى اختيار طريقة الدفع الأكثر ملاءمة لك',
      '38': 'الدفع نقد',
      '39': 'بطاقة إئتمان',
      '40': 'الدفع بواسطة ابل',
      '41': 'الدفع بواسطة كوكل',
      '42': 'غير متوفرة',
      '43': 'طريقة الدفع غير متوفرة في الوقت الحالي',
      '44': 'التوصيل',
      '45': 'الدفع',
      '46': 'مراجعة',
      '47': 'المبلغ الاجمالي',
      '48': 'مبلغ التوصيل',
      '49': 'المبلغ الكلي',
      '50': 'ملخص الطلب',
      '51': 'التالي',
      '52': 'عودة',
      '53': 'الغاء',
      '54': 'الدفع',
      '55': 'تمت العملية بنجاح',
      '56': 'الاسم الكامل',
      '57': 'المحافظة',
      '58': 'العنوان',
      '59': 'اختر المحافظة',
      '60': 'المفضلة',
      '61': 'الاشعارات',
      '62': 'معلومات التوصيل',
      '63': 'الرجاء ادخال تفاصيلك بالكامل',
      '64': 'العودة الى الصفحة الرئيسية',
      '65': 'دفع',
      '66': 'يرجى ادخال جميع التفاصيل !',
      '67': 'حدث خطآ',
      '68': 'العملية فشلت',
      '69': 'الفواتير',
      '70': 'البحث عن فاتورة ...',
      '71': 'رقم الفاتورة',
      '72': 'عرض التفاصيل',
      '73': 'قيد التجهيز',
      '74': 'قيد التوصيل',
      '75': 'مكتملة',
      '76': 'فلترة',
      '77': 'عرض الاحدث',
      '78': 'عرض الاقدم',
      '79': 'تفاصيل الفاتورة',
      '80':'اقساطي',
      '81': 'عالـــــــــــم من \n ',
      '82': 'الخصومــات',
      '83': ' \n الغير منتهي',
      '84': 'من خلال تطبيق cbc للخصومات النقدية \n يمكنك التعرف على خصومات البطاقة \n المتوفر في المتاجر المنضمة',
      '85': 'عربي',
      '86': 'كوردى',
      '87': 'خصومات المتاجر',
      '88': 'بحث عن متجر ؟',
      '89': 'خصومات جديدة',
      '90': 'المزيد',
      '91': 'الآعلى خصومات',
      '92': 'المحافظــات',
      '93': 'اقسام متاجر',
      '94': 'المتاجر',
      '95': 'الخصم',
      '96': 'تفاصيل المتجر',
      '97': 'عن المتجر',
      '98': 'الخصومات',
      '99': 'الفروع',
      '100': 'الصور',
      '101': 'عروض حصرية',
      '102': 'لا توجد خصومات في الوقت الحالي',
      '103': 'لا توجد افرع في الوقت الحالي',
      '104': 'لا توجد صور في الوقت الحالي',
      '105': 'لا توجد عروض في الوقت االحالي',
      '106': 'عن البطاقة',
      '107': 'فئات البطاقة',
      '108': 'شراء البطاقة',
      '109': 'شكل البطاقة',
      '110': 'مميزات تصميم البطاقة',
      '111': 'ماذا تقدم البطاقة من خدمات وفوائد ؟',
      '112': 'فئات البطاقة وقيمة الاشتراك',
      '113': 'العروض على البطاقة لفترة محدودة',
      '114': 'الفئة',
      '115': 'قيمة الاشتراك',
      '116': 'يمكنك الان الحصول على بطاقة cbc للخصومات النقدية :',
      '117': 'الحجز المباشر',
      '118': 'الاتصال على الرقم التالي : ',
      '119': 'او من خلال موظفات المبيعات',
      '120': 'حسابي',
      '121': 'تفعيل االبطاقة',
      '122': 'بطاقة غير فعالة',
      '123': 'بطاقة فعالة',
      '124': 'يرجى تفعيل بطاقة cbc لتتمكن من الحصول على خصومات المتاجر من خلال خانة  ',
      '125': 'عند استلام بطاقة cbc للخصومات النقدية الخاصة بك',
      '126': 'يرجى ادخال رقم بطاقة cbc : ',
      '127': 'رقم البطاقة',
      '128': 'تحديث البطاقة',
      '129': 'لم يتم العثور على البطاقة',
      '130': 'تمت تفعيل البطاقة بنجاح',
      '131': 'خدمة الزبائن',
      '132': 'تعليمات البطاقة',
      '133': 'مشاركة التطبيق',
      '134': 'يسعدنا خدمة زبائننا على مدار اليوم وطيلة الاسبوع 7/24 لاستلام كل استفساراتكم واسئلتكم التي تخص تطبيق وبطاقة cbc',
      '135': 'بآمكانك مراسلتنا على واتساب او الاتصال على الارقام التالية : ',
      '136': 'يرجى التواصل مع خدمة الزبائن عند حدوث اي مشكلة',
      '137': 'التعليمات لآستخدام بطاقة cbc',
      '138': 'لمعرفة كيفية استخدام بطاقة bcc لغرض حصولك على الخصم المقدم من المتاجر المشتركة فيها يرجى اتباع التالي: ',
      '139': 'نتمنى لكم تسوق ممتع مع خصومات نقدية مستحقة',
      '140': 'شارك التطبيق مع احبابك',
      '141': 'دع الاخرين يعرفون بالخصومات المقدمة من المتاجر من خلال تطبيقنا',
      '142': ' امسح رمز QR وسيتم فتح جميع روابط صفحات التواصل الاجتماعي وتحميل التطبيق على اجهزة الاندرويد والابل',
      '143': 'الفلترة',
      '144': 'من خلال نسبة الخصومات',
      '145': 'الاعلى خصومات',
      '146': 'الادنى خصومات',
      '147': 'عرض النتائج',
      '148': 'ترتيب',
      '149': 'المساعدة',
      '150': 'البطاقة',
      '151': 'الاشعارات',
      '152': 'ما الذي تبحث عنه ؟',
      '153': 'تسوق من الآكثر رواجآ',
      '154': 'الاعدادات',
      '155': 'تفاصيل المنتج',
      '156': 'الشركة المنتجة',
      '157': 'الموديل',
      '158': 'المميزات',
      '159': 'القسط الشهري',
      '160': 'دينار عراقي'

    },
    'ckb': {
      '0': 'بەرزکراوەکان',
      '1': 'تۆمارکردن',
      '2': 'بەخۆربێیت',
      '3': 'ژمارەی تەلەفۆن',
      '4': 'وشەی تێپەربو',
      '5': 'هەژمارەکەت ئێستا بکە',
      '6': 'تکایە زانیاریەکانت داخل بکە',
      '7': 'وشەی تێپەربو بپێشەوە',
      '8': 'لە ڕاستەوخۆی هەژمار دروستکردن، تۆ خۆتۆمار دەکەیت\nلەگەڵ شرایەت و پەیوەندی سیاسەتی ئایینی خۆماندا',
      '9': 'گەڕان بۆ بەرهەم ...',
      '10': 'بەشەکان',
      '11': 'هەموو ببینە',
      '12': 'جدیدترین بەرهەمەکان',
      '13': 'وشەی تێپەربوت بیرم بکە ؟',
      '14': 'سەرەکی',
      '15': 'بەشەکان',
      '16': 'گۆڕاو',
      '17': 'هەژمار',
      '18': 'دینار',
      '19': 'زیادکردن بۆ گۆڕانکاری',
      '20': 'هیچ زانیاریەک نییە',
      '21': 'پەیوەندی بکە',
      '22': 'زمان بگۆڕە',
      '23': 'دەرچوون',
      '24': 'ژمارەی تەلەفۆن یان وشەی تێپەربو هەڵەیە',
      '25': 'هەڵەیەکی ناپێویست هەیە',
      '26': 'گۆڕینی شوێن',
      '27': 'بگەڕێ بۆ بەشێک',
      '28': 'پیشاندان',
      '29': 'کارگێری بە سەرکەوتوویی',
      '30': 'بەرزی گۆڕانکاری دابنێ لە کۆمەڵگەری',
      '31': 'کردنەوەی کاری کراو',
      '32': 'ئەنجامەکان هەیە',
      '33': 'پێشتر بەرزیت زیادکردووە بۆ گۆڕانکاری',
      '34': 'کۆی گشتی',
      '35': 'سڕینەوەی هەموو',
      '36': 'هەڵبژاردنی شێوازی پارەدان',
      '37': 'تکایە شێوازی پارەدانی بەرزیت هەڵبژێرە',
      '38': 'پارەدانی ناقد',
      '39': 'کارتی کرێدیت',
      '40': 'پارەدان لەلایەن ئاپڵ',
      '41': 'پارەدان لەلایەن گووگڵ',
      '42': 'بەردەست نییە',
      '43': 'شێوازی پارەدان نییە لە ئێستادا',
      '44': 'ئەنجام',
      '45': 'پارەدان',
      '46': 'بچووکردن',
      '47': 'کۆی گشتی',
      '48': 'کۆی بچووککردن',
      '49': 'کۆی گشتی',
      '50': 'کورتەیی کار',
      '51': 'دواتر',
      '52': 'گەڕانەوە',
      '53': 'پاشگەزبوونەوە',
      '54': 'پارەدان',
      '55': 'کاری گۆڕانکاری بە سەرکەوتوویی',
      '56': 'ناوی تەواو',
      '57': 'پارێزگا',
      '58': 'ناونیشان',
      '59': 'پارێزگا هەڵبژێرە',
      '60': 'دلخواز',
      '61': 'ئاگاداریەکان',
      '62': 'زانیاریەکانی پێکهاتوو',
      '63': 'تکایە زانیاریەکانی تۆ پڕ بکە',
      '64': 'گەڕانەوە بۆ ماڵەوەی سەرەکی',
      '65': 'پارەدان',
      '66': 'تکایە هەموو زانیاریەکان بنووسە !',
      '67': 'هەڵەیەک ڕویدا',
      '68': 'کارەکە بە شکست دۆزرایەوە',
      '69': 'فاتورەکان',
      '70': 'گەڕان بۆ فاتورە ...',
      '71': 'ژمارەی فاتورە',
      '72': 'پیشاندانی وردەکاریەکان',
      '73': 'ئەنجامدراوە',
      '74': 'لە بەرەوپێشی',
      '75': 'وازووتراوە',
      '76': 'فلتەرکردن',
      '77': 'نیشاندانی نوێترین',
      '78': 'نیشاندانی کۆنترین',
      '79': 'زانیاریەکانی فاتورە',
      '80': 'قساطەکانم',
      '81': 'جیهانێکی \n ',
      '82': 'خەسەکان',
      '83': ' \n ناوەخۆی',
      '84': 'لە ڕاستەوخۆی ئەپڵیکەیشنی cbc بۆ خەسەکانی ناقد',
      '85': 'عەرەبی',
      '86': 'کوردی',
      '87': 'خەسەکانی دوکانەکان',
      '88': 'گەڕان بۆ دوکان ؟',
      '89': 'خەسەکانی نوێ',
      '90': 'زیاتر',
      '91': 'خەسەکانی زۆرترین',
      '92': 'پارێزگاکان',
      '93': 'بەشەکانی دوکان',
      '94': 'دوکانەکان',
      '95': 'خەسەکان',
      '96': 'زانیاریەکانی دوکان',
      '97': 'دەربارەی دوکان',
      '98': 'خەسەکان',
      '99': 'شوارەکان',
      '100': 'وێنەکان',
      '101': 'پاڵپشتی خوشخۆشیەکان',
      '102': 'هیچ خەسەکانی ئێستا نییە',
      '103': 'هیچ شوارەکانی ئێستا نییە',
      '104': 'هیچ وێنەکانی ئێستا نییە',
      '105': 'هیچ پاڵپشتیەکانی ئێستا نییە',
      '106': 'دەربارەی کارت',
      '107': 'پۆلەکانی کارت',
      '108': 'کارتی کڕین',
      '109': 'شێوازی کارت',
      '110': 'تایبەتمەندیەکانی شێوازی کارت',
      '111': 'کراییاتی کارت و خزمەتگوزاریەکانی ئەنجام دەدرێت ؟',
      '112': 'پۆلەکانی کارت و قیمەتی بەرزترین خشتەیی',
      '113': 'پۆلەکانی کارت بۆ فراوانی کاتی کۆتایی',
      '114': 'بەرپرس',
      '115': 'قیمەتی بەرپرسکردن',
      '116': 'ئێستا دەتوانیت کارتی کاری cbc بەدەستبێنیت :',
      '117': 'رزروکردن',
      '118': 'پەیوەندی بکە بە ژمارەی خوێندنەوە : ',
      '119': 'یان لەگەڵ بەژدارییەکانی فرۆشگا',
      '120': 'هەژمارەکەم',
      '121': 'چالاککردنی کارت',
      '122': 'کارتی ناچالاک',
      '123': 'کارتی چالاک',
      '124': 'تکایە کارتی cbc بچالاک بکە بۆ ئەوەی دەتوانی خەسەکانی دوکان لە ڕێگای خانە بخوێنیت ',
      '125': 'لە کاتی بدووچاوە دەستی ئەپڵیکەیشنی cbc بەدەستت بگرە',
      '126': 'تکایە ژمارەی کارتی cbc بنووسە : ',
      '127': 'ژمارەی کارت',
      '128': 'نوێکردنەوەی کارت',
      '129': 'کارت پەیدان نەکرا',
      '130': 'کارت بە سەرکەوتوویی چالاککرا',
      '131': 'خدمەتگوزارییەکان',
      '132': 'ئامێری کارت',
      '133': 'بەڵامەکانی ئەپڵیکەیشن پێوەکراو',
      '134': 'خوشخۆشترین خزمەتگوزاری لە هەر شۆقی ئەو شۆقەدایە',
      '135': 'دەتوانیت پەیوەندی بکەیت بە واتساپ یان پەیوەندی بکەیت بە ژمارەکانی خوارەوە : ',
      '136': 'تکایە پاشکەوتکردنی پەیوەندیدان بە خدمەتگوزارییەکان هەنگاوبکات',
      '137': 'ئامێری بەکارهێنانی کارتی cbc',
      '138': 'بۆ زانینی چۆنیەتی بەکارهێنانی کارتی bcc بۆ ئەوەی دەتوانی خاوەندێک بکەی خاوەندەکانی دوکاندا بە پاراستن',
      '139': 'بۆت دەتوانیت کۆشتی خۆشی داشتوان بکەی بە کاردنی هەموو خەسەکانی ناقد',
      '140': 'هاوبەشی ئەپڵیکەیشن بە هاوڕێکانت بکە',
      '141': 'بەڵامەکانی خەسەکان بگۆرە کە خاوەندەکانی ئەپڵیکەیشنماندا پێناو دەکەین',
      '142': 'پارتی QR چاپ بکە و هەموو پەیوەندیدانەکانی شارەکەت بەرزبکەوە و ئەپڵیکەیشنی ئاندرۆید و ئایفۆن دابگرەوە',
      '143': 'فلتەرکردن',
      '144': 'لە رێگای نرخی خەسەکان',
      '145': 'زۆرترین نرخ',
      '146': 'کەمترین نرخ',
      '147': 'پیشاندانی ئەنجامەکان',
      '148': 'ڕیزکردن',
      '149': 'یارمەتی',
      '150': 'کارت',
      '151': 'الاشعارات',
      '152': 'ما الذي تبحث عنه ؟',
      '153': 'تسوق من الآكثر رواجآ',
      '154': 'الاعدادات',
      '155': 'تفاصيل المنتج',
      '156': 'الشركة المنتجة',
      '157': 'الموديل',
      '158': 'المميزات',
      '159': 'القسط الشهري',
      '160': 'دينار عراقي'



    }
  };
}