import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'heart_rate_screen.dart';
import 'history_screen.dart';
import 'tips_screen.dart';
import '../models/heart_rate_measurement.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  HeartRateMeasurement? _lastMeasurement;

  @override
  void initState() {
    super.initState();
    _loadLastMeasurement();
  }

  Future<void> _loadLastMeasurement() async {
    final prefs = await SharedPreferences.getInstance();
    final lastHeartRate = prefs.getInt('last_heart_rate');
    final lastTimestamp = prefs.getString('last_timestamp');

    if (lastHeartRate != null && lastTimestamp != null) {
      setState(() {
        _lastMeasurement = HeartRateMeasurement(
          heartRate: lastHeartRate,
          timestamp: DateTime.parse(lastTimestamp),
          stress: _getStressLevel(lastHeartRate),
          tension: _getTensionLevel(lastHeartRate),
          energy: _getEnergyLevel(lastHeartRate),
        );
      });
    }
  }

  int _getStressLevel(int heartRate) {
    if (heartRate < 60) return 1;
    if (heartRate < 80) return 2;
    if (heartRate < 100) return 3;
    if (heartRate < 120) return 4;
    return 5;
  }

  int _getTensionLevel(int heartRate) {
    if (heartRate < 70) return 1;
    if (heartRate < 90) return 2;
    if (heartRate < 110) return 3;
    if (heartRate < 130) return 4;
    return 5;
  }

  int _getEnergyLevel(int heartRate) {
    if (heartRate < 60) return 2;
    if (heartRate < 80) return 5;
    if (heartRate < 100) return 4;
    if (heartRate < 120) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildHomePage(),
      const HeartRateScreen(),
      const HistoryScreen(),
      const TipsScreen(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart),
            label: 'Measure',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Tips',
          ),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: AppBar(title: const Text('HeartRater'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size: 32,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Welcome to HeartRater',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Easily take your heart rate by placing your finger on the camera. This heart health app will educate and inform you on how to keep your heart strong and risk factors minimal.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Last Measurement Card
            if (_lastMeasurement != null) ...[
              Text(
                'Last Measurement',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildMeasurementItem(
                            'Heart Rate',
                            '${_lastMeasurement!.heartRate}',
                            'BPM',
                            Icons.monitor_heart,
                            Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildMeasurementItem(
                            'Stress',
                            '${_lastMeasurement!.stress}',
                            '/5',
                            Icons.psychology,
                            Colors.orange,
                          ),
                          _buildMeasurementItem(
                            'Tension',
                            '${_lastMeasurement!.tension}',
                            '/5',
                            Icons.fitness_center,
                            Colors.red,
                          ),
                          _buildMeasurementItem(
                            'Energy',
                            '${_lastMeasurement!.energy}',
                            '/5',
                            Icons.battery_charging_full,
                            Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Quick Start Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                icon: const Icon(Icons.monitor_heart),
                label: const Text('Start Heart Rate Measurement'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tips Preview
            Text('Quick Tips', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTipItem('Always hold your phone steady'),
                    _buildTipItem('Remain calm and breathe at a regular rate'),
                    _buildTipItem(
                      'Cover the entire back camera with your finger',
                    ),
                    _buildTipItem('Use a light touch - don\'t press hard'),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      child: const Text('View All Tips →'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementItem(
    String label,
    String value,
    String unit,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(unit, style: TextStyle(fontSize: 12, color: color)),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTipItem(String tip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
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
}
