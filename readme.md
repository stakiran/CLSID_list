# CLSID list
Windows の主要アプリやら機能やらの CLSID 一覧。

`HKEY_CLASSES_ROOT\CLSID` から抽出してみた。

## 成果物
- [こちら](6_markdown_list_fix.md)

なお環境は Windows 7 Professional です。

## 導出過程

### 1 infotiip
[1_infotip.txt](1_infotip.txt)

```
$ reg query "HKEY_CLASSES_ROOT\CLSID" /f "InfoTip" /s > 1_infotip.txt
```

### 2 keyonly
[2_keyonly.txt](2_keyonly.txt)

Grep でキー部分の行だけ取り出す。

### 3 queries
[3_queries.txt](3_queries.txt)

[reg_query_all.bat](reg_query_all.bat) を使って各キーに対して `reg query /f "*" /d` を実行

### 4_removing_dusts
[4_removing_dusts.txt](4_removing_dusts.txt)

余分な行を Grep などで削除。

### 5 markdown list
[5_markdown_list.md](5_markdown_list.md)

Grep と正規表現で頑張って Markdown Table 文法に。

```
    (既定)    REG_SZ    DefaultLocation

(    )([^ ]+)(    )([a-zA-Z_]+)(    )(.+)
| \2 | \4 | \6 |


| キー名 | エントリ種類 | 値 |
| ------ | ------------ | -- |
```

### 5 namelist
※名前だけ眺めたかったのでついでに作った

[5_namelist.txt]([5_namelist.txt)

CLSID が表すアプリ名/機能名を取り出すために、`(既定)` エントリの値を Grep と正規表現で頑張って取り出す。

### 6 markdown list
[6_markdown_list_fix.md](6_markdown_list_fix.md)

GFM でプレビューしながら余分なデータ削除や書式修正など。

