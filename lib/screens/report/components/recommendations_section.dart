import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../../../models/report/heart_rate_report.dart';

class RecommendationsSection extends StatelessWidget {
  final List<RecommendationItem> recommendations;

  const RecommendationsSection({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  LocaleKeys.report_personalized_recommendations.tr(),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),

          // Sort recommendations by priority
          ListView.separated(
            padding: EdgeInsets.only(bottom: 1.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recommendations.length,
            separatorBuilder: (context, index) => SizedBox(height: 2.h),
            itemBuilder: (context, index) {
              final sortedRecommendations = [...recommendations];
              sortedRecommendations.sort(
                (a, b) => a.priority.compareTo(b.priority),
              );
              final recommendation = sortedRecommendations[index];

              return _buildRecommendationCard(
                context,
                recommendation,
                index + 1,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(
    BuildContext context,
    RecommendationItem recommendation,
    int index,
  ) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: _getTypeColor(recommendation.type).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _getTypeColor(recommendation.type).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Priority Badge
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _getPriorityColor(recommendation.priority),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$index',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 3.w),

              // Emoji and Type
              Text(recommendation.emoji, style: TextStyle(fontSize: 24.sp)),

              SizedBox(width: 2.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendation.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      _getTypeText(recommendation.type),
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: _getTypeColor(recommendation.type),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),

          // Description
          Text(
            recommendation.description,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(RecommendationType type) {
    switch (type) {
      case RecommendationType.exercise:
        return Colors.blue;
      case RecommendationType.nutrition:
        return Colors.green;
      case RecommendationType.lifestyle:
        return Colors.purple;
      case RecommendationType.medical:
        return Colors.red;
      case RecommendationType.stress:
        return Colors.orange;
    }
  }

  String _getTypeText(RecommendationType type) {
    switch (type) {
      case RecommendationType.exercise:
        return LocaleKeys.report_recommendation_types_exercise.tr();
      case RecommendationType.nutrition:
        return LocaleKeys.report_recommendation_types_nutrition.tr();
      case RecommendationType.lifestyle:
        return LocaleKeys.report_recommendation_types_lifestyle.tr();
      case RecommendationType.medical:
        return LocaleKeys.report_recommendation_types_medical.tr();
      case RecommendationType.stress:
        return LocaleKeys.report_recommendation_types_stress.tr();
    }
  }

  Color _getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.blue;
      case 4:
        return Colors.green;
      case 5:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
