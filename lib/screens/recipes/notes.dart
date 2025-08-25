import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher'ı import edin

class Notes extends StatelessWidget {
  const Notes({super.key});

  // URL'leri açmak için yardımcı bir metot
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // Kullanıcıya bir hata mesajı gösterebilirsiniz
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    // general_note1 için metin parçalarını ve linkleri hazırlayın
    // Bu URL'leri gerçek ve doğru kaynak URL'leri ile değiştirdiğinizden emin olun.
    const String usdaUrl = 'https://fdc.nal.usda.gov/';
    const String sydneyGiDbUrl =
        'https://glycemicindex.com/'; // Örnek URL, doğru olanı bulun.

    String note1Text = LocaleKeys.general_note1.tr();
    String part1 = note1Text.substring(
      0,
      note1Text.indexOf("USDA FoodData Central"),
    );
    String linkText1 = "USDA FoodData Central";
    String part2 = note1Text.substring(
      note1Text.indexOf("USDA FoodData Central") + linkText1.length,
      note1Text.indexOf("University of Sydney GI Database"),
    );
    String linkText2 = "University of Sydney GI Database";
    String part3 = note1Text.substring(
      note1Text.indexOf("University of Sydney GI Database") + linkText2.length,
    );

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${LocaleKeys.general_notes.tr()}:",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // general_note1 için RichText kullanarak linkli yapı
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      height: 1.4,
                      color: Colors.black87,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: part1),
                      TextSpan(
                        text: linkText1,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL(usdaUrl);
                          },
                      ),
                      TextSpan(text: part2),
                      TextSpan(
                        text: linkText2,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL(sydneyGiDbUrl);
                          },
                      ),
                      TextSpan(text: part3),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          _buildNoteItem(context, LocaleKeys.general_note2.tr()),
          const SizedBox(height: 4),
          _buildNoteItem(context, LocaleKeys.general_note3.tr()),
          const SizedBox(height: 4),
          _buildNoteItem(context, LocaleKeys.general_note4.tr()),
        ],
      ),
    );
  }

  Widget _buildNoteItem(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(height: 1.4, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
