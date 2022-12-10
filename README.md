## 設計
１, clean architectureを採用
２, 主にUIに関わるpresentation層はfeature単位でディレクトリを切る
３, 簡易的なアプリケーションのため、認証、データストア、ストレージにfirebaseを採用
４, 状態管理にriverpodを採用
５, データの不変性を担保するためにfreezedを採用

## 開発方針
１, 基本的なスタイルはMaterialAppで読み込んでいるThemeDataに当てる
　　※ 特殊なデザインのwidgetを使用する際にはwidget自体に独自のスタイルを当てる 
2, 関数の引数には名前付き引数を使用
3, なるべく引数には自作の方を使用して定義する

```
× 
Future<void> signin({required String email, required String password}) {}

○
class AuthForm {
    final String email, password;
    const AuthForm({required this.email, required this.password})
}
Future<void> signin({required AuthForm form}) {}

// signin関数を引数に渡す場合
typedef AuthFunctionType = Future<void> Function({
  required AuthForm form,
});
void callbackSigninFunction({required AuthFunctionType signin}) {}

```
４, riverpodの使用に関して
　　１、シングルトンの実現のために使用するもの、グローバルで扱うものはルートのcommon_provider.dartに記述
　　　　→ featureの中の使用しか想定されないproviderはそのディレクトリの中に定義
　　２、読み取り専用の非同期処理のデータにはFutureProvderを使用(categoryFutureProvider参照)
　　３、取り扱っている非同期データの状態が変更する可能性のあるものにはStateNotifierProviderを使用

## 開発tips
1, スクリーンへのパス名は該当screen.dartにstatic const pathの形で記述
2, パスベースルーティングが行われる可能性のないスクリーンはその必要はなし
3, shared_preferencesを使用したメモリの使用は極力控える
4, ルーティングはutils/Routerの中の静的メソッドを使用して実行