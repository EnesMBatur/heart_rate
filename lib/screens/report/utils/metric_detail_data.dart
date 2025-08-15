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
      'unit': 'ms',
      'status': _getHRVScoreStatus(hrvScore),
      'statusColor': _getHRVScoreColor(hrvScore),
      'description':
          'HRV skoru kalp hızı değişkenliğinizin genel değerlendirmesidir. Yüksek skor daha iyi otonomik sinir sistemi dengesini gösterir.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '< 30 ms',
          'color': Colors.red,
          'min': 0.0,
          'max': 29.9,
        },
        {
          'label': 'Normal',
          'range': '30 - 50 ms',
          'color': Colors.orange,
          'min': 30.0,
          'max': 50.0,
        },
        {
          'label': 'Yüksek',
          'range': '> 50 ms',
          'color': Colors.green,
          'min': 50.1,
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
          'SDNN (Standard Deviation of NN intervals) kalp atım aralıklarının standart sapmasıdır. Otonomik sinir sistemi aktivitesinin genel bir göstergesidir.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '< 20 ms',
          'color': Colors.red,
          'min': 0.0,
          'max': 19.9,
        },
        {
          'label': 'Normal',
          'range': '20 - 50 ms',
          'color': Colors.orange,
          'min': 20.0,
          'max': 50.0,
        },
        {
          'label': 'Yüksek',
          'range': '> 50 ms',
          'color': Colors.green,
          'min': 50.1,
          'max': 150.0,
        },
      ],
      'interpretation': _getSDNNInterpretation(sdnn),
      'recommendations': _getSDNNRecommendations(sdnn),
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
          'RMSSD parasempatik sinir sistemi aktivitesinin önemli bir göstergesidir. Kalp hızı değişkenliğinin kısa vadeli bileşenini yansıtır.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '< 20 ms',
          'color': Colors.red,
          'min': 0.0,
          'max': 19.9,
        },
        {
          'label': 'Normal',
          'range': '20 - 50 ms',
          'color': Colors.orange,
          'min': 20.0,
          'max': 50.0,
        },
        {
          'label': 'Yüksek',
          'range': '> 50 ms',
          'color': Colors.green,
          'min': 50.1,
          'max': 150.0,
        },
      ],
      'interpretation': _getRMSSDInterpretation(rmssd),
      'recommendations': _getRMSSDRecommendations(rmssd),
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
          'pNN50 parasempatik sinir sistemi aktivitesinin bir göstergesidir. Ardışık RR aralıkları arasında 50ms\'den fazla farkın yüzdesini gösterir.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '< 3%',
          'color': Colors.red,
          'min': 0.0,
          'max': 2.9,
        },
        {
          'label': 'Normal',
          'range': '3 - 15%',
          'color': Colors.orange,
          'min': 3.0,
          'max': 15.0,
        },
        {
          'label': 'Yüksek',
          'range': '> 15%',
          'color': Colors.green,
          'min': 15.1,
          'max': 50.0,
        },
      ],
      'interpretation': _getPNN50Interpretation(pnn50),
      'recommendations': _getPNN50Recommendations(pnn50),
    };
  }

  static Map<String, dynamic> getCovDetail(double cov) {
    return {
      'title': 'CoV',
      'value': cov,
      'unit': '%',
      'status': _getCoVStatus(cov),
      'statusColor': _getCoVColor(cov),
      'description':
          'CoV (Coefficient of Variation) kalp hızı değişkenliğinin normalleştirilmiş bir ölçüsüdür. Ortalama kalp hızına göre ayarlanmış HRV\'yi gösterir.',
      'ranges': [
        {
          'label': 'Düşük',
          'range': '< 2%',
          'color': Colors.red,
          'min': 0.0,
          'max': 1.9,
        },
        {
          'label': 'Normal',
          'range': '2 - 7%',
          'color': Colors.orange,
          'min': 2.0,
          'max': 7.0,
        },
        {
          'label': 'Yüksek',
          'range': '> 7%',
          'color': Colors.green,
          'min': 7.1,
          'max': 20.0,
        },
      ],
      'interpretation': _getCoVInterpretation(cov),
      'recommendations': _getCoVRecommendations(cov),
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
    if (value < 30) return 'Düşük';
    if (value <= 50) return 'Normal';
    return 'Yüksek';
  }

  static Color _getHRVScoreColor(double value) {
    if (value < 30) return Colors.red;
    if (value <= 50) return Colors.orange;
    return Colors.green;
  }

  static String _getSDNNStatus(double value) {
    if (value < 20) return 'Düşük';
    if (value <= 50) return 'Normal';
    return 'Yüksek';
  }

  static Color _getSDNNColor(double value) {
    if (value < 20) return Colors.red;
    if (value <= 50) return Colors.orange;
    return Colors.green;
  }

  static String _getRMSSDStatus(double value) {
    if (value < 20) return 'Düşük';
    if (value <= 50) return 'Normal';
    return 'Yüksek';
  }

  static Color _getRMSSDColor(double value) {
    if (value < 20) return Colors.red;
    if (value <= 50) return Colors.orange;
    return Colors.green;
  }

  static String _getPNN50Status(double value) {
    if (value < 3) return 'Düşük';
    if (value <= 15) return 'Normal';
    return 'Yüksek';
  }

  static Color _getPNN50Color(double value) {
    if (value < 3) return Colors.red;
    if (value <= 15) return Colors.orange;
    return Colors.green;
  }

  static String _getCoVStatus(double value) {
    if (value < 2) return 'Düşük';
    if (value <= 7) return 'Normal';
    return 'Yüksek';
  }

  static Color _getCoVColor(double value) {
    if (value < 2) return Colors.red;
    if (value <= 7) return Colors.orange;
    return Colors.green;
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

  // SDNN Interpretation and Recommendations
  static String _getSDNNInterpretation(double value) {
    if (value < 20) {
      return 'Düşük SDNN değeri, otonomik sinir sisteminizde stres veya yorgunluk olduğunu gösterir. Dinlenme ve stres azaltma teknikleri gereklidir.';
    } else if (value <= 50) {
      return 'Normal SDNN değeri, otonomik sinir sisteminizin sağlıklı çalıştığını gösterir. Mevcut yaşam tarzınızı sürdürebilirsiniz.';
    } else {
      return 'Yüksek SDNN değeri, mükemmel otonomik denge gösterir. Bu durum optimal sağlık ve fitness seviyesini yansıtır.';
    }
  }

  static List<String> _getSDNNRecommendations(double value) {
    if (value < 20) {
      return [
        'Derin nefes egzersizleri yapın',
        'Meditasyon pratiği başlayın',
        'Uyku kalitesini artırın (7-9 saat)',
        'Kafein alımını azaltın',
        'Hafif egzersiz yapın',
        'Stres kaynaklarını belirleyin',
      ];
    } else if (value <= 50) {
      return [
        'Mevcut sağlıklı alışkanlıklarınızı sürdürün',
        'Düzenli egzersiz rutini devam ettirin',
        'Dengeli beslenme planını koruyun',
        'Yeterli hidrasyon sağlayın',
        'Sosyal aktivitelere katılın',
      ];
    } else {
      return [
        'Mükemmel durumunuzu koruyun',
        'Performans odaklı antrenman yapabilirsiniz',
        'Diğerlerine rehberlik edebilirsiniz',
        'Aşırı antrenmandan kaçının',
        'Vücudunuzun sinyallerini dinleyin',
      ];
    }
  }

  // RMSSD Interpretation and Recommendations
  static String _getRMSSDInterpretation(double value) {
    if (value < 20) {
      return 'Düşük RMSSD değeri, parasempatik sinir sistemi aktivitesinin azaldığını gösterir. Vücut dinlenme moduna girmekte zorlanıyor.';
    } else if (value <= 50) {
      return 'Normal RMSSD değeri, parasempatik sinir sisteminizin sağlıklı çalıştığını gösterir. İyi bir dinlenme-aktivite dengesi var.';
    } else {
      return 'Yüksek RMSSD değeri, mükemmel parasempatik aktivite gösterir. Vücudunuz stresle çok iyi başa çıkıyor.';
    }
  }

  static List<String> _getRMSSDRecommendations(double value) {
    if (value < 20) {
      return [
        'Yoga veya tai chi yapın',
        'Düzenli meditasyon pratiği',
        'Sıcak banyo alın',
        'Klasik müzik dinleyin',
        'Doğada zaman geçirin',
        'Derin nefes teknikleri uygulayın',
      ];
    } else if (value <= 50) {
      return [
        'Parasempatik aktiviteyi destekleyin',
        'Rahatlatıcı aktiviteler yapın',
        'Uyku kalitesini koruyun',
        'Hafif stretching egzersizleri',
        'Mindfulness pratiği yapın',
      ];
    } else {
      return [
        'Mükemmel durumunuzu koruyun',
        'Yüksek performans antrenmanı yapabilirsiniz',
        'Recovery zamanlarınızı optimize edin',
        'Diğerlerine rehberlik edebilirsiniz',
        'Dengeli yaşam tarzınızı sürdürün',
      ];
    }
  }

  // pNN50 Interpretation and Recommendations
  static String _getPNN50Interpretation(double value) {
    if (value < 3) {
      return 'Düşük pNN50 değeri, parasempatik sinir sistemi aktivitesinin azaldığını ve stres seviyesinin yükseldiğini gösterir.';
    } else if (value <= 15) {
      return 'Normal pNN50 değeri, kalbinizin günlük stresle iyi başa çıktığını ve sağlıklı bir otonomik denge olduğunu gösterir.';
    } else {
      return 'Yüksek pNN50 değeri, mükemmel parasempatik aktivite ve optimal kalp sağlığını gösterir.';
    }
  }

  static List<String> _getPNN50Recommendations(double value) {
    if (value < 3) {
      return [
        'Stres azaltma teknikleri uygulayın',
        'Düzenli nefes egzersizleri',
        'Uyku kalitesini artırın',
        'Kafein alımını azaltın',
        'Rahatlatıcı aktiviteler yapın',
        'Profesyonel destek alın',
      ];
    } else if (value <= 15) {
      return [
        'Mevcut sağlıklı alışkanlıklarınızı sürdürün',
        'Dengeli beslenme planını koruyun',
        'Düzenli uyku saatlerine dikkat edin',
        'Hafif kardiyovasküler egzersizler',
        'Sosyal aktivitelere katılın',
      ];
    } else {
      return [
        'Mükemmel durumunuzu koruyun',
        'Yüksek performans antrenmanı',
        'Diğerlerine örnek olun',
        'Aşırı antrenmandan kaçının',
        'Optimal yaşam tarzınızı sürdürün',
      ];
    }
  }

  // CoV Interpretation and Recommendations
  static String _getCoVInterpretation(double value) {
    if (value < 2) {
      return 'Düşük CoV değeri, kalp hızı değişkenliğinin normalleştirilmiş ölçümünde azalma olduğunu gösterir. Bu stres veya yorgunluk işareti olabilir.';
    } else if (value <= 7) {
      return 'Normal CoV değeri, kalp hızı değişkenliğinizin sağlıklı bir seviyede olduğunu gösterir. Otonomik dengeniz iyidir.';
    } else {
      return 'Yüksek CoV değeri, mükemmel kalp hızı değişkenliğini gösterir. Bu optimal kardiyovasküler sağlığın işaretidir.';
    }
  }

  static List<String> _getCoVRecommendations(double value) {
    if (value < 2) {
      return [
        'HRV artırıcı egzersizler yapın',
        'Interval training deneyin',
        'Stres yönetimi teknikleri',
        'Uyku kalitesini optimize edin',
        'Beslenme planınızı gözden geçirin',
        'Düzenli sağlık kontrolü',
      ];
    } else if (value <= 7) {
      return [
        'Mevcut rutininizi koruyun',
        'Kardiyovasküler egzersizleri sürdürün',
        'Dengeli yaşam tarzını devam ettirin',
        'Hidrasyon seviyenizi koruyun',
        'Düzenli egzersiz programı',
      ];
    } else {
      return [
        'Yüksek performansınızı koruyun',
        'Optimizasyon odaklı antrenman',
        'Vücudunuzun sinyallerini dinleyin',
        'Aşırı antrenmandan kaçının',
        'Başarınızı sürdürülebilir kılın',
      ];
    }
  }
}
