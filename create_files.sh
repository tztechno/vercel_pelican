#!/bin/bash

# 日付を取得
current_date=$(date +%Y-%m-%d)

# 数字範囲の指定
start=356
end=417

all=("アイスランド語" "アフリカーンス語" "アムハラ語" "アラビア語" "アルバニア語" "イタリア語" "インドネシア語" "ウェールズ語" "ウクライナ語" "ウルドゥ語" "エストニア語" "オランダ語" "カタルーニャ語" "ガリシア語" "カンナダ語" "ギリシャ語" "グジャラート語" "クメール語" "クロアチア語" "ジャワ語" "シンハラ語" "スウェーデン語" "スペイン語" "スロバキア語" "スワヒリ語" "スンダ語" "セルビア語" "タイ語" "タガログ語" "タミル語" "チェコ語" "テルグ語" "デンマーク語" "ドイツ語" "トルコ語" "ネパール語" "ノルウェー語" "ハウサ語" "バスク語" "ハンガリー語" "パンジャブ語" "ヒンディー語" "フィンランド語" "フランス語" "ブルガリア語" "ベトナム語" "ヘブライ語" "ベンガル語" "ポーランド語" "ボスニア語" "ポルトガル語" "マラーティー語" "マラヤーラム語" "マレー語" "ミャンマー語" "ラテン語" "ラトビア語" "リトアニア語" "ルーマニア語" "ロシア語" "韓国語" "中国語簡体")
# 言語の配列を定義
langs=("アイスランド語" "アフリカーンス語" "アムハラ語" "アラビア語" "アルバニア語" "イタリア語" "インドネシア語" "ウェールズ語" "ウクライナ語" "ウルドゥ語" "エストニア語" "オランダ語" "カタルーニャ語" "ガリシア語" "カンナダ語" "ギリシャ語" "グジャラート語" "クメール語" "クロアチア語" "ジャワ語" "シンハラ語" "スウェーデン語" "スペイン語" "スロバキア語" "スワヒリ語" "スンダ語" "セルビア語" "タイ語" "タガログ語" "タミル語" "チェコ語" "テルグ語" "デンマーク語" "ドイツ語" "トルコ語" "ネパール語" "ノルウェー語" "ハウサ語" "バスク語" "ハンガリー語" "パンジャブ語" "ヒンディー語" "フィンランド語" "フランス語" "ブルガリア語" "ベトナム語" "ヘブライ語" "ベンガル語" "ポーランド語" "ボスニア語" "ポルトガル語" "マラーティー語" "マラヤーラム語" "マレー語" "ミャンマー語" "ラテン語" "ラトビア語" "リトアニア語" "ルーマニア語" "ロシア語" "韓国語" "中国語簡体")
texts=("I've never seen anyone as bad as him.")
kws=("bad")

# テンプレート内容
template="Title:
Date:
Category: Blog
Tags:
Slug:
Authors: stpete
Summary:
"

# 指定範囲の数字に対してファイルを作成または編集
for number in $(seq $start $end); do
    # 数字をゼロ埋め（zfill(3)）する
    zfilled_number=$(printf "%03d" $number)
    
    # ファイル名を作成
    file_name="${current_date}-${zfilled_number}.md"
    
    # 言語のインデックスを計算（0から始まるため-1する）
    lang_index=$((number - start))
    current_lang="${langs[$lang_index]}"
    
    # texts配列から要素を取得（配列が1つの要素しか持たない場合は常に最初の要素を使用）
    current_text="${texts[0]}"
    current_kw="${kws[0]}"

    # ファイルが存在しない場合、テンプレートを追加
    if [ ! -f "$file_name" ]; then
        echo "$template" > "$file_name"
    fi
    
    # 一時ファイルを作成
    tmp_file=$(mktemp)

    # ファイルの内容を読み込み、指定された行を置き換える
    while IFS= read -r line; do
        case "$line" in
            "Date:")
                echo "Date: ${current_date}" >> "$tmp_file"
                ;;
            "Slug:")
                echo "Slug: ${zfilled_number}" >> "$tmp_file"
                ;;
            "Tags:")
                echo "Tags: ${current_kw}, ${current_lang}" >> "$tmp_file"
                ;;
            "Title:")
                echo "Title: ${current_text} ${current_lang}" >> "$tmp_file"
                ;;
            "Summary:")
                echo "Summary: ${current_text}" >> "$tmp_file"
                ;;
            *)
                echo "$line" >> "$tmp_file"
                ;;
        esac
    done < "$file_name"

    # 一時ファイルの内容を元のファイルに書き戻す
    if ! mv "$tmp_file" "$file_name"; then
        echo "エラー: ファイル '${file_name}' の更新に失敗しました。" >&2
        rm -f "$tmp_file"
        exit 1
    fi

    # 確認メッセージ
    echo "ファイル '${file_name}' が作成または編集されました。"
done