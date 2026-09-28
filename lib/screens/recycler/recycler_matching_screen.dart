import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/localization/app_localizations.dart';
import '../../models/e_waste_lot.dart';
import '../../models/recycler.dart';
import '../../repositories/recycler_repository.dart';
import '../handover/handover_qr_screen.dart';

class RecyclerMatchingScreen extends StatefulWidget {
  final EWasteLot? lot;
  final String? selectedCategory;
  final List<Recycler>? initialRecyclers;
  final RecyclerRepository? recyclerRepository;

  const RecyclerMatchingScreen({
    super.key,
    this.lot,
    this.selectedCategory,
    this.initialRecyclers,
    this.recyclerRepository,
  });

  @override
  State<RecyclerMatchingScreen> createState() => _RecyclerMatchingScreenState();
}

class _RecyclerMatchingScreenState extends State<RecyclerMatchingScreen> {
  late final RecyclerRepository _recyclerRepo;

  List<Recycler> _recyclers = [];
  bool _isLoading = true;
  bool _isMapView = false;
  Recycler? _selectedRecycler;

  @override
  void initState() {
    super.initState();
    _recyclerRepo = widget.recyclerRepository ?? RecyclerRepository();
    if (widget.initialRecyclers != null) {
      _recyclers = widget.initialRecyclers!;
      _isLoading = false;
      if (_recyclers.isNotEmpty) {
        _selectedRecycler = _recyclers.first;
      }
    } else {
      _loadRecyclers();
    }
  }

  Future<void> _loadRecyclers() async {
    setState(() => _isLoading = true);
    final category = widget.lot?.category ?? widget.selectedCategory;
    final list = await _recyclerRepo.getMatchingRecyclers(category: category);
    if (mounted) {
      setState(() {
        _recyclers = list;
        _isLoading = false;
        if (list.isNotEmpty) {
          _selectedRecycler = list.first;
        }
      });
    }
  }

  void _onSelectRecycler(Recycler recycler) {
    setState(() {
      _selectedRecycler = recycler;
    });
    _showRecyclerDetails(recycler);
  }

  void _showRecyclerDetails(Recycler recycler) {
    final loc = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.recycling_rounded,
                      color: AppColors.primary,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                recycler.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            if (recycler.isAuthorized)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.primary.withValues(alpha: 0.4),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.verified,
                                      size: 14,
                                      color: AppColors.primary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      loc.translate('authorizedRecycler'),
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryDark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          recycler.address,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoChip(
                    icon: Icons.near_me_rounded,
                    label: '${recycler.distanceKm.toStringAsFixed(1)} km',
                    subtitle: loc.translate('distance'),
                  ),
                  _InfoChip(
                    icon: Icons.star_rounded,
                    label: '${recycler.rating} ★',
                    subtitle: loc.translate('rating'),
                    color: Colors.amber.shade800,
                  ),
                  _InfoChip(
                    icon: Icons.currency_rupee_rounded,
                    label: '₹${recycler.indicativeRatePerKg.toStringAsFixed(0)}/kg',
                    subtitle: loc.translate('indicativePrice'),
                    color: AppColors.primary,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                loc.translate('acceptedMaterials'),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: recycler.acceptedCategories.map((cat) {
                  return Chip(
                    label: Text(
                      cat.toUpperCase(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    backgroundColor: Colors.grey.shade100,
                    visualDensity: VisualDensity.compact,
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HandoverQrScreen(
                          recycler: recycler,
                          lot: widget.lot,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.qr_code_2_rounded),
                  label: Text(
                    loc.translate('proceedToHandover'),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final categoryName = widget.lot?.category ?? widget.selectedCategory ?? 'E-Waste';

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.translate('recyclerMatching')),
        actions: [
          IconButton(
            icon: Icon(_isMapView ? Icons.list_alt_rounded : Icons.map_rounded),
            tooltip: _isMapView ? loc.translate('listView') : loc.translate('mapView'),
            onPressed: () {
              setState(() => _isMapView = !_isMapView);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Matching Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: AppColors.primary.withValues(alpha: 0.08),
            child: Row(
              children: [
                const Icon(Icons.tune_rounded, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${loc.translate('material')}: $categoryName • ${_recyclers.length} Matches Found',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.amber.shade400),
                  ),
                  child: Text(
                    'DEMO DATA',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Location Notice
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 14, color: Colors.grey.shade600),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    loc.translate('locationPermissionDenied'),
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ),
          // Body (List or Visual Radar/Map)
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _isMapView
                    ? _buildMapRadarView(loc)
                    : _buildListView(loc),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(AppLocalizations loc) {
    if (_recyclers.isEmpty) {
      return Center(
        child: Text(
          'No matching recyclers found for this category.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(14),
      itemCount: _recyclers.length,
      itemBuilder: (context, index) {
        final r = _recyclers[index];
        final isSelected = _selectedRecycler?.id == r.id;

        return Card(
          elevation: isSelected ? 3 : 1,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: isSelected
                  ? AppColors.primary
                  : Colors.grey.shade200,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _onSelectRecycler(r),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              r.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              r.address,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (r.isAuthorized)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.verified,
                            color: AppColors.primary,
                            size: 16,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.navigation_outlined,
                            size: 16,
                            color: AppColors.secondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${r.distanceKm.toStringAsFixed(1)} km away',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.currency_rupee,
                            size: 16,
                            color: AppColors.primary,
                          ),
                          Text(
                            '${r.indicativeRatePerKg.toStringAsFixed(0)}/kg',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () => _onSelectRecycler(r),
                        style: OutlinedButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          side: const BorderSide(color: AppColors.primary),
                        ),
                        child: Text(loc.translate('selectRecycler')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMapRadarView(AppLocalizations loc) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blueGrey.shade800),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Radar Rings
                Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.teal.withValues(alpha: 0.2), width: 1.5),
                  ),
                ),
                Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.teal.withValues(alpha: 0.3), width: 1.5),
                  ),
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.teal.withValues(alpha: 0.4), width: 1.5),
                  ),
                ),
                // Center Collector Marker
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person_pin_circle, color: Colors.white, size: 24),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'You',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Recycler Markers dynamically positioned around radar
                ..._recyclers.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final r = entry.value;
                  final isSel = _selectedRecycler?.id == r.id;

                  // Compute visual polar offset
                  final angle = (idx * (2 * pi / _recyclers.length));
                  final radius = 40.0 + (r.distanceKm * 12.0).clamp(20.0, 95.0);
                  final dx = radius * cos(angle);
                  final dy = radius * sin(angle);

                  return Transform.translate(
                    offset: Offset(dx, dy),
                    child: GestureDetector(
                      onTap: () => _onSelectRecycler(r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: isSel ? AppColors.accent : AppColors.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.storefront_rounded,
                              color: isSel ? Colors.black : Colors.white,
                              size: 18,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${r.distanceKm}km',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        if (_selectedRecycler != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: ListTile(
                leading: const Icon(Icons.place, color: AppColors.primary),
                title: Text(
                  _selectedRecycler!.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${_selectedRecycler!.distanceKm} km • ${_selectedRecycler!.address}'),
                trailing: ElevatedButton(
                  onPressed: () => _showRecyclerDetails(_selectedRecycler!),
                  child: Text(loc.translate('selectRecycler')),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color? color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.subtitle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color ?? AppColors.textPrimary),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color ?? AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
