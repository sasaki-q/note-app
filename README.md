## 設計
１, clean architectureを採用
２, 簡易的なアプリケーションのため、認証、データストア、ストレージにfirebaseを採用
３, 状態管理にriverpodを採用
４, データの普遍性を保障するためにfreezedを採用

## 開発方針
１, 基本的なスタイルはMaterialAppで読み込んでいるThemeDataに当てる
　　※ 特殊なデザインのwidgetを使用する際にはwidget自体に独自のスタイルを当てる
2, 関数の引数には名前付き引数を使用
3, なるべく引数にクラスを作成して定義する

```
× 
Future<void> signin({required String email, required String password}) {}

○
class AuthForm {
    final String email, password;
    const AuthForm({required this.email, required this.password})
}
Future<void> signin({required AuthForm form}) {}

```