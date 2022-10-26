
<!-- README.md is generated from README.Rmd. Please edit that file -->

# estatapi.appId

<!-- badges: start -->
<!-- badges: end -->

`{estatapi.appId}`は`{estatapi}`の関数群を使用するときに入力する必要のある、`appId`を一度設定することで`{estatapi}`の各関数をラップした`{estatapi.appId}`関数実行するときに`appId`を入力する必要がなくなることを目指したパッケージです。

e-StatのAPIを操作する各関数の挙動は`{estatapi}`のドキュメントを参照してください。

## Installation

You can install the development version of `{estatapi.appId}` like so:

``` r
remote::install_github("indenkun/estatapi.appId")
```

## 使い方

`set_appId()`で一度e-StatのAPP
IDを設定すると、`{estatapi}`の各関数をラップした`{estatapi.appId}`を実行するときに`appId`を入力する必要がなくなります。

``` r
library(estatapi.appId)
set_appId("XXX")
```

e-Stat
APIを操作する各関数の基本的な挙動はもともとの`{estatapi}`と変わりません。

`{estatapi}`と`{estatapi.appId}`とのe-Stat
APIを操作する各関数の変更点は、`{estatapi.appId}`では引数の`appId`が一番最後になっており、既定値が`NULL`になっていますが、`set_appId()`で設定されて入ればその値が代入されるようになっています。

``` r
estat_getStatsList("チョコレート")
#> # A tibble: 258 × 22
#>    `@id`     STAT_…¹ GOV_ORG STATI…² TITLE CYCLE SURVE…³ OPEN_…⁴ SMALL…⁵ COLLE…⁶
#>    <chr>     <chr>   <chr>   <chr>   <chr> <chr> <chr>   <chr>   <chr>   <chr>  
#>  1 00001000… 全国物… 総務省  平成9…  価格… -     199711  2007-0… 0       該当な…
#>  2 00001001… 全国物… 総務省  平成9…  価格… -     199711  2007-0… 0       該当な…
#>  3 00001001… 全国物… 総務省  平成9…  指数… -     199711  2007-0… 0       該当な…
#>  4 00001001… 全国物… 総務省  平成9…  指数… -     199711  2007-0… 0       該当な…
#>  5 00001001… 全国物… 総務省  平成9…  品目… -     199711  2007-0… 0       該当な…
#>  6 00001001… 全国物… 総務省  平成9…  品目… -     199711  2007-0… 0       該当な…
#>  7 00001001… 全国物… 総務省  平成9…  品目… -     199711  2007-0… 0       該当な…
#>  8 00001001… 全国物… 総務省  平成9…  品目… -     199711  2007-0… 0       該当な…
#>  9 00034481… 工業統… 経済産… 工業統… 品目… 年次  202001… 2022-0… 0       該当な…
#> 10 00031265… 工業統… 経済産… 工業統… 品目… 年次  201301… 2015-0… 0       該当な…
#> # … with 248 more rows, 12 more variables: MAIN_CATEGORY <chr>,
#> #   SUB_CATEGORY <chr>, OVERALL_TOTAL_NUMBER <chr>, UPDATED_DATE <chr>,
#> #   TABULATION_CATEGORY <chr>, TABULATION_SUB_CATEGORY1 <chr>,
#> #   DESCRIPTION <chr>, TABLE_CATEGORY <chr>, TABLE_NAME <chr>,
#> #   TABULATION_SUB_CATEGORY2 <chr>, TABLE_SUB_CATEGORY1 <chr>,
#> #   TABULATION_SUB_CATEGORY3 <chr>, and abbreviated variable names ¹​STAT_NAME,
#> #   ²​STATISTICS_NAME, ³​SURVEY_DATE, ⁴​OPEN_DATE, ⁵​SMALL_AREA, ⁶​COLLECT_AREA
```

ただし、`appId`が各関数の実行時に指定されている場合には、入力された値が優先的に使用されます。

`appId`は`{rappdirs}`の`user_data_dir()`指定されるユーザー設定ディレクトリ下に`R\estatapi.appId`に`appId`ファイルに平文で保存されます。

`clear_appId()`を実行するとこの`appId`ファイルが削除されます。

設定した`appId`は`check_appId()`で確認できます。

## Licence

MIT.

## Imports Packages

- `{estatapi}`
- `{rappdirs}`

## Notice

- R 4.2.1 (Windows)でのみ挙動を確認しています。
- 多分MacやLinuxでも`{rappdirs}`の`user_data_dir()`関数がいい感じにディレクトリを指定してくれるはずなので期待通りの動作をすると思います。
