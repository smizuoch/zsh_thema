# zsh_thema

`smizuoch.zsh-theme` は、Git リポジトリの状態と現在のディレクトリを表示するカスタム Zsh プロンプトテーマです。

## インストール

1. `smizuoch.zsh-theme` ファイルを `~/.oh-my-zsh/custom/themes/` ディレクトリにコピーします。
2. `.zshrc` ファイルを編集し、テーマを `ZSH_THEME="smizuoch"` に設定します。
3. Zsh を再起動するか、`source ~/.zshrc` を実行して設定を反映させます。

## 特徴

- 現在の Git ブランチ名を表示
- ワーキングツリーの状態を表示
  - 変更がある場合は黄色の `✗`
  - クリーンな場合は緑の `✔`
- 現在のディレクトリを表示
- プロンプトの色を変更
  - コマンドが成功した場合は緑
  - コマンドが失敗した場合は赤

## Demo
![Demo](demo.gif)