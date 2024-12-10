
# Title: December 09, 2024 
Link: https://cloud.google.com/release-notes#December_09_2024<br>
## BigQuery - Go client library changes (bigquery/storage/apiv1beta1)

### Changed

**原文:**
- **bigquery/reservation:** Add a new field `is_flat_rate` to `.google.cloud.bigquery.reservation.v1.CapacityCommitment` to distinguish between flat rate and edition commitments (8dedb87)
- **bigquery/reservation:** Add the managed disaster recovery API(https (8dedb87)
- **bigquery:** Expose IsCaseInsensitive for dataset metadata (#11216) (364b639)
- **bigquery:** Support IAM conditions in datasets (#11123) (d93c2d9)
- **bigquery:** Do not override ctx within inner span creation (#11119) (627c69a), refs #10961
- **bigquery/reservation:** Clarify that `Autoscale.current_slots` in message `.google.cloud.bigquery.reservation.v1.Reservation` can temporarily be larger than `Autoscale.max_slots` if users reduce `Autoscale.max_slots` (8dedb87)
- **bigquery/reservation:** Update comment for `slot_capacity` in message `.google.cloud.bigquery.reservation.v1.Reservation` to provide more clarity about reservation baselines, committed slots and autoscaler SKU charges when the baseline exceeds committed slots (8dedb87)
- **bigquery/reservation:** Update comments for `commitment_start_time` and `commitment_end_time` in message `.google.cloud.bigquery.reservation.v1.CapacityCommitment` to provide details on how these values are affected by commitment renewal (8dedb87)

**説明:**

* BigQueryの予約機能に関するGo client libraryのアップデート
    * `CapacityCommitment` に `is_flat_rate` フィールドが追加され、定額料金とエディションコミットメントの区別が可能になりました。
    * マネージドディザスタリカバリAPIが追加されました。
    * データセットメタデータで`IsCaseInsensitive`が利用可能になりました。
    * データセットでIAM条件がサポートされるようになりました。
    * 内部スパン作成時にctxが上書きされないよう修正されました。
    * `Reservation`メッセージ内の`Autoscale.current_slots`が一時的に`Autoscale.max_slots`よりも大きくなる可能性があることを明確化しました。
    * `Reservation`メッセージ内の`slot_capacity`に関するコメントを更新し、予約ベースライン、コミット済みスロット、およびベースラインがコミット済みスロットを超えた場合のオートスケーラーSKU料金について、より明確な情報を提供するようにしました。
    * `CapacityCommitment`メッセージ内の`commitment_start_time`と`commitment_end_time`に関するコメントを更新し、コミットメントの更新によってこれらの値がどのように影響を受けるかについての詳細を提供するようにしました。 

**影響有無:** 有

**対処方法:**

BigQueryの予約機能を利用している場合は、これらの変更内容を確認し、必要に応じてアプリケーションのコードを更新してください。 

# Title: December 03, 2024 
Link: https://cloud.google.com/release-notes#December_03_2024<br>
# Cloud Composer 
## Announcement
**原文:** All Cloud Composer environment's GKE clusters are set up with maintenance exclusions from December 20, 2024 to January 2, 2025. For more information, see Maintenance exclusions. 

**説明:**  2024年12月20日から2025年1月2日までの期間、Cloud Composer環境のGKEクラスタに対するメンテナンスによる自動アップグレードや自動修復が一時的に停止されます。これは、年末年始の期間中にCloud Composerの安定性を確保するための措置です。

**製品への影響有無:**  有

**対処方法:** 
* 上記期間中にGKEクラスタのアップグレードやパッチ適用が必要な場合は、メンテナンスウィンドウを手動で設定する必要があります。
* 詳細は、メンテナンスの除外に関するドキュメントを参照してください。 [Maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions) 

# Title: December 02, 2024 
Link: https://cloud.google.com/release-notes#December_02_2024<br>
## Spanner

### Announcement

原文：

Spanner Graph is Generally Available (GA). For more information, see
Spanner Graph overview.
Spanner Graph supports defining path variables and using path functions. For more information, see Work with paths.
Information about how Spanner Graph supports the ISO international standard query language for graph databases is available. For more information, see Spanner Graph and ISO standards.
Spanner Graph supports vector similarity search to find K-nearest neighbors (KNN) and approximate nearest neighbors (ANN). For more information, see Perform vector similarity search in Spanner Graph.
Full-text search is available in Spanner Graph. For more information, see Use full-text search with Spanner Graph.

説明：

Spanner Graphが一般提供(GA)開始されました。主なアップデートは以下の通りです。

- パス変数の定義とパス関数の使用をサポート
- グラフデータベース用のISO国際標準クエリ言語のサポート
- K近傍(KNN)と近似最近傍(ANN)を見つけるためのベクトル類似検索のサポート
- フルテキスト検索のサポート

詳細については、各項目のリンクを参照してください。

影響有無：無

対処方法：
- Spanner Graphの新機能をご活用ください。
# Title: November 27, 2024 
Link: https://cloud.google.com/release-notes#November_27_2024<br>
# Cloud Composer

## Announcement 

**原文**:

In December 2024, Google will **remove the following previously deprecated Airflow operators** from the `apache-airflow-providers-google` package.

The new version of this package will be included in one of the future releases of Cloud Composer and the change will be announced in the Release Notes. After this change, it will not be possible to use these operators in your DAGs.

Make sure that you use up-to-date alternatives of the removed operators instead. For more information about removed and deprecated Airflow operators and their up-to-date alternatives, see Deprecated and removed Airflow operators.

[Deprecated and removed Airflow operators](https://cloud.google.com/composer/docs/composer-2/write-dags#deprecated-operators)
**Operators that will be removed in December 2024**: DataPipelineHook, CreateDataPipelineOperator, RunDataPipelineOperator, AutoMLDatasetLink, AutoMLDatasetListLink, AutoMLModelLink, AutoMLModelTrainLink, AutoMLModelPredictLink.

**説明**:
2024年12月に、`apache-airflow-providers-google` パッケージから、非推奨のAirflowオペレーターが削除されます。削除されるオペレーターは、DataPipelineHook、CreateDataPipelineOperator、RunDataPipelineOperator、AutoMLDatasetLink、AutoMLDatasetListLink、AutoMLModelLink、AutoMLModelTrainLink、AutoMLModelPredictLinkです。

このパッケージの新しいバージョンは、今後の Cloud Composer のリリースに含まれ、リリースノートで発表されます。変更後は、DAG でこれらのオペレーターを使用できなくなります。

削除されたオペレーターの代わりに、最新の代替手段を使用してください。削除および非推奨の Airflow オペレーターとその最新の代替手段の詳細については、「非推奨の Airflow オペレーター」を参照してください。

**影響有無**: 有

**対処方法**: 

2024年12月までに、削除される予定のAirflowオペレーターを利用している場合は、代替のオペレーターへの移行が必要です。 提供されているリンク先を参考に、最新の代替オペレーターへ変更してください。 

# Title: November 25, 2024 
Link: https://cloud.google.com/release-notes#November_25_2024<br>
## BigQuery

### 変更カテゴリ

Libraries/Java/Changes for google-cloud-bigquery

### 原文

- Enable maxTimeTravelHours in BigQuery java client library (#3555) (bd24fd8)
- Update experimental methods documentation to @internalapi (#3552) (20826f1)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.55.0 (#3559) (950ad0c)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20241027-2.0.0 (#3568) (b5ccfcc)
- Update dependency com.google.cloud:google-cloud-datacatalog-bom to v1.59.0 (#3561) (1bd24a1)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.40.0 (#3576) (d5fa951)
- Update github/codeql-action action to v2.27.1 (#3567) (e154ee3)
- Update github/codeql-action action to v2.27.3 (#3569) (3707a40)
- Update github/codeql-action action to v2.27.4 (#3572) (2c7b4f7)
- Fix BigQuery documentation formating (#3565) (552f491)

### 説明

BigQuery Javaクライアントライブラリのバージョン2.44.0における変更です。

- maxTimeTravelHoursが有効化されました。
- 実験的なメソッドのドキュメントが@internalapiに更新されました。
- いくつかの依存関係が更新されました。
- BigQueryドキュメントのフォーマットが修正されました。

### 影響有無

有

### 対処方法

BigQuery Javaクライアントライブラリをバージョン 2.44.0 に更新する必要があります。 

## Cloud Logging

### 変更カテゴリ

Libraries/Java/Changes for google-cloud-logging

### 原文

- **deps:** Update the Java code generator (gapic-generator-java) to 2.49.0 (a1ec68d)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.50.0 (afcf63c)
- Fixed outdated link to X-Cloud-Trace-Context header description (#1713) (d474313)
- Update sdk platform java dependencies (#1725) (531f8c5)

### 説明
Cloud Logging Javaライブラリのバージョン 3.20.7における変更です。

- Javaコードジェネレーター (gapic-generator-java) がバージョン 2.49.0 および 2.50.0 に更新されました。
- X-Cloud-Trace-Context ヘッダーの説明への古いリンクが修正されました。
- SDKプラットフォームJavaの依存関係が更新されました。

### 影響有無
有

### 対処方法

Cloud Logging Javaライブラリをバージョン 3.20.7 に更新する必要があります。

## Cloud Storage

### 変更カテゴリ

Libraries/Java/Changes for google-cloud-storage

### 原文

- Adds support for restore token (aef367d)
- Adds support for restore token (#2768) (0394354)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.49.0 (aef367d)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.50.0 (281cccb)
- Set default values for monitored resource (#2809) (27829a4)
- Update sdk-platform-java dependencies (#2817) (9e961c4)

### 説明

Cloud Storage Java ライブラリのバージョン 2.45.0 における変更です。

- リストアトークンがサポートされました。
- Javaコードジェネレーター (gapic-generator-java) がバージョン 2.49.0 および 2.50.0 に更新されました。
- 監視対象リソースのデフォルト値が設定されました。
- SDKプラットフォームJavaの依存関係が更新されました。

### 影響有無

有

### 対処方法

Cloud Storage Java ライブラリをバージョン 2.45.0 に更新する必要があります。 

## Pub/Sub

### 変更カテゴリ

Libraries/Java/Changes for google-cloud-pubsub

### 原文

- **deps:** Update the Java code generator (gapic-generator-java) to 2.49.0 (77546e0)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.50.0 (3f21af3)
- Update dependency com.google.cloud:google-cloud-bigquery to v2.43.3 (#2256) (f7fbc6c)
- Update dependency com.google.cloud:google-cloud-core to v2.47.0 (#2249) (3df5729)
- Update dependency com.google.cloud:google-cloud-storage to v2.44.1 (#2240) (f8dae4d)
- Update googleapis/sdk-platform-java action to v2.50.0 (#2261) (d0aab7d)
- Update sdk platform java dependencies (#2262) (b689fe2)

### 説明

Pub/Sub Java ライブラリのバージョン 1.134.2 における変更です。

- Javaコードジェネレーター (gapic-generator-java) がバージョン 2.49.0 および 2.50.0 に更新されました。
- いくつかの依存関係が更新されました。

### 影響有無

有

### 対処方法

Pub/Sub Java ライブラリをバージョン 1.134.2 に更新する必要があります。 

# Title: November 25, 2024 
Link: https://cloud.google.com/release-notes#November_25_2024<br>
## BigQuery - Java ライブラリアップデート (google-cloud-bigquery)

### 変更カテゴリ

Changed (変更)

### 原文

- Enable maxTimeTravelHours in BigQuery java client library (#3555) (bd24fd8)
- Update experimental methods documentation to @internalapi (#3552) (20826f1)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.55.0 (#3559) (950ad0c)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20241027-2.0.0 (#3568) (b5ccfcc)
- Update dependency com.google.cloud:google-cloud-datacatalog-bom to v1.59.0 (#3561) (1bd24a1)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.40.0 (#3576) (d5fa951)
- Update github/codeql-action action to v2.27.1 (#3567) (e154ee3)
- Update github/codeql-action action to v2.27.3 (#3569) (3707a40)
- Update github/codeql-action action to v2.27.4 (#3572) (2c7b4f7)
- Fix BigQuery documentation formating (#3565) (552f491)

### 説明

BigQuery Javaクライアントライブラリに以下の変更がありました。

- maxTimeTravelHours が有効になりました。
- 実験的なメソッドのドキュメントが @internalapi に更新されました。
- いくつかの依存関係が更新されました。
- BigQueryドキュメントのフォーマットが修正されました。

### 製品への影響有無

有

### 対処方法

BigQuery Java クライアントライブラリを使用している場合は、バージョン2.44.0以降にアップデートしてください。


## Pub/Sub - Java ライブラリアップデート (google-cloud-pubsub)

### 変更カテゴリ

Changed (変更)

### 原文

- **deps:** Update the Java code generator (gapic-generator-java) to 2.49.0 (77546e0)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.50.0 (3f21af3)
- Update dependency com.google.cloud:google-cloud-bigquery to v2.43.3 (#2256) (f7fbc6c)
- Update dependency com.google.cloud:google-cloud-core to v2.47.0 (#2249) (3df5729)
- Update dependency com.google.cloud:google-cloud-storage to v2.44.1 (#2240) (f8dae4d)
- Update googleapis/sdk-platform-java action to v2.50.0 (#2261) (d0aab7d)
- Update sdk platform java dependencies (#2262) (b689fe2)


### 説明

Pub/Sub Java クライアントライブラリの依存関係がアップデートされました。

- Java コードジェネレーター (gapic-generator-java) がバージョン 2.49.0 および 2.50.0 にアップデートされました。
- いくつかの依存関係が更新されました。

### 製品への影響有無

有

### 対処方法

Pub/Sub Java クライアントライブラリを使用している場合は、バージョン 1.134.2 以降にアップデートしてください。

# Title: November 21, 2024 
Link: https://cloud.google.com/release-notes#November_21_2024<br>
## Google Kubernetes Engine

### Changed

**原文:** If your GKE cluster was created before version 1.26, you can now migrate it to cgroupv2. This migration enables the use of Pod bursting in Autopilot mode.

**説明:**  バージョン 1.26 より前に作成された GKE クラスタを cgroupv2 に移行できるようになりました。この移行により、Autopilot モードで Pod バースト機能が使用できるようになります。

**製品への影響有無:** 有

**対処方法:** 
* GKEクラスタでAutopilotモードを使用しており、Pod bursting機能を利用したい場合は、クラスタをcgroupv2に移行する必要があります。
* 移行手順については、提供されたリンクを参照してください。
    * [migrate it to cgroupv2](https://cloud.google.com/kubernetes-engine/docs/how-to/migrate-cgroupv2)
    * [Pod bursting](https://cloud.google.com/kubernetes-engine/docs/how-to/pod-bursting-gke#availability-in-gke) 
* cgroupv2への移行は、アプリケーションに影響を与える可能性があります。移行前に、十分なテストを実施してください。 

# Title: November 19, 2024 
Link: https://cloud.google.com/release-notes#November_19_2024<br>
# Compute Engine
## Changed
原文: The documentation has been updated to clarify that future reservation requests don't support E2 machine types. To reserve VMs that use E2 machine types, use on-demand reservations instead.

説明： 将来の予約リクエストではE2 マシンタイプがサポートされなくなりました。E2 マシンタイプを使用するVMを予約するには、代わりにオンデマンド予約を使用してください。

影響有無：無し
対処方法：E2 マシンタイプを使用するVMを予約する場合は、オンデマンド予約を使用してください。

# Google Kubernetes Engine
## Changed
原文: GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

 The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.
説明： GKEクラスタバージョンが更新されました。

新しいクラスタとアップグレードで利用可能なバージョン：

以下のKubernetesバージョンが、新しいクラスタ、および既存クラスタのオプトインによるコントロールプレーンとノードのアップグレードで利用可能になりました。バージョン管理とアップグレードの詳細については、GKEのバージョン管理とサポートおよびアップグレードを参照してください。

影響有無：有
対処方法：必要に応じて、新しいバージョンを利用するためにクラスタのアップグレードを検討してください。

## Rapid channel
## Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- The following versions are now available in the Rapid channel:

- 1.28.15-gke.1159000
- 1.29.10-gke.1227000
- 1.30.6-gke.1125000
- 1.31.2-gke.1518000

説明： Rapidチャネルで以下のバージョンが利用可能になりました。

- 1.28.15-gke.1159000
- 1.29.10-gke.1227000
- 1.30.6-gke.1125000
- 1.31.2-gke.1518000

これらのバージョンは、リリースノートの公開時に展開がすでに進行中であり、Google Cloudのすべてのゾーンで完了するまでに数日かかる場合があります。

影響有無：有
対処方法：必要に応じて、Rapidチャネルで利用可能な新しいバージョンへのアップグレードを検討してください。

## Regular channel
## Changed
原文: There are no new releases in the Regular channel.

説明： Regularチャネルでの新しいリリースはありません。

影響有無：無
対処方法：対応不要です。

## Stable channel
## Changed
原文: There are no new releases in the Stable channel.
説明： Stableチャネルでの新しいリリースはありません。

影響有無：無
対処方法：対応不要です。

## Extended channel
## Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.27.16-gke.1836000 is now available in the Extended channel.
説明： Extendedチャネルでバージョン1.27.16-gke.1836000が利用可能になりました。

このバージョンは、リリースノートの公開時に展開がすでに進行中であり、Google Cloudのすべてのゾーンで完了するまでに数日かかる場合があります。

影響有無：有
対処方法：必要に応じて、Extendedチャネルで利用可能な新しいバージョンへのアップグレードを検討してください。

## No channel
## Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- The following versions are now available:

- 1.28.15-gke.1159000
- 1.29.10-gke.1227000
- 1.30.6-gke.1125000
- 1.31.2-gke.1518000

- The following node versions are now available:

- 1.27.16-gke.1836000
- 1.28.15-gke.1159000
- 1.29.10-gke.1227000
- 1.30.6-gke.1125000
- 1.31.2-gke.1518000
説明： 
チャネルを指定していないクラスタ向けに以下のバージョンが利用可能になりました。

- 利用可能なバージョン: 1.28.15-gke.1159000, 1.29.10-gke.1227000, 1.30.6-gke.1125000, 1.31.2-gke.1518000
- 利用可能なノードバージョン: 1.27.16-gke.1836000, 1.28.15-gke.1159000, 1.29.10-gke.1227000, 1.30.6-gke.1125000, 1.31.2-gke.1518000

これらのバージョンは、リリースノートの公開時に展開がすでに進行中であり、Google Cloudのすべてのゾーンで完了するまでに数日かかる場合があります。

影響有無：有
対処方法：必要に応じて、チャネルを指定していないクラスタで利用可能な新しいバージョンへのアップグレードを検討してください。 

# Title: November 18, 2024 
Link: https://cloud.google.com/release-notes#November_18_2024<br>
# Pub/Sub

## Libraries/Node.js/@google-cloud/pubsub/Changes for @google-cloud/pubsub/4.9.0

### 原文

- Add IngestionFailureEvent to the external proto (#1984) (7075430)
- KiB, not MiB for ack size limits (#1999) (798270d)

### 説明
- Pub/Sub Node.js ライブラリのバージョン 4.9.0 がリリースされました。
  - 外部プロトコルに IngestionFailureEvent が追加されました。
  - 確認応答サイズの上限の単位が MiB から KiB に修正されました。

### 製品への影響有無
-  バージョン 4.9.0 より前の  `@google-cloud/pubsub` を使用しているアプリケーションに影響があります。

### 対処方法
 - `@google-cloud/pubsub` をバージョン 4.9.0 以降にアップデートしてください。
 -  確認応答サイズの上限に MiB 単位を使用している場合は、KiB 単位に修正してください。 

# Title: November 15, 2024 
Link: https://cloud.google.com/release-notes#November_15_2024<br>
## Cloud Run

### Changed

原文: `asia-south1` (Mumbai, India) is now subject to Tier 1 pricing

説明：インドのムンバイリージョン(`asia-south1`)がTier 1の料金体系の対象になりました。

影響有無：有

対処方法：`asia-south1` リージョンを利用している場合は、料金体系が変更になるため、[料金表](https://cloud.google.com/run/pricing#tables)を確認してください。 


## Cloud Storage

### Changed

原文: You can now use the `x-amz-decoded-content-length` header to allow an XML API upload that uses chunked transfer encoding to include a signature in its `Authorization` header.

説明：チャンク転送エンコーディングを使用する XML API アップロードで、`Authorization` ヘッダーに署名を含めるために `x-amz-decoded-content-length` ヘッダーを使用できるようになりました。

影響有無：無

対処方法： `x-amz-decoded-content-length` ヘッダーは任意で利用できます。チャンク転送エンコーディングを使用する XML API アップロードで署名を利用する場合は、[x-amz-decoded-content-length ヘッダー](https://cloud.google.com/storage/docs/xml-api/reference-headers#xamzdecodedcontentlength)と[署名](https://cloud.google.com/storage/docs/authentication/signatures)のドキュメントを参照してください。 
