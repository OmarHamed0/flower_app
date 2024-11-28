import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProfileRowItem extends StatefulWidget {
  const ProfileRowItem({
    super.key,
    this.icon,
    required this.title,
    this.onTap,
  });

  final String? icon;
  final String title;
  final VoidCallback? onTap;

  @override
  _ProfileRowItemState createState() => _ProfileRowItemState();
}

class _ProfileRowItemState extends State<ProfileRowItem> {
  bool _isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blueAccent.withOpacity(0.1),
        highlightColor: Colors.transparent,
        child: Row(
          children: [
            if (widget.title == 'Notification')
              FlutterSwitch(
                value: _isNotificationEnabled,
                width: 50.0,
                height: 25.0,
                toggleSize: 20.0,
                borderRadius: 20.0,
                padding: 2.0,
                activeColor: Colors.pink,
                inactiveColor: Colors.grey[400]!,
                onToggle: (value) {
                  setState(() {
                    _isNotificationEnabled = value;
                  });
                },
              ),
            if (widget.icon != null)
              Container(
                padding: const EdgeInsets.all(8),
                child: ImageIcon(
                  AssetImage(widget.icon!),
                  size: 20,
                ),
              ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            if (widget.title == 'Language')
              const Text(
                'English',
                style: TextStyle(
                  color: AppColors.kBaseColor,
                  fontSize: 14,
                ),
              ),
            if (widget.title == 'Logout') const Icon(Icons.logout),
            if (widget.title != 'Language' && widget.title != 'Logout')
              const Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: AppColors.kGray,
              ),
          ],
        ),
      ),
    );
  }
}
