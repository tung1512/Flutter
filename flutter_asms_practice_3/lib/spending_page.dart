import 'package:flutter/material.dart';
import 'package:flutter_asms_practice_3/bottom_navigation.dart';

class SpendingPage extends StatelessWidget {
  const SpendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Spending',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Month Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: 'January',
                  onChanged: (String? newValue) {},
                  items: <String>['January', 'February', 'March', 'April']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Total Spend and Available Balance
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard('Total Spend', '\$500.00', Colors.blue),
                _buildInfoCard('Available Balance', '\$20,000.00', Colors.yellow),
              ],
            ),
            const SizedBox(height: 16),
            // Bar Chart
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildBarColumn(100, '2-8'),
                      _buildBarColumn(100, '9-15'),
                      _buildBarColumn(100, '16-22'),
                      _buildBarColumn(50, '23-29'),
                      _buildBarColumn(100, '30-1'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Category Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryIcon(Icons.credit_card, 'Spending', Colors.blue),
                _buildCategoryIcon(Icons.attach_money, 'Income', Colors.green),
                _buildCategoryIcon(Icons.receipt, 'Bills', Colors.orange),
                _buildCategoryIcon(Icons.savings, 'Savings', Colors.yellow),
              ],
            ),
            const SizedBox(height: 16),
            // Spending List
            Expanded(
              child: ListView(
                children: [
                  _buildSpendingItem('Netflix', '1st Jan at 7:20pm', '-\$15.99',
                      Colors.red),
                  _buildSpendingItem('Google', '2nd Jan at 8:00am', '-\$100.00',
                      Colors.orange),
                  _buildSpendingItem('Namecheap', '3rd Jan at 9:30am', '-\$50.00',
                      Colors.purple),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget _buildInfoCard(String title, String amount, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarColumn(double height, String label) {
    return Column(
      children: [
        Container(
          width: 20,
          height: height,
          color: Colors.blue,
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  Widget _buildSpendingItem(String name, String date, String amount, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(Icons.credit_card, color: color),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
