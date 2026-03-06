import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      height: size.height,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Main title with glitch effect
          Text(
            'LEVEL UP',
            style: GoogleFonts.orbitron(
              fontSize: isMobile ? 48 : 72,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
              letterSpacing: 4,
              shadows: [
                Shadow(
                  color: AppTheme.primaryNeon.withOpacity(0.8),
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          )
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(
                duration: const Duration(seconds: 2),
                color: AppTheme.primaryNeon.withOpacity(0.5),
              )
              .then()
              .shake(duration: const Duration(milliseconds: 500), hz: 4, curve: Curves.easeInOut),
          
          const SizedBox(height: 20),
          
          // Subtitle
          Text(
            'YOUR DEVELOPMENT',
            style: GoogleFonts.orbitron(
              fontSize: isMobile ? 36 : 56,
              fontWeight: FontWeight.bold,
              color: AppTheme.secondaryNeon,
              letterSpacing: 3,
              shadows: [
                Shadow(
                  color: AppTheme.secondaryNeon.withOpacity(0.8),
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          )
              .animate()
              .fadeIn(duration: const Duration(milliseconds: 800))
              .slideY(begin: 0.3, end: 0),
          
          const SizedBox(height: 40),
          
          // Description
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              'Welcome to my gaming portfolio. I\'m a developer who transforms ideas into interactive experiences. Ready to play?',
              style: GoogleFonts.roboto(
                fontSize: isMobile ? 16 : 20,
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            )
                .animate()
                .fadeIn(delay: const Duration(milliseconds: 400), duration: const Duration(milliseconds: 800))
                .slideY(begin: 0.3, end: 0),
          ),
          
          const SizedBox(height: 60),
          
          // CTA buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildGameButton(
                context,
                'START GAME',
                AppTheme.primaryNeon,
                Icons.play_arrow,
              )
                  .animate()
                  .fadeIn(delay: const Duration(milliseconds: 600))
                  .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
              
              if (!isMobile) const SizedBox(width: 30),
              if (!isMobile)
                _buildGameButton(
                  context,
                  'VIEW QUESTS',
                  AppTheme.secondaryNeon,
                  Icons.emoji_events,
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 800))
                    .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),
            ],
          ),
          
          const SizedBox(height: 100),
          
          // Scroll indicator
          Column(
            children: [
              Text(
                'SCROLL DOWN',
                style: GoogleFonts.rajdhani(
                  fontSize: 14,
                  color: AppTheme.textSecondary,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppTheme.primaryNeon,
                size: 32,
              ),
            ],
          )
              .animate(onPlay: (controller) => controller.repeat())
              .fadeIn(duration: const Duration(milliseconds: 500))
              .then()
              .fadeOut(duration: const Duration(milliseconds: 500)),
        ],
      ),
    );
  }

  Widget _buildGameButton(BuildContext context, String label, Color color, IconData icon) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7)],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.6),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 12),
              Text(
                label,
                style: GoogleFonts.rajdhani(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
