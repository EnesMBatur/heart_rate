import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../router/app_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        title: Text('Settings'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            _buildSettingsCard(
              context,
              title: 'History',
              subtitle: 'View all measurements history',
              icon: LineIcons.history,
              onTap: () => context.push(AppRouter.history),
            ),
            SizedBox(height: 2.h),
            _buildSettingsCard(
              context,
              title: 'Tips',
              subtitle: 'Health tips and recommendations',
              icon: LineIcons.lightbulb,
              onTap: () => context.push(AppRouter.tips),
            ),
            SizedBox(height: 2.h),
            _buildSettingsCard(
              context,
              title: 'Privacy Policy',
              subtitle: 'Read our privacy policy',
              icon: LineIcons.lock,
              onTap: () {
                // TODO: Navigate to privacy policy
              },
            ),
            SizedBox(height: 2.h),
            _buildSettingsCard(
              context,
              title: 'Terms of Service',
              subtitle: 'Read our terms of service',
              icon: LineIcons.fileContract,
              onTap: () {
                // TODO: Navigate to terms of service
              },
            ),
            SizedBox(height: 2.h),
            _buildSettingsCard(
              context,
              title: 'About',
              subtitle: 'App version and information',
              icon: LineIcons.infoCircle,
              onTap: () {
                // TODO: Navigate to about page
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B6B).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFFF6B6B),
            size: Device.screenType == ScreenType.tablet ? 28 : 24,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Device.screenType == ScreenType.tablet ? 18 : 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: Device.screenType == ScreenType.tablet ? 16 : 14,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: Device.screenType == ScreenType.tablet ? 20 : 16,
          color: Colors.grey[400],
        ),
        onTap: onTap,
      ),
    );
  }
}
