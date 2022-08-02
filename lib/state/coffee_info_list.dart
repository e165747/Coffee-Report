import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// String name : コーヒー豆の名前
/// double evaluation : 評価(お気に入り度)
/// String country : 産出国
/// String id : ID
/// String memo : メモ
/// double amount : 豆の量
/// */
@immutable
class CoffeeInfo {
  const CoffeeInfo({
    required this.beansName,
    this.evaluation,
    this.country,
    required this.id,
    this.memo,
    this.amount,
  });
  final String beansName;
  final double? evaluation;
  final String? country;
  final String id;
  final String? memo;
  final int? amount;

  CoffeeInfo copyWith({
    String? beansName,
    double? evaluation,
    String? country,
    String? id,
    String? memo,
    int? amount,
  }) {
    return CoffeeInfo(
      beansName: beansName ?? this.beansName,
      id: id ?? this.id,
      country: country ?? this.country,
      evaluation: evaluation ?? this.evaluation,
      memo: memo ?? this.memo,
      amount: amount ?? this.amount,
    );
  }
}

class CoffeeInfoNotifier extends StateNotifier<List<CoffeeInfo>> {
  CoffeeInfoNotifier()
      : super([
          const CoffeeInfo(
            beansName: 'moca',
            id: '0',
            country: 'ethiopia',
            memo: 'memo',
            evaluation: 3.0,
            amount: 300,
          ),
          const CoffeeInfo(
            beansName: 'santos No2',
            id: '1',
            country: 'Brazil',
            memo: 'memo2',
            evaluation: 5.0,
            amount: 200,
          ),
          const CoffeeInfo(
              beansName: 'moca',
              id: '2',
              country: 'ethiopia',
              memo: 'memo',
              evaluation: 3.0),
          const CoffeeInfo(
            beansName: 'moca',
            id: '3',
            country: 'ethiopia',
            evaluation: 3.0,
            amount: 200,
          ),
        ]);

  // リスト追加
  void addCoffeeInfo(CoffeeInfo coffeeInfo) {
    state = [...state, coffeeInfo];
  }

  void updateCoffeeInfo(CoffeeInfo newCoffeeInfo) {
    final String infoId = newCoffeeInfo.id;
    state = [
      for (final coffeeInfo in state)
        // if (coffeeInfo.id == infoId) newCoffeeInfo else coffeeInfo,
        coffeeInfo.id == infoId ? newCoffeeInfo : coffeeInfo,
    ];
  }

  // リスト削除
  void removeCoffeeInfo(String infoId) {
    state = [
      for (final coffeeInfo in state)
        if (coffeeInfo.id != infoId) coffeeInfo,
    ];
  }

  // コーヒー豆の名前を更新
  void updateBeansName(String infoId, String newName) {
    state = [
      for (final coffeeInfo in state)
        if (coffeeInfo.id == infoId)
          coffeeInfo.copyWith(beansName: newName)
        else
          coffeeInfo,
    ];
  }

  void updateCountry(String infoId, String newCountry) {
    state = [
      for (final coffeeInfo in state)
        if (coffeeInfo.id == infoId)
          coffeeInfo.copyWith(country: newCountry)
        else
          coffeeInfo,
    ];
  }

  void updateEvaluation(String infoId, double newEval) {
    state = [
      for (final coffeeInfo in state)
        if (coffeeInfo.id == infoId)
          coffeeInfo.copyWith(evaluation: newEval)
        else
          coffeeInfo,
    ];
  }

  void updateMemo(String infoId, String newMemo) {
    state = [
      for (final coffeeInfo in state)
        if (coffeeInfo.id == infoId)
          coffeeInfo.copyWith(memo: newMemo)
        else
          coffeeInfo,
    ];
  }
}

final coffeeInfoListProvider =
    StateNotifierProvider<CoffeeInfoNotifier, List<CoffeeInfo>>((ref) {
  return CoffeeInfoNotifier();
});
