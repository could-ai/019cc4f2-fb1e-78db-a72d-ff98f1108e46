import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
          _buildSectionTitle('COMPLETED QUESTS'),
          
          const SizedBox(height: 60),
          
          // Projects list
          _buildProjectCard(
            'E-Commerce Platform',
            'A full-stack e-commerce solution with real-time inventory management and payment integration.',
            ['Flutter', 'Node.js', 'MongoDB', 'Stripe'],
            AppTheme.primaryNeon,
            0,
          ),
          const SizedBox(height: 40),
          _buildProjectCard(
            'Social Media App',
            'Mobile-first social platform with live messaging, stories, and AI-powered content recommendations.',
            ['Flutter', 'Firebase', 'TensorFlow', 'Cloud Functions'],
            AppTheme.secondaryNeon,
            200,
          ),
          const SizedBox(height: 40),
          _buildProjectCard(
            'Fitness Tracker',
            'Cross-platform fitness application with workout plans, progress tracking, and nutrition guides.',
            ['React Native', 'Python', 'PostgreSQL', 'AWS'],
            AppTheme.accentYellow,
            400,
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

  Widget _buildProjectCard(
    String title,
    String description,
    List<String> technologies,
    Color accentColor,
    int delayMs,
  ) {
    return Container(
      padding: const EdgeInsets.all(30),
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
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Quest icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [accentColor, accentColor.withOpacity(0.6)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 20),
              // Title
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.orbitron(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
              // Status badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: accentColor.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Text(
                  'COMPLETED',
                  style: GoogleFonts.rajdhani(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Description
          Text(
            description,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Technologies
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: technologies.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.darkBg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: accentColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  tech,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: AppTheme.textPrimary,
                  ),
                ),
              );
            }).toList(),
          ),
          
          const SizedBox(height: 20),
          
          // Action buttons
          Row(
            children: [
              _buildActionButton('View Details', Icons.visibility, accentColor),
              const SizedBox(width: 15),
              _buildActionButton('Live Demo', Icons.open_in_new, accentColor),
            ],
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: delayMs),
          duration: const Duration(milliseconds: 800),
        )
        .slideX(
          begin: 0.2,
          end: 0,
          delay: Duration(milliseconds: delayMs),
        );
  }

  Widget _buildActionButton(String label, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: color.withOpacity(0.5),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.rajdhani(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
