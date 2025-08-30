import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';

class MetricDetailData {
  static Map<String, dynamic> getStressLevelDetail(double stressLevel) {
    return {
      'title': LocaleKeys.report_metric_details_stress_level_title.tr(),
      'value': stressLevel,
      'unit': '/5',
      'status': _getStressStatus(stressLevel),
      'statusColor': _getStressColor(stressLevel),
      'description': LocaleKeys.report_metric_details_stress_level_description
          .tr(),
      'ranges': [
        {
          'label': LocaleKeys.report_metric_details_stress_level_low.tr(),
          'range': '1.0 - 2.0',
          'color': Colors.green,
          'min': 1.0,
          'max': 2.0,
        },
        {
          'label': LocaleKeys.report_metric_details_stress_level_normal.tr(),
          'range': '2.1 - 3.5',
          'color': Colors.orange,
          'min': 2.1,
          'max': 3.5,
        },
        {
          'label': LocaleKeys.report_metric_details_stress_level_high.tr(),
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
      'title': LocaleKeys.report_metric_details_energy_level_title.tr(),
      'value': energyLevel,
      'unit': '/5',
      'status': _getEnergyStatus(energyLevel),
      'statusColor': _getEnergyColor(energyLevel),
      'description': LocaleKeys.report_metric_details_energy_level_description
          .tr(),
      'ranges': [
        {
          'label': LocaleKeys.report_metric_details_energy_level_low.tr(),
          'range': '1.0 - 2.0',
          'color': Colors.red,
          'min': 1.0,
          'max': 2.0,
        },
        {
          'label': LocaleKeys.report_metric_details_energy_level_normal.tr(),
          'range': '2.1 - 3.5',
          'color': Colors.orange,
          'min': 2.1,
          'max': 3.5,
        },
        {
          'label': LocaleKeys.report_metric_details_energy_level_high.tr(),
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
      'title': LocaleKeys.report_metric_details_physical_tension_title.tr(),
      'value': tensionLevel,
      'unit': '/5',
      'status': _getTensionStatus(tensionLevel),
      'statusColor': _getTensionColor(tensionLevel),
      'description': LocaleKeys
          .report_metric_details_physical_tension_description
          .tr(),
      'ranges': [
        {
          'label': LocaleKeys.report_metric_details_physical_tension_low.tr(),
          'range': '1.0 - 2.0',
          'color': Colors.green,
          'min': 1.0,
          'max': 2.0,
        },
        {
          'label': LocaleKeys.report_metric_details_physical_tension_normal
              .tr(),
          'range': '2.1 - 3.5',
          'color': Colors.orange,
          'min': 2.1,
          'max': 3.5,
        },
        {
          'label': LocaleKeys.report_metric_details_physical_tension_high.tr(),
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
      'title': LocaleKeys.report_metric_details_hrv_score_title.tr(),
      'value': hrvScore,
      'unit': 'ms',
      'status': _getHRVScoreStatus(hrvScore),
      'statusColor': _getHRVScoreColor(hrvScore),
      'description': LocaleKeys.report_metric_details_hrv_score_description
          .tr(),
      'ranges': [
        {
          'label': LocaleKeys.report_metric_details_hrv_score_low.tr(),
          'range': '< 30 ms',
          'color': Colors.red,
          'min': 0.0,
          'max': 29.9,
        },
        {
          'label': LocaleKeys.report_metric_details_hrv_score_normal.tr(),
          'range': '30 - 50 ms',
          'color': Colors.orange,
          'min': 30.0,
          'max': 50.0,
        },
        {
          'label': LocaleKeys.report_metric_details_hrv_score_high.tr(),
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
      'title': LocaleKeys.report_metric_details_sdnn_title.tr(),
      'value': sdnn,
      'unit': 'ms',
      'status': _getSDNNStatus(sdnn),
      'statusColor': _getSDNNColor(sdnn),
      'description': LocaleKeys.report_metric_details_sdnn_description.tr(),
      'ranges': [
        {
          'label': LocaleKeys.report_metric_details_sdnn_low.tr(),
          'range': '< 20 ms',
          'color': Colors.red,
          'min': 0.0,
          'max': 19.9,
        },
        {
          'label': LocaleKeys.report_metric_details_sdnn_normal.tr(),
          'range': '20 - 50 ms',
          'color': Colors.orange,
          'min': 20.0,
          'max': 50.0,
        },
        {
          'label': LocaleKeys.report_metric_details_sdnn_high.tr(),
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
      'title': LocaleKeys.report_metric_details_rmssd_title.tr(),
      'value': rmssd,
      'unit': 'ms',
      'status': _getRMSSDStatus(rmssd),
      'statusColor': _getRMSSDColor(rmssd),
      'description': LocaleKeys.report_metric_details_rmssd_description.tr(),
      'ranges': [
        {
          'label': LocaleKeys.report_metric_details_rmssd_low.tr(),
          'range': '< 20 ms',
          'color': Colors.red,
          'min': 0.0,
          'max': 19.9,
        },
        {
          'label': LocaleKeys.report_metric_details_rmssd_normal.tr(),
          'range': '20 - 50 ms',
          'color': Colors.orange,
          'min': 20.0,
          'max': 50.0,
        },
        {
          'label': LocaleKeys.report_metric_details_rmssd_high.tr(),
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
      'title': LocaleKeys.report_metric_details_pnn50_title.tr(),
      'value': pnn50,
      'unit': '%',
      'status': _getPNN50Status(pnn50),
      'statusColor': _getPNN50Color(pnn50),
      'description': LocaleKeys.report_metric_details_pnn50_description.tr(),
      'ranges': [
        {
          'label': LocaleKeys.report_metric_details_pnn50_low.tr(),
          'range': '< 3%',
          'color': Colors.red,
          'min': 0.0,
          'max': 2.9,
        },
        {
          'label': LocaleKeys.report_metric_details_pnn50_normal.tr(),
          'range': '3 - 15%',
          'color': Colors.orange,
          'min': 3.0,
          'max': 15.0,
        },
        {
          'label': LocaleKeys.report_metric_details_pnn50_high.tr(),
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
      'title': LocaleKeys.report_metric_details_cov_title.tr(),
      'value': cov,
      'unit': '%',
      'status': _getCoVStatus(cov),
      'statusColor': _getCoVColor(cov),
      'description': LocaleKeys.report_metric_details_cov_description.tr(),
      'ranges': [
        {
          'label': LocaleKeys.report_metric_details_cov_low.tr(),
          'range': '< 2%',
          'color': Colors.red,
          'min': 0.0,
          'max': 1.9,
        },
        {
          'label': LocaleKeys.report_metric_details_cov_normal.tr(),
          'range': '2 - 7%',
          'color': Colors.orange,
          'min': 2.0,
          'max': 7.0,
        },
        {
          'label': LocaleKeys.report_metric_details_cov_high.tr(),
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
    if (value <= 2.0) {
      return LocaleKeys.report_metric_details_status_labels_low.tr();
    }
    if (value <= 3.5) {
      return LocaleKeys.report_metric_details_status_labels_normal.tr();
    }
    return LocaleKeys.report_metric_details_status_labels_high.tr();
  }

  static Color _getStressColor(double value) {
    if (value <= 2.0) return Colors.green;
    if (value <= 3.5) return Colors.orange;
    return Colors.red;
  }

  static String _getEnergyStatus(double value) {
    if (value <= 2.0) {
      return LocaleKeys.report_metric_details_status_labels_low.tr();
    }
    if (value <= 3.5) {
      return LocaleKeys.report_metric_details_status_labels_normal.tr();
    }
    return LocaleKeys.report_metric_details_status_labels_high.tr();
  }

  static Color _getEnergyColor(double value) {
    if (value <= 2.0) return Colors.red;
    if (value <= 3.5) return Colors.orange;
    return Colors.green;
  }

  static String _getTensionStatus(double value) {
    if (value <= 2.0) {
      return LocaleKeys.report_metric_details_status_labels_low.tr();
    }
    if (value <= 3.5) {
      return LocaleKeys.report_metric_details_status_labels_normal.tr();
    }
    return LocaleKeys.report_metric_details_status_labels_high.tr();
  }

  static Color _getTensionColor(double value) {
    if (value <= 2.0) return Colors.green;
    if (value <= 3.5) return Colors.orange;
    return Colors.red;
  }

  static String _getHRVScoreStatus(double value) {
    if (value < 30) {
      return LocaleKeys.report_metric_details_status_labels_low.tr();
    }
    if (value <= 50) {
      return LocaleKeys.report_metric_details_status_labels_normal.tr();
    }
    return LocaleKeys.report_metric_details_status_labels_high.tr();
  }

  static Color _getHRVScoreColor(double value) {
    if (value < 30) return Colors.red;
    if (value <= 50) return Colors.orange;
    return Colors.green;
  }

  static String _getSDNNStatus(double value) {
    if (value < 20) {
      return LocaleKeys.report_metric_details_status_labels_low.tr();
    }
    if (value <= 50) {
      return LocaleKeys.report_metric_details_status_labels_normal.tr();
    }
    return LocaleKeys.report_metric_details_status_labels_high.tr();
  }

  static Color _getSDNNColor(double value) {
    if (value < 20) return Colors.red;
    if (value <= 50) return Colors.orange;
    return Colors.green;
  }

  static String _getRMSSDStatus(double value) {
    if (value < 20) {
      return LocaleKeys.report_metric_details_status_labels_low.tr();
    }
    if (value <= 50) {
      return LocaleKeys.report_metric_details_status_labels_normal.tr();
    }
    return LocaleKeys.report_metric_details_status_labels_high.tr();
  }

  static Color _getRMSSDColor(double value) {
    if (value < 20) return Colors.red;
    if (value <= 50) return Colors.orange;
    return Colors.green;
  }

  static String _getPNN50Status(double value) {
    if (value < 3) {
      return LocaleKeys.report_metric_details_status_labels_low.tr();
    }
    if (value <= 15) {
      return LocaleKeys.report_metric_details_status_labels_normal.tr();
    }
    return LocaleKeys.report_metric_details_status_labels_high.tr();
  }

  static Color _getPNN50Color(double value) {
    if (value < 3) return Colors.red;
    if (value <= 15) return Colors.orange;
    return Colors.green;
  }

  static String _getCoVStatus(double value) {
    if (value < 2) {
      return LocaleKeys.report_metric_details_status_labels_low.tr();
    }
    if (value <= 7) {
      return LocaleKeys.report_metric_details_status_labels_normal.tr();
    }
    return LocaleKeys.report_metric_details_status_labels_high.tr();
  }

  static Color _getCoVColor(double value) {
    if (value < 2) return Colors.red;
    if (value <= 7) return Colors.orange;
    return Colors.green;
  }

  // Interpretation methods
  static String _getStressInterpretation(double value) {
    if (value <= 2.0) {
      return LocaleKeys.report_metric_details_stress_level_interpretation_low
          .tr(namedArgs: {'value': value.toStringAsFixed(1)});
    } else if (value <= 3.5) {
      return LocaleKeys.report_metric_details_stress_level_interpretation_normal
          .tr(namedArgs: {'value': value.toStringAsFixed(1)});
    } else {
      return LocaleKeys.report_metric_details_stress_level_interpretation_high
          .tr(namedArgs: {'value': value.toStringAsFixed(1)});
    }
  }

  static List<String> _getStressRecommendations(double value) {
    if (value <= 2.0) {
      return LocaleKeys.report_metric_details_stress_level_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 3.5) {
      return LocaleKeys
          .report_metric_details_stress_level_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys.report_metric_details_stress_level_recommendations_high
          .tr()
          .split('|');
    }
  }

  static String _getEnergyInterpretation(double value) {
    if (value <= 2.0) {
      return LocaleKeys.report_metric_details_energy_level_interpretation_low
          .tr(namedArgs: {'value': value.toStringAsFixed(1)});
    } else if (value <= 3.5) {
      return LocaleKeys.report_metric_details_energy_level_interpretation_normal
          .tr(namedArgs: {'value': value.toStringAsFixed(1)});
    } else {
      return LocaleKeys.report_metric_details_energy_level_interpretation_high
          .tr(namedArgs: {'value': value.toStringAsFixed(1)});
    }
  }

  static List<String> _getEnergyRecommendations(double value) {
    if (value <= 2.0) {
      return LocaleKeys.report_metric_details_energy_level_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 3.5) {
      return LocaleKeys
          .report_metric_details_energy_level_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys.report_metric_details_energy_level_recommendations_high
          .tr()
          .split('|');
    }
  }

  static String _getTensionInterpretation(double value) {
    if (value <= 2.0) {
      return LocaleKeys
          .report_metric_details_physical_tension_interpretation_low
          .tr(namedArgs: {'value': value.toStringAsFixed(1)});
    } else if (value <= 3.5) {
      return LocaleKeys
          .report_metric_details_physical_tension_interpretation_normal
          .tr(namedArgs: {'value': value.toStringAsFixed(1)});
    } else {
      return LocaleKeys
          .report_metric_details_physical_tension_interpretation_high
          .tr(namedArgs: {'value': value.toStringAsFixed(1)});
    }
  }

  static List<String> _getTensionRecommendations(double value) {
    if (value <= 2.0) {
      return LocaleKeys
          .report_metric_details_physical_tension_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 3.5) {
      return LocaleKeys
          .report_metric_details_physical_tension_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys
          .report_metric_details_physical_tension_recommendations_high
          .tr()
          .split('|');
    }
  }

  static String _getHRVScoreInterpretation(double value) {
    if (value <= 40) {
      return LocaleKeys.report_metric_details_hrv_score_interpretation_low.tr();
    } else if (value <= 70) {
      return LocaleKeys.report_metric_details_hrv_score_interpretation_normal
          .tr();
    } else {
      return LocaleKeys.report_metric_details_hrv_score_interpretation_high
          .tr();
    }
  }

  static List<String> _getHRVScoreRecommendations(double value) {
    if (value <= 40) {
      return LocaleKeys.report_metric_details_hrv_score_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 70) {
      return LocaleKeys.report_metric_details_hrv_score_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys.report_metric_details_hrv_score_recommendations_high
          .tr()
          .split('|');
    }
  }

  // SDNN Interpretation and Recommendations
  static String _getSDNNInterpretation(double value) {
    if (value < 20) {
      return LocaleKeys.report_metric_details_sdnn_interpretation_low.tr();
    } else if (value <= 50) {
      return LocaleKeys.report_metric_details_sdnn_interpretation_normal.tr();
    } else {
      return LocaleKeys.report_metric_details_sdnn_interpretation_high.tr();
    }
  }

  static List<String> _getSDNNRecommendations(double value) {
    if (value < 20) {
      return LocaleKeys.report_metric_details_sdnn_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 50) {
      return LocaleKeys.report_metric_details_sdnn_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys.report_metric_details_sdnn_recommendations_high
          .tr()
          .split('|');
    }
  }

  // RMSSD Interpretation and Recommendations
  static String _getRMSSDInterpretation(double value) {
    if (value < 20) {
      return LocaleKeys.report_metric_details_rmssd_interpretation_low.tr();
    } else if (value <= 50) {
      return LocaleKeys.report_metric_details_rmssd_interpretation_normal.tr();
    } else {
      return LocaleKeys.report_metric_details_rmssd_interpretation_high.tr();
    }
  }

  static List<String> _getRMSSDRecommendations(double value) {
    if (value < 20) {
      return LocaleKeys.report_metric_details_rmssd_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 50) {
      return LocaleKeys.report_metric_details_rmssd_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys.report_metric_details_rmssd_recommendations_high
          .tr()
          .split('|');
    }
  }

  // pNN50 Interpretation and Recommendations
  static String _getPNN50Interpretation(double value) {
    if (value < 3) {
      return LocaleKeys.report_metric_details_pnn50_interpretation_low.tr();
    } else if (value <= 15) {
      return LocaleKeys.report_metric_details_pnn50_interpretation_normal.tr();
    } else {
      return LocaleKeys.report_metric_details_pnn50_interpretation_high.tr();
    }
  }

  static List<String> _getPNN50Recommendations(double value) {
    if (value < 3) {
      return LocaleKeys.report_metric_details_pnn50_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 15) {
      return LocaleKeys.report_metric_details_pnn50_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys.report_metric_details_pnn50_recommendations_high
          .tr()
          .split('|');
    }
  }

  // CoV Interpretation and Recommendations
  static String _getCoVInterpretation(double value) {
    if (value < 2) {
      return LocaleKeys.report_metric_details_cov_interpretation_low.tr();
    } else if (value <= 7) {
      return LocaleKeys.report_metric_details_cov_interpretation_normal.tr();
    } else {
      return LocaleKeys.report_metric_details_cov_interpretation_high.tr();
    }
  }

  static List<String> _getCoVRecommendations(double value) {
    if (value < 2) {
      return (LocaleKeys.report_metric_details_cov_recommendations_low.tr())
          .split('|');
    } else if (value <= 7) {
      return (LocaleKeys.report_metric_details_cov_recommendations_normal.tr())
          .split('|');
    } else {
      return (LocaleKeys.report_metric_details_cov_recommendations_high.tr())
          .split('|');
    }
  }
}
