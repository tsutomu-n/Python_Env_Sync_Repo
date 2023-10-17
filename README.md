# Python_Env_Sync_Repo（Python環境同期リポジトリ）

## 説明（Description）

チーム全体でPythonの環境設定と依存関係を同期するためのリポジトリです。pyenvの設定、Poetryのロックファイル、シェルの設定が含まれています。

A repository for syncing Python environment configurations and dependencies across the team. Includes pyenv settings, Poetry lock files, and shell configurations.

---

## 環境のクローンと復元方法（How to Clone and Restore Environment）

### ステップ 1: リポジトリをクローン（Clone the Repository）

\```bash
git clone git@github.com:tsutomu-n/Python_Env_Sync_Repo.git
\```

### ステップ 2: ディレクトリに移動（Navigate to the Directory）

\```bash
cd Python_Env_Sync_Repo/backup_folder
\```

### ステップ 3: 復元スクリプトを実行（Run the Restore Script）

\```bash
python restore_environment.py
\```

このスクリプトは以下を行います（This script will）:

1. pyenvを使用して適切なPythonバージョンをインストール（Install the appropriate Python version using pyenv）。
2. Poetryを使用して依存関係をインストール（Install dependencies using Poetry）。
3. `.zshrc`と`.zshenv`ファイルをホームディレクトリにコピー（Copy `.zshrc` and `.zshenv` files to your home directory）。
4. 新しい設定を適用するために`.zshrc`をソース（Source the `.zshrc` to apply new settings）。

---

## 注意（Notes）

- `pyenv`と`poetry`がマシンにインストールされていることを確認してください（Make sure you have `pyenv` and `poetry` installed on your machine）。
- このスクリプトは既存の`.zshrc`と`.zshenv`ファイルを上書きします。スクリプトを実行する前に既存のファイルのバックアップを取ってください（This script will overwrite existing `.zshrc` and `.zshenv` files. Please backup your existing files before running the script）。
