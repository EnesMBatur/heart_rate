import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';

class MetricDetailScreen extends StatelessWidget {
  final String title;
  final double value;
  final String unit;
  final String status;
  final Color statusColor;
  final String description;
  final List<Map<String, dynamic>> ranges;
  final String interpretation;
  final List<String> recommendations;

  const MetricDetailScreen({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.status,
    required this.statusColor,
    required this.description,
    required this.ranges,
    required this.interpretation,
    required this.recommendations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main metric display with circular progress
            _buildMainMetricCard(context),

            SizedBox(height: 3.h),

            // Status ranges
            _buildRangesSection(context),

            SizedBox(height: 3.h),

            // Interpretation section
            _buildInterpretationSection(context),

            SizedBox(height: 3.h),

            // Recommendations section
            _buildRecommendationsSection(context),

            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildMainMetricCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Modern circular progress with gradient and glow effect
          SizedBox(
            width: 220,
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer glow effect
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: statusColor.withValues(alpha: 0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                ),
                // Background circle with subtle gradient
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [Colors.grey[50]!, Colors.grey[100]!],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
                // Progress track (background)
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 8,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.grey[200]!,
                    ),
                  ),
                ),
                // Main progress with gradient effect
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CustomPaint(
                    painter: GradientCircularProgressPainter(
                      progress: _getProgressValue(),
                      strokeWidth: 8,
                      startColor: statusColor,
                      endColor: _getGradientEndColor(statusColor),
                    ),
                  ),
                ),
                // Inner decorative circle
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                // Center content with responsive layout and fixed width
                SizedBox(
                  width: 120, // Fixed width to prevent overflow
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Value with dynamic font sizing
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _formatValue(value),
                          style: TextStyle(
                            fontSize: _getResponsiveFontSize(),
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                            letterSpacing: -1,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: 0.15.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 0.5.h,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          unit,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 3.h),

          // Enhanced status badge with icon and better styling
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  statusColor.withValues(alpha: 0.1),
                  statusColor.withValues(alpha: 0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: statusColor.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(_getStatusIcon(), color: Colors.white, size: 14),
                ),
                SizedBox(width: 2.w),
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 2.h),

          // Enhanced description with better typography
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.grey[600],
                height: 1.6,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRangesSection(BuildContext context) {
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
          Text(
            'Referans Aralıkları',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 2.h),

          ...ranges.map((range) => _buildRangeItem(range)),
        ],
      ),
    );
  }

  Widget _buildRangeItem(Map<String, dynamic> range) {
    final isCurrentRange = _isInRange(value, range);

    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: isCurrentRange
            ? (range['color'] as Color).withValues(alpha: 0.1)
            : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCurrentRange
              ? (range['color'] as Color).withValues(alpha: 0.3)
              : Colors.grey[200]!,
          width: isCurrentRange ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: range['color'] as Color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  range['label'] as String,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  range['range'] as String,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          if (isCurrentRange)
            Icon(Icons.check_circle, color: range['color'] as Color, size: 20),
        ],
      ),
    );
  }

  Widget _buildInterpretationSection(BuildContext context) {
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
                Icons.info_outline,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              SizedBox(width: 2.w),
              Text(
                'Yorumlama',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),

          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              interpretation,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationsSection(BuildContext context) {
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
              Text(
                'Öneriler',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),

          ...recommendations.asMap().entries.map((entry) {
            return Container(
              margin: EdgeInsets.only(bottom: 1.h),
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${entry.key + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      entry.value,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  double _getProgressValue() {
    if (ranges.isEmpty) return 0.5;

    // Special handling for 5-point scale metrics (value is 1-5)
    if (unit == '/5') {
      // For 5-point scale, map 1-5 to 0.1-0.9 for better visual representation
      // This avoids the circle being empty (0.0) or completely full (1.0)
      return ((value - 1) / 4 * 0.8 + 0.1).clamp(0.1, 0.9);
    }

    // Find the range where current value belongs for better scaling
    for (int i = 0; i < ranges.length; i++) {
      final range = ranges[i];
      final min = range['min'] as double;
      final max = range['max'] as double;

      if (value >= min && value <= max) {
        // Calculate position within this specific range
        final rangeProgress = (value - min) / (max - min);
        // Map to appropriate segment of the circle (each range gets equal space)
        final segmentSize = 1.0 / ranges.length;
        return (i * segmentSize + rangeProgress * segmentSize).clamp(0.0, 1.0);
      }
    }

    // Fallback: use overall range
    final minValue = ranges.first['min'] as double;
    final maxValue = ranges.last['max'] as double;
    return ((value - minValue) / (maxValue - minValue)).clamp(0.0, 1.0);
  }

  String _formatValue(double value) {
    // For very large numbers, use shorter format
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }

    if (value == value.roundToDouble()) {
      return value.round().toString();
    } else {
      return value.toStringAsFixed(1);
    }
  }

  IconData _getStatusIcon() {
    switch (status.toLowerCase()) {
      case 'excellent':
      case 'yüksek':
        return Icons.trending_up;
      case 'normal':
        return Icons.trending_flat;
      case 'düşük':
      case 'low':
      case 'needs attention':
        return Icons.trending_down;
      default:
        return Icons.info;
    }
  }

  bool _isInRange(double value, Map<String, dynamic> range) {
    final min = range['min'] as double;
    final max = range['max'] as double;
    return value >= min && value <= max;
  }

  Color _getGradientEndColor(Color startColor) {
    // Create a lighter version of the start color for gradient effect
    HSLColor hslColor = HSLColor.fromColor(startColor);
    return hslColor
        .withLightness((hslColor.lightness + 0.2).clamp(0.0, 1.0))
        .toColor();
  }

  // Get responsive font size based on value length
  double _getResponsiveFontSize() {
    final valueStr = _formatValue(value);
    if (valueStr.length <= 3) {
      return 28.sp; // Short values (like "85" or "1.2")
    } else if (valueStr.length <= 5) {
      return 24.sp; // Medium values (like "137.5")
    } else {
      return 22.sp; // Long values
    }
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color startColor;
  final Color endColor;

  GradientCircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.startColor,
    required this.endColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Create gradient
    final gradient = SweepGradient(
      startAngle: -1.57, // -90 degrees in radians (top of circle)
      endAngle: -1.57 + (2 * 3.14159 * progress), // progress angle
      colors: [startColor, endColor],
      stops: const [0.0, 1.0],
    );

    // Create paint with gradient
    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw the progress arc
    const startAngle = -1.57; // Start from top (-90 degrees)
    final sweepAngle = 2 * 3.14159 * progress; // Progress angle

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    // Add a subtle glow effect
    if (progress > 0) {
      final glowPaint = Paint()
        ..shader = gradient.createShader(
          Rect.fromCircle(center: center, radius: radius),
        )
        ..strokeWidth = strokeWidth + 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        glowPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
