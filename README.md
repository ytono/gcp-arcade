
Title: August 19, 2024
Link: https://cloud.google.com/release-notes#August_19_2024
## BigQuery - Timeouts when deploying API proxies and shared flows

### 元の文章

Apigee のエンドポイントにおいて、1秒あたりのクエリ数（QPS）が多い場合にタイムアウトが発生する可能性があります。影響を受けるエンドポイントは次のとおりです。

- organizations.environments.apis.revisions.deployments.deploy
- organizations.environments.apis.revisions.deployments.undeploy
- organizations.environments.sharedflows.revisions.deployments.deploy
- organizations.environments.sharedflows.revisions.deployments.undeploy

タイムアウトの可能性を減らすために、これらのエンドポイントを使用する場合は、目標を3 QPSにすることをお勧めします。

### 説明

Apigee の特定のエンドポイントを使用する際に、高負荷の場合にタイムアウトが発生する可能性があるという問題です。これは、Apigee が BigQuery を利用している場合に発生する可能性があります。

### 製品への影響有無

あなたは Google Cloud Composer2 と Google Kubernetes Engine 1.27, 1.28 を利用しているとのことですが、この問題は **Apigee** に関するものであるため、直接的な影響はありません。

### 対処方法

該当製品を利用していないため、対処は不要です。 

もし、Apigee を利用していて、上記エンドポイントへのリクエストが多い場合は、リクエスト頻度を調整する必要があります。
Title: August 16, 2024
Link: https://cloud.google.com/release-notes#August_16_2024
## Apigee X リリースノートについて

### アナウンス

**元の文章:**

On August 16, 2024, we released an updated version of Apigee (1-13-0-apigee-2).

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:**

Apigee X のバージョン 1-13-0-apigee-2 がリリースされました。本番環境へのロールアウトは 8月18日から開始され、すべての Google Cloud リージョンへの展開が完了するまで4営業日以上かかる可能性があります。

**製品への影響有無:**

Apigee X を利用している場合は影響を受ける可能性があります。

**対処方法:**

* リリースノートの内容を確認し、新バージョンによる影響がないか確認してください。
* 影響がある場合は、必要に応じて対応してください。
* 本番環境への適用前に、ステージング環境などで動作確認を行うことを推奨します。


### 修正

**元の文章:**

| Bug ID | Description |
| --- | --- |
| **324418891** | Added improvements to the MessageLogging policy to avoid potential downtime and deployment failures. |
| **351068926** | Updated the error format and status code returned (from `500` to `400`) in cases where an invalid authorization code causes an error. |

**説明:**

* Bug ID 324418891: MessageLogging ポリシーの改善により、潜在的なダウンタイムとデプロイメントの失敗が回避されるようになりました。
* Bug ID 351068926: 無効な認証コードでエラーが発生した場合に返されるエラー形式とステータスコードが更新されました（`500` から `400` に変更）。

**製品への影響有無:**

上記のBug IDに関連する問題が発生していた場合は、影響を受ける可能性があります。

**対処方法:**

* リリースノートの内容を確認し、該当のBug IDに関連する問題が発生していないか確認してください。
* 発生していた場合は、本リリースの適用により問題が解決される可能性があります。


## Google Kubernetes Engine リリースノートについて

### 変更

**元の文章:**

In GKE version 1.29.7-gke.1238000-1.30, and 1.30.3-gke.1571000 or later, node pools use regional instance templates instead of global instance templates. To learn more, see Regional and global instance templates.

[Regional and global instance templates](https://cloud.google.com/compute/docs/instance-templates#regional_and_global_instance_templates)

**説明:**

GKE バージョン 1.29.7-gke.1238000-1.30 と 1.30.3-gke.1571000 以降では、ノードプールはグローバルインスタンス テンプレートではなく、リージョンインスタンス テンプレートを使用します。

**製品への影響有無:**

* Google Kubernetes Engine 1.27, 1.28 を使用しているため、 **影響はありません**。
* ただし、GKE を 1.29.7-gke.1238000-1.30, 1.30.3-gke.1571000 以降にアップグレードする場合は注意が必要です。

**対処方法:**

* GKE を 1.29.7-gke.1238000-1.30, 1.30.3-gke.1571000 以降にアップグレードする場合は、リージョンインスタンステンプレートを使用するように変更する必要があります。詳細については、提供されたリンクを参照してください。 

**備考:**

CVE 情報は提供されていません。 

Title: August 15, 2024
Link: https://cloud.google.com/release-notes#August_15_2024
## Apigee X

### Announcement

**元の文章**

On August 15, 2024 documentation was added describing how to provision Apigee in the Google Cloud console.

See Get started in the Google Cloud console for more information.

[Get started in the Google Cloud console](https://cloud.google.com/apigee/docs/api-platform/get-started/wizard-select-project)

**説明**

2024年8月15日、Google Cloud ConsoleでApigeeをプロビジョニングする方法を説明したドキュメントが追加されました。

**製品への影響有無**

影響なし。ドキュメントの追加のみ。

**対処方法**

特になし。


## Cloud SQL for PostgreSQL

### Announcement

**元の文章**

Extended support pricing is now available for Cloud SQL for PostgreSQL. To view pricing details, see  Cloud SQL pricing.

[Cloud SQL pricing](https://cloud.google.com/sql/pricing#extended-support-pricing)
 For more information about extended support, see Extended support for Cloud SQL.

[Extended support for Cloud SQL](https://cloud.google.com/sql/docs/postgres/extended-support)
 For more information about extended support timelines, see Database versions and version policies.

[Database versions and version policies](https://cloud.google.com/sql/docs/postgres/db-versions)

**説明**

Cloud SQL for PostgreSQLで拡張サポートの料金体系が利用可能になりました。

**製品への影響有無**

影響なし。情報提供のみ。

**対処方法**

特になし。

### Changed

**元の文章**

If your Cloud SQL Enterprise edition instance stores the transaction logs used for point-in-time recovery (PITR) on disk, then when you do an in-place upgrade to Cloud SQL Enterprise Plus edition the storage location for the transaction logs is switched to Cloud Storage. For more information, see Upgrade an instance to Cloud SQL Enterprise Plus edition by using in-place upgrade.

[Upgrade an instance to Cloud SQL Enterprise Plus edition by using in-place upgrade](https://cloud.google.com/sql/docs/postgres/upgrade-cloud-sql-instance-to-enterprise-plus-in-place)
 To check where your instance stores the transaction logs used for PITR, see Use point-in-time recovery (PITR).

[Use point-in-time recovery (PITR)](https://cloud.google.com/sql/docs/postgres/backup-recovery/pitr#check-log-storage-location)

**説明**

Cloud SQL Enterprise エディションインスタンスで、ポイントインタイムリカバリ（PITR）に使用されるトランザクションログをディスクに保存している場合、Cloud SQL Enterprise Plus エディションにインプレースアップグレードを行うと、トランザクションログの保存場所がCloud Storageに切り替わります。

**製品への影響有無**

Cloud SQL for PostgreSQLのEnterpriseエディションを利用しており、PITRのトランザクションログをディスクに保存している場合、Enterprise Plusエディションへのインプレースアップグレード時にトランザクションログの保存場所が変更されるため、影響があります。

**対処方法**

Cloud SQL Enterprise Plus エディションへのインプレースアップグレードを行う前に、トランザクションログの保存場所が変更されることを認識しておく必要があります。必要に応じて、アップグレード前に既存のトランザクションログをCloud Storageに移動してください。

Title: August 14, 2024
Link: https://cloud.google.com/release-notes#August_14_2024
## Google Kubernetes Engine リリースノート 분석 (2024-08-14)

### **Changed: GKE cluster versions update**

**元の文章:** 

GKE cluster versions have been updated. New versions available for upgrades and new clusters. The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades.

**説明：**

このリリースでは、さまざまなリリースチャネルで利用可能なGKEクラスタバージョン（Kubernetesバージョン）を更新します。

**製品の影響:**

* Google Kubernetes Engine 1.27、1.28の利用に影響があります。

**処置:**

*使用中のリリースチャンネル（Rapid、Regular、Stable、Extended、No channel）を確認してください。
*各リリースチャンネルで新しくリリースされたバージョンと使用できなくなったバージョンを確認します。
* Auto-upgradeが有効になっている場合は、対応するバージョンにクラスタがアップグレードされます。
*必要に応じて、GKEバージョンサポートポリシー（[https://cloud.google.com/kubernetes-engine/versioning]（https://cloud.google.com/kubernetes-engine/versioning））とアップグレードガイド（[ https://cloud.google.com/kubernetes-engine/upgrades]（https://cloud.google.com/kubernetes-engine/upgrades））を参照してクラスタを手動でアップグレードします。

---

### Rapid Channelの変更

**原文：**

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- Version 1.30.3-gke.1225000 is now the default version in the Rapid channel.
- The following versions are now available in the Rapid channel:
 - 1.27.16-gke.1148000
 - 1.28.12-gke.1179000
 - 1.29.7-gke.1274000
 - 1.30.3-gke.1639000
- The following versions are no longer available in the Rapid channel:
 - 1.27.16-gke.1008000
 - 1.28.11-gke.1315000
 - 1.29.7-gke.1008000
 - 1.30.2-gke.1587003
 - 1.30.3-gke.1451000
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.26 to version 1.27.16-gke.1051000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.27 to version 1.27.16-gke.1051000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.27 to version 1.28.12-gke.1052000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.28.12-gke.1052000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.7-gke.1104000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.7-gke.1104000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.3-gke.1225000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.3-gke.1225000 with this release.

**説明：**

* Rapid Channelでは、Kubernetes 1.30.3-gke.1225000が新しい基本バージョンになりました。
* 複数のバージョンが新しく利用可能であり、一部の古いバージョンは使用できなくなりました。
* Auto-upgradeが有効になっていると、以前のバージョンから新しいバージョンに自動アップグレードが行われます。
*詳細については、提供されている各バージョンの変更ログリンクを参照してください。

**製品の影響:**

* Google Kubernetes Engine 1.27、1.28の利用に影響があります。
* Rapid Channelを使用する場合に該当します。

**アクション：**

* Rapid Channelを使用してAuto-upgradeを使用している場合、クラスタは自動的にアップグレードされます。アップグレードスケジュールを確認し、必要に備えてください。
* Auto-upgradeを使用しない場合は、提供された変更ログを確認して新しいバージョンにアップグレードすることを検討してください。

---

### **Issue: Internal passthrough Network Load Balancers の問題**

**原文：**

We've identified a potential issue that may cause downtime for traffic coming to your GKE managed Internal passthrough Network Load Balancers, after certain cluster operations like node upgrades. This issue specifically affects clusters with GKE Subsetting and Services with `externalTrafficPolicy=Cluster`. This issue is more likely to occur in clusters with more than 25 nodes. To prevent this issue altogether, we recommend updating your Service configuration to use `externalTrafficPolicy=Local`. If you're already experiencing downtime, scale up the number of pods backing your LoadBalancer to provide immediate relief. A fix for this issue will be available in upcoming GKE releases.

**説明：**

* GKE Subsettingを使用し、 `externalTrafficPolicy = Cluster`に設定されているサービスを持つクラスタでノードのアップグレードなどの操作が完了した後、Internal passthrough Network Load Balancerに入ってくるトラフィックが中断される可能性がある問題が発見されました。
*特に25以上のノードを持つクラスタで発生する可能性が高いです。
*この問題は将来のGKEリリースで修正される予定です。

**製品の影響:**

* Google Kubernetes Engine 1.27、1.28の利用に影響があります。
* GKE Subsettingを使用し、 `externalTrafficPolicy = Cluster`設定されたサービスを持つクラスターに対応します。

**アクション：**

*影響を受ける構成を使用している場合は、サービス設定を `externalTrafficPolicy = Local`に更新することをお勧めします。
*すでにダウンタイムが発生している場合は、LoadBalancerをサポートするPodの数を増やすことで、すぐに問題を軽減できます。

---

**次のRegular channel、Stable channel、Extended channel、No channelへの変更も、Rapid Channelと同じ方法で分析して影響を受けていることを確認し、必要な措置を講じる必要があります。**

**各チャンネルごとの変更の説明、製品の影響、およびアクションは、上記のRapid Channelの変更と同じフォーマットを維持しながら分析できます。**

**注：**各変更に含まれるKubernetesバージョン固有の変更ログリンク（[https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/]（https://github.com/kubernetes/ kubernetes/blob/master/CHANGELOG/))でCVE情報を確認し、影響度の高いCVEに関する詳細を確認する必要があります。

Title: August 13, 2024
Link: https://cloud.google.com/release-notes#August_13_2024
## Cloud Composer リリースノート

### アナウンス: 新しい Cloud Composer リリースの開始

#### 元の文章

A new Cloud Composer release has started on **August 13, 2024**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet. 

#### 説明
Cloud Composer の新しいリリースが2024年8月13日から開始されました。このリリースは現在進行中で、すべてのリージョンに展開されるまでに時間がかかる可能性があります。リストされている変更点や新機能の一部は、一部のリージョンではまだ利用できない場合があります。

#### 製品への影響有無
Cloud Composer 2 を利用している場合、このリリースは影響ありません。Cloud Composer 3 を利用している場合は、新しい Airflow ビルドと Cloud Composer イメージが利用可能になるため、影響があります。

#### 対処方法
* **Cloud Composer 2**: リリースノートの内容を確認し、必要に応じて新しいバージョンへのアップグレードを検討してください。
* **Cloud Composer 3**: 新しい Airflow ビルドと Cloud Composer イメージを利用する場合は、リリースノートの内容を確認し、アップグレード手順に従ってください。

### 変更点: Cloud Composer 3 で利用可能な新しい Airflow ビルド

#### 元の文章

New Airflow builds are available in Cloud Composer 3:

[Airflow builds](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-3)
- composer-3-airflow-2.9.1-build.4
- composer-3-airflow-2.7.3-build.13 

#### 説明
Cloud Composer 3 で、新しい Airflow ビルドが利用可能になりました。

* composer-3-airflow-2.9.1-build.4
* composer-3-airflow-2.7.3-build.13

#### 製品への影響有無
Cloud Composer 3 を利用している場合、新しい Airflow ビルドが利用可能になったため、影響があります。

#### 対処方法
必要に応じて、新しい Airflow ビルドへのアップグレードを検討してください。アップグレード手順については、提供されているリンクを参照してください。

### 変更点: Cloud Composer 2.9.1 イメージの提供開始

#### 元の文章

 Cloud Composer 2.9.1 images are available:

[images](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-2)
- composer-2.9.1-airflow-2.9.1 (default)
- composer-2.9.1-airflow-2.7.3

#### 説明
Cloud Composer 2.9.1 イメージが利用可能になりました。

* composer-2.9.1-airflow-2.9.1 (デフォルト)
* composer-2.9.1-airflow-2.7.3

#### 製品への影響有無
Cloud Composer 2 を利用している場合、新しいイメージが利用可能になったため、影響があります。

#### 対処方法
必要に応じて、新しいイメージへのアップグレードを検討してください。アップグレード手順については、提供されているリンクを参照してください。


## Google Kubernetes Engine リリースノート

### 修正: 特権ワークロードにおける PDCSI ドライバの問題解決

#### 元の文章

 In GKE version 1.30 and later, there is a workaround in the PDCSI driver for privileged workloads that access container namespaces with hostpath. The workaround delays NodeUnstage until attached filesystems are no longer in use. Under certain conditions, the privileged hostpath workloads may cause a container's mount namespace to be retained longer than the container's lifecycle. The workaround addresses an issue where the driver could proceed with detaching a GCE persistent disk even if the block device filesystem is still in use.

[workaround in the PDCSI driver](https://github.com/kubernetes-sigs/gcp-compute-persistent-disk-csi-driver/pull/1658)
 With this fix, the PDCSI driver will validate that an attached block device is no longer in use prior to unmounting it from a GKE node.

#### 説明

GKEバージョン1.30以降では、hostpathを使用してコンテナ名前空間にアクセスする特権ワークロード向けにPDCSIドライバに回避策が導入されました。この回避策は、アタッチされたファイルシステムが使用されなくなるまでNodeUnstageを遅延させます。特定の条件下では、特権hostpathワークロードが原因で、コンテナのマウント名前空間がコンテナのライフサイクルよりも長く保持される可能性があります。この回避策は、ブロックデバイスファイルシステムがまだ使用されている場合でも、ドライバがGCE永続ディスクのデタッチ処理を進めてしまう可能性がある問題に対処しています。

この修正により、PDCSIドライバは、GKEノードからマウント解除する前に、アタッチされたブロックデバイスが使用されていないことを検証するようになります。

#### 製品への影響有無

GKE 1.27, 1.28 を利用している場合、この修正は GKE 1.30 以降に適用されるため、影響はありません。

#### 対処方法

GKE 1.27, 1.28 を利用している場合は、特別な対処は不要です。ただし、この問題の影響を受けないためには、GKEの最新バージョンへのアップグレードを検討することをお勧めします。
