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
  final int id;
  final String? memo;
  final int? amount;

  CoffeeInfo copyWith({
    String? beansName,
    double? evaluation,
    String? country,
    int? id,
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
            beansName: 'coffee1',
            id: 0,
            country: 'ethiopia',
            memo: 'memo',
            evaluation: 3.0,
            amount: 300,
          ),
          const CoffeeInfo(
            beansName: 'coffee2',
            id: 1,
            country: 'Brazil',
            memo: 'memo2',
            evaluation: 5.0,
            amount: 200,
          ),
          const CoffeeInfo(
              beansName: 'coffee3',
              id: 2,
              country: 'ethiopia',
              memo: 'memo',
              evaluation: 3.0),
          const CoffeeInfo(
            beansName: 'coffee4',
            id: 3,
            country: 'ethiopia',
            evaluation: 3.0,
            amount: 200,
          ),
        ]);

  // 特定の情報を取得
  // CoffeeInfo? getCoffeeInfo(String id) {
  //   for (final coffeeInfo in state) {
  //     if (coffeeInfo.id == id) {
  //       return coffeeInfo;
  //     }
  //   }
  //   return 'Data Not Found';
  // }

  // リスト追加
  void addCoffeeInfo(
      {required String beansName,
      String? country,
      double? evaluation,
      int? amount,
      String? memo}) {
    print(state.length);
    int newId = state.isNotEmpty ? state.last.id + 1 : 0;
    CoffeeInfo newCoffeeInfo = CoffeeInfo(
        beansName: beansName,
        id: newId,
        country: country,
        evaluation: evaluation,
        amount: amount,
        memo: memo);
    state = [...state, newCoffeeInfo];
    print(state);
  }

  // リスト更新
  void updateCoffeeInfo(CoffeeInfo newCoffeeInfo) {
    final int infoId = newCoffeeInfo.id;
    state = [
      for (final coffeeInfo in state)
        // if (coffeeInfo.id == infoId) newCoffeeInfo else coffeeInfo,
        coffeeInfo.id == infoId ? newCoffeeInfo : coffeeInfo,
    ];
  }

  // リスト削除
  void removeCoffeeInfo(int infoId) {
    state = [
      for (final coffeeInfo in state)
        if (coffeeInfo.id != infoId) coffeeInfo,
    ];
  }
}

// リスト一覧Provider
final coffeeInfoListProvider =
    StateNotifierProvider<CoffeeInfoNotifier, List<CoffeeInfo>>((ref) {
  return CoffeeInfoNotifier();
});
