<p align="center">
<img src="https://user-images.githubusercontent.com/3329008/112176051-657fac80-8c15-11eb-87c1-d48fa0942392.png" /> + 
<img src="https://user-images.githubusercontent.com/3329008/114268585-0abcc200-9a17-11eb-97f7-838c9c8c6660.png" />
</p>
<p align="center">
  <a href="https://packagist.org/packages/pejmankheyri/whmcs-irnic"><img src="https://poser.pugx.org/pejmankheyri/whmcs-irnic/v/stable" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/pejmankheyri/whmcs-irnic"><img src="https://img.shields.io/packagist/dt/pejmankheyri/whmcs-irnic" alt="Total Downloads"></a>
  <a href="https://packagist.org/packages/pejmankheyri/whmcs-irnic"><img src="https://poser.pugx.org/pejmankheyri/whmcs-irnic/d/monthly" alt="Monthly Downloads"></a>
<a href="https://packagist.org/packages/pejmankheyri/whmcs-irnic"><img src="https://img.shields.io/github/license/pejmankheyri/whmcs-irnic" alt="License"></a>
</p>
<div dir="rtl">

# ماژول مدیریت دامنه ir برای نماینده های irnic جهت استفاده در سیستم WHMCS

 یک افزونه کاربردی برای سیستم مدیریت هاستینگ WHMCS می باشد که نمایندگان سامانه irnic را قادر می سازد تا براحتی اقدام به ارتباط با nic.ir کرده و تمامی امکانات و اتوماسیون ها را داشته باشند.

## نصب

* محتویات پوشه `WHMCS-IRNIC` را در مسیر اصلی پروژه اوپن کارت کپی کنید.
* افزونه را از طریق منوی `افزونه ها` فعال کنید.
* [تنظیمات افزونه را انجام دهید.](https://github.com/pejmankheyri/WHMCS-IRNIC#%D8%AA%D9%86%D8%B8%DB%8C%D9%85%D8%A7%D8%AA)

## امکانات

* امکان ثبت دامنه ir برای تمامی انواع پسوند های موجود در سامانه
* امکان انتقال، تمدید، قفل و حذف دامنه های ir
* مدیریت تمامی رابط های ممکن در سیستم توسط کاربر و در غیراینصورت توسط شرکت
* ثبت شناسه جدید بدون واسطه برای تمامی کاربری های ممکن در سیستم
* مشاهده لیست درخواست های ارسال شده
* مدیریت لیست درخواست های ارسال شده
* مدیریت poll request ها برای اتوماسیون درخواست های سیستم نیک
* لاگ کردن تمامی اتفاقات رخ داده در ماژول
* قابلیت sync کردن اطلاعات دامنه در پنل ادمین
* قابلیت cron job برای مدیریت poll request ها
* صفحات مجزا برای ثبت شناسه ایرنیک که در مسیر اصلی ماژول با عبارت irnic- شروع می شوند که می توانید در بخش کاربری از این صفحات استفاده کنید.

## تنظیمات

* فایل زیپ گواهی که از سامانه نیک دریافت کرده اید را اکسترکت کرده و به مسیر `modules/registrars/irnic/` آپلود کنید.
* فایل `modules/registrars/irnic/functions.php` را باز کنید و عبارات توکن و شناسه و عنوان فایل گواهی را داخل تابع __construct در ابتدای فایل و در جای مشخص شده وارد نمایید.
* فایل `modules/registrars/irnic/Poll.php` را باز کنید و تنظیمات پایگاه داده سیستم خود را در ابتدای فایل و در متغیر های نام پایگاه داده، نام کاربری و رمزعبور وارد نمایید.
* فایل `modules/registrars/irnic/poll_cron.php` را در cron job سیستم خود بصورت روزانه تنظیم کنید

## کمک به توسعه

از Pull request ها استقبال می کنیم.

برای تغییرات عمده ، لطفاً ابتدا یک issue را باز کنید تا در مورد آنچه می خواهید تغییر دهیم و بحث کنیم.

## لایسنس

MIT

</div>