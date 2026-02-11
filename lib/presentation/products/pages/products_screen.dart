import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/text/custom_text.dart';
import '../widgets/product_card.dart';
import '../widgets/eid_offer_card.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = '/products';
  final String initialCategory;

  const ProductsScreen({super.key, this.initialCategory = 'All'});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late String _selectedFilter;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.initialCategory.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    // Define products with their categories
    final List<Map<String, String>> products = [
      {
        'name': localizations.najdi,
        'image': Assets.images.nagdy.path,
        'price': '1250',
        'type': 'sheep',
      },
      {
        'name': localizations.naeemi,
        'image': Assets.images.neami.path,
        'price': '1150',
        'type': 'sheep',
      },
      {
        'name': localizations.harri,
        'image': Assets.images.hari.path,
        'price': '1150',
        'type': 'sheep',
      },
      {
        'name': localizations.swakni,
        'image': Assets.images.swakni.path,
        'price': '1250',
        'type': 'sheep',
      },
      {
        'name': localizations.tyus,
        'image': Assets.images.tyous.path,
        'price': '1100',
        'type': 'goats',
      },
      {
        'name': localizations.hashee,
        'image': Assets.images.hashee.path,
        'price': '1250',
        'type': 'camels',
      },
      {
        'name': localizations.localcow,
        'image': Assets.images.cow.path,
        'price': '1250',
        'type': 'cows',
      },
    ];

    // Filter logic
    final filteredProducts = products.where((product) {
      final matchesSearch = product['name']!.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );
      final matchesFilter =
          _selectedFilter == 'all' || product['type'] == _selectedFilter;
      return matchesSearch && matchesFilter;
    }).toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      'assets/images/sheep.png',
                      height: 80.h,
                      width: 80.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  10.horizontalSpace,
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText.s20(
                          AppLocalizations.of(context)!.rabwatalriyad,
                          color: Palette.dayBreakBlue.color7,
                          bold: true,
                        ),
                        4.verticalSpace,
                        CustomText.s12(
                          AppLocalizations.of(context)!.thebestinKingdom,
                          color: Palette.neutral.color7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: EdgeInsets.all(16.w),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: localizations.choose(
                  localizations.products,
                ), // Simplified hint
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
            ),
          ),

          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                _buildFilterChip('all', localizations.all),
                7.horizontalSpace,
                _buildFilterChip('sheep', localizations.sheep),
                7.horizontalSpace,
                _buildFilterChip('goats', localizations.goats),
                7.horizontalSpace,
                _buildFilterChip('cows', localizations.cows),
                7.horizontalSpace,
                _buildFilterChip('camels', localizations.camels),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          // Product List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: filteredProducts.length + 1, // +1 for the offer card
              itemBuilder: (context, index) {
                if (index == filteredProducts.length) {
                  return const EidOfferCard();
                }
                final product = filteredProducts[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: ProductCard(
                    name: product['name']!,
                    imagePath: product['image']!,
                    price: product['price']!,
                    onTap: () {
                      // Navigate to details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String filterKey, String label) {
    final isSelected = _selectedFilter == filterKey;
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          if (selected) {
            setState(() {
              _selectedFilter = filterKey;
            });
          }
        },
        checkmarkColor: Colors.white,
        selectedColor: Palette.dayBreakBlue.color7,
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
        backgroundColor: Colors.grey.withValues(alpha: 0.2),
      ),
    );
  }
}
