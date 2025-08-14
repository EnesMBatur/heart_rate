import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class MeasurementResultsBottomSheet extends StatefulWidget {
  final int heartRate;
  final double hrv;
  final int signalQualityPercent;
  final VoidCallback onCreateReport;

  const MeasurementResultsBottomSheet({
    super.key,
    required this.heartRate,
    required this.hrv,
    required this.signalQualityPercent,
    required this.onCreateReport,
  });

  @override
  State<MeasurementResultsBottomSheet> createState() =>
      _MeasurementResultsBottomSheetState();
}

class _MeasurementResultsBottomSheetState
    extends State<MeasurementResultsBottomSheet>
    with TickerProviderStateMixin {
  String selectedStatus = 'normal';
  int selectedMood = 3; // 1-5 scale, 3 is neutral

  // Rive animation controllers
  SMITrigger? confetti;
  bool isShowConfetti = true;

  @override
  void initState() {
    super.initState();
    // Confetti will be triggered when widget is built
  }

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );
    artboard.addController(controller!);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Header with confetti
            Container(
              padding: const EdgeInsets.all(20),
              height: 250, // Fixed height for confetti area
              child: Stack(
                children: [
                  // Confetti animation background
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: isShowConfetti
                          ? Transform.scale(
                              scale:
                                  4, // Reduced from 7 to 4 for slower visual effect
                              child: RiveAnimation.asset(
                                'assets/rive/confetti.riv',
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      getRiveController(artboard);
                                  confetti =
                                      controller.findSMI('Trigger explosion')
                                          as SMITrigger;

                                  // Trigger confetti immediately when loaded
                                  Future.delayed(
                                    Duration(milliseconds: 500),
                                    () {
                                      confetti?.fire();
                                    },
                                  );
                                },
                              ),
                            )
                          : Container(),
                    ),
                  ),

                  // Header content
                  Column(
                    children: [
                      // Drag indicator
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Checkmark
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Text(
                        'Measurement Completed',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                      ),
                      const SizedBox(height: 8),

                      // Heart rate display
                      Text(
                        '${widget.heartRate} BPM',
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Select Your Current Status
                  Text(
                    '1. Select Your Current Status',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _buildStatusCard('Normal', '🧍‍♂️', 'normal'),
                      const SizedBox(width: 12),
                      _buildStatusCard('Active', '🏃‍♂️', 'active'),
                      const SizedBox(width: 12),
                      _buildStatusCard('Resting', '🧘‍♂️', 'resting'),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 2. Select Your Mood
                  Text(
                    '2. Select Your Mood',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Mood Bar
                  _buildMoodBar(),

                  const SizedBox(height: 30),

                  // Rapor Oluştur Button
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onCreateReport();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Create Report',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, String emoji, String value) {
    final isSelected = selectedStatus == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedStatus = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                : Colors.grey[100],
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey[300]!,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoodBar() {
    final moods = [
      {'emoji': '😰', 'label': 'Bad', 'value': 1},
      {'emoji': '😐', 'label': 'Okay', 'value': 2},
      {'emoji': '😊', 'label': 'Normal', 'value': 3},
      {'emoji': '😄', 'label': 'Good', 'value': 4},
      {'emoji': '🤩', 'label': 'Great', 'value': 5},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: moods.map((mood) {
            final isSelected = selectedMood == mood['value'];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedMood = mood['value'] as int;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: TextStyle(fontSize: isSelected ? 28 : 24),
                      child: Text(mood['emoji'] as String),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      mood['label'] as String,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
