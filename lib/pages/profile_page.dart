import 'dart:math';
import 'package:flutter/material.dart';
import 'package:novalume_app/constants/colors.dart';
import 'package:novalume_app/constants/text_styles.dart';
// import 'package:novalume_app/constants/icon_styles.dart';
import 'package:novalume_app/widgets/sliver_page_column.dart';
// import 'packages:novalume_app/widgets/section_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPageColumn(
      appBartitle: "Profile",
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _ProfileDonutSection(),
                const SizedBox(height: 20),
                // GradientBannerCard(
                //   title: 'Your Savings : ₹ 3567',
                //   subtitle: '+14% this month',
                //   margin: const EdgeInsets.symmetric(horizontal: 20),
                //   titleAlignment: CrossAxisAlignment.center,
                // ),
                const SizedBox(height: 20),
                // _ProfileMenuList(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// HEADER
// ─────────────────────────────────────────────────────────────────────────────
// class _ProfileHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: KColors.appbarColor,
//       child: SafeArea(
//         bottom: false,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//           child: Row(
//             children: [
//               const SizedBox(width: 48),
//               Expanded(
//                 child: Text(
//                   'My Profile',
//                   textAlign: TextAlign.center,
//                   style: KTextStyles.bold22.copyWith(
//                     color: KColors.whiteTextColor,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: const BoxDecoration(
//                   color: KColors.defaultHighlightColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.person_rounded,
//                   color: KColors.navbarUnselectedColor,
//                   size: KIconStyles.default22,
//                 ),
//               ),
//               const SizedBox(width: 8),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ─────────────────────────────────────────────────────────────────────────────
// DONUT SECTION (on scaffold / cream background)
// ─────────────────────────────────────────────────────────────────────────────
class _ProfileDonutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 180,
          height: 180,
          child: CustomPaint(
            painter: _ProfileDonutPainter(
              fractions: const [0.70, 0.30],
              colors: const [
                KColors.primaryColorDark, // Mains — dark warm brown
                KColors.profileSolarColor, // Solar — warm amber
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ProfileEnergyLabel(
              label: 'Mains',
              amount: '2.1 kWh',
              labelColor: KColors.primaryColorDark,
              amountColor: KColors.brownTextColor,
            ),
            const SizedBox(width: 40),
            _ProfileEnergyLabel(
              label: 'Solar',
              amount: '0.9 kWh',
              labelColor: KColors.profileSolarColor,
              amountColor: KColors.brownTextColor,
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DONUT PAINTER
// ─────────────────────────────────────────────────────────────────────────────
class _ProfileDonutPainter extends CustomPainter {
  const _ProfileDonutPainter({required this.fractions, required this.colors});

  final List<double> fractions;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const strokeWidth = 16.0;
    const gap = 22.0;
    final outerRadius = size.width / 2 - 4;

    for (int i = 0; i < fractions.length; i++) {
      final radius = outerRadius - i * gap;

      final trackPaint = Paint()
        ..color = colors[i].withValues(alpha: 0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      final arcPaint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      final rect = Rect.fromCircle(center: center, radius: radius);
      canvas.drawCircle(center, radius, trackPaint);
      canvas.drawArc(rect, -pi / 2, 2 * pi * fractions[i], false, arcPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ─────────────────────────────────────────────────────────────────────────────
// ENERGY LABEL
// ─────────────────────────────────────────────────────────────────────────────
class _ProfileEnergyLabel extends StatelessWidget {
  const _ProfileEnergyLabel({
    required this.label,
    required this.amount,
    required this.labelColor,
    required this.amountColor,
  });

  final String label;
  final String amount;
  final Color labelColor;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: KTextStyles.bold16.copyWith(color: labelColor)),
        const SizedBox(height: 4),
        Text(amount, style: KTextStyles.regular16.copyWith(color: amountColor)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// MENU LIST
// ─────────────────────────────────────────────────────────────────────────────
// class _ProfileMenuList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final items = [
//       _ProfileMenuItem(
//         icon: Icons.person_rounded,
//         label: 'Personal Info',
//         destination: const PersonalInfoPage(),
//       ),
//       _ProfileMenuItem(
//         icon: Icons.phone_android_rounded,
//         label: 'Devices',
//         destination: const DevicesPage(),
//       ),
//       _ProfileMenuItem(
//         icon: Icons.currency_rupee_rounded,
//         label: 'Cost Goal',
//         destination: const CostGoalPage(),
//       ),
//       _ProfileMenuItem(
//         icon: Icons.bar_chart_rounded,
//         label: 'Comparison',
//         destination: const ComparisonPage(),
//       ),
//     ];

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: SectionCard(
//         child: ListView.separated(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: items.length,
//           separatorBuilder: (_, unused) => Divider(
//             height: 1,
//             indent: 16,
//             endIndent: 16,
//             color: KColors.dividerColor,
//           ),
//           itemBuilder: (context, index) => _ProfileMenuTile(item: items[index]),
//         ),
//       ),
//     );
//   }
// }

// class _ProfileMenuItem {
//   final IconData icon;
//   final String label;
//   final Widget destination;

//   const _ProfileMenuItem({
//     required this.icon,
//     required this.label,
//     required this.destination,
//   });
// }

// class _ProfileMenuTile extends StatelessWidget {
//   const _ProfileMenuTile({required this.item});

//   final _ProfileMenuItem item;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//       leading: Icon(
//         item.icon,
//         color: KColors.brownTextColor,
//         size: KIconStyles.default22,
//       ),
//       title: Text(
//         item.label,
//         style: KTextStyles.medium16.copyWith(color: KColors.blackTextColor),
//       ),
//       trailing: Icon(
//         Icons.chevron_right_rounded,
//         color: KColors.primaryColorDark,
//         size: KIconStyles.default22,
//       ),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => item.destination),
//         );
//       },
//     );
//   }
// }
