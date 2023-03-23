

import 'package:flutter/material.dart';

class AccountDetails extends StatelessWidget {
  final String accountName;
  final String accountNumber;
  final double balance;

  const AccountDetails({
    super.key,
    required this.accountName,
    required this.accountNumber,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  accountName,
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Account Number: $accountNumber',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Balance: \$${balance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  _TransactionItem(description: 'Withdrawal', date: DateTime.now(), amount: -50.0),
                  _TransactionItem(description: 'Deposit', date: DateTime.now(), amount: 400.0),
                  _TransactionItem(description: 'Transfer', date: DateTime.now(), amount: -75.0),
                  _TransactionItem(description: 'Withdrawal', date: DateTime.now(), amount: -100.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _TransactionItem extends StatelessWidget {
  final String description;
  final DateTime date;
  final double amount;

  const _TransactionItem({
    required this.description,
    required this.date,
    required this.amount,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          amount > 0 ? Icons.arrow_upward : Icons.arrow_downward,
          color: amount > 0 ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                date.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        Text(
          '\$${amount.abs().toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 16.0,
            color: amount > 0 ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}

