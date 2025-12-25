import 'package:flutter/material.dart';

class CustomMore extends StatelessWidget {
  final IconData sectionIcon;
  final String sectionTitle;
  final List<SettingItemData> items;

  const CustomMore({
    super.key,
    required this.sectionIcon,
    required this.sectionTitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Row(
            children: [
              Icon(sectionIcon, size: 18, color: Colors.black87),
              const SizedBox(width: 8),
              Text(
                sectionTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),

        // Container
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              _buildSettingItem(items[0]),
              Divider(height: 1, color: Colors.grey[200]),
              _buildSettingItem(items[1]),
              Divider(height: 1, color: Colors.grey[200]),
              _buildSettingItem(items[2]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(SettingItemData item) {
    return InkWell(
      onTap: item.onTap,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      if (item.badge != null) ...[
                        const SizedBox(width: 12),

                       Container(
                           padding: EdgeInsets.symmetric(
                           horizontal: 14, vertical: 6),
                           decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(8),
                           border: Border.all(
                           color: Colors.grey[200]!,
                           width: 1,
                           ),
                          ),
                          child:Text(
                          item.badge!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                        ),
                       ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[500], size: 23),
          ],
        ),
      ),
    );
  }
}

class SettingItemData {
  final String title;
  final String subtitle;
  final String? badge;
  final VoidCallback? onTap;

  SettingItemData({
    required this.title,
    required this.subtitle,
    this.badge,
    this.onTap,
  });
}
