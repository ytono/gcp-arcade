
# Title: November 08, 2024 
Link: https://cloud.google.com/release-notes#November_08_2024<br>
## Cloud Logging

### Audit Logging now populates the `status.details` field in the audit log with the `google.rpc.ErrorInfo` and `google.rpc.Help` proto payload types in cases where an API returns an error status and that status includes one of those types in the details field.

#### 説明
APIがエラーを返し、そのエラーの詳細に`google.rpc.ErrorInfo`または`google.rpc.Help`が含まれている場合、Audit Loggingの`status.details`フィールドに、これらの詳細情報が設定されるようになりました。

#### 製品への影響有無
有

#### 対処方法
`status.details`フィールドを利用したモニタリングやアラート設定を行っている場合は、`google.rpc.ErrorInfo`および`google.rpc.Help`の形式に対応するよう修正が必要となる可能性があります。変更の詳細については、提供されているリンク先を参照してください。

## Google Kubernetes Engine

### The machine family of N1 custom machine types (like `custom-1-1024`) is now accurately labeled as "N1" for all node versions later than 1.31.2-gke.1115000.

#### 説明
バージョン1.31.2-gke.1115000より後のノードバージョンにおいて、N1カスタムマシンタイプ（`custom-1-1024`など）のマシンファミリーのラベルが「N1」と正しく表示されるようになりました。

#### 製品への影響有無
 無

#### 対処方法
 特に対処は必要ありません。 

# Title: November 06, 2024 
Link: https://cloud.google.com/release-notes#November_06_2024<br>
## Cloud Composer

###  PyPIパッケージインストール速度の改善

**原文:** *(Cloud Composer 3)* Fixed an issue that affected the speed of PyPI package installation. PyPI packages are now installed slightly faster.

**説明:** Cloud Composer 3 環境で、PyPI パッケージのインストール速度が改善されました。

**製品への影響有無:** 無

**対処方法:** 特に対処は不要です。


###  preinstalled パッケージからのdocutils パッケージの削除

**原文:** *(Airflow 2.9.3 and 2.7.3)* The `docutils` package was removed from preinstalled packages.

**説明:** Airflow 2.9.3 と 2.7.3 で、 `docutils` パッケージが事前インストールされたパッケージから削除されました。

**製品への影響有無:**  有

**対処方法:** `docutils` パッケージを使用している場合は、個別にインストールする必要があります。


### Cloud Composer 3 で利用可能な Airflow ビルドの更新

**原文:** New Airflow builds are available in Cloud Composer 3: [Airflow builds](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-3)
- composer-3-airflow-2.9.3-build.6 (default)
- composer-3-airflow-2.7.3-build.22

**説明:** Cloud Composer 3 で、新しい Airflow ビルドが利用可能になりました。デフォルトビルドは composer-3-airflow-2.9.3-build.6 です。

**製品への影響有無:** 無

**対処方法:** 新しいビルドを使用する場合は、明示的に指定してください。そうでない場合は、デフォルトビルドが使用されます。


###  Cloud Composer 2 で利用可能なイメージの更新

**原文:** New images are available in Cloud Composer 2: [images](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-2)
- composer-2.9.10-airflow-2.9.3 (default)
- composer-2.9.10-airflow-2.7.3

**説明:** Cloud Composer 2 で、新しいイメージが利用可能になりました。デフォルトイメージは composer-2.9.10-airflow-2.9.3 です。

**製品への影響有無:** 無

**対処方法:** 新しいイメージを使用する場合は、明示的に指定してください。そうでない場合は、デフォルトイメージが使用されます。


### Cloud Composer バージョン2.5.1 のサポート終了

**原文:** Cloud Composer version 2.5.1 has reached its end of support period. [end of support period](https://cloud.google.com/composer/docs/concepts/versioning/composer-versioning-overview#version-deprecation-and-support)

**説明:** Cloud Composer バージョン 2.5.1 のサポートが終了しました。

**製品への影響有無:**  有

**対処方法:** セキュリティと安定性の維持のため、サポートされているバージョンにアップグレードしてください。


## Google Kubernetes Engine

### GKE クラスタバージョンの更新

**原文:** (2024-R43) Version updates GKE cluster versions have been updated. **New versions available for upgrades and new clusters.** The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades. [GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning) [Upgrades](https://cloud.google.com/kubernetes-engine/upgrades) ## Rapid channel > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones. - The following versions are now available in the Rapid channel: - 1.28.15-gke.1041000 - 1.29.10-gke.1071000 - 1.30.5-gke.1713000 - 1.31.2-gke.1115000 - The following versions are no longer available in the Rapid channel: - 1.28.14-gke.1340000 - 1.28.15-gke.1015000 - 1.29.9-gke.1496000 - 1.29.10-gke.1043000 - 1.30.5-gke.1443001 ...(以下略)

**説明:** GKE クラスタのバージョンが更新されました。Rapid、Regular、Extended、No channel の各チャネルで利用可能な Kubernetes バージョン、自動アップグレードの対象バージョン、サポート終了バージョンが更新されています。

**製品への影響有無:** 有

**対処方法:** 
* 各チャネルで利用可能なバージョン、サポート終了バージョンを確認し、必要な場合はアップグレードを計画してください。
* 自動アップグレードが有効になっているクラスタでは、自動的にアップグレードが適用されます。メンテナンスウィンドウなどを利用して、アップグレードによる影響を最小限に抑えるようにしてください。
# Title: November 05, 2024 
Link: https://cloud.google.com/release-notes#November_05_2024<br>
## BigQuery

### Announcement

**原文:** The BigQuery Data Transfer Service data source change log provides details about upcoming changes to data source schemas and schema mappings.

[BigQuery Data Transfer Service data source change log](https://cloud.google.com/bigquery/docs/transfer-changes)

**説明:** BigQuery Data Transfer Serviceのデータソースのスキーマとスキーママッピングに関する今後の変更についての詳細が、データソース変更ログで提供されるようになりました。

**影響有無:**  有（BigQuery Data Transfer Serviceを利用している場合）

**対処方法:** BigQuery Data Transfer Service を利用している場合は、データソースの変更ログを確認し、今後の変更に備えてください。特に、スキーマの変更はデータ処理に影響を与える可能性があるため、注意が必要です。提供されている変更ログを参照して、必要な対応を事前に検討してください。 

# Title: November 04, 2024 
Link: https://cloud.google.com/release-notes#November_04_2024<br>
## BigQuery

### 変更カテゴリ: Changes

原文：
- **bigquery/storage/apiv1beta1:** Add scheduleOptionsV2 and Error fields for TransferConfig (78d8513)
- **bigquery/storage:** Add experimental ArrowData type and arrow_data field within AppendRowsRequest (f0b05e2)
- **bigquery:** Handle null RANGE (#11058) (9979e72), refs #11047 
- **bigquery:** Parse negative NUMERIC from arrow (#11052) (83352c4)
- **bigquery:** Update google.golang.org/api to v0.203.0 (8bb87d5)
- **bigquery:** WARNING: On approximately Dec 1, 2024, an update to Protobuf will change service registration function signatures to use an interface instead of a concrete type in generated .pb.go files. This change is expected to affect very few if any users of this client library. For more information, see https://togithub.com/googleapis/google-cloud-go/issues/11020. (8bb87d5)
- **bigquery:** Link types on package docs (#11036) (c4af6fe)

説明：
- BigQueryのデータ転送設定に関する更新が行われ、スケジュールオプションとエラーに関するフィールドが追加されました。
- BigQuery Storageに、実験的なArrowData型とAppendRowsRequest内のarrow_dataフィールドが追加されました。
- BigQuery Goクライアントライブラリで、null値を持つRANGE型の処理が修正されました。
- BigQuery Goクライアントライブラリで、Arrow形式からの負のNUMERIC型の解析が修正されました。
- BigQuery Goクライアントライブラリで使用されているgoogle.golang.org/apiがv0.203.0にアップデートされました。
- BigQuery Goクライアントライブラリで、Protobufのアップデートに関する警告が追加されました。このアップデートは2024年12月1日頃に予定されており、サービス登録関数のシグネチャが変更されます。
- BigQuery Goクライアントライブラリのドキュメントで、パッケージのリンクタイプが修正されました。

影響有無：有（Goクライアントライブラリを使用している場合） 

対処方法： 
- Goクライアントライブラリを使用している場合は、最新バージョンにアップデートしてください。 
- Protobufのアップデートに関する警告については、今後の発表に注意し、必要に応じてコードの修正を行ってください。

## BigQuery

### 変更カテゴリ: Changes

原文：
- Update dependency com.google.cloud:google-cloud-bigquerystorage-bom to v3.10.2 (19fc184)
- Update actions/checkout action to v4.2.2 (#3541) (c36c123)
- Update actions/upload-artifact action to v4.4.2 (#3524) (776a554)
- Update actions/upload-artifact action to v4.4.3 (#3530) (2f87fd9)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.54.0 (#3532) (25be311)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20241013-2.0.0 (#3544) (0c42092)
- Update dependency com.google.cloud:google-cloud-bigquerystorage-bom to v3.10.0 (0bd3c86)
- Update dependency com.google.cloud:google-cloud-bigquerystorage-bom to v3.10.1 (c03a63a)
- Update dependency com.google.cloud:google-cloud-datacatalog-bom to v1.58.0 (#3533) (cad2643)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.38.0 (#3542) (16448ee)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.39.0 (#3548) (616b2f6)
- Update github/codeql-action action to v2.26.13 (#3536) (844744f)
- Update github/codeql-action action to v2.27.0 (#3540) (1616a0f)
- Reformat javadoc (#3545) (4763f73)
- Update SimpleApp to explicitly set project id (#3534) (903a0f7)


説明：
- BigQuery Javaクライアントライブラリで、複数の依存関係のバージョンが更新されました。
  - google-cloud-bigquerystorage-bom: v3.10.0, v3.10.1, v3.10.2
  - com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1: v2.54.0
  - com.google.apis:google-api-services-bigquery: v2-rev20241013-2.0.0
  - com.google.cloud:google-cloud-datacatalog-bom: v1.58.0
  - com.google.cloud:sdk-platform-java-config: v3.38.0, v3.39.0
  - actions/checkout: v4.2.2
  - actions/upload-artifact: v4.4.2, v4.4.3
  - github/codeql-action: v2.26.13, v2.27.0
- JavaDocのフォーマットが修正されました。
- サンプルアプリケーション(SimpleApp)で、プロジェクトIDを明示的に設定するように更新されました。

影響有無：有（Javaクライアントライブラリを使用している場合） 

対処方法： 
- Javaクライアントライブラリを使用している場合は、最新バージョンにアップデートしてください。 


## Cloud Storage

### 変更カテゴリ: Changes

原文：
- Add support for restore token (#2548) (8241e91)
- Adds integration tests for Universe Domain configuration (#2538) (53db6ba)
- Adds integration tests for Universe Domain configuration with (53db6ba)
- **storage:** Add support for 'skipIfExists' option for downloadMany (#2526) (729efb2)

説明：
- Cloud Storage Node.jsクライアントライブラリで、リストアトークンのサポートが追加されました。
- ユニバースドメイン構成の統合テストが追加されました。
- downloadManyメソッドに、'skipIfExists'オプションのサポートが追加されました。このオプションを使用すると、ダウンロード先のファイルがすでに存在する場合にダウンロードをスキップすることができます。

影響有無：有（Node.jsクライアントライブラリを使用している場合） 

対処方法： 
- Node.jsクライアントライブラリを使用している場合は、最新バージョンにアップデートしてください。 

## Cloud Storage

### 変更カテゴリ: Changes

原文：
- **storage:** Add grpc metrics experimental options (#10984) (5b7397b)
- **storage:** Skip only specific transport tests. (#11016) (d40fbff)
- **storage:** Update google.golang.org/api to v0.203.0 (8bb87d5)
- **storage:** WARNING: On approximately Dec 1, 2024, an update to Protobuf will change service registration function signatures to use an interface instead of a concrete type in generated .pb.go files. This change is expected to affect very few if any users of this client library. For more information, see https://togithub.com/googleapis/google-cloud-go/issues/11020. (2b8ca4b)
- **storage/internal:** Remove notification, service account, and hmac RPCS. These API have been migrated to Storage Control and are available via the JSON API. (#11008) (e0759f4)

説明：
- Cloud Storage Goクライアントライブラリで、gRPCメトリックの実験的オプションが追加されました。
- 特定のトランスポートテストのみをスキップするように変更されました。
- 使用されているgoogle.golang.org/apiがv0.203.0にアップデートされました。
- Protobufのアップデートに関する警告が追加されました。このアップデートは2024年12月1日頃に予定されており、サービス登録関数のシグネチャが変更されます。
- 通知、サービスアカウント、HMAC RPCがstorage/internalパッケージから削除されました。これらのAPIはStorage Controlに移行され、JSON API経由で利用できるようになりました。

影響有無：有（Goクライアントライブラリを使用している場合） 

対処方法： 
- Goクライアントライブラリを使用している場合は、最新バージョンにアップデートしてください。 
- Protobufのアップデートに関する警告については、今後の発表に注意し、必要に応じてコードの修正を行ってください。
- 通知、サービスアカウント、HMAC RPCを使用している場合は、Storage ControlのJSON APIを使用するように変更してください。

## Pub/Sub

### 変更カテゴリ: Changes

原文：
- Update dependency com.google.cloud:sdk-platform-java-config to v3.39.0 (#2251) (083cc7c)
- Update googleapis/sdk-platform-java action to v2.49.0 (#2250) (af0f194)

説明：
- Pub/Sub Javaクライアントライブラリで、以下の依存関係のバージョンが更新されました。
  - com.google.cloud:sdk-platform-java-config: v3.39.0
  - googleapis/sdk-platform-java action: v2.49.0

影響有無：有（Javaクライアントライブラリを使用している場合） 

対処方法： 
- Javaクライアントライブラリを使用している場合は、最新バージョンにアップデートしてください。 


## Pub/Sub

### 変更カテゴリ: Changes

原文：
- Add support for Python 3.13 (#1281) (0b46a33)
- Mark test_streaming_pull_max_messages flaky (#1288) (d6635a0)

説明：
- Pub/Sub Pythonクライアントライブラリで、Python 3.13のサポートが追加されました。
- test_streaming_pull_max_messagesテストが不安定であるとマークされました。

影響有無：有（Pythonクライアントライブラリを使用している場合） 

対処方法： 
- Pythonクライアントライブラリを使用している場合は、最新バージョンにアップデートしてください。 
