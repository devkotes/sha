import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sha/models/transaction_model.dart';
import 'package:sha/shared/methods.dart';
import 'package:sha/shared/theme.dart';

class OverviewTransactionItem extends StatelessWidget {
  final TransactionModel transaction;
  const OverviewTransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Image.asset(
              'assets/icons/ic_type_topup.png',
              width: 44,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    '${transaction.transactionType?.name}',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                ),
                Text(
                  DateFormat('MMM dd')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(transaction.amount ?? 0,
                symbol: (transaction.transactionType?.action == 'cr')
                    ? '+ '
                    : '- '),
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
