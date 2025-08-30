import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/core/enums/premium_duration_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/provider/premium_provider.dart';
import 'package:heart_rate/provider/revenuecat.dart';
import 'package:heart_rate/screens/premium/components/android_cancel.dart';
import 'package:heart_rate/screens/premium/components/custom_elevated_button.dart';
import 'package:heart_rate/screens/premium/components/detail_buttons.dart';
import 'package:heart_rate/screens/premium/components/paywall_option.dart';
import 'package:heart_rate/screens/premium/components/special_offer_screen.dart';
import 'package:line_icons/line_icons.dart';

import 'package:provider/provider.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; // LineIcons için import

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key, this.listPackages});

  final List<Package>? listPackages;

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  Package? packageWeekly;
  Package? packageLifetime;
  bool _button = false;

  @override
  void initState() {
    super.initState();
    // 5 saniye sonra kapatma butonunu göster
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _button = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.listPackages != null && widget.listPackages!.length >= 2) {
      packageWeekly =
          widget.listPackages![1]; // Varsayım: Haftalık ikinci sırada
      packageLifetime = widget.listPackages![0]; // Varsayım: Ömürlük ilk sırada
    } else {
      packageWeekly = context.watch<RevenueCatProvider>().packageWeekly;
      packageLifetime = context.watch<RevenueCatProvider>().packageLifetime;
    }

    return Scaffold(
      body: riverpod.Consumer(
        builder: (context, ref, child) {
          // final state = ref.watch(premiumProvider); // Bu state'i şimdilik kullanmıyoruz
          return Stack(
            children: [
              Platform.isIOS
                  ? buildIOSLayout(context)
                  : buildAndroidScrollableLayout(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, IconData icon, String title) {
    // Bu metot resim üzerindeki özellikler için kullanılacak
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ), // Sadece dikey padding
      child: Row(
        mainAxisSize: MainAxisSize
            .min, // Önemli: Row'un genişliği içeriğine göre ayarlanır

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // İkon için sabit genişlikli bir container - tüm ikonlar dikey bir çizgide olacak
          SizedBox(
            width: 40, // Sabit genişlik (tüm ikonlar için aynı)
            child: Icon(icon, color: Colors.black, size: 26),
          ),
          const SizedBox(width: 8), // İkon ve metin arası boşluk
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: Device.screenType == ScreenType.tablet ? 30 : 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIOSLayout(BuildContext context) {
    final topSafeArea = MediaQuery.of(context).padding.top;
    const double topElementsHeight =
        48.0; // Logo ve buton için yaklaşık yükseklik
    const double spacingAfterTopElements =
        8.0; // Logo/buton ve başlıklar arası boşluk

    return Column(
      children: [
        // 1. ÜST KISIM: Logo, Kapatma Butonu ve Başlıklar (Beyaz Arka Plan)
        Container(
          color: Theme.of(
            context,
          ).scaffoldBackgroundColor, // Beyaz veya tema rengi
          padding: EdgeInsets.only(
            top: topSafeArea, // Genel üst boşluk
            left: 16, // Kapsayıcı için sol genel boşluk
            right: 16, // Kapsayıcı için sağ genel boşluk
            bottom: 20, // Başlıklar ve resimli alan arası boşluk
          ),
          child: Stack(
            children: [
              // Logo - Ortada, Kapatma Butonu ile aynı hizada
              Positioned(
                top: 0, // Stack'in üstü
                left: 0,
                right: 0,
                height:
                    topElementsHeight, // Dikey hizalama için yükseklik veriyoruz
                child: Center(
                  // Resmi yatayda ortalar
                  child: Image.asset(
                    'assets/logo/glycemic_index.png', // Resminizin doğru yolunu belirtin
                    height: 28, // Logonun yüksekliğini ayarlayın
                    // fit: BoxFit.contain, // İsteğe bağlı
                  ),
                ),
              ),

              // Kapatma butonu - Sağ üste konumlandırılmış
              if (_button)
                Positioned(
                  top: 0, // Stack'in üstü
                  right: 0, // Stack'in sağı
                  child: SizedBox(
                    width: topElementsHeight, // Genişlik ve yükseklik aynı
                    height: topElementsHeight,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey.shade300,
                        size: 28,
                      ),
                      onPressed: () {
                        _showSpecialOfferDialog(context);
                      },
                      tooltip: MaterialLocalizations.of(
                        context,
                      ).closeButtonTooltip,
                    ),
                  ),
                ),

              // Başlıklar - Logo ve Kapatma Butonunun Altında, Ortalanmış
              Padding(
                // Başlıkları logo/buton satırının altına ittiriyoruz
                padding: const EdgeInsets.only(
                  top: topElementsHeight + spacingAfterTopElements,
                ),
                child: Center(
                  // Başlık Column'unu yatayda ortalamak için
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // Metinleri kendi içinde ortalar
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        LocaleKeys.paywall_title.tr(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConst.kDefaultEdgeInsets,
                        ),
                        child: Text(
                          LocaleKeys.paywall_subtitle.tr(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.color,
                                height: 1.2,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 2. ORTA KISIM: Resim ve Özellikler (Resim Arka Plan, Beyaz Metin)
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/logo/paywall.png', // Resminizin doğru yolunu belirtin
                fit: BoxFit.cover, // Resmi kaplayacak şekilde ayarla
              ),
              Container(
                color: Colors.white.withValues(alpha: 0.40), // Karartma efekti
              ),
              Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12,
                    ), // Dikey padding de eklendi
                    child: Center(
                      child: Column(
                        // mainAxisSize:
                        //     MainAxisSize.min, // İçerik kadar yer kapla
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        // // crossAxisAlignment: CrossAxisAlignment
                        // //     .start, // ÖNEMLİ: Bu satır eklendi/güncellendi
                        children: [
                          _buildFeatureItem(
                            context,
                            LineIcons.comments,
                            LocaleKeys.paywall_text_1.tr(),
                          ),
                          _buildFeatureItem(
                            context,
                            LineIcons.bookOpen,
                            LocaleKeys.paywall_text_2.tr(),
                          ),
                          _buildFeatureItem(
                            context,
                            LineIcons.barChart,
                            LocaleKeys.paywall_text_3.tr(),
                          ),
                          _buildFeatureItem(
                            context,
                            LineIcons.infinity,
                            LocaleKeys.paywall_text_4.tr(),
                          ),
                          _buildFeatureItem(
                            context,
                            LineIcons.pieChart,
                            LocaleKeys.paywall_text_5.tr(),
                          ),
                          _buildFeatureItem(
                            context,
                            LineIcons.plusSquare,
                            LocaleKeys.paywall_text_6.tr(),
                          ),
                          _buildFeatureItem(
                            context,
                            LineIcons.ban,
                            LocaleKeys.paywall_text_7.tr(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 3. ALT KISIM: Satın Alma Seçenekleri ve Butonlar
        riverpod.Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(premiumProvider);
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PaywallOption(
                      label: LocaleKeys.premium_lifetime.tr(),
                      subtitle: LocaleKeys.premium_onetime.tr(),
                      price: packageLifetime?.storeProduct.priceString ?? '...',
                      isBestSeller: true,
                      isSelected:
                          state.indexSelected ==
                          PremiumDurationEnum.lifetime.value,
                      onPressed: () =>
                          ref.read(premiumProvider.notifier).setPage(0),
                    ),
                    const SizedBox(height: AppConst.kDefaultPadding / 2),
                    PaywallOption(
                      label: LocaleKeys.premium_weekly.tr(),
                      subtitle: LocaleKeys.paywall_try_text.tr(),
                      price: packageWeekly?.storeProduct.priceString ?? '...',
                      isBestSeller: false,
                      isSelected:
                          state.indexSelected ==
                          PremiumDurationEnum.weekly.value,
                      onPressed: () =>
                          ref.read(premiumProvider.notifier).setPage(1),
                    ),
                    const SizedBox(height: AppConst.kDefaultPadding),
                    CustomElevatedButton(widget.listPackages),
                    const DetailButtons(),
                    if (Platform.isAndroid) // Bu kısım iOS'ta görünmeyecek
                      const AndroidCancel()
                    else
                      const SizedBox(height: 10), // iOS için altta biraz boşluk
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Android için tüm sayfayı kaydırılabilir yapıyoruz
  Widget buildAndroidScrollableLayout(BuildContext context) {
    final topSafeArea = MediaQuery.of(context).padding.top;
    const double topElementsHeight = 48.0;
    const double spacingAfterTopElements = 8.0;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Header section with logo and close button
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.only(
              top: topSafeArea,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            child: Stack(
              children: [
                // Logo - Centered
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: topElementsHeight,
                  child: Center(
                    child: Image.asset(
                      'assets/logo/glycemic_index.png',
                      height: 28,
                    ),
                  ),
                ),

                // Close button - Top right
                Positioned(
                  top: 0,
                  right: 0,
                  child: SizedBox(
                    width: topElementsHeight,
                    height: topElementsHeight,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey.shade300,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      tooltip: MaterialLocalizations.of(
                        context,
                      ).closeButtonTooltip,
                    ),
                  ),
                ),

                // Title and subtitle
                Padding(
                  padding: const EdgeInsets.only(
                    top: topElementsHeight + spacingAfterTopElements,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          LocaleKeys.paywall_title.tr(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.color,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConst.kDefaultEdgeInsets,
                          ),
                          child: Text(
                            LocaleKeys.paywall_subtitle.tr(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.color,
                                  height: 1.2,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Features section with background image
          SizedBox(
            height:
                MediaQuery.of(context).size.height *
                0.36, // Fixed height for feature section
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/logo/paywall.png', fit: BoxFit.cover),
                Container(color: Colors.white.withValues(alpha: 0.40)),
                Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 12,
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildFeatureItem(
                              context,
                              LineIcons.comments,
                              LocaleKeys.paywall_text_1.tr(),
                            ),
                            _buildFeatureItem(
                              context,
                              LineIcons.bookOpen,
                              LocaleKeys.paywall_text_2.tr(),
                            ),
                            _buildFeatureItem(
                              context,
                              LineIcons.barChart,
                              LocaleKeys.paywall_text_3.tr(),
                            ),
                            _buildFeatureItem(
                              context,
                              LineIcons.infinity,
                              LocaleKeys.paywall_text_4.tr(),
                            ),
                            _buildFeatureItem(
                              context,
                              LineIcons.pieChart,
                              LocaleKeys.paywall_text_5.tr(),
                            ),
                            _buildFeatureItem(
                              context,
                              LineIcons.plusSquare,
                              LocaleKeys.paywall_text_6.tr(),
                            ),
                            _buildFeatureItem(
                              context,
                              LineIcons.ban,
                              LocaleKeys.paywall_text_7.tr(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Payment options section
          riverpod.Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(premiumProvider);
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PaywallOption(
                        label: LocaleKeys.premium_lifetime.tr(),
                        subtitle: LocaleKeys.premium_onetime.tr(),
                        price:
                            packageLifetime?.storeProduct.priceString ?? '...',
                        isBestSeller: true,
                        isSelected:
                            state.indexSelected ==
                            PremiumDurationEnum.lifetime.value,
                        onPressed: () =>
                            ref.read(premiumProvider.notifier).setPage(0),
                      ),
                      const SizedBox(height: AppConst.kDefaultPadding / 2),
                      PaywallOption(
                        label: LocaleKeys.premium_weekly.tr(),
                        subtitle: LocaleKeys.paywall_try_text.tr(),
                        price: packageWeekly?.storeProduct.priceString ?? '...',
                        isBestSeller: false,
                        isSelected:
                            state.indexSelected ==
                            PremiumDurationEnum.weekly.value,
                        onPressed: () =>
                            ref.read(premiumProvider.notifier).setPage(1),
                      ),
                      const SizedBox(height: AppConst.kDefaultPadding),
                      CustomElevatedButton(widget.listPackages),
                      const DetailButtons(),
                      const AndroidCancel(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Row buildRow(String title) {
    return Row(
      children: [
        const Icon(LineIcons.checkCircle),
        const SizedBox(width: 4),
        AutoSizeText(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _showSpecialOfferDialog(BuildContext context) async {
    // SpecialOfferScreen'in kapanmasını bekle.
    // Bu, MaterialPageRoute'un döndürdüğü Future'ı await ederek yapılır.
    await Navigator.push(
      context,
      MaterialPageRoute(
        // SpecialOfferScreen'e, abonelik sonrası Paywall'u kapatması
        // gerektiğini bildiren bir callback veriyoruz.
        builder: (context) => SpecialOfferScreen(
          onOfferCompleted: () {
            // Bu callback, SpecialOfferScreen'in kendisini kapatmadan hemen önce
            // çağrılmalı. Bu sayede buraya bir değer dönebiliriz.
            // SpecialOfferScreen'de: Navigator.pop(context, true);
            Navigator.of(context).pop(true); // Abonelik başarılı, true döndür.
          },
        ),
      ),
    );

    // SpecialOfferScreen kapandıktan sonra bu kod çalışır.
    // Eğer abonelik başarılı olduysa (ve SpecialOfferScreen'den true döndüyse),
    // PaywallScreen'i de kapatarak ana ekrana dön.
    // Bu kontrol, kullanıcının abone olmadan geri tuşuna basması durumunda
    // Paywall'un kapanmasını engeller.
    //
    // NOT: Bu çözümün çalışması için SpecialOfferScreen'deki onOfferCompleted
    // callback'inin `Navigator.of(context).pop(true);` şeklinde çağrılması gerekir.
    // Eğer SpecialOfferScreen'den bir değer dönmüyorsa, bu kısım çalışmayacaktır.
    // Bu durumda en basit çözüm, koşulsuz olarak Paywall'u da kapatmaktır:
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
