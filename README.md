Title: August 01, 2024Link: https://cloud.google.com/release-notes#August_01_2024## Apigee X

### Announcement: Apigee X のバージョンアップ (1-13-0-apigee-1) リリース

**元の文章**

On August 1, 2024, we released an updated version of Apigee (1-13-0-apigee-1).

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明**

2024年8月1日に、Apigee のアップデートバージョン (1-13-0-apigee-1) がリリースされました。
本番環境へのロールアウトは2営業日以内に開始され、Google Cloud のすべてのゾーンで完了するまでに4営業日以上かかる場合があります。
ロールアウトが完了するまで、すべての機能と修正が利用できない場合があります。

**製品への影響有無**

影響あり。
ApigeeX を利用している場合、このアップデートが自動的に適用されます。

**対処方法**

特別な対処は不要です。
ただし、新バージョンで発生する可能性のある問題を把握するために、リリースノートの詳細を確認することを推奨します。
新機能を利用する場合は、ロールアウトが完了するまで待つ必要があります。


### セキュリティアップデート

**元の文章**

| Bug ID | Description |
| --- | --- |
| **308583363, 332464869** | Security fix for `apigee-mart`. This addresses the following vulnerabilities:- CVE-2023-36478 - CVE-2023-36479- CVE-2023-34462- CVE-2023-40167- CVE-2023-26048- CVE-2023-26049- CVE-2023-51775- CVE-2024-28752- CVE-2024-25710- CVE-2024-26308 |
| **332465218** | Security fix for `apigee-runtime`.This addresses the following vulnerabilities:- CVE-2023-52428- CVE-2023-44483 |
| **341994213, 333971421** | Security fixes for `Cassandra emulator`.These address the following vulnerabilities:- CVE-2017-5929- CVE-2017-18640- CVE-2023-36478- CVE-2019-16869- CVE-2024-22201- CVE-2015-0886- CVE-2024-28752- CVE-2024-29025- CVE-2021-42550- CVE-2023-52428- CVE-2018-10237- CVE-2023-40167- CVE-2021-29425- CVE-2023-44487- CVE-2023-26048- CVE-2023-44483- CVE-2023-26049 |
| **329762216** | Security fix for `apigee-installer`.This addresses the following vulnerability: CVE-2024-24786 |
| **342630443, 342714341, 343202829** | Security fixes to address the following vulnerabilities:- CVE-2024-29857 - CVE-2024-30172 - CVE-2024-30171 - CVE-2024-34447 - CVE-2023-5072- CVE-2022-4568- CVE-2023-6378   - CVE-2021-42550 |

**説明**
下記のコンポーネントに対して、複数の脆弱性を修正するセキュリティアップデートが含まれています。

* apigee-mart
* apigee-runtime
* Cassandra emulator
* apigee-installer

各脆弱性の詳細は、CVE番号のリンク先を参照してください。

**製品への影響有無**
影響あり。セキュリティアップデートが含まれているため、影響があります。

**対処方法**

Apigee X を最新バージョンにアップデートしてください。


#### CVE 詳細説明 (影響度 高)

| CVE | 説明 | CVSSスコア | 対策 |
|---|---|---|---|
| CVE-2023-36478 | proto3 メッセージを逆シリアル化する際に、Go 言語の "google.golang.org/protobuf" パッケージにサービス拒否の脆弱性が存在します。細工されたメッセージを送信することで、アプリケーションをクラッシュさせる可能性があります。 | 7.5 (High) | "google.golang.org/protobuf" パッケージをバージョン 1.29.1, 1.30.1, 1.31.1 以上にアップデートしてください。 |
| CVE-2023-36479 | proto3 メッセージを逆シリアル化する際に、Java 言語の "com.google.protobuf:protobuf-java" パッケージにサービス拒否の脆弱性が存在します。細工されたメッセージを送信することで、アプリケーションをクラッシュさせる可能性があります。 | 7.5 (High) | "com.google.protobuf:protobuf-java" パッケージをバージョン 3.21.10, 3.22.1, 3.23.1 以上にアップデートしてください。 |
| CVE-2024-28752 | .NET 用 Azure SDK for Storage Blobs ライブラリにおいて、不適切な入力検証の脆弱性が存在します。細工された URI を使用して Blob Storage リソースにアクセスすることで、サービス拒否を引き起こす可能性があります。 | 7.5 (High) | .NET 用 Azure SDK for Storage Blobs ライブラリを最新バージョンにアップデートしてください。 |

### 修正

**元の文章**

| Bug ID | Description |
| --- | --- |
| **293150694** | **`<HTTPMonitor>` now supports the `<UseTargetServerSSLInfo>` element and can trust TLS certs from non-public CAs**. |
| **329874359** | **Decreased the default value of `<CacheLookupTimeoutInSeconds>` from 30 seconds to 12 seconds.** |
| **334442202** | **Added specific and informative error messaging for App query failures resulting from discrepancies between developers and apps.** |
| **333919279** | **Improved reliability for Developer, App and API products APIs.** |
| **339169651** | **Fixed potential `HTTP` request smuggling vulnerability when using the  `OPTIONS` method.** |
| **297539870** | **`<HTTPTargetConnection>` property `io.timeout.millis` is  honored when used with WebSockets.** |
| **N/A** | **Updated infrastructure and libraries.** |

**説明**
下記を含む複数のバグ修正が行われました。

* `HTTPMonitor` で `<UseTargetServerSSLInfo>` 要素がサポートされ、パブリックでない CA からの TLS 証明書を信頼できるようになりました
* `<CacheLookupTimeoutInSeconds>` のデフォルト値が 30 秒から 12 秒に短縮されました
* 開発者とアプリの不整合が原因でアプリのクエリが失敗した場合に、具体的で有益なエラーメッセージが追加されました
* 開発者、アプリ、API プロダクト API の信頼性が向上しました
* `OPTIONS` メソッドを使用する場合の潜在的な HTTP リクエストスマグリングの脆弱性が修正されました
* `HTTPTargetConnection` プロパティ `io.timeout.millis` が WebSocket で使用される場合に機能するようになりました
* インフラストラクチャとライブラリが更新されました

**製品への影響有無**
影響あり。
バグ修正が含まれているため、影響があります。

**対処方法**
Apigee X を最新バージョンにアップデートしてください。

## Cloud Composer

### Announcement: Cloud Composer 2 環境での GKE 1.29 および PSC への移行

**元の文章**

In July and August 2024, **new Cloud Composer 2 environments** keep switching to using GKE 1.29 and PSC as a connectivity channel to the GKE control plane. Creating new Cloud Composer 2 private IP environments will require using PSC `SERVICE_PRODUCER` endpoints, which might be blocked by the **Disable Private Service Connect for Consumers** organization policy constraint. Previously, this org policy limitation could be addressed by using VPC peerings instead of PSC, but starting from GKE 1.29, this workaround is no longer available.

**説明**

2024年7月および8月に、新しい Cloud Composer 2 環境では、GKEコントロールプレーンへの接続チャネルとして GKE 1.29 および PSC を使用するように切り替わります。新しい Cloud Composer 2 プライベート IP 環境を作成するには、PSC `SERVICE_PRODUCER` エンドポイントを使用する必要があります。これは、「コンシューマーのプライベートサービス接続を無効にする」組織ポリシーの制約によってブロックされる可能性があります。以前は、この組織ポリシーの制限は PSC の代わりに VPC ピアリングを使用することで対処できましたが、GKE 1.29 以降では、この回避策は使用できなくなりました。

**製品への影響有無**

影響あり。
Cloud Composer 2 環境を作成する際に、「コンシューマーのプライベートサービス接続を無効にする」組織ポリシーが設定されていると、環境の作成に失敗する可能性があります。

**対処方法**
「コンシューマーのプライベートサービス接続を無効にする」組織ポリシーを解除するか、PSC `SERVICE_PRODUCER` エンドポイントが許可されるようにポリシーを構成してください。

### Announcement: Cloud Composer 3 環境での Airflow アップグレード操作に関する問題の修正

**元の文章**

*(Cloud Composer 3 only)* The July 24th issue with Airflow upgrade operations for Cloud Composer 3 environments is now fixed. Airflow upgrade operations are now being re-enabled, and should reach all Cloud Composer 3 environments within the next couple of days.

[July 24th issue with Airflow upgrade operations for Cloud Composer 3 environments](https://cloud.google.com/composer/docs/release-notes#July_24_2024)

**説明**

Cloud Composer 3 環境の Airflow アップグレード操作に関する 7 月 24 日の問題は修正されました。Airflow のアップグレード操作は再び有効化されており、今後数日で Cloud Composer 3 のすべての環境に適用される予定です。

**製品への影響有無**

影響あり (7月24日以前にCloud Composer 3環境でAirflowのアップグレードに失敗した場合)。

**対処方法**

7月24日以前に Airflow のアップグレードに失敗した場合は、再度アップグレード操作を実行してください。


## Compute Engine

### Announcement: BigQuery における Cloud Storage 使用量の課金に関するお知らせ

**元の文章**

Beginning November 1, 2024, BigQuery users will start seeing charges for Cloud Storage usage as per pricing documentation, which was not metered before due to a billing bug.

[pricing documentation](https://cloud.google.com/storage/pricing)
- Retrieval fees for Nearline, Coldline, and Archive storage classes will be charged per existing pricing documentation and retrieval SKUs.
- Inter Region Network Data Transfer fees will be charged when a BigQuery job in one location reads data stored in a Cloud Storage bucket in a different location. These charges are covered by **GCP Storage Data Transfer** SKUs and **Network Data Transfer GCP Inter Region** SKUs. **Network Data Transfer GCP Multi-region** SKUs are not applicable to this change.
- Refer to the announcement for more information.

**説明**

2024年11月1日から、BigQuery ユーザーに対して、Cloud Storage の使用量に応じた課金が開始されます。これは、以前は課金のバグによって計測されていなかったためです。

* Nearline、Coldline、Archive ストレージクラスの取得料金は、既存の料金体系と取得 SKU に従って課金されます。
* リージョン間ネットワークデータ転送料金は、あるロケーションの BigQuery ジョブが、別のロケーションの Cloud Storage バケットに格納されているデータを読み取る場合に課金されます。これらの料金は、GCP ストレージデータ転送 SKU とネットワークデータ転送 GCP リージョン間 SKU でカバーされます。ネットワークデータ転送料金 GCP マルチリージョン SKU は、この変更には適用されません。

**製品への影響有無**

影響あり。
BigQuery で Cloud Storage を利用している場合、11月1日以降は使用量に応じた課金が発生します。

**対処方法**

* Cloud Storage の利用状況を確認し、必要に応じてデータの保存先やアクセス方法を見直してください。
* BigQuery の料金計算ツールを使用して、今後の請求額を予測することができます。


**注記**

Google Kubernetes Engine 1.27, 1.28 に関するリリースノートは提供されていません。Title: July 31, 2024Link: https://cloud.google.com/release-notes#July_31_2024## Google Kubernetes Engine リリースノート (2024-R27)

### 変更点

#### (2024-R27) バージョンアップデート

##### 元の文章

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

##### 説明

GKEクラスタのバージョンが更新されました。公開されたリリースノートはロールアウトの途中であり、すべてのGoogle Cloudゾーンに完全に展開されるまで数日かかる場合があります。

##### 製品への影響有無

あり

##### 対処方法

お使いのGKEクラスタのバージョンと、利用したいバージョンが利用可能になっているかを確認してください。

---

##### Rapid チャネル

###### 元の文章

- Version 1.30.2-gke.1587003 is now the default version in the Rapid channel.
- The following versions are now available in the Rapid channel:
    - 1.27.16-gke.1051000
    - 1.28.12-gke.1052000
    - 1.29.7-gke.1104000
    - 1.30.3-gke.1225000
- The following versions are no longer available in the Rapid channel:
    - 1.27.14-gke.1059002
    - 1.27.15-gke.1125000
    - 1.28.11-gke.1260000
    - 1.28.11-gke.1289000
    - 1.29.6-gke.1038001
    - 1.29.6-gke.1137000
    - 1.30.1-gke.1329003
    - 1.30.2-gke.1394003
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.26 to version 1.27.15-gke.1252000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.27 to version 1.27.15-gke.1252000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.28.11-gke.1315000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.6-gke.1326000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.2-gke.1587003 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

###### 説明

- Rapidチャネルのデフォルトバージョンが 1.30.2-gke.1587003 になりました。
- 新規クラスタおよびアップグレードに、リストされたバージョンが利用可能になりました。
- リストされたバージョンはRapidチャネルでは使用できなくなりました。
- 自動アップグレードが有効になっている場合、リストにあるようにコントロールプレーンとノードがアップグレードされます。

###### 製品への影響有無

あり

###### 対処方法

- Rapidチャネルを使用している場合は、デフォルトバージョンが 1.30.2-gke.1587003 に更新されていることに注意してください。
- 自動アップグレードが無効になっている場合は、利用可能なバージョンを確認し、必要に応じて手動でアップグレードしてください。

###### 変更点の詳細

各バージョンにおける変更点の詳細は、以下のリンク先を参照してください。

- [1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- [1.27.16-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
- [1.28.12-gke.1052000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12812)
- [1.29.7-gke.1104000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1297)
- [1.30.3-gke.1225000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
- [1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
- [1.28.11-gke.1315000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
- [1.29.6-gke.1326000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)

---

##### Regular チャネル

###### 元の文章

- Version 1.29.6-gke.1254000 is now the default version in the Regular channel.
- The following versions are now available in the Regular channel:
    - 1.27.15-gke.1252000
    - 1.28.11-gke.1260000
    - 1.29.6-gke.1326000
    - 1.30.2-gke.1587003
- The following versions are no longer available in the Regular channel:
    - 1.27.14-gke.1059002
    - 1.28.11-gke.1019001
    - 1.29.6-gke.1038001
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.26 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.27 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.28.11-gke.1172000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

###### 説明

- Regularチャネルのデフォルトバージョンが 1.29.6-gke.1254000 になりました。
- 新規クラスタおよびアップグレードに、リストされたバージョンが利用可能になりました。
- リストされたバージョンはRegularチャネルでは使用できなくなりました。
- 自動アップグレードが有効になっている場合、リストにあるようにコントロールプレーンとノードがアップグレードされます。

###### 製品への影響有無

あり

###### 対処方法

- Regularチャネルを使用している場合は、デフォルトバージョンが 1.29.6-gke.1254000 に更新されていることに注意してください。
- 自動アップグレードが無効になっている場合は、利用可能なバージョンを確認し、必要に応じて手動でアップグレードしてください。

###### 変更点の詳細

各バージョンにおける変更点の詳細は、以下のリンク先を参照してください。

- [1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- [1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
- [1.28.11-gke.1260000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
- [1.29.6-gke.1326000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- [1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- [1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
- [1.28.11-gke.1172000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)

---

##### Stable チャネル

###### 元の文章

- Version 1.29.6-gke.1038001 is now the default version in the Stable channel.
- The following versions are no longer available in the Stable channel:
    - 1.27.14-gke.1042001
    - 1.28.10-gke.1075001
    - 1.29.5-gke.1091002
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.26 to version 1.27.14-gke.1059002 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.27 to version 1.27.14-gke.1059002 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.27 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.6-gke.1038001 with this release.

###### 説明

- Stableチャネルのデフォルトバージョンが 1.29.6-gke.1038001 になりました。
- リストされたバージョンはStableチャネルでは使用できなくなりました。
- 自動アップグレードが有効になっている場合、リストにあるようにコントロールプレーンとノードがアップグレードされます。

###### 製品への影響有無

あり

###### 対処方法

- Stableチャネルを使用している場合は、デフォルトバージョンが 1.29.6-gke.1038001 に更新されていることに注意してください。
- 自動アップグレードが無効になっている場合は、利用可能なバージョンを確認し、必要に応じて手動でアップグレードしてください。

###### 変更点の詳細

各バージョンにおける変更点の詳細は、以下のリンク先を参照してください。

- [1.29.6-gke.1038001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- [1.27.14-gke.1059002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12714)
- [1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)

---

##### Extended チャネル

###### 元の文章

- Version 1.29.6-gke.1254000 is now the default version in the Extended channel.
- The following versions are now available in the Extended channel:
    - 1.27.15-gke.1252000
    - 1.28.11-gke.1260000
    - 1.29.6-gke.1326000
    - 1.30.2-gke.1587003
- The following versions are no longer available in the Extended channel:
    - 1.27.14-gke.1059002
    - 1.28.11-gke.1019001
    - 1.29.6-gke.1038001
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.11-gke.1172000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

###### 説明

- Extendedチャネルのデフォルトバージョンが 1.29.6-gke.1254000 になりました。
- 新規クラスタおよびアップグレードに、リストされたバージョンが利用可能になりました。
- リストされたバージョンはExtendedチャネルでは使用できなくなりました。
- 自動アップグレードが有効になっている場合、リストにあるようにコントロールプレーンとノードがアップグレードされます。

###### 製品への影響有無

あり

###### 対処方法

- Extendedチャネルを使用している場合は、デフォルトバージョンが 1.29.6-gke.1254000 に更新されていることに注意してください。
- 自動アップグレードが無効になっている場合は、利用可能なバージョンを確認し、必要に応じて手動でアップグレードしてください。

###### 変更点の詳細

各バージョンにおける変更点の詳細は、以下のリンク先を参照してください。

- [1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- [1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
- [1.28.11-gke.1260000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
- [1.29.6-gke.1326000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- [1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- [1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
- [1.28.11-gke.1172000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)


---

##### No チャネル

###### 元の文章

- Version 1.29.6-gke.1254000 is now the default version.
- The following versions are now available:
    - 1.27.16-gke.1051000
    - 1.28.12-gke.1052000
    - 1.29.7-gke.1104000
    - 1.30.1-gke.1329003
    - 1.30.2-gke.1587003
    - 1.30.3-gke.1225000
- The following node versions are now available:
    - 1.27.16-gke.1051000
    - 1.28.12-gke.1052000
    - 1.29.7-gke.1104000
    - 1.30.1-gke.1329003
    - 1.30.2-gke.1587003
    - 1.30.3-gke.1225000
- The following versions are no longer available:
    - 1.27.14-gke.1042001
    - 1.27.15-gke.1125000
    - 1.28.9-gke.1289002
    - 1.28.10-gke.1075001
    - 1.28.11-gke.1289000
    - 1.29.6-gke.1137000
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.26 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.27 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.27 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

###### 説明

- Noチャネルのデフォルトバージョンが 1.29.6-gke.1254000 になりました。
- 新規クラスタおよびアップグレードに、リストされたバージョンが利用可能になりました。
- リストされたバージョンはNoチャネルでは使用できなくなりました。
- 自動アップグレードが有効になっている場合、リストにあるようにコントロールプレーンとノードがアップグレードされます。

###### 製品への影響有無

あり

###### 対処方法

- Noチャネルを使用している場合は、デフォルトバージョンが 1.29.6-gke.1254000 に更新されていることに注意してください。
- 自動アップグレードが無効になっている場合は、利用可能なバージョンを確認し、必要に応じて手動でアップグレードしてください。

###### 変更点の詳細

各バージョンにおける変更点の詳細は、以下のリンク先を参照してください。

- [1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- [1.27.16-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
- [1.28.12-gke.1052000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12812)
- [1.29.7-gke.1104000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1297)
- [1.30.1-gke.1329003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1301)
- [1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- [1.30.3-gke.1225000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
- [1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
- [1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)


---

#### 修正

##### 元の文章

GKE Autopilot versions 1.28.6-gke.1317000 and later fixes a known issue for ephemeral storage requests.  If the combined ephemeral storage requests across all containers in your workload exceed 10 GiB, your workload will be rejected with an error message. This differs from earlier versions, which admitted the workload if it requested more than 10 GiB while only actually provisioning 10 GiB, which would result in workload eviction when the workload used more than 10 GiB.

To ensure uninterrupted operation with GKE Autopilot versions 1.28.6-gke.1317000 and later, do the following:

- Verify that containers injected by webhooks don't cause Pods to exceed the maximum Autopilot resource limits.
- Adjust workload resource requests to account for any containers that may be injected by webhooks.
- If any Pods are rejected after updating, reduce their ephemeral storage requests to meet the limit for your workload configuration.

[maximum Autopilot resource limits](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-resource-requests#hardware-min-max)
To learn more, see Automatic resource management in Autopilot.

[Automatic resource management in Autopilot](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-resource-requests#autopilot-resource-management)

##### 説明

GKE Autopilotバージョン1.28.6-gke.1317000以降では、ephemeralストレージリクエストに関する既知の問題が修正されました。ワークロード内のすべてのコンテナからのephemeralストレージリクエストの合計が10GiBを超えると、ワークロードはエラーメッセージと共に拒否されます。これは、以前のバージョンでは、実際にプロビジョニングされるのは10GiBのみであっても、10GiBを超えるリクエストが許可され、ワークロードが10GiBを超えて使用した場合にワークロードのエビクションが発生することと異なります。

GKE Autopilotバージョン1.28.6-gke.1317000以降で運用を中断させないようにするには、次の手順を実行します。

- webhookによって挿入されたコンテナが、Podの最大Autopilotリソース制限を超えていないことを確認します。
- webhookによって挿入される可能性のあるコンテナを考慮して、ワークロードリソースリクエストを調整します。
- 更新後にPodが拒否された場合は、ワークロード構成の制限を満たすようにephemeralストレージリクエストを減らします。

##### 製品への影響有無

あり

##### 対処方法

- GKE Autopilotバージョン1.28.6-gke.1317000以降にアップグレードする場合は、ephemeralストレージリクエストが10GiBを超えていないことを確認してください。
- ephemeralストレージリクエストが10GiBを超えている場合は、ワークロード構成の制限を満たすようにリクエストを減らしてください。

---

## Google Cloud Composer, ApigeeX リリースノート

今回のリリースノートには、Google Cloud ComposerおよびApigeeXに関する情報は記載されていません。Title: July 30, 2024Link: https://cloud.google.com/release-notes#July_30_2024## Apigee X リリースノート 분석

**元の文章:** On July 30, 2024, we released an updated version of Apigee. 

**説明:**  2024年7月30日に、Apigee のアップデートバージョンがリリースされました。

**製品への影響有無:** ApigeeXを利用している場合、影響を受ける可能性があります。

**対処方法:** 

* リリースノートの詳細を確認し、アップデート内容と影響範囲を確認してください。
* 必要に応じて、ApigeeX環境のアップグレードを検討してください。
* アップグレード前に、テスト環境で十分な検証を実施することを推奨します。

**補足:** このアナウンスだけでは、具体的なアップデート内容や影響範囲は不明です。詳細な情報は、Apigee X の公式ドキュメントやリリースノートを参照してください。Title: July 29, 2024Link: https://cloud.google.com/release-notes#July_29_2024## BigQuery

### Go

**元の文章:**

```
## Changes for bigquery/storage/apiv1beta1

[bigquery/storage/apiv1beta1](https://github.com/googleapis/google-cloud-go/tree/main/bigquery/storage/apiv1beta1)
[1.62.0](https://github.com/googleapis/google-cloud-go/compare/bigquery/v1.61.0...bigquery/v1.62.0)
- **bigquery/analyticshub:** Support Direct Table Access Toggle (Egress GA) (b660d68)
- **bigquery/analyticshub:** Support public directory self service for Listings/Exchanges (#10485) (b660d68)
- **bigquery:** Add rounding mode to FieldSchema (#10328) (1a9e204)
- **bigquery:** Json support on managedwriter/adapt pkg (#10542) (978d4a1)
- **bigquery:** Support column name character map in load jobs (#10425) (b829327)

... (以下略) ...
```

**説明:**

BigQueryのGoクライアントライブラリ `bigquery/storage/apiv1beta1` のバージョン1.62.0がリリースされました。

主な変更点は以下の通りです。

* Direct Table Access Toggle (Egress GA) のサポート
* Listings/Exchanges のためのパブリックディレクトリセルフサービスのサポート
* FieldSchemaへのrounding modeの追加
* managedwriter/adapt pkgでのJsonサポート
* ロードジョブでのカラム名文字マップのサポート

**製品への影響有無:** 

BigQuery Goクライアントライブラリを利用している場合は影響があります。

**対処方法:**

最新バージョンを利用するために、クライアントライブラリをバージョン1.62.0にアップデートしてください。

### Java

**元の文章:**

```
## Changes for google-cloud-bigquery

[google-cloud-bigquery](https://github.com/googleapis/java-bigquery)
[2.42.0](https://github.com/googleapis/java-bigquery/compare/v2.41.0...v2.42.0)
- Add ability to specify RetryOptions and BigQueryRetryConfig when create job and waitFor (#3398) (1f91ae7)
- Add additional parameters to CsvOptions and ParquetOptions (#3370) (34f16fb)
- Add remaining Statement Types (#3381) (5f39b19)

... (以下略) ...
```

**説明:**

BigQueryのJavaクライアントライブラリ `google-cloud-bigquery` のバージョン2.42.0がリリースされました。

主な変更点は以下の通りです。

* ジョブ作成時とwaitFor時にRetryOptionsとBigQueryRetryConfigを指定する機能の追加
* CsvOptionsとParquetOptionsに追加パラメータを追加
* 残りのStatement Typesを追加

**製品への影響有無:** 

BigQuery Javaクライアントライブラリを利用している場合は影響があります。

**対処方法:**

最新バージョンを利用するために、クライアントライブラリをバージョン2.42.0にアップデートしてください。

## Cloud Logging

### Go

**元の文章:**

```
## Changes for logging/apiv2

[logging/apiv2](https://github.com/googleapis/google-cloud-go/tree/main/logging/apiv2)
[1.11.0](https://github.com/googleapis/google-cloud-go/compare/logging/v1.10.0...logging/v1.11.0)
- **logging:** OpenTelemetry trace/span ID integration for Go logging library (#10030) (c6711b8)

... (以下略) ...
```

**説明:**

Cloud Logging の Go クライアントライブラリ `logging/apiv2` のバージョン 1.11.0 がリリースされました。

主な変更点は以下の通りです。

* OpenTelemetry trace/span ID と Go ロギングライブラリの統合

**製品への影響有無:** 

Cloud Logging Goクライアントライブラリを利用している場合は影響があります。

**対処方法:**

最新バージョンを利用するために、クライアントライブラリをバージョン 1.11.0 にアップデートしてください。

### Python

**元の文章:**

```
## Changes for google-cloud-logging

[google-cloud-logging](https://github.com/googleapis/python-logging)
[3.11.0](https://github.com/googleapis/python-logging/compare/v3.10.0...v3.11.0)
- OpenTelemetry trace/spanID integration for Python handlers (#889) (78168a3)

... (以下略) ...
```

**説明:**

Cloud Logging の Python クライアントライブラリ `google-cloud-logging` のバージョン 3.11.0 がリリースされました。

主な変更点は以下の通りです。

* Python ハンドラのための OpenTelemetry trace/spanID 統合

**製品への影響有無:** 

Cloud Logging Python クライアントライブラリを利用している場合は影響があります。

**対処方法:**

最新バージョンを利用するために、クライアントライブラリをバージョン 3.11.0 にアップデートしてください。

## Cloud Storage

### Python

**元の文章:**

```
## Changes for google-cloud-storage

[google-cloud-storage](https://github.com/googleapis/python-storage)
[2.18.0](https://github.com/googleapis/python-storage/compare/v2.17.0...v2.18.0)
- Add OpenTelemetry Tracing support as a preview feature (#1288) (c2ab0e0)

... (以下略) ...
```

**説明:**

Cloud Storage の Python クライアントライブラリ `google-cloud-storage` のバージョン 2.18.0 がリリースされました。

主な変更点は以下の通りです。

* プレビュー機能として OpenTelemetry Tracing のサポートを追加

**製品への影響有無:** 

Cloud Storage Python クライアントライブラリを利用している場合は影響があります。

**対処方法:**

最新バージョンを利用するために、クライアントライブラリをバージョン 2.18.0 にアップデートしてください。
プレビュー機能である OpenTelemetry Tracing を利用する場合は、別途設定が必要です。

## Secret Manager

### Go

**元の文章:**

```
## Changes for secretmanager/apiv1

[secretmanager/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/secretmanager/apiv1)
[1.13.5](https://github.com/googleapis/google-cloud-go/compare/secretmanager/v1.13.4...secretmanager/v1.13.5)
- **secretmanager:** Update dependencies (257c40b)
```

**説明:**

Secret Manager の Go クライアントライブラリ `secretmanager/apiv1` のバージョン 1.13.5 がリリースされました。

主な変更点は以下の通りです。

* 依存関係のアップデート

**製品への影響有無:** 

Secret Manager Go クライアントライブラリを利用している場合は影響がある可能性があります。

**対処方法:**

最新バージョンを利用するために、クライアントライブラリをバージョン 1.13.5 にアップデートしてください。
依存関係のアップデートにより、予期しない問題が発生する可能性があります。アップデート後に動作確認を行うことを推奨します。


##  記載のない製品について

**Google Cloud Composer2, Google Kubernetes Engine 1.27, 1.28, ApigeeX** への影響については、今回のリリースノートには記載がありません。 
