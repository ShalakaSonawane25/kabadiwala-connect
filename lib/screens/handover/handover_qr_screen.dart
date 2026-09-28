import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/localization/app_localizations.dart';
import '../../models/e_waste_lot.dart';
import '../../models/handover.dart';
import '../../models/recycler.dart';
import '../../repositories/handover_repository.dart';
import '../earnings/earnings_screen.dart';

class HandoverQrScreen extends StatefulWidget {
  final Recycler recycler;
  final EWasteLot? lot;
  final Handover? initialHandover;
  final HandoverRepository? handoverRepository;

  const HandoverQrScreen({
    super.key,
    required this.recycler,
    this.lot,
    this.initialHandover,
    this.handoverRepository,
  });

  @override
  State<HandoverQrScreen> createState() => _HandoverQrScreenState();
}

class _HandoverQrScreenState extends State<HandoverQrScreen> {
  late final HandoverRepository _handoverRepo;

  Handover? _handover;
  bool _isLoading = true;
  bool _isConfirming = false;

  @override
  void initState() {
    super.initState();
    _handoverRepo = widget.handoverRepository ?? HandoverRepository();
    if (widget.initialHandover != null) {
      _handover = widget.initialHandover;
      _isLoading = false;
    } else {
      _initializeHandover();
    }
  }

  Future<void> _initializeHandover() async {
    setState(() => _isLoading = true);

    final lotId = widget.lot?.id ?? 'demo-lot-${DateTime.now().millisecondsSinceEpoch}';
    final material = widget.lot?.category ?? 'pcb';
    final weight = widget.lot?.weightKg ?? 5.0;
    final rate = widget.recycler.indicativeRatePerKg > 0
        ? widget.recycler.indicativeRatePerKg
        : 260.0;
    final agreedPrice = weight * rate;

    final handover = await _handoverRepo.createHandoverLocally(
      lotId: lotId,
      recyclerId: widget.recycler.id,
      recyclerName: widget.recycler.name,
      materialCategory: material,
      weightKg: weight,
      agreedPrice: agreedPrice,
    );

    if (mounted) {
      setState(() {
        _handover = handover;
        _isLoading = false;
      });
    }
  }

  Future<void> _simulateConfirmation() async {
    if (_handover == null || _isConfirming) return;

    setState(() => _isConfirming = true);

    final updated = await _handoverRepo.confirmHandover(
      _handover!.id,
      finalAmount: _handover!.agreedPrice,
    );

    if (mounted) {
      setState(() {
        _handover = updated;
        _isConfirming = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context).translate('handoverConfirmed'),
          ),
          backgroundColor: AppColors.primary,
          action: SnackBarAction(
            label: AppLocalizations.of(context).translate('viewInLedger'),
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EarningsScreen()),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.translate('handoverQr')),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Status Header
                  _buildStatusHeader(loc),
                  const SizedBox(height: 20),

                  // QR Code Card
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: _handover?.status == HandoverStatus.confirmed
                            ? AppColors.primary
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            loc.translate('readyForHandover'),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryDark,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // QR Display
                          if (_handover != null)
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: QrImageView(
                                data: _handover!.qrPayload,
                                version: QrVersions.auto,
                                size: 200.0,
                                backgroundColor: Colors.white,
                                eyeStyle: const QrEyeStyle(
                                  eyeShape: QrEyeShape.square,
                                  color: AppColors.primaryDark,
                                ),
                                dataModuleStyle: const QrDataModuleStyle(
                                  dataModuleShape: QrDataModuleShape.square,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                            ),
                          const SizedBox(height: 12),

                          // Handover ID Preview
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${loc.translate('handoverId')}: ',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                _handover?.id.substring(0, 8).toUpperCase() ?? '',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'monospace',
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.copy_rounded, size: 16),
                                onPressed: () {
                                  if (_handover != null) {
                                    Clipboard.setData(
                                      ClipboardData(text: _handover!.id),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Handover ID copied to clipboard'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Handover Details Card
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _DetailRow(
                            label: loc.translate('material'),
                            value: loc.translate('category${_capitalize(_handover?.materialCategory ?? '')}') == 'category${_capitalize(_handover?.materialCategory ?? '')}'
                                ? (_handover?.materialCategory.toUpperCase() ?? '')
                                : loc.translate('category${_capitalize(_handover?.materialCategory ?? '')}'),
                            icon: Icons.category_rounded,
                          ),
                          const Divider(height: 16),
                          _DetailRow(
                            label: loc.translate('weight'),
                            value: '${_handover?.weightKg.toStringAsFixed(1)} kg',
                            icon: Icons.scale_rounded,
                          ),
                          const Divider(height: 16),
                          _DetailRow(
                            label: loc.translate('recycler'),
                            value: widget.recycler.name,
                            icon: Icons.business_rounded,
                          ),
                          const Divider(height: 16),
                          _DetailRow(
                            label: loc.translate('finalAmount'),
                            value: '₹${_handover?.agreedPrice.toStringAsFixed(0)}',
                            icon: Icons.currency_rupee_rounded,
                            isHighlighted: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Actions
                  if (_handover?.status == HandoverStatus.confirmed) ...[
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EarningsScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.account_balance_wallet_rounded),
                        label: Text(
                          loc.translate('viewInLedger'),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
                  ] else ...[
                    // Simulation button for test/demo
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.amber.shade300),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.info_outline, size: 16, color: Colors.amber.shade900),
                              const SizedBox(width: 6),
                              Text(
                                'DEMO TEST TRIGGER',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber.shade900,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: _isConfirming ? null : _simulateConfirmation,
                              icon: _isConfirming
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(strokeWidth: 2),
                                    )
                                  : const Icon(Icons.check_circle_outline),
                              label: Text(
                                loc.translate('confirmHandoverDemo'),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget _buildStatusHeader(AppLocalizations loc) {
    final isConfirmed = _handover?.status == HandoverStatus.confirmed;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isConfirmed
            ? const Color(0xFFE8F5E9)
            : const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isConfirmed ? AppColors.primary : Colors.amber.shade600,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isConfirmed ? Icons.check_circle : Icons.hourglass_top_rounded,
            color: isConfirmed ? AppColors.primary : Colors.amber.shade900,
            size: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              isConfirmed
                  ? loc.translate('handoverConfirmed')
                  : loc.translate('waitingForConfirmation'),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isConfirmed ? AppColors.primaryDark : Colors.amber.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isHighlighted;

  const _DetailRow({
    required this.label,
    required this.value,
    required this.icon,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: isHighlighted ? AppColors.primary : AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: isHighlighted ? 16 : 14,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w600,
            color: isHighlighted ? AppColors.primaryDark : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
