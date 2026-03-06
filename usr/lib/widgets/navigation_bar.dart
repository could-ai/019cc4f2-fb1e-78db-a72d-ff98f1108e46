import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';

class CustomNavigationBar extends StatefulWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const CustomNavigationBar({
    super.key,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  String _hoveredItem = '';

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.darkBg.withOpacity(0.95),
            AppTheme.darkBg.withOpacity(0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryNeon.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.primaryNeon, AppTheme.secondaryNeon],
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryNeon.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(Icons.games, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                'GAME.DEV',
                style: GoogleFonts.orbitron(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          
          // Navigation items
          if (!isMobile)
            Row(
              children: [
                _buildNavItem('ABOUT', widget.onAboutTap),
                const SizedBox(width: 40),
                _buildNavItem('SKILLS', widget.onSkillsTap),
                const SizedBox(width: 40),
                _buildNavItem('PROJECTS', widget.onProjectsTap),
                const SizedBox(width: 40),
                _buildNavItem('CONTACT', widget.onContactTap),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.primaryNeon),
              onPressed: () {
                // Mobile menu would open here
              },
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, VoidCallback onTap) {
    final isHovered = _hoveredItem == label;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredItem = label),
      onExit: (_) => setState(() => _hoveredItem = ''),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isHovered ? AppTheme.primaryNeon : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.rajdhani(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isHovered ? AppTheme.primaryNeon : AppTheme.textSecondary,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
