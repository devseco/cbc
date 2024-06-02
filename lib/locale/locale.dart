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
      '111': 'ماذا تقم البطاقة من خدمات وفوائد ؟',
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




    },
    'en': {
      '0': 'Seco Store',
      '1':'Login',
      '2':'Welcome',
      '3':'Phone',
      '4':'Password',
      '5':'Register Now',
      '6': 'Plase Enter Your Details',
      '7': 'Remember Me',
      '8': 'By creating an account, you agree to our\nTerms of Service and Privacy Policy',
      '9': 'Search for products ...',
      '10': 'Categories',
      '11': 'view all',
      '12': 'Recently Products',
      '13': 'Forgot Password ? ',
      '14': "Home",
      '15': "Categories",
      '16': "Cart",
      '17': "Account",
      '18': 'IQD',
      '19': 'Add To Cart',
      '20': 'There is not data',
      '21': 'Contact us',
      '22': 'Change Language',
      '23': 'Logout',
      '24': 'Phone or Password is Incurrect',
      '25': 'An unexpected error occurred',
      '26': 'Change Mode',
      '27': 'Search For Category ...',
      '28': 'Offer',
      '29': 'Successfully',
      '30': 'Add To Cart is Success',
      '31': 'Check Out',
      '32': 'Already exists',
      '33': 'You have already added the product to the cart',
      '34': 'Total Price ',
      '35': 'Clear All',
      '36': 'Choose a payment method',
      '37': 'Plase select a payment method most convenient to you',
      '38': 'Cash',
      '39': 'Credit Card',
      '40': 'Apple pay',
      '41': 'Google pay',
      '42': 'Ops!',
      '43': 'Payment method is not available at this time',
      '44': 'Delivery',
      '45': 'Payment',
      '46': 'Review',
      '47': 'SubTotal',
      '48': 'Delivery',
      '49': 'Total',
      '50': 'Order Summary',
      '51': 'Next',
      '52': 'Back',
      '53': 'Cancel',
      '54': 'Checkout',
      '55': 'Payment Successfully',
      '56': 'Full Name',
      '57': 'City',
      '58': 'Address',
      '59': 'Select City',
      '60': 'Favorites',
      '61': 'Notifications',
      '62': 'Delivery details',
      '63': 'Please enter your full details',
      '64': 'Back To Home',
      '65': 'Pay',
      '66': 'Please enter all details !',
      '67': 'Enter Details',
      '68': 'Payment Failed',
      '69': 'Billing',
      '70': 'Search For Bills ...',
      '71': 'Bill ID',
      '72': 'View Details',
      '73': 'Processing',
      '74': 'Delivery',
      '75': 'Completed',
      '76': 'Filter',
      '77': 'View the latest',
      '78': 'View the oldest',
      '79': 'Bill Details',
      '80': 'اقساطي',
      '81': 'عالـــــــــــم من \n ',
      '82': 'الخصومــات',
      '83': ' \n الغير منتهية',
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
      '111': 'ماذا تقم البطاقة من خدمات وفوائد ؟',
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
      '124': 'يرجى تفعيل بطاقة cbc لتتمكن من الحصول على خصومات المتاجر من خلال خانة',
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
      '141': 'دع الاخرين يعرفون بالخصومات النقدية المقدمة من المتاجر من خلال تطبيقنا',
      '142': ' امسح رمز QR وسيتم فتح جميع روابط صفحات التواصل الاجتماعي وتحميل التطبيق على اجهزة الاندرويد والابل',
      '143': 'الفلترة',
      '144': 'من خلال نسبة الخصومات',
      '145': 'الاعلى خصومات',
      '146': 'الادنى خصومات',
      '147': 'عرض النتائج',
      '148': 'ترتيب',









    }
  };
}