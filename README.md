# tz_blog_pelican

deploy成功

```
cd myblog/y
pelican content
cd output

python -m http.server
http://0.0.0.0:8000/

あるいは

git init
git remote add origin https://github.com/tztechno/tz_blog_pelican
git add .
git commit -m "Initial commit"
git push -u origin master
```

---


以下に、再度手順をまとめておきます。今後の参考にしてください。

### PelicanサイトのGitHub Pagesへのデプロイ手順

1. **GitHub リポジトリの作成**
   - GitHub上で新しいリポジトリを作成する。

2. **Pelican設定ファイルの更新**
   - `pelicanconf.py`ファイルで、`SITEURL`をGitHub PagesのURLに設定する。
   ```python
   SITEURL = 'https://<your-username>.github.io/<your-repo>'
   RELATIVE_URLS = False
   ```
   - `<your-username>` と `<your-repo>` をあなたのGitHubユーザー名とリポジトリ名に置き換える。

3. **サイトのビルド**
   - Pelicanでサイトをビルドする。
   ```bash
   pelican content
   ```

4. **`output` ディレクトリのGitリポジトリを初期化**
   - `output`ディレクトリに移動し、Gitリポジトリを初期化する。
   ```bash
   cd output
   git init
   ```

5. **リモートリポジトリの追加**
   - リモートリポジトリを追加する。
   ```bash
   git remote add origin https://github.com/<your-username>/<your-repo>.git
   ```

6. **コミットとプッシュ**
   - `output`ディレクトリの内容をコミットしてGitHubにプッシュする。
   ```bash
   git add .
   git commit -m "Initial commit"
   git push -u origin master
   ```

7. **GitHub Pagesの設定確認**
   - GitHubリポジトリの設定ページに移動し、「Pages」セクションで`master`ブランチが選択されていることを確認する。

### ローカルでの確認方法（オプション）

公開前にローカル環境でサイトを確認したい場合は、以下の手順でローカルサーバーを起動できます。

```bash
cd output
python -m http.server
```

ブラウザで `http://0.0.0.0:8000` にアクセスして確認してください。


---
