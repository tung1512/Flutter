import 'package:flutter/material.dart';
import 'package:flutter_asms_6/bottom_nav_bar.dart';
import 'package:intl/intl.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lấy chiều cao màn hình

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 235, 235),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[600],
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          // Chỉnh kích thước cho Container chứa SearchBar, BalanceCard, và ActionIconButton
          Container(
            child: Column(
              children: [
                SearchBar(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    BalanceCard(balance: 20000),
                    Positioned(
                      bottom:
                          -40, // Điều chỉnh giá trị này để kiểm soát mức độ chồng chéo
                      left: 20,
                      right: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ), // Thay đổi màu nền cho phần cha
                        padding: const EdgeInsets.symmetric(
                            vertical: 10), // Thêm khoảng cách bên trong
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceAround, // Căn chỉnh các nút
                          children: [
                            const ActionIconButton(
                                icon: Icons.send,
                                label: 'Send',
                                color: Colors.blue),
                            Container(
                              width: 1, // Độ rộng của đường kẻ
                              height: 30, // Chiều cao của đường kẻ
                              color: Colors.grey, // Màu sắc của đường kẻ
                            ),
                            const ActionIconButton(
                                icon: Icons.get_app_rounded,
                                label: 'Request',
                                color: Colors.orange),
                            Container(
                              width: 1, // Độ rộng của đường kẻ
                              height: 30, // Chiều cao của đường kẻ
                              color: Colors.grey, // Màu sắc của đường kẻ
                            ),
                            const ActionIconButton(
                                icon: Icons.account_balance_outlined,
                                label: 'Bank',
                                color: Colors.orange),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.symmetric(
                horizontal:
                    20), // Thay đổi giá trị này để điều chỉnh khoảng cách
            child: const Row(
              children: [
                Expanded(
                    child: Text(
                  'Transaction',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                )),
                Icon(Icons.arrow_right_alt),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Bo góc
              ),
              child: 
                TransactionList(),
              // ),
            ),
          ), // Phần còn lại sẽ dành cho TransactionList
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Bo góc
        ),
        child: const BottomNavBar(),
      ),
    );
  }
}

// SearchBar with blue background
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.blue[600],
      child: Row(
        children: [
          const Icon(Icons.emoji_events, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  hintText: 'Search "Payments"',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.notifications, color: Colors.white),
        ],
      ),
    );
  }
}

// Balance Card Component
class BalanceCard extends StatefulWidget {
  final double balance;

  BalanceCard({required this.balance});

  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  String? _selectedValue; // Biến để lưu giá trị đã chọn từ dropdown
  final List<Map<String, dynamic>> _dropdownItems = [
    {'label': 'US Dollar', 'icon': Icons.flag_circle},
    {'label': 'VND', 'icon': Icons.flag_circle},
    {'label': 'NDT', 'icon': Icons.flag_circle},
  ];

  @override
  void initState() {
    super.initState();
    _selectedValue =
        _dropdownItems[0]['label']; // Hiển thị item đầu tiên khi khởi tạo
  }

  @override
  Widget build(BuildContext context) {
    final formattedBalance =
        NumberFormat.currency(symbol: '\$', decimalDigits: 0)
            .format(widget.balance);

    return Container(
      color: Colors.blue[600],
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 60),
      child: Column(
        children: [
          // DropdownButton nằm ở dưới item đầu tiên
          DropdownButton<String>(
            value: _selectedValue,
            hint: const Text(
              'Select an item',
              style: TextStyle(color: Colors.white),
            ),
            dropdownColor: Colors.blue[600], // Màu nền cho dropdown
            iconEnabledColor: Colors.white, // Màu cho biểu tượng dropdown
            underline: Container(), // Xóa dòng kẻ dưới
            items: _dropdownItems.map((Map<String, dynamic> item) {
              return DropdownMenuItem<String>(
                value: item['label'], // Giá trị của item
                child: Row(
                  children: [
                    Icon(item['icon'], color: Colors.white), // Biểu tượng
                    const SizedBox(width: 10), // Khoảng cách giữa icon và text
                    Text(
                      item['label'],
                      style: const TextStyle(color: Colors.white), // Màu chữ
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue; // Cập nhật giá trị đã chọn
              });
            },
          ),
          Text(
            formattedBalance,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Available Balance',
            style: TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 5),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[600],
              shape: const StadiumBorder(side: BorderSide(color: Colors.white)),
            ),
            icon: const Icon(
              Icons.wallet,
              color: Colors.white,
            ),
            label: const Text(
              'Add Money',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
// Action Buttons Component

// Reusable ActionIconButton widget
class ActionIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const ActionIconButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: color),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}

// Transaction List Component
class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white, // Thêm màu nền trắng
        child: ListView(
          children: [
            TransactionTile(
                icon: Icons.shopping_cart,
                label: 'Spending',
                amount: '-\$500',
                color: Colors.blue),
            const Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 16,
                endIndent: 16), // Đường gạch dưới

            TransactionTile(
                icon: Icons.attach_money,
                label: 'Income',
                amount: '\$3000',
                color: Colors.green),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 16,
              endIndent: 16,
            ), // Đường gạch dưới

            TransactionTile(
                icon: Icons.receipt,
                label: 'Bills',
                amount: '-\$800',
                color: Colors.yellow),
            const Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 16,
              endIndent: 16,
            ), // Đường gạch dưới

            TransactionTile(
                icon: Icons.savings,
                label: 'Savings',
                amount: '\$1000',
                color: Colors.orange),
            const Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 16,
                endIndent: 16), // Đường gạch dưới
          ],
        ),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String amount;
  final Color color;

  TransactionTile({
    required this.icon,
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(icon, color: color),
      ),
      title: Text(label),
      trailing: Row(
        mainAxisSize: MainAxisSize.min, // Chỉ sử dụng không gian cần thiết
        children: [
          Text(
            amount,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8), // Khoảng cách giữa số tiền và icon
          const Icon(Icons.arrow_right,
              color: Colors.grey), // Biểu tượng mũi tên
        ],
      ),
    );
  }
}
