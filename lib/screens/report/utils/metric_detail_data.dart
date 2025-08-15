import 'package:flutter/material.dart';

class MetricDetailData {
  static Map<String, dynamic> getStressLevelDetail(double stressLevel) {
    return {
      'title': 'Stress Level',
      'value': stressLevel,
      'unit': '/5',
      'status': _getStressStatus(stressLevel),
      'statusColor': _getStressColor(stressLevel),
      'description':
          'Stres seviyeniz kalp hızı değişkenliği analizi ile hesaplanmıştır. Bu değer günlük yaşamdaki stres yükünüzü 5 üzerinden gösterir.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '1.0 - 2.0',
          'color': Colors.green,
          'min': 1.0,
          'max': 2.0,
        },
        {
          'label': 'Normal',
          'range': '2.1 - 3.5',
          'color': Colors.orange,
          'min': 2.1,
          'max': 3.5,
        },
        {
          'label': 'Yüksek',
          'range': '3.6 - 5.0',
          'color': Colors.red,
          'min': 3.6,
          'max': 5.0,
        },
      ],
      'interpretation': _getStressInterpretation(stressLevel),
      'recommendations': _getStressRecommendations(stressLevel),
    };
  }

  static Map<String, dynamic> getEnergyLevelDetail(double energyLevel) {
    return {
      'title': 'Energy Level',
      'value': energyLevel,
      'unit': '/5',
      'status': _getEnergyStatus(energyLevel),
      'statusColor': _getEnergyColor(energyLevel),
      'description':
          'Enerji seviyeniz HRV analizi ve kalp hızı verilerine dayanarak hesaplanmıştır. Bu değer genel vitalite durumunuzu 5 üzerinden gösterir.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '1.0 - 2.0',
          'color': Colors.red,
          'min': 1.0,
          'max': 2.0,
        },
        {
          'label': 'Normal',
          'range': '2.1 - 3.5',
          'color': Colors.orange,
          'min': 2.1,
          'max': 3.5,
        },
        {
          'label': 'Yüksek',
          'range': '3.6 - 5.0',
          'color': Colors.green,
          'min': 3.6,
          'max': 5.0,
        },
      ],
      'interpretation': _getEnergyInterpretation(energyLevel),
      'recommendations': _getEnergyRecommendations(energyLevel),
    };
  }

  static Map<String, dynamic> getPhysicalTensionDetail(double tensionLevel) {
    return {
      'title': 'Physical Tension',
      'value': tensionLevel,
      'unit': '/5',
      'status': _getTensionStatus(tensionLevel),
      'statusColor': _getTensionColor(tensionLevel),
      'description':
          'Fiziksel gerginlik seviyeniz kalp hızı değişkenliği ve nabız düzensizliği analizi ile belirlenmektedir. Bu değer 5 üzerinden gösterilir.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '1.0 - 2.0',
          'color': Colors.green,
          'min': 1.0,
          'max': 2.0,
        },
        {
          'label': 'Normal',
          'range': '2.1 - 3.5',
          'color': Colors.orange,
          'min': 2.1,
          'max': 3.5,
        },
        {
          'label': 'Yüksek',
          'range': '3.6 - 5.0',
          'color': Colors.red,
          'min': 3.6,
          'max': 5.0,
        },
      ],
      'interpretation': _getTensionInterpretation(tensionLevel),
      'recommendations': _getTensionRecommendations(tensionLevel),
    };
  }

  static Map<String, dynamic> getHRVScoreDetail(double hrvScore) {
    return {
      'title': 'HRV Score',
      'value': hrvScore,
      'unit': '/100',
      'status': _getHRVScoreStatus(hrvScore),
      'statusColor': _getHRVScoreColor(hrvScore),
      'description':
          'HRV skoru kalp hızı değişkenliğinizin genel değerlendirmesidir. Yüksek skor daha iyi otonomik sinir sistemi dengesini gösterir.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '0 - 40',
          'color': Colors.red,
          'min': 0.0,
          'max': 40.0,
        },
        {
          'label': 'Normal',
          'range': '41 - 70',
          'color': Colors.orange,
          'min': 41.0,
          'max': 70.0,
        },
        {
          'label': 'Yüksek',
          'range': '71 - 100',
          'color': Colors.green,
          'min': 71.0,
          'max': 100.0,
        },
      ],
      'interpretation': _getHRVScoreInterpretation(hrvScore),
      'recommendations': _getHRVScoreRecommendations(hrvScore),
    };
  }

  static Map<String, dynamic> getSDNNDetail(double sdnn) {
    return {
      'title': 'SDNN',
      'value': sdnn,
      'unit': 'ms',
      'status': _getSDNNStatus(sdnn),
      'statusColor': _getSDNNColor(sdnn),
      'description':
          'SDNN\'niz beklenenden düşük, bu da otonom sinir sisteminiz üzerinde artan stres olduğunu gösteriyor. Rahatlama tekniklerine odaklanın ve yeterli dinlenme ve iyileşmeye öncelik verin.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '0 - 115 ms',
          'color': Colors.blue,
          'min': 0.0,
          'max': 115.0,
        },
        {
          'label': 'Normal',
          'range': '116 - 176 ms',
          'color': Colors.green,
          'min': 116.0,
          'max': 176.0,
        },
        {
          'label': 'Yüksek',
          'range': '> 176 ms',
          'color': Colors.orange,
          'min': 177.0,
          'max': 300.0,
        },
      ],
      'interpretation':
          'SDNN (Standard Deviation of NN intervals) kalp atım aralıklarının standart sapmasıdır. Otonomik sinir sistemi aktivitesinin genel bir göstergesidir.',
      'recommendations': [
        'Düzenli derin nefes egzersizleri yapın',
        'Meditasyon veya mindfulness teknikleri uygulayın',
        'Kaliteli uyku alın (7-9 saat)',
        'Kafein alımını azaltın',
        'Düzenli hafif egzersiz yapın',
        'Stres kaynaklarını belirlemeye çalışın',
      ],
    };
  }

  static Map<String, dynamic> getRMSSDDetail(double rmssd) {
    return {
      'title': 'RMSSD',
      'value': rmssd,
      'unit': 'ms',
      'status': _getRMSSDStatus(rmssd),
      'statusColor': _getRMSSDColor(rmssd),
      'description':
          'Düşük RMSSD, vücudunuzun strese girdiğini veya etkili bir şekilde iyileşmediğini gösterebilir. Yüksek iş yükünü azaltmaya, hafif fiziksel aktivite yapmaya ve yeterli dinlenmeyi sağlamaya odaklanın.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '0 - 24 ms',
          'color': Colors.blue,
          'min': 0.0,
          'max': 24.0,
        },
        {
          'label': 'Normal',
          'range': '25 - 50 ms',
          'color': Colors.green,
          'min': 25.0,
          'max': 50.0,
        },
        {
          'label': 'Yüksek',
          'range': '> 50 ms',
          'color': Colors.orange,
          'min': 51.0,
          'max': 100.0,
        },
      ],
      'interpretation':
          'RMSSD parasempatik sinir sistemi aktivitesinin önemli bir göstergesidir. Kalp hızı değişkenliğinin kısa vadeli bileşenini yansıtır.',
      'recommendations': [
        'Parasempatik aktiviteyi artıran aktiviteler yapın',
        'Yoga veya tai chi gibi sakin egzersizler',
        'Düzenli meditasyon pratiği',
        'Sıcak banyo veya duş alın',
        'Klasik müzik dinleyin',
        'Doğada zaman geçirin',
      ],
    };
  }

  static Map<String, dynamic> getPNN50Detail(double pnn50) {
    return {
      'title': 'PNN50',
      'value': pnn50,
      'unit': '%',
      'status': _getPNN50Status(pnn50),
      'statusColor': _getPNN50Color(pnn50),
      'description':
          'Normal PNN50, kalbinizin günlük stresle iyi başa çıktığını gösterir. Bu durumu desteklemek için dengeli alışkanlıklarla, besleyici bir diyet ve orta seviyede fiziksel aktivite ile devam edin.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '0 - 9%',
          'color': Colors.blue,
          'min': 0.0,
          'max': 9.0,
        },
        {
          'label': 'Normal',
          'range': '10 - 30%',
          'color': Colors.green,
          'min': 10.0,
          'max': 30.0,
        },
        {
          'label': 'Yüksek',
          'range': '> 30%',
          'color': Colors.orange,
          'min': 31.0,
          'max': 100.0,
        },
      ],
      'interpretation':
          'pNN50 ardışık kalp atımları arasındaki farkın 50ms\'den fazla olduğu durumların yüzdesini gösterir. Parasempatik aktivitenin bir göstergesidir.',
      'recommendations': [
        'Mevcut sağlıklı alışkanlıklarınızı sürdürün',
        'Dengeli beslenme planına devam edin',
        'Düzenli uyku saatlerine dikkat edin',
        'Hafif kardiyovasküler egzersizler yapın',
        'Sosyal aktivitelere katılın',
        'Hobi edinmeye odaklanın',
      ],
    };
  }

  static Map<String, dynamic> getCoVDetail(double cov) {
    return {
      'title': 'CoV',
      'value': cov,
      'unit': '%',
      'status': _getCoVStatus(cov),
      'statusColor': _getCoVColor(cov),
      'description':
          'CoV\'niz yüksek, bu da kalp atış hızı değişkenliğinizin güçlü olduğunu gösterir. Hem fiziksel aktiviteyi hem de yeterli dinlenmeyi önceliklendirmeye devam edin, böylece bu yüksek uyum seviyesini sürdürebilirsiniz.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '0 - 2%',
          'color': Colors.blue,
          'min': 0.0,
          'max': 2.0,
        },
        {
          'label': 'Normal',
          'range': '3 - 6%',
          'color': Colors.green,
          'min': 3.0,
          'max': 6.0,
        },
        {
          'label': 'Yüksek',
          'range': '> 6%',
          'color': Colors.orange,
          'min': 7.0,
          'max': 50.0,
        },
      ],
      'interpretation':
          'CoV (Coefficient of Variation) kalp hızı değişkenliğinin göreceli bir ölçüsüdür. Kalp atım hızının istikrarını değerlendirir.',
      'recommendations': [
        'Yüksek performans seviyenizi koruyun',
        'Aşırı antrenman yapmaktan kaçının',
        'Aktif dinlenme günleri planlayın',
        'Vücudunuzun sinyallerini dinleyin',
        'Beslenme kalitesini koruyun',
        'Düzenli sağlık kontrolü yaptırın',
      ],
    };
  }

  // Helper methods for status determination
  static String _getStressStatus(double value) {
    if (value <= 2.0) return 'Düşük';
    if (value <= 3.5) return 'Normal';
    return 'Yüksek';
  }

  static Color _getStressColor(double value) {
    if (value <= 2.0) return Colors.green;
    if (value <= 3.5) return Colors.orange;
    return Colors.red;
  }

  static String _getEnergyStatus(double value) {
    if (value <= 2.0) return 'Düşük';
    if (value <= 3.5) return 'Normal';
    return 'Yüksek';
  }

  static Color _getEnergyColor(double value) {
    if (value <= 2.0) return Colors.red;
    if (value <= 3.5) return Colors.orange;
    return Colors.green;
  }

  static String _getTensionStatus(double value) {
    if (value <= 2.0) return 'Düşük';
    if (value <= 3.5) return 'Normal';
    return 'Yüksek';
  }

  static Color _getTensionColor(double value) {
    if (value <= 2.0) return Colors.green;
    if (value <= 3.5) return Colors.orange;
    return Colors.red;
  }

  static String _getHRVScoreStatus(double value) {
    if (value <= 40) return 'Düşük';
    if (value <= 70) return 'Normal';
    return 'Yüksek';
  }

  static Color _getHRVScoreColor(double value) {
    if (value <= 40) return Colors.red;
    if (value <= 70) return Colors.orange;
    return Colors.green;
  }

  static String _getSDNNStatus(double value) {
    if (value <= 115) return 'Düşük';
    if (value <= 176) return 'Normal';
    return 'Yüksek';
  }

  static Color _getSDNNColor(double value) {
    if (value <= 115) return Colors.blue;
    if (value <= 176) return Colors.green;
    return Colors.orange;
  }

  static String _getRMSSDStatus(double value) {
    if (value <= 24) return 'Düşük';
    if (value <= 50) return 'Normal';
    return 'Yüksek';
  }

  static Color _getRMSSDColor(double value) {
    if (value <= 24) return Colors.blue;
    if (value <= 50) return Colors.green;
    return Colors.orange;
  }

  static String _getPNN50Status(double value) {
    if (value <= 9) return 'Düşük';
    if (value <= 30) return 'Normal';
    return 'Yüksek';
  }

  static Color _getPNN50Color(double value) {
    if (value <= 9) return Colors.blue;
    if (value <= 30) return Colors.green;
    return Colors.orange;
  }

  static String _getCoVStatus(double value) {
    if (value <= 2) return 'Düşük';
    if (value <= 6) return 'Normal';
    return 'Yüksek';
  }

  static Color _getCoVColor(double value) {
    if (value <= 2) return Colors.blue;
    if (value <= 6) return Colors.green;
    return Colors.orange;
  }

  // Interpretation methods
  static String _getStressInterpretation(double value) {
    if (value <= 2.0) {
      return 'Stres seviyeniz düşük (${value.toStringAsFixed(1)}/5). Bu, genel olarak rahat ve dengeli bir durumda olduğunuzu gösterir. Mevcut yaşam tarzınızı sürdürmeye devam edin.';
    } else if (value <= 3.5) {
      return 'Stres seviyeniz normal aralıkta (${value.toStringAsFixed(1)}/5). Günlük hayatın getirdiği stresi iyi yönetiyorsunuz, ancak stres azaltıcı aktivitelere yer vermeye devam edin.';
    } else {
      return 'Stres seviyeniz yüksek (${value.toStringAsFixed(1)}/5). Bu durum, vücudunuzun stres altında olduğunu ve rahatlama tekniklerine ihtiyaç duyduğunu gösterir.';
    }
  }

  static List<String> _getStressRecommendations(double value) {
    if (value <= 2.0) {
      return [
        'Mevcut sağlıklı alışkanlıklarınızı sürdürün',
        'Düzenli egzersiz rutininize devam edin',
        'Sosyal ilişkilerinizi güçlendirin',
        'Hobilerinize zaman ayırın',
      ];
    } else if (value <= 3.5) {
      return [
        'Günlük 10-15 dakika meditasyon yapın',
        'Derin nefes egzersizleri uygulayın',
        'Yeterli uyku alın (7-9 saat)',
        'Düzenli yürüyüş yapın',
        'Stres kaynaklarını belirleyin ve azaltın',
      ];
    } else {
      return [
        'Profesyonel stres yönetimi desteği alın',
        'Günlük mindfulness pratiği yapın',
        'İş yükünüzü gözden geçirin',
        'Relaksasyon teknikleri öğrenin',
        'Sosyal destek sistemini güçlendirin',
        'Fiziksel aktiviteyi artırın',
      ];
    }
  }

  static String _getEnergyInterpretation(double value) {
    if (value <= 2.0) {
      return 'Enerji seviyeniz düşük (${value.toStringAsFixed(1)}/5). Bu durum yorgunluk, yetersiz uyku veya beslenme eksikliğinden kaynaklanabilir. Yaşam tarzınızı gözden geçirmeniz faydalı olabilir.';
    } else if (value <= 3.5) {
      return 'Enerji seviyeniz normal aralıkta (${value.toStringAsFixed(1)}/5). Genel olarak iyi bir vitalite durumundasınız, ancak enerji seviyenizi artırmak için küçük iyileştirmeler yapabilirsiniz.';
    } else {
      return 'Enerji seviyeniz yüksek (${value.toStringAsFixed(1)}/5). Mükemmel bir vitalite durumundasınız! Bu durumu korumak için mevcut sağlıklı alışkanlıklarınızı sürdürün.';
    }
  }

  static List<String> _getEnergyRecommendations(double value) {
    if (value <= 2.0) {
      return [
        'Uyku kalitesini artırın',
        'Beslenme düzeninizi gözden geçirin',
        'Demir ve B12 vitamin seviyelerini kontrol ettirin',
        'Hafif egzersiz programı başlatın',
        'Su tüketimini artırın',
        'Stres seviyelerini azaltın',
      ];
    } else if (value <= 3.5) {
      return [
        'Düzenli egzersiz rutini oluşturun',
        'Protein alımını optimize edin',
        'Kahvaltıyı atlamayın',
        'Açık havada zaman geçirin',
        'Enerji veren aktiviteler yapın',
      ];
    } else {
      return [
        'Mevcut alışkanlıklarınızı sürdürün',
        'Performansınızı koruyun',
        'Aşırı yorgunluktan kaçının',
        'Dinlenme günlerini ihmal etmeyin',
        'Beslenme kalitesini koruyun',
      ];
    }
  }

  static String _getTensionInterpretation(double value) {
    if (value <= 2.0) {
      return 'Fiziksel gerginlik seviyeniz düşük (${value.toStringAsFixed(1)}/5). Kaslarınız rahat ve vücudunuz genel olarak dengeli durumda. Bu harika bir durum!';
    } else if (value <= 3.5) {
      return 'Fiziksel gerginlik seviyeniz normal aralıkta (${value.toStringAsFixed(1)}/5). Hafif gerginlik normal olmakla birlikte, gevşeme tekniklerine yer vermeniz faydalı olabilir.';
    } else {
      return 'Fiziksel gerginlik seviyeniz yüksek (${value.toStringAsFixed(1)}/5). Kaslarınızda gerilim var ve bu durum rahatsızlık yaratabilir. Gevşeme teknikleri önemli.';
    }
  }

  static List<String> _getTensionRecommendations(double value) {
    if (value <= 2.0) {
      return [
        'Mevcut rahatlatıcı rutininizi sürdürün',
        'Düzenli stretching yapın',
        'Postür kontrolü yapın',
        'Aktif yaşam tarzını koruyun',
      ];
    } else if (value <= 3.5) {
      return [
        'Günlük stretching egzersizleri yapın',
        'Masaj terapisi deneyin',
        'Yoga veya pilates başlatın',
        'Çalışma postürünüzü düzeltin',
        'Düzenli mola verin',
      ];
    } else {
      return [
        'Profesyonel fizyoterapi desteği alın',
        'Günlük 20 dakika gevşeme egzersizi',
        'Sıcak banyo veya sauna kullanın',
        'Stres kaynaklarını azaltın',
        'Düzenli masaj yaptırın',
        'Ergonomik çalışma ortamı oluşturun',
      ];
    }
  }

  static String _getHRVScoreInterpretation(double value) {
    if (value <= 40) {
      return 'HRV skorunuz düşük. Bu, otonomik sinir sisteminizin stres altında olduğunu gösterebilir. İyileşme ve rahatlama odaklı yaklaşımlar benimsenmelidir.';
    } else if (value <= 70) {
      return 'HRV skorunuz normal aralıkta. Otonomik sinir sisteminiz dengeli çalışıyor. Bu durumu korumak için sağlıklı alışkanlıklarınızı sürdürün.';
    } else {
      return 'HRV skorunuz yüksek. Mükemmel otonomik denge! Kalp hızı değişkenliğiniz çok iyi durumda ve bu harika bir sağlık göstergesi.';
    }
  }

  static List<String> _getHRVScoreRecommendations(double value) {
    if (value <= 40) {
      return [
        'HRV odaklı nefes egzersizleri yapın',
        'Kaliteli uyku önceliği verin',
        'Aşırı yoğun egzersizlerden kaçının',
        'Stres yönetimi teknikleri öğrenin',
        'Düzenli meditasyon pratiği',
        'Alkol ve kafein tüketimini azaltın',
      ];
    } else if (value <= 70) {
      return [
        'Mevcut rutininizi sürdürün',
        'HRV izleme alışkanlığı edinin',
        'Varyasyon odaklı egzersizler yapın',
        'Beslenme kalitesini artırın',
        'Sosyal bağlantıları güçlendirin',
      ];
    } else {
      return [
        'Yüksek performansınızı koruyun',
        'Vücudunuzun sinyallerini dinleyin',
        'Aşırı antrenman yapmaktan kaçının',
        'Başarınızı sürdürülebilir kılın',
        'Diğerlerine ilham olun',
      ];
    }
  }
}
