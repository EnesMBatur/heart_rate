import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heart Health Tips')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // How to measure section
            _buildSectionCard(
              context,
              'How to Check Pulse Using Finger',
              Icons.fingerprint,
              [
                'First, make sure your fingers aren\'t cold. When checking your pulse, be sure your fingertip completely covers the camera lens and flashlight.',
                'Press gently with your finger. Pressing too hard may result in reduced blood flow, which will make it more difficult to get an accurate result.',
                'Always hold your phone steady',
                'Remain calm and breathe at a regular rate',
                'Cover the entire back camera with your finger. You do not need to press hard for it to begin measuring. A light touch is all that is needed to begin the reading.',
              ],
            ),

            const SizedBox(height: 20),

            // Best practices section
            _buildSectionCard(
              context,
              'Follow These Easy Tips for Best Results',
              Icons.lightbulb_outline,
              [
                'Always hold your phone steady',
                'Remain calm and breathe at a regular rate',
                'Cover the entire back camera with your finger',
                'Use a light touch - don\'t press hard',
                'Ensure good lighting conditions',
                'Take measurements at the same time of day for consistency',
                'Avoid caffeine or exercise before measuring',
                'Sit quietly for a few minutes before measuring',
              ],
            ),

            const SizedBox(height: 20),

            // Heart rate zones section
            _buildHeartRateZonesCard(context),

            const SizedBox(height: 20),

            // Health tips section
            _buildSectionCard(
              context,
              'Keeping Your Heart Strong',
              Icons.favorite,
              [
                'Exercise regularly - aim for at least 150 minutes of moderate activity per week',
                'Maintain a healthy diet rich in fruits, vegetables, and whole grains',
                'Limit sodium, saturated fats, and added sugars',
                'Don\'t smoke and limit alcohol consumption',
                'Manage stress through relaxation techniques',
                'Get adequate sleep (7-9 hours per night)',
                'Maintain a healthy weight',
                'Monitor your blood pressure regularly',
                'Stay hydrated throughout the day',
              ],
            ),

            const SizedBox(height: 20),

            // Risk factors section
            _buildSectionCard(
              context,
              'Minimizing Risk Factors',
              Icons.warning_outlined,
              [
                'Control high blood pressure',
                'Manage diabetes if you have it',
                'Maintain healthy cholesterol levels',
                'Avoid tobacco in all forms',
                'Limit alcohol consumption',
                'Manage stress effectively',
                'Maintain a healthy weight',
                'Stay physically active',
                'Get regular health check-ups',
                'Know your family history',
              ],
            ),

            const SizedBox(height: 20),

            // When to see a doctor section
            _buildWarningCard(context),

            const SizedBox(height: 20),

            // Sharing section
            _buildSectionCard(
              context,
              'Share with Friends and Family',
              Icons.share,
              [
                'Heart health is important for everyone',
                'Share this app with your loved ones',
                'Encourage regular heart rate monitoring',
                'Start making a difference in their lives',
                'Create healthy habits together',
                'Support each other in maintaining heart health',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context,
    String title,
    IconData icon,
    List<String> tips,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...tips.map((tip) => _buildTipItem(context, tip)),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(BuildContext context, String tip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(tip, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartRateZonesCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.monitor_heart,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  'Understanding Heart Rate Zones',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildHeartRateZone(
              context,
              'Resting Heart Rate',
              '60-100 BPM',
              'Normal resting heart rate for adults',
              Colors.green,
            ),
            _buildHeartRateZone(
              context,
              'Low Heart Rate',
              'Below 60 BPM',
              'May indicate excellent fitness or bradycardia',
              Colors.blue,
            ),
            _buildHeartRateZone(
              context,
              'Elevated Heart Rate',
              '100-120 BPM',
              'May indicate mild stress or physical activity',
              Colors.orange,
            ),
            _buildHeartRateZone(
              context,
              'High Heart Rate',
              'Above 120 BPM',
              'May indicate stress, anxiety, or tachycardia',
              Colors.red,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.amber[700], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'These are general guidelines. Individual normal ranges may vary. Consult a healthcare provider for personalized advice.',
                      style: TextStyle(fontSize: 12, color: Colors.amber[700]),
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

  Widget _buildHeartRateZone(
    BuildContext context,
    String zone,
    String range,
    String description,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$zone ($range)',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningCard(BuildContext context) {
    return Card(
      color: Colors.red[50],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.medical_services_outlined,
                  color: Colors.red[700],
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'When to See a Doctor',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.red[700]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Consult a healthcare provider if you experience:',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: Colors.red[700]),
            ),
            const SizedBox(height: 8),
            ...[
              'Chest pain or discomfort',
              'Shortness of breath',
              'Dizziness or fainting',
              'Irregular heartbeat',
              'Persistent high or low heart rate',
              'Heart palpitations',
              'Unusual fatigue',
              'Swelling in legs, ankles, or feet',
            ].map(
              (symptom) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.emergency, color: Colors.red[700], size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        symptom,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.red[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red[300]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.emergency, color: Colors.red[700], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This app is for informational purposes only and should not replace professional medical advice, diagnosis, or treatment.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red[700],
                        fontWeight: FontWeight.w500,
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
}
