import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/palette.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  String _getSizeLabel(BuildContext context, String size) {
    final localizations = AppLocalizations.of(context)!;
    switch (size) {
      case 'small':
        return '${localizations.small} (${localizations.upTo} 15${localizations.kg})';
      case 'medium':
        return '${localizations.medium} (${localizations.upTo} 20${localizations.kg})';
      case 'large':
        return '${localizations.large} (${localizations.upTo} 25${localizations.kg})';
      case 'extraLarge':
        return '${localizations.extraLarge} (${localizations.upTo} 30${localizations.kg})';
      default:
        return size;
    }
  }

  String _getCuttingMethodLabel(BuildContext context, String method) {
    final localizations = AppLocalizations.of(context)!;
    switch (method) {
      case 'grilled_whole':
        return '${localizations.grilled} - ${localizations.whole}';
      case 'grilled_no_fat':
        return '${localizations.grilled} - ${localizations.withoutFat}';
      case 'minced':
        return localizations.minced;
      case 'four_pieces':
        return '${localizations.fourPieces} - ${localizations.fourPieces}';
      case 'preferred_thighs':
        return '${localizations.preferredCut} ${localizations.bigSmall} - ${localizations.thighs}';
      case 'three_small':
        return '${localizations.threePieces} - ${localizations.smallPieces}';
      case 'detailed':
        return localizations.detailedCutting;
      case 'preferred_complete':
        return '${localizations.preferredCut} ${localizations.smallMedium} - ${localizations.complete}';
      default:
        return method;
    }
  }

  String _getPackagingLabel(BuildContext context, String packaging) {
    final localizations = AppLocalizations.of(context)!;
    switch (packaging) {
      case 'without':
        return localizations.withoutPackaging;
      case 'wrapped':
        return localizations.wrapped;
      default:
        return packaging;
    }
  }

  String _getHeadLabel(BuildContext context, String head) {
    final localizations = AppLocalizations.of(context)!;
    switch (head) {
      case 'without':
        return localizations.withoutHead;
      case 'with':
        return localizations.withHead;
      case 'mixed':
        return localizations.mixed;
      default:
        return head;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                child: Image.asset(
                  item.imagePath,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 200.h,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, color: Colors.grey, size: 50.sp),
                  ),
                ),
              ),

              // Details Table
              Container(
                padding: EdgeInsets.all(16.w),
                child: Table(
                  border: TableBorder.all(
                    color: Palette.neutral.color4,
                    width: 1,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                  },
                  children: [
                    _buildTableRow(
                      localizations.type,
                      item.productName,
                      context,
                    ),
                    _buildTableRow(
                      localizations.priceLabel,
                      '${item.basePrice.toInt()}${localizations.sar}',
                      context,
                    ),
                    _buildTableRow(
                      localizations.quantity,
                      '${item.quantity}',
                      context,
                    ),
                    if (item.additions.isNotEmpty)
                      _buildTableRow(
                        localizations.additions,
                        item.additions.join(', '),
                        context,
                      ),
                    _buildTableRow(
                      localizations.size,
                      _getSizeLabel(context, item.size),
                      context,
                    ),
                    _buildTableRow(
                      localizations.cuttingMethod,
                      _getCuttingMethodLabel(context, item.cuttingMethod),
                      context,
                    ),
                    _buildTableRow(
                      localizations.packaging,
                      _getPackagingLabel(context, item.packaging),
                      context,
                    ),
                    _buildTableRow(
                      localizations.head,
                      _getHeadLabel(context, item.head),
                      context,
                    ),
                    if (item.notes.isNotEmpty)
                      _buildTableRow(
                        localizations.orderNotes,
                        item.notes,
                        context,
                      ),
                  ],
                ),
              ),
            ],
          ),

          // Remove Button
          Positioned(
            top: 8.h,
            left: 8.w,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: Palette.dustRed.color5,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.close, color: Colors.white, size: 20.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String label, String value, BuildContext context) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(12.w),
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 14.sp,
              color: Palette.dayBreakBlue.color7,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Palette.neutral.color2,
          ),
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Palette.dayBreakBlue.color7,
            ),
          ),
        ),
      ],
    );
  }
}
