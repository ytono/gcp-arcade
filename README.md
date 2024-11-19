
# Title: November 15, 2024 
Link: https://cloud.google.com/release-notes#November_15_2024<br>
## Cloud Storage

### Changed

**原文:** You can now use the `x-amz-decoded-content-length` header to allow an XML API upload that uses chunked transfer encoding to include a signature in its `Authorization` header. 

**説明:** XML API を使用してチャンク転送エンコーディングでアップロードする際に、 `x-amz-decoded-content-length` ヘッダーを使用することで `Authorization` ヘッダーに署名を含めることができるようになりました。

**影響有無:**  アップロード時にチャンク転送エンコーディングを使用し、かつ `Authorization` ヘッダーに署名を含める場合に影響があります。

**対処方法:** 
* `x-amz-decoded-content-length` ヘッダーを使用する場合は、Cloud Storage のドキュメントを参照し、正しく実装してください。
* 従来の方法で問題なく動作している場合は、変更は必須ではありません。 

# Title: November 14, 2024 
Link: https://cloud.google.com/release-notes#November_14_2024<br>
# BigQuery 

## Announcement

### 原文
You can try Gemini in BigQuery at no charge until January 27, 2025. After that date, to continue to use Gemini in BigQuery you must do one of the following:

- Purchase and assign BigQuery Enterprise Plus edition reservations to projects that use Gemini in BigQuery.
- Purchase Gemini Code Assist Enterprise.
To learn more, see Purchase Gemini in BigQuery. These purchase options are now generally available (GA).

### 説明

BigQueryでGeminiを2025年1月27日まで無料で試用できます。それ以降もGeminiを使い続けるには、以下のいずれかが必要です。

- BigQuery Enterprise Plus Editionの予約を購入し、BigQueryでGeminiを使用するプロジェクトに割り当てる。
- Gemini Code Assist Enterpriseを購入する。

これらの購入オプションは現在、一般提供(GA)されています。

### 製品への影響有無

有

### 対処方法

2025年1月27日以降もBigQueryでGeminiを使用する場合、上記2つの購入オプションから選択し、購入・設定を行う必要があります。 

# Title: November 13, 2024 
Link: https://cloud.google.com/release-notes#November_13_2024<br>
## Cloud Composer 

### Announcement - 2024年11月13日リリース開始 

**原文:** A new Cloud Composer release has started on **November 13, 2024**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.

**説明:** 2024年11月13日から新しいCloud Composerのリリースが開始されました。段階的に全リージョンに展開されるため、今後の変更や新機能に備えてください。リリースは現在進行中であり、記載されている変更や機能の一部は、一部のリージョンではまだ利用できない可能性があります。

**製品への影響有無:** 無

**対処方法:** 特になし。


### Fixed - AirflowのDST遷移問題を修正 

**原文:** *(Airflow 2.7.3)* Backported #35887 to fix an issue that occurred during the DST transition. The issue affected DAGs with timezone-aware cron schedule and caused infinite loops in the Airflow scheduler.

[#35887](https://github.com/apache/airflow/pull/35887)

**説明:** Airflow 2.7.3において、DST（夏時間）遷移中に発生する問題を修正するために、#35887がバックポートされました。この問題は、タイムゾーンを認識するcronスケジュールを持つDAGに影響を与え、Airflowスケジューラで無限ループを引き起こしていました。

**製品への影響有無:**  有 (Airflow 2.7.3を利用している場合)

**対処方法:** Cloud Composerを最新バージョンにアップデートしてください。


### Changed - Cloud Composer 3 環境作成エラーメッセージの改善 

**原文:** Improved the error message generated when a Cloud Composer 3 environment creation fails because of missing permissions.

**説明:** 権限不足が原因でCloud Composer 3環境の作成に失敗した場合に生成されるエラーメッセージが改善されました。

**製品への影響有無:** 無

**対処方法:** 特になし。


### Changed - apache-airflow-providers-google パッケージのアップグレード 

**原文:** *(Airflow 2.10.2 and 2.9.3)* The `apache-airflow-providers-google` package was upgraded to version 10.25.0 in Cloud Composer 2 images and Cloud Composer 3 builds. For more information about changes, see the apache-airflow-providers-google changelog from version 10.24.0 to version 10.25.0.

[apache-airflow-providers-google changelog](https://airflow.apache.org/docs/apache-airflow-providers-google/10.25.0/commits.html)

**説明:** Airflow 2.10.2および2.9.3において、Cloud Composer 2イメージとCloud Composer 3ビルドで`apache-airflow-providers-google`パッケージがバージョン10.25.0にアップグレードされました。変更点の詳細については、バージョン10.24.0からバージョン10.25.0へのapache-airflow-providers-googleの変更履歴を参照してください。

**製品への影響有無:**  有 (Airflow 2.10.2, 2.9.3 を利用している場合)

**対処方法:** `apache-airflow-providers-google` の変更履歴を確認し、必要な対応を行ってください。


### Changed - apache-airflow-providers-cncf-kubernetes パッケージのアップグレード 

**原文:** *(Airflow 2.10.2 and 2.9.3)* The `apache-airflow-providers-cncf-kubernetes` package was upgraded to version 9.0.1 in Cloud Composer 2 images and Cloud Composer 3 builds. For more information about changes, see the apache-airflow-providers-cncf-kubernetes changelog from version 9.0.0 to version 9.0.1.

[apache-airflow-providers-cncf-kubernetes changelog](https://airflow.apache.org/docs/apache-airflow-providers-cncf-kubernetes/stable/changelog.html)

**説明:** Airflow 2.10.2および2.9.3において、Cloud Composer 2イメージとCloud Composer 3ビルドで`apache-airflow-providers-cncf-kubernetes`パッケージがバージョン9.0.1にアップグレードされました。変更点の詳細については、バージョン9.0.0からバージョン9.0.1へのapache-airflow-providers-cncf-kubernetesの変更履歴を参照してください。

**製品への影響有無:**  有 (Airflow 2.10.2, 2.9.3 を利用している場合)

**対処方法:** `apache-airflow-providers-cncf-kubernetes` の変更履歴を確認し、必要な対応を行ってください。


### Changed - Cloud Composer 3 で利用可能な新しい Airflow ビルド 

**原文:** New Airflow builds are available in Cloud Composer 3:

[Airflow builds](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-3)
- composer-3-airflow-2.10.2-build.0
- composer-3-airflow-2.9.3-build.7 (default)
- composer-3-airflow-2.7.3-build.23

**説明:** Cloud Composer 3で新しいAirflowビルドが利用可能になりました。

**製品への影響有無:** 無

**対処方法:** 特になし。


### Changed - Cloud Composer 2 で利用可能な新しいイメージ

**原文:** New images are available in Cloud Composer 2:

[images](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-2)
- composer-2.9.11-airflow-2.10.2
- composer-2.9.11-airflow-2.9.3 (default)
- composer-2.9.11-airflow-2.7.3

**説明:** Cloud Composer 2で新しいイメージが利用可能になりました。

**製品への影響有無:** 無

**対処方法:** 特になし。


### Changed - 以前の Cloud Composer 3 ビルドのサポート期間

**原文:** Support dates for previous Cloud Composer 3 builds are available. All Cloud Composer 3 builds with Airflow 2.9.3 are supported until November 13, 2025.

**説明:** 以前のCloud Composer 3ビルドのサポート日が公開されました。Airflow 2.9.3を搭載したすべてのCloud Composer 3ビルドは、2025年11月13日までサポートされます。

**製品への影響有無:** 無

**対処方法:** 特になし。 

# Title: November 11, 2024 
Link: https://cloud.google.com/release-notes#November_11_2024<br>
## BigQuery

### Changes for google-cloud-bigquery

**原文:**
- Updates to allow users to set max_stream_count (#2039) (7372ad6)

**説明:**
BigQueryのPythonクライアントライブラリ `google-cloud-bigquery` のバージョン 3.27.0 がリリースされました。このバージョンでは、`max_stream_count` を設定できるようになりました。これにより、ユーザーはストリームの最大数を制御できるようになります。

**製品への影響有無:** 無
**対処方法:** 特に対応は不要です。 `google-cloud-bigquery` をバージョン 3.27.0 にアップデートすることで、新機能が利用可能になります。

## Google Kubernetes Engine

### Changed

**原文:**
Clusters now have unified and flexible configuration, allowing you to modify control plane access and cluster node settings at any time, without the need to recreate the cluster. This eliminates the previous distinction between private and public clusters. All clusters support this flexibility and utilize DNS-based endpoints for secure and direct control plane access from any network, removing the need for bastion hosts or proxies. You can still enhance security with measures like VPC Service Controls. 

**説明:**
Google Kubernetes Engine (GKE) のクラスタ設定がより柔軟になりました。コントロールプレーンへのアクセスやクラスタノードの設定を、クラスタを作り直すことなくいつでも変更できるようになりました。これにより、従来のプライベートクラスタとパブリッククラスタの区別がなくなり、すべてのクラスタでこの柔軟性がサポートされます。また、すべてのクラスタはDNSベースのエンドポイントを利用して、どのネットワークからでもセキュアかつ直接的にコントロールプレーンにアクセスできるようになり、bastionホストやプロキシが不要になりました。VPC Service Controlsなどの対策でセキュリティを強化することも可能です。

**製品への影響有無:** 有
**対処方法:** 既存のクラスタは自動的に新しい設定に更新されますが、以前の設定を引き続き使用することもできます。詳細については、[About network isolation in GKE](https://cloud.google.com/kubernetes-engine/docs/concepts/network-isolation) を参照してください。

## Pub/Sub

### Changes for google-cloud-pubsub

**原文:** 
- Add support for Python3.13 (#1302) (ab22e27)

**説明:**
Pub/SubのPythonクライアントライブラリ `google-cloud-pubsub` のバージョン 2.27.1 がリリースされました。このバージョンでは、Python 3.13 のサポートが追加されました。

**製品への影響有無:** 無
**対処方法:** Python 3.13 を使用する場合は、`google-cloud-pubsub` をバージョン 2.27.1 にアップデートする必要があります。 
