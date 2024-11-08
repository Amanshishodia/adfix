import 'package:adfix/presentation/changeAddress/Ui/changeAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../HomePage/controller/CartController.dart';
import '../../Payment/ui/payment.dart';
import '../../changeAddress/controller/AddressController.dart';
import '../../changeAddress/controller/DateandTimeController.dart';

class ServiceSummaryPage extends StatelessWidget {
  ServiceSummaryPage({Key? key}) : super(key: key);

  final RxDouble selectedTip = 0.0.obs;
  final CartController cartController = Get.find<CartController>();

  void selectTip(double amount) {
    selectedTip.value = amount;
    // Update the total in cart controller to include tip
    cartController.updateTotalWithTip(amount);
  }

  Widget _buildTipSection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add a tip to thank the Professional',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() => GestureDetector(
                    onTap: () => selectTip(50),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(20),
                        color: selectedTip.value == 50
                            ? Colors.deepPurple[50]
                            : Colors.white,
                      ),
                      child: Text(
                        '₹50',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: selectedTip.value == 50
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  )),
              SizedBox(width: 12),
              Obx(() => GestureDetector(
                    onTap: () => selectTip(100),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20),
                        color: selectedTip.value == 100
                            ? Colors.green[50]
                            : Colors.white,
                      ),
                      child: Text(
                        '₹100',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: selectedTip.value == 100
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  )),
              SizedBox(width: 12),
              Obx(() => GestureDetector(
                    onTap: () => _showCustomTipDialog(),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(20),
                        color: selectedTip.value > 0 &&
                                selectedTip.value != 50 &&
                                selectedTip.value != 100
                            ? Colors.deepPurple[50]
                            : Colors.white,
                      ),
                      child: Text(
                        'Custom',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: selectedTip.value > 0 &&
                                  selectedTip.value != 50 &&
                                  selectedTip.value != 100
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '100% of the tip goes to the professional',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  void _showCustomTipDialog() {
    final TextEditingController customTipController = TextEditingController();
    Get.dialog(
      AlertDialog(
        title: Text('Enter custom tip amount'),
        content: TextField(
          controller: customTipController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: '₹',
            hintText: 'Enter amount',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final double? amount = double.tryParse(customTipController.text);
              if (amount != null && amount > 0) {
                selectTip(amount);
                Get.back();
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCartState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please add items from the home page',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24),
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Go to Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    item.imageUrl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 48,
                      height: 48,
                      color: Colors.grey[200],
                      child: Icon(Icons.error_outline, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.name,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.remove,
                          size: 18, color: Colors.deepPurple),
                      onPressed: () =>
                          cartController.decrementQuantity(item.id),
                    ),
                    Obx(() => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('${item.quantity.value}',
                              style: TextStyle(fontSize: 14)),
                        )),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add, size: 18, color: Colors.deepPurple),
                      onPressed: () =>
                          cartController.incrementQuantity(item.id),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Obx(() => Text(
                    '₹${(item.price * item.quantity.value).toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 15),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateTimeController = Get.put(DateTimeController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text('Summary',
            style: TextStyle(color: Colors.black, fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return _buildEmptyCartState();
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Savings Banner
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Text(
                      "You're saving total ",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "₹100 ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "on this order!",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.monetization_on,
                        color: Colors.amber[700], size: 20),
                  ],
                ),
              ),

              Divider(height: 1, thickness: 1),

              // AC Service Section
              ...cartController.cartItems.map(_buildCartItem).toList(),
              // Adfix cover
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Adfix cover',
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          'protection on this booking',
                          style:
                              TextStyle(fontSize: 13, color: Colors.grey[600]),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),

              // Membership Section
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Membership',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '6 months plan',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        Text(
                          '₹349',
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Save ₹100 on this booking',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                    Text(
                      'Save 10% on every service',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'View all benefits',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),

              // Contact Info
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Icon(Icons.phone_outlined,
                        size: 20, color: Colors.grey[700]),
                    SizedBox(width: 12),
                    Text(
                      'Satyam, +91 8081924394',
                      style: TextStyle(fontSize: 14),
                    ),
                    Spacer(),
                    Text(
                      'Change',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),

              // Service Preferences
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service Preferences',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Avoid calling before reaching the location',
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),

              // Coupons and offers
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: EdgeInsets.only(top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.local_offer_outlined,
                            size: 20, color: Colors.green),
                        SizedBox(width: 12),
                        Text(
                          'Coupons and offers',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '2 offers',
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),

              // Payment Summary
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Obx(() {
                  final double itemTotal = cartController.total.value;
                  final double taxes = itemTotal * 0.18; // Assuming 18% tax
                  final double discount = 100.0; // Fixed discount amount
                  final double finalTotal =
                      itemTotal + taxes - discount + selectedTip.value;
                  final double tip = selectedTip.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Payment summary',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Item total', style: TextStyle(fontSize: 14)),
                          Text('₹${itemTotal.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      if (tip > 0) ...[
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tip amount', style: TextStyle(fontSize: 14)),
                            Text('₹${tip.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Item discount', style: TextStyle(fontSize: 14)),
                          Text('-₹${discount.toStringAsFixed(2)}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.green)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Taxes and fee', style: TextStyle(fontSize: 14)),
                          Text('₹${taxes.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            'Yay! You have saved ₹${discount.toStringAsFixed(0)} on final bill',
                            style: TextStyle(color: Colors.green, fontSize: 13),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          Text('₹${finalTotal.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  );
                }),
              ),

              // Cancellation Policy
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cancellation & reschedule policy',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Free cancellation/reschedule 2 days before service time.',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                    Text(
                      'You will be charged from the payment after that otherwise',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Learn more',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              _buildAddressSection(),

              SizedBox(height: 8),
              Divider(),
              _buildDateTimeSection(),

              // Tip Section
              _buildTipSection(),

              SizedBox(height: 16),
            ],
          ),
        );
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Obx(() {
            final dateTimeController = Get.find<DateTimeController>();
            final addressController = Get.find<AddressController>();

            // Check if both address and date/time are selected
            bool isAddressSelected =
                addressController.selectedAddress.value != null;
            bool isDateTimeSelected =
                dateTimeController.selectedDate.value != null &&
                    dateTimeController.selectedTime.value.isNotEmpty;

            return TextButton(
              onPressed: () {
                if (isAddressSelected && isDateTimeSelected) {
                  // If both are selected, navigate to payment page
                  final double itemTotal = cartController.total.value;
                  final double taxes = itemTotal * 0.18; // Assuming 18% tax
                  final double discount = 100.0; // Fixed discount amount
                  final double finalTotal =
                      itemTotal + taxes - discount + selectedTip.value;
                  Get.to(PaymentPage(amount: finalTotal));
                } else {
                  // If either is missing, navigate to address page
                  Get.to(SaveAddressPage());
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                isAddressSelected && isDateTimeSelected
                    ? 'Proceed to Payment'
                    : 'Add address and slots',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// In your ServiceSummaryPage, add this widget where you want to show the address:
Widget _buildAddressSection() {
  final dateTimeController = Get.put(DateTimeController());
  final addressController = Get.put(AddressController());

  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(bottom: 8),
    child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                    size: 20, color: Colors.grey[700]),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    addressController.formattedSelectedAddress,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (dateTimeController.selectedDate.value != null) {
                      // Navigate to the page for selecting additional details
                      Get.to(PaymentPage(
                          amount:
                              12.2)); // Replace NextPage with your actual page class
                    } else {
                      // Navigate to the address selection page
                      Get.to(SaveAddressPage()); // Adjust your logic as needed
                    }
                  },
                  child: Text(
                    addressController.selectedAddress.value == null
                        ? 'Add'
                        : 'Change',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
  );
}

// Add this new widget for date and time display
Widget _buildDateTimeSection() {
  final dateTimeController = Get.put(DateTimeController());

  String formatDate(DateTime? date) {
    if (date == null) return 'Select date';
    return '${date.day}/${date.month}/${date.year}';
  }

  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(16),
    child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.access_time, size: 20, color: Colors.grey[700]),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        dateTimeController.selectedDate.value != null &&
                                dateTimeController.selectedTime.value.isNotEmpty
                            ? '${formatDate(dateTimeController.selectedDate.value)} at ${dateTimeController.selectedTime.value}'
                            : 'Select date and time',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    dateTimeController.selectedDate.value != null
                        ? 'Change'
                        : 'Add',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            if (dateTimeController.selectedDate.value != null)
              Padding(
                padding: EdgeInsets.only(left: 32, top: 4),
                child: Text(
                  'Service will take approx. 1hr and 30 mins',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
          ],
        )),
  );
}
