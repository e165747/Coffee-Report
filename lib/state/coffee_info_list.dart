import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// String name : コーヒー豆の名前
/// double evaluation : 評価(お気に入り度)
/// String country : 産出国
/// String id : ID
/// String description : メモ
/// */
@immutable
class CoffeeInfo {
  const CoffeeInfo(
      {required this.beansName,
      this.evaluation,
      this.country,
      required this.id,
      this.memo});
  final String beansName;
  final double? evaluation;
  final String? country;
  final String id;
  final String? memo;

  CoffeeInfo copyWith(
      {String? beansName,
      double? evaluation,
      String? country,
      String? id,
      String? memo}) {
    return CoffeeInfo(
      beansName: beansName ?? this.beansName,
      id: id ?? this.id,
      country: country ?? this.country,
      evaluation: evaluation ?? this.evaluation,
      memo: memo ?? this.memo,
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
              evaluation: 3.0),
          const CoffeeInfo(
              beansName: 'santos No2',
              id: '1',
              country: 'Brazil',
              memo: 'memo2',
              evaluation: 5.0),
          const CoffeeInfo(
              beansName: 'moca',
              id: '0',
              country: 'ethiopia',
              memo: 'memo',
              evaluation: 3.0),
          const CoffeeInfo(
              beansName: 'moca', id: '0', country: 'ethiopia', evaluation: 3.0),
        ]);

  // リスト追加
  void addCoffeeInfo(CoffeeInfo coffeeInfo) {
    state = [...state, coffeeInfo];
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
