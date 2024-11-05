
# Title: October 31, 2024 
Link: https://cloud.google.com/release-notes#October_31_2024<br>
## Google Kubernetes Engine
### Fixed
原文：
Clusters that are experiencing stale endpoint resources and stale kube-dns entries are likely affected by Kubernetes issue #126578. Your cluster is most likely affected if endpoint resources consistently have incorrect Pod IPs. This issue has been fixed in the following GKE versions or later:

[Kubernetes issue #126578](https://github.com/kubernetes/kubernetes/issues/126578)
- 1.28.14-gke.1115000
- 1.29.9-gke.1207000
- 1.30.5-gke.1171000
- 1.31.1-gke.1414000

説明：
古いエンドポイントリソースと古いkube-dnsエントリが発生しているクラスタは、Kubernetesの問題 #126578 の影響を受けている可能性があります。エンドポイントリソースに常に誤ったPod IPが含まれている場合は、クラスタが影響を受けている可能性が最も高くなります。この問題は、以下のGKEバージョン以降で修正されています。

影響有無：有
対処方法：
記載されたGKEバージョン以降にアップグレードしてください。


## Spanner
### Libraries
#### Go
##### Changes for spanner/admin/database/apiv1
- 1.69.0
  説明： リクエストヘッダーに`x-goog-spanner-end-to-end-tracing`が追加され、エラーハンドリングとエミュレータエンドポイントでのパススルーが改善されました。
  影響有無：無
  対処方法： 特に対応は不要です。

- 1.70.0
  説明： `ReplicaComputeCapacity`と`AsymmetricAutoscalingOption`が定義され、INTERVAL APIと新しい`QueryMode`列挙値(`WITH_STATS`, `WITH_PLAN_AND_STATS`)が追加されました。また、`node_count`, `processing_units`, `PROFILE QueryMode`のコメントが更新されました。
  影響有無：無
  対処方法： 特に対応は不要です。

#### Java
##### Changes for google-cloud-spanner
- 6.77.0
  説明： INTERVAL APIが追加され、多数の依存関係が更新されました。また、`PROFILE QueryMode`のコメントが更新されました。
  影響有無：無
  対処方法： 特に対応は不要です。

- 6.78.0
  説明： `ReplicaComputeCapacity`と`AsymmetricAutoscalingOption`が定義され、Javaコードジェネレータ(gapic-generator-java)が2.47.0に更新されました。また、いくつかの依存関係が更新されました。
  影響有無：無
  対処方法： 特に対応は不要です。

- 6.79.0
  説明： Connection APIでDML自動バッチ処理がサポートされ、多数の依存関係が更新されました。
  影響有無：無
  対処方法： 特に対応は不要です。

- 6.80.0
  説明： Connection APIでendToEndTracingがサポートされ、多数の依存関係が更新されました。また、トレースサンプルが完了時に終了するように修正され、エクスポートにカスタム監視対象リソースが使用されるようになりました。
  影響有無：無
  対処方法： 特に対応は不要です。

# Title: October 30, 2024 
Link: https://cloud.google.com/release-notes#October_30_2024<br>
## Cloud Composer

### Announcement

原文:
> A new Cloud Composer release has started on **October 30, 2024**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet. 

説明：
2024年10月30日から新しい Cloud Composer のリリースが開始されました。リリースは全リージョンへの展開作業中のため、記載されている変更点や新機能の一部は、まだ利用できない場合があります。

影響有無：無

対処方法：
特になし。


### Fixed

原文:
> *(Cloud Composer 3)* Airflow workers now generate a proper OpenID Connect (OIDC) token.

説明：
Cloud Composer 3 の Airflow ワーカーにおいて、適切な OpenID Connect (OIDC) トークンが生成されるようになりました。

影響有無：有

対処方法：
以前のリリースで Airflow ワーカーの OIDC トークンに問題があった場合は、この修正により解決される可能性があります。Cloud Composer 3 環境で OIDC を使用している場合は、この変更が環境に与える影響を確認してください。


### Changed

原文:
> *(Airflow 2.9.3 and 2.7.3)* The `dbt-common` package was downgraded from 1.11.0 to 1.10.0.

説明：
Airflow 2.9.3 および 2.7.3 において、`dbt-common` パッケージがバージョン 1.11.0 から 1.10.0 にダウングレードされました。

影響有無：有

対処方法：
`dbt-common` パッケージのバージョン 1.11.0 に依存した機能を使用している場合は、バージョン 1.10.0 との互換性を確認する必要があります。互換性がない場合は、Airflow の DAG を修正する必要があるかもしれません。


### Changed

原文:
> New Airflow builds are available in Cloud Composer 3:
> 
> [Airflow builds](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-3)
> - composer-3-airflow-2.9.3-build.5 (default)
> - composer-3-airflow-2.7.3-build.21

説明：
Cloud Composer 3 で新しい Airflow ビルドが利用可能になりました。
- composer-3-airflow-2.9.3-build.5 (デフォルト)
- composer-3-airflow-2.7.3-build.21

影響有無：無

対処方法：
Cloud Composer 3 環境を新規作成する場合、デフォルトで composer-3-airflow-2.9.3-build.5 が使用されます。以前のビルドを使用している場合は、必要に応じて新しいビルドにアップグレードすることを検討してください。


### Changed

原文:
> Cloud Composer 2.9.9 images are available:
> 
> [images](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-2)
> - composer-2.9.9-airflow-2.9.3 (default)
> - composer-2.9.9-airflow-2.7.3

説明：
Cloud Composer 2.9.9 イメージが利用可能になりました。
- composer-2.9.9-airflow-2.9.3 (デフォルト)
- composer-2.9.9-airflow-2.7.3

影響有無：無

対処方法：
Cloud Composer 2.9.9 環境を新規作成する場合、デフォルトで composer-2.9.9-airflow-2.9.3 が使用されます。以前のバージョンを使用している場合は、必要に応じて新しいバージョンにアップグレードすることを検討してください。


### Deprecated

原文:
> Cloud Composer version 2.5.0 has reached its end of support period.
> 
> [end of support period](https://cloud.google.com/composer/docs/concepts/versioning/composer-versioning-overview#version-deprecation-and-support)

説明：
Cloud Composer バージョン 2.5.0 はサポート終了になりました。

影響有無：有

対処方法：
Cloud Composer 2.5.0 を使用している場合は、サポートされているバージョンにアップグレードしてください。サポート終了のバージョンはセキュリティリスクとなる可能性があります。



## Google Kubernetes Engine

### Changed

原文:
> GKE cluster versions have been updated.
> 
> **New versions available for upgrades and new clusters.**
> 
> The following Kubernetes versions are now available for new clusters and for
> opt-in control plane upgrades and node upgrades for existing clusters. For more
> information on versioning and upgrades, see GKE versioning and support
> and Upgrades.
> 
> [GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
> [Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

説明：
GKE クラスタのバージョンが更新されました。新しいクラスタの作成、および既存クラスタの制御プレーンとノードのオプトインアップグレードで、以下の Kubernetes バージョンが使用可能になりました。

影響有無：無

対処方法：
GKE クラスタのバージョンアップグレードは、自動または手動で行うことができます。自動アップグレードを有効にしている場合は、特に対応は必要ありません。手動でアップグレードする場合は、GKE のドキュメントを参照して、アップグレード手順を確認してください。

**Rapid channel**

原文:
> > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
> when we publish the release notes, and can take multiple days to complete across all Google Cloud
> zones.
> 
> - Version 1.31.1-gke.1846000 is now the default version for cluster creation in the Rapid channel.
> - The following versions are now available in the Rapid channel:
> 
> - 1.28.15-gke.1015000
> - 1.28.15-gke.1020000
> - 1.29.10-gke.1043000
> - 1.29.10-gke.1054000
> - 1.30.5-gke.1699000
> - 1.31.1-gke.2105000
> 
> - The following versions are no longer available in the Rapid channel:
> 
> - 1.28.14-gke.1217000
> - 1.29.9-gke.1341000
> - 1.30.5-gke.1355000
> - 1.31.1-gke.1678000
> - 1.31.1-gke.2008000
> 
> - Auto-upgrade targets are now available for the following minor versions:
> 
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.27 to version 1.28.14-gke.1340000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.9-gke.1496000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.5-gke.1443001 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.1-gke.1846000 with this release.
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.28.14-gke.1340000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.9-gke.1496000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.5-gke.1443001 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.1-gke.1846000 with this release.

説明：
Rapid channel において、バージョン 1.31.1-gke.1846000 が新しいクラスタのデフォルトバージョンになりました。また、いくつかのバージョンが利用可能になり、いくつかのバージョンは利用不可になりました。自動アップグレードが有効になっているクラスタは、指定されたバージョンに自動的にアップグレードされます。

影響有無：有

対処方法：
Rapid channel を使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

**Regular channel**

原文:
> > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
> when we publish the release notes, and can take multiple days to complete across all Google Cloud
> zones.
> 
> - Version 1.30.5-gke.1355000 is now the default version for cluster creation in the Regular channel.
> - The following versions are now available in the Regular channel:
> 
> - 1.28.14-gke.1340000
> - 1.29.9-gke.1496000
> - 1.30.5-gke.1443001
> - 1.31.1-gke.1846000
> 
> - The following versions are no longer available in the Regular channel:
> 
> - 1.28.14-gke.1099000
> - 1.29.9-gke.1177000
> - 1.30.5-gke.1014001
> - 1.30.5-gke.1014003
> 
> - Auto-upgrade targets are now available for the following minor versions:
> 
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.27 to version 1.28.14-gke.1217000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.9-gke.1341000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.5-gke.1355000 with this release.
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.28.14-gke.1217000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.9-gke.1341000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.5-gke.1355000 with this release.

説明：
Regular channel において、バージョン 1.30.5-gke.1355000 が新しいクラスタのデフォルトバージョンになりました。また、いくつかのバージョンが利用可能になり、いくつかのバージョンは利用不可になりました。自動アップグレードが有効になっているクラスタは、指定されたバージョンに自動的にアップグレードされます。

影響有無：有

対処方法：
Regular channel を使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

**Stable channel**

原文:
> > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
> when we publish the release notes, and can take multiple days to complete across all Google Cloud
> zones.
> 
> - Version 1.30.5-gke.1014003 is now the default version for cluster creation in the Stable channel.
> - The following versions are no longer available in the Stable channel:
> 
> - 1.28.14-gke.1004000
> - 1.29.8-gke.1278000
> - 1.30.5-gke.1014001
> 
> - Auto-upgrade targets are now available for the following minor versions:
> 
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.27 to version 1.28.14-gke.1099000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.29.9-gke.1177000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.5-gke.1014003 with this release.
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.28.14-gke.1099000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.9-gke.1177000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.5-gke.1014003 with this release.

説明：
Stable channel において、バージョン 1.30.5-gke.1014003 が新しいクラスタのデフォルトバージョンになりました。また、いくつかのバージョンが利用不可になりました。自動アップグレードが有効になっているクラスタは、指定されたバージョンに自動的にアップグレードされます。

影響有無：有

対処方法：
Stable channel を使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

**Extended channel**

原文:
> > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
> when we publish the release notes, and can take multiple days to complete across all Google Cloud
> zones.
> 
> - Version 1.30.5-gke.1355000 is now the default version for cluster creation in the Extended channel.
> - The following versions are now available in the Extended channel:
> 
> - 1.27.16-gke.1742000
> - 1.28.14-gke.1340000
> - 1.29.9-gke.1496000
> - 1.30.5-gke.1443001
> - 1.31.1-gke.1846000
> 
> - The following versions are no longer available in the Extended channel:
> 
> - 1.27.16-gke.1712000
> - 1.28.14-gke.1099000
> - 1.29.9-gke.1177000
> - 1.30.5-gke.1014001
> - 1.30.5-gke.1014003
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.14-gke.1217000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.9-gke.1341000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.5-gke.1355000 with this release.

説明：
Extended channel において、バージョン 1.30.5-gke.1355000 が新しいクラスタのデフォルトバージョンになりました。また、いくつかのバージョンが利用可能になり、いくつかのバージョンは利用不可になりました。自動アップグレードが有効になっているクラスタは、指定されたバージョンに自動的にアップグレードされます。

影響有無：有

対処方法：
Extended channel を使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

**No channel**

原文:
> > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
> when we publish the release notes, and can take multiple days to complete across all Google Cloud
> zones.
> 
> - Version 1.30.5-gke.1355000 is now the default version for cluster creation.
> - The following versions are now available:
> 
> - 1.28.15-gke.1015000
> - 1.28.15-gke.1020000
> - 1.29.10-gke.1043000
> - 1.29.10-gke.1054000
> - 1.30.5-gke.1699000
> - 1.31.1-gke.2105000
> 
> - The following node versions are now available:
> 
> - 1.27.16-gke.1742000
> - 1.28.15-gke.1015000
> - 1.28.15-gke.1020000
> - 1.29.10-gke.1043000
> - 1.29.10-gke.1054000
> - 1.30.5-gke.1699000
> - 1.31.1-gke.2105000
> 
> - The following versions are no longer available:
> 
> - 1.28.14-gke.1004000
> - 1.29.8-gke.1278000
> - 1.30.4-gke.1348000
> - 1.30.4-gke.1348001
> - 1.31.1-gke.1146000
> - 1.31.1-gke.2008000
> 
> - Auto-upgrade targets are now available for the following minor versions:
> 
> - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.27 to version 1.28.14-gke.1217000 with this release.
> - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.29.9-gke.1341000 with this release.
> - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.5-gke.1014003 with this release.
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.28.14-gke.1217000 with this release.
> - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.9-gke.1341000 with this release.
> - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.5-gke.1014003 with this release.


説明：
リリースチャネルを指定しない場合、バージョン 1.30.5-gke.1355000 が新しいクラスタのデフォルトバージョンになりました。また、いくつかのバージョンが利用可能になり、いくつかのバージョンは利用不可になりました。自動アップグレードが有効になっているクラスタは、指定されたバージョンに自動的にアップグレードされます。

影響有無：有

対処方法：
リリースチャネルを指定しない場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

# Title: October 29, 2024 
Link: https://cloud.google.com/release-notes#October_29_2024<br>
## Cloud Storage

### Data Access logs are now compatible with all authenticated browser downloads.

[Data Access logs](https://cloud.google.com/storage/docs/audit-logging#available-logs)
[authenticated browser downloads](https://cloud.google.com/storage/docs/request-endpoints#cookieauth)
- When an authenticated browser download occurs outside of the Google Cloud console, a resulting Data Access log has its `principalEmail` and `callerIp` fields redacted.

**説明**

これまでは、Google Cloud Console以外からの認証済みブラウザダウンロードでは、Data Accessログの`principalEmail`と`callerIp`フィールドが記録されませんでした。今回の変更により、これらのフィールドが記録されるようになります。ただし、プライバシー保護のため、これらのフィールドは編集された状態で記録されます。

**製品への影響有無**: 有

**対処方法**: 

Google Cloud Console以外からの認証済みブラウザダウンロードで`principalEmail`と`callerIp`フィールドの情報が必要な場合は、別の方法で取得する必要があります。


## Google Kubernetes Engine

###  Instance Group Managers for node pools created with version 1.30.5-gke.1523000 or later and 1.31.1-gke.1869000 or later will now have *update on repair* enabled by default. This will allow labels to persist upon Spot VM preemption.

[*update on repair*](https://cloud.google.com/compute/docs/instance-groups/update-on-repair)

**説明**

バージョン 1.30.5-gke.1523000 以降および 1.31.1-gke.1869000 以降で作成されたノードプールの Instance Group Manager は、デフォルトで *update on repair* が有効になります。これにより、Spot VM のプリエンプト時にラベルが保持されます。

**製品への影響有無**: 有

**対処方法**: 

* 1.30.5-gke.1523000 以降および 1.31.1-gke.1869000 以降でノードプールを作成する場合、デフォルトで *update on repair* が有効になります。
* 以前のバージョンで作成したノードプールについては、*update on repair* はデフォルトで無効のままです。必要に応じて、手動で有効にすることができます。
# Title: October 28, 2024 
Link: https://cloud.google.com/release-notes#October_28_2024<br>
## Cloud Logging - Java Libraries Changes
### 原文
A weekly digest of client library updates from across the Cloud SDK.

#### Java

#### Changes for google-cloud-logging

[google-cloud-logging](https://github.com/googleapis/java-logging)
[3.20.6](https://github.com/googleapis/java-logging/compare/v3.20.5...v3.20.6)
- Update sdk platform java dependencies (#1717) (ee9ef91)

[#1717](https://github.com/googleapis/java-logging/issues/1717)
[ee9ef91](https://github.com/googleapis/java-logging/commit/ee9ef91a9ebaed9faa5870a29be40b0c1531a226)
[3.20.5](https://github.com/googleapis/java-logging/compare/v3.20.4...v3.20.5)
- Update sdk platform java dependencies (#1707) (2359040)

[#1707](https://github.com/googleapis/java-logging/issues/1707)
[2359040](https://github.com/googleapis/java-logging/commit/23590409f5c4aaff5c741e860fc0916f7ec4c963)

### 説明
Cloud Logging の Java 用クライアントライブラリである `google-cloud-logging` のバージョン 3.20.6 および 3.20.5 がリリースされました。 

これらのバージョンでは、Cloud SDK の Java プラットフォームの依存関係が更新されています。

### 製品への影響有無
 無

### 対処方法
 特に対応は不要です。 


## Cloud Storage - Changed
### 原文
Additional functionality is now available for the Object Retention Lock and Bucket Lock features:

[Object Retention Lock](https://cloud.google.com/storage/docs/object-lock)
[Bucket Lock](https://cloud.google.com/storage/docs/bucket-lock)

- You can now enable Object Retention Lock on existing buckets using the Console.
- Enabling Object Retention Lock on a bucket will cause a lien to be placed, at best effort, on the project containing the bucket.
- Buckets can now have Bucket Lock and Object Versioning enabled at the same time.

You can now enable Object Retention Lock on existing buckets using the Console.

[enable Object Retention Lock on existing buckets using the Console](https://cloud.google.com/storage/docs/using-object-lock#enable-retentions)

Enabling Object Retention Lock on a bucket will cause a lien to be placed, at best effort, on the project containing the bucket.

[lien](https://cloud.google.com/resource-manager/docs/project-liens)

Buckets can now have Bucket Lock and Object Versioning enabled at the same time.

[Object Versioning](https://cloud.google.com/storage/docs/object-versioning)

### 説明

Cloud Storage のオブジェクト保持ロックとバケットロック機能に、以下の機能が追加されました。

- コンソールを使用して、既存のバケットに対してオブジェクト保持ロックを有効にできるようになりました。
- バケットに対してオブジェクト保持ロックを有効にすると、そのバケットを含むプロジェクトに可能な限り lien が設定されるようになります。
- バケットに対して、バケットロックとオブジェクトバージョニングを同時に有効にできるようになりました。

### 製品への影響有無

有

### 対処方法
- オブジェクト保持ロックを既存のバケットに適用したい場合は、コンソールから設定できます。
- オブジェクト保持ロックを有効にすると、プロジェクトに lien が設定される可能性があることに注意してください。
- バケットロックとオブジェクトバージョニングを同時に有効にする場合は、それぞれの機能の動作と相互作用について理解しておく必要があります。

## Cloud Storage - Java Libraries Changes
### 原文
A weekly digest of client library updates from across the Cloud SDK.

#### Java

#### Changes for google-cloud-storage

[google-cloud-storage](https://github.com/googleapis/java-storage)
[2.44.1](https://github.com/googleapis/java-storage/compare/v2.44.0...v2.44.1)
- Update sdk-platform-java dependencies (#2795) (aeb86e5)

[#2795](https://github.com/googleapis/java-storage/issues/2795)
[aeb86e5](https://github.com/googleapis/java-storage/commit/aeb86e5467269d55f9019638fe8b05331b423e55)
[2.44.0](https://github.com/googleapis/java-storage/compare/v2.43.2...v2.44.0)
- Promote gRPC transport to GA (#2766) (41fd72a)

[#2766](https://github.com/googleapis/java-storage/issues/2766)
[41fd72a](https://github.com/googleapis/java-storage/commit/41fd72a57e3577217e98f7a179d8958c14c5676a)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.47.0 (c517798)
- Fix createFrom resumable upload retry offset calculation (#2771) (1126cdc), closes #2770 
- Update gRPC ReadObject retry to avoid double retry (#2765) (1fc57b9)

[c517798](https://github.com/googleapis/java-storage/commit/c5177983a48b1bf26e8abb5d4d27355bfcd62d3b)
[#2771](https://github.com/googleapis/java-storage/issues/2771)
[1126cdc](https://github.com/googleapis/java-storage/commit/1126cdcde07fed3c57d99dfa2b2505b06d5cd25a)
[#2770](https://github.com/googleapis/java-storage/issues/2770)
[#2765](https://github.com/googleapis/java-storage/issues/2765)
[1fc57b9](https://github.com/googleapis/java-storage/commit/1fc57b9b4fe2ec2d08333fb62be66f272294deca)
- Update dependency com.google.apis:google-api-services-storage to v1-rev20241008-2.0.0 (#2776) (0545b5e)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.38.0 (#2787) (a470e88)
- Update gcr.io/cloud-devrel-public-resources/storage-testbench docker tag to v0.48.0 (#2781) (8fa013e)
- Update gcr.io/cloud-devrel-public-resources/storage-testbench docker tag to v0.49.0 (#2782) (a7baffb)
- Update googleapis/sdk-platform-java action to v2.48.0 (#2786) (2893e61)

[#2776](https://github.com/googleapis/java-storage/issues/2776)
[0545b5e](https://github.com/googleapis/java-storage/commit/0545b5e7d7e292da38fb42a9160fb1938628684b)
[#2787](https://github.com/googleapis/java-storage/issues/2787)
[a470e88](https://github.com/googleapis/java-storage/commit/a470e880f348a4950102546c7ee844761e1c5b57)
[#2781](https://github.com/googleapis/java-storage/issues/2781)
[8fa013e](https://github.com/googleapis/java-storage/commit/8fa013e09e3c02c6deeb6d49911c051b940ef79c)
[#2782](https://github.com/googleapis/java-storage/issues/2782)
[a7baffb](https://github.com/googleapis/java-storage/commit/a7baffb9579f865a20fe42d189f8ba9d8b4ee716)
[#2786](https://github.com/googleapis/java-storage/issues/2786)
[2893e61](https://github.com/googleapis/java-storage/commit/2893e617b865717959da34a47d2a972ad90cde72)
### 説明
Cloud Storage の Java 用クライアントライブラリである `google-cloud-storage` のバージョン 2.44.1 と 2.44.0 がリリースされました。

バージョン 2.44.1 では、Cloud SDK の Java プラットフォームの依存関係が更新されました。

バージョン 2.44.0 では、以下の変更が含まれています。
- gRPC トランスポートが GA になりました。
- Java コードジェネレーター（gapic-generator-java）が 2.47.0 に更新されました。
- createFrom 再開可能なアップロードの再試行オフセット計算が修正されました。
- gRPC ReadObject の再試行が更新され、二重の再試行が回避されるようになりました。
- いくつかの依存関係が更新されました。

### 製品への影響有無
 無

### 対処方法
 特に対応は不要です。 

## Pub/Sub - Go Libraries Changes
### 原文
A weekly digest of client library updates from across the Cloud SDK.

#### Go

#### Changes for pubsub/apiv1

[pubsub/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/pubsub/apiv1)
[1.45.1](https://github.com/googleapis/google-cloud-go/compare/pubsub/v1.45.0...pubsub/v1.45.1)
- **pubsub:** Update google.golang.org/api to v0.203.0 (8bb87d5)
- **pubsub:** WARNING: On approximately Dec 1, 2024, an update to Protobuf will change service registration function signatures to use an interface instead of a concrete type in generated .pb.go files. This change is expected to affect very few if any users of this client library. For more information, see https://togithub.com/googleapis/google-cloud-go/issues/11020. (8bb87d5)

[8bb87d5](https://github.com/googleapis/google-cloud-go/commit/8bb87d56af1cba736e0fe243979723e747e5e11e)
[8bb87d5](https://github.com/googleapis/google-cloud-go/commit/8bb87d56af1cba736e0fe243979723e747e5e11e)
- **pubsub:** Add doc links to top level package doc (#11029) (fe2ec56)

[#11029](https://github.com/googleapis/google-cloud-go/issues/11029)
[fe2ec56](https://github.com/googleapis/google-cloud-go/commit/fe2ec569029d2052885063b6fca90e1a27424b4e)
[1.45.0](https://github.com/googleapis/google-cloud-go/compare/pubsub/v1.44.0...pubsub/v1.45.0)
- **pubsub:** Add IngestionFailureEvent to the external proto (f0b05e2)
- **pubsub:** Add support for ingestion platform logging settings (#10969) (c60241f)

[f0b05e2](https://github.com/googleapis/google-cloud-go/commit/f0b05e260435d5e8889b9a0ca0ab215fcde169ab)
[#10969](https://github.com/googleapis/google-cloud-go/issues/10969)
[c60241f](https://github.com/googleapis/google-cloud-go/commit/c60241f46db2b021d799f621851a352f2baec96e)

### 説明
Pub/Sub の Go 用クライアントライブラリである `google-cloud-go/pubsub/apiv1` のバージョン 1.45.1 と 1.45.0 がリリースされました。

バージョン 1.45.1 では、`google.golang.org/api` が v0.203.0 にアップデートされました。また、2024年12月1日頃に予定されている Protobuf のアップデートに関する警告が追加されました。

バージョン 1.45.0 では、外部プロトコルに `IngestionFailureEvent` が追加されました。また、取り込みプラットフォームのロギング設定のサポートが追加されました。

### 製品への影響有無
 無

### 対処方法
 特に対応は不要です。 


## Pub/Sub - Java Libraries Changes
### 原文
A weekly digest of client library updates from across the Cloud SDK.

#### Java

#### Changes for google-cloud-pubsub

[google-cloud-pubsub](https://github.com/googleapis/java-pubsub)
[1.134.0](https://github.com/googleapis/java-pubsub/compare/v1.133.1...v1.134.0)
- Add IngestionFailureEvent to the external proto (6c67798)
- Track batch size using serialized size of PublishRequest (#2113) (be78e64)

[6c67798](https://github.com/googleapis/java-pubsub/commit/6c67798c6b7442d77eb30fbba874344f32a926b4)
[#2113](https://github.com/googleapis/java-pubsub/issues/2113)
[be78e64](https://github.com/googleapis/java-pubsub/commit/be78e64f9fdfc9ddf0790189311fac673754e219)
- Update dependency com.google.cloud:google-cloud-bigquery to v2.43.1 (#2202) (acaf5f2)
- Update dependency com.google.cloud:google-cloud-core to v2.46.0 (#2238) (dc06d54)
- Update dependency com.google.cloud:google-cloud-storage to v2.43.2 (#2226) (eb87c04)
- Update dependency com.google.cloud.opentelemetry:exporter-trace to v0.33.0 (#2225) (cc1b072)
- Update dependency com.google.protobuf:protobuf-java-util to v4.28.3 (#2237) (75abe83)
- Update dependency org.apache.avro:avro to v1.11.4 security (31f276b)
- Update sdk platform java dependencies (#2239) (8f4f855)

[#2202](https://github.com/googleapis/java-pubsub/issues/2202)
[acaf5f2](https://github.com/googleapis/java-pubsub/commit/acaf5f2e3686a939d4b972c73a4d039142f753df)
[#2238](https://github.com/googleapis/java-pubsub/issues/2238)
[dc06d54](https://github.com/googleapis/java-pubsub/commit/dc06d5456ab6fe8d94b7b845ca9159391949517f)
[#2226](https://github.com/googleapis/java-pubsub/issues/2226)
[eb87c04](https://github.com/googleapis/java-pubsub/commit/eb87c04619f7bdaf59ce2b562a96b8c25d3c8196)
[#2225](https://github.com/googleapis/java-pubsub/issues/2225)
[cc1b072](https://github.com/googleapis/java-pubsub/commit/cc1b0726009524ddee3c2ce7f1446608dd3bc752)
[#2237](https://github.com/googleapis/java-pubsub/issues/2237)
[75abe83](https://github.com/googleapis/java-pubsub/commit/75abe83a9b14c2e5cc3f136ff97b5340bfa904db)
[security](%5B#2223%5D(https://github.com/googleapis/java-pubsub/issues/2223)%7B:%20.external%20target=%22_blank%20rel=%22noreferrer%20noopener%22%7D)
[31f276b](https://github.com/googleapis/java-pubsub/commit/31f276b10a96c53ecbd828972a9e3457c0c7c700)
[#2239](https://github.com/googleapis/java-pubsub/issues/2239)
[8f4f855](https://github.com/googleapis/java-pubsub/commit/8f4f8556414aaef731a7226dcbffe59d91819775)
- Add OpenTelemetry samples (#2208) (c447fe5)

[#2208](https://github.com/googleapis/java-pubsub/issues/2208)
[c447fe5](https://github.com/googleapis/java-pubsub/commit/c447fe500ba48ba4fde27d97f10ef7664d09363b)

### 説明
Pub/Sub の Java 用クライアントライブラリである `google-cloud-pubsub` のバージョン 1.134.0 がリリースされました。

このバージョンでは、以下の変更が含まれています。

- 外部プロトコルに `IngestionFailureEvent` が追加されました。
- バッチサイズは `PublishRequest` のシリアライズサイズを使用して追跡されるようになりました。
- いくつかの依存関係が更新されました。
- OpenTelemetry のサンプルが追加されました。

### 製品への影響有無
 無

### 対処方法
 特に対応は不要です。 

## Secret Manager - Go Libraries Changes
### 原文
A weekly digest of client library updates from across the Cloud SDK.

#### Go

#### Changes for secretmanager/apiv1

[secretmanager/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/secretmanager/apiv1)
[1.14.2](https://github.com/googleapis/google-cloud-go/compare/secretmanager/v1.14.1...secretmanager/v1.14.2)
- **secretmanager:** Update google.golang.org/api to v0.203.0 (8bb87d5)
- **secretmanager:** WARNING: On approximately Dec 1, 2024, an update to Protobuf will change service registration function signatures to use an interface instead of a concrete type in generated .pb.go files. This change is expected to affect very few if any users of this client library. For more information, see https://togithub.com/googleapis/google-cloud-go/issues/11020. (2b8ca4b)

[8bb87d5](https://github.com/googleapis/google-cloud-go/commit/8bb87d56af1cba736e0fe243979723e747e5e11e)
[2b8ca4b](https://github.com/googleapis/google-cloud-go/commit/2b8ca4b4127ce3025c7a21cc7247510e07cc5625)

### 説明
Secret Manager の Go 用クライアントライブラリである `google-cloud-go/secretmanager/apiv1` のバージョン 1.14.2 がリリースされました。

バージョン 1.14.2 では `google.golang.org/api` が v0.203.0 にアップデートされました。また、2024年12月1日頃に予定されている Protobuf のアップデートに関する警告が追加されました。

### 製品への影響有無
 無

### 対処方法
 特に対応は不要です。 
