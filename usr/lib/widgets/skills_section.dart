import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 100,
      ),
      child: Column(
        children: [
          // Section title
          _buildSectionTitle('SKILL TREE'),
          
          const SizedBox(height: 60),
          
          // Skills grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 2 : 4,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            children: [
              _buildSkillCard(
                'Frontend',
                FontAwesomeIcons.code,
                ['Flutter', 'React', 'Vue.js', 'HTML/CSS'],
                AppTheme.primaryNeon,
                0,
              ),
              _buildSkillCard(
                'Backend',
                FontAwesomeIcons.server,
                ['Node.js', 'Python', 'Firebase', 'PostgreSQL'],
                AppTheme.secondaryNeon,
                100,
              ),
              _buildSkillCard(
                'Mobile',
                FontAwesomeIcons.mobileScreen,
                ['Flutter', 'React Native', 'iOS', 'Android'],
                AppTheme.accentYellow,
                200,
              ),
              _buildSkillCard(
                'Tools',
                FontAwesomeIcons.wrench,
                ['Git', 'Docker', 'AWS', 'CI/CD'],
                const Color(0xFF00FF88),
                300,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppTheme.primaryNeon, AppTheme.secondaryNeon],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style: GoogleFonts.orbitron(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.secondaryNeon,
                  Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 600))
        .slideX(begin: -0.2, end: 0);
  }

  Widget _buildSkillCard(
    String category,
    IconData icon,
    List<String> skills,
    Color accentColor,
    int delayMs,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accentColor.withOpacity(0.5),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.6)],
              ),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(0.5),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          
          const SizedBox(height: 15),
          
          // Category name
          Text(
            category,
            style: GoogleFonts.orbitron(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          
          const SizedBox(height: 15),
          
          // Skills list
          ...skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                skill,
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: AppTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: delayMs),
          duration: const Duration(milliseconds: 600),
        )
        .scale(
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
          delay: Duration(milliseconds: delayMs),
        );
  }
}
