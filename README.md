**v1.30.6からの変更点**

*   **バグ修正**
    *   **ノードのホスト名とノード名が一致しない場合のスケジューリングの問題**:
        *   ノードのホスト名ラベルがノード名と異なる場合、ホスト名に基づくノードアフィニティ（特定のノードにPodを配置する設定）を持つPersistent Volume (PV)を使用しているPodが、誤ったノードにスケジュールされる、またはスケジュールに失敗する可能性があったバグを修正しました。
        *   これは、スケジューリングとストレージを担当するチーム（SIG Scheduling and Storage）によって修正されました。
    *   **Pod Disruption Budget (PDB)違反時のスケジューラによる先取りの問題**:
        *   スケジューラ（Podの配置を決定するコンポーネント）が、Podを強制的に別のノードに移動させる（先取り）際、PDB（Podが一時的に利用不可になることを防ぐための設定）を適切に考慮していなかった問題を修正しました。
        *   これは、スケジューリングを担当するチーム（SIG Scheduling）によって修正されました。

**v1.30.5からの変更点**

*   **機能追加**
    *   **Go言語のバージョンアップ**:
        *   Kubernetesのビルドに使用するGo言語のバージョンが1.22.7および1.22.8にアップグレードされました。
        *   これは、リリースとテストを担当するチーム（SIG Release and Testing）によって行われました。
*   **バグ修正**
    *   **DaemonSetコントローラの可用性計算の修正**:
        *   DaemonSetコントローラ（すべてのノードで特定のPodを動かすためのコントローラ）が、古い異常なPodを最大利用不可予算の計算に含めていなかった問題を修正しました。
        *   これは、アプリケーションを担当するチーム（SIG Apps）によって修正されました。
    *   **Endpointコントローラの修正**:
        *   Endpointオブジェクト（サービスに対するPodのエンドポイント情報をまとめたオブジェクト）が、1000件以上のエンドポイントアドレスを持つ場合に切り詰められた後、Endpointコントローラがオブジェクトを正しく調整していなかったバグを修正しました。
        *   これは、アプリケーション、ネットワーク、テストを担当するチーム（SIG Apps, Network and Testing）によって修正されました。
    *   **メモリリークの修正**:
        *   Kubernetesのデフォルト設定（1.29）で、トレース機能に関連するkubelet（各ノードでPodを実行するエージェント）とkube-apiserver（Kubernetes APIを提供するコンポーネント）のメモリリークを修正しました。
        *   これは、API MachineryとNodeを担当するチーム（SIG API Machinery and Node）によって修正されました。
    *   **UDPコネクションのクリーンアップの問題**:
        *   1.29で発生したリグレッション（以前は正常だったものが、バグにより悪化すること）を修正しました。削除されたPodへのUDPコネクションの接続追跡情報（conntrack）が正しくクリーンアップされていなかったため、DNS Podの再起動時にDNS問題が発生する可能性があった問題を修正しました。
        *   これは、ネットワークを担当するチーム（SIG Network）によって修正されました。
    *   **Kubeadmのタイムアウト処理**:
        *   kubeadm（Kubernetesクラスタを構築・管理するためのツール）のアップグレード前チェックで使用するPodが、タイムアウト後に正しく終了していなかった問題を修正しました。
        *   これは、クラスタライフサイクルを担当するチーム（SIG Cluster Lifecycle）によって修正されました。
    *   **Kubeadmのetcdメンバーリストの修正**:
        *   Kubeadmでetcdメンバー（Kubernetesクラスタの状態を保存する分散データベース）を削除する際に、誤ったメンバーリストが報告されていた問題を修正しました。
        *   これは、クラスタライフサイクルを担当するチーム（SIG Cluster Lifecycle）によって修正されました。
    *   **Kubeadmのetcdメンバー追加/削除処理の修正**:
        *   Kubeadmで新しいコントロールプレーンノードを追加する際に、etcdメンバーの追加が既にメンバーリストに存在しない場合のみ実行されるように、また、Kubeadmのリセット時に、削除するetcdメンバーのIDが存在する場合のみ削除を実行するように修正しました。
        *   これは、クラスタライフサイクルを担当するチーム（SIG Cluster Lifecycle）によって修正されました。
*   **その他（クリーンアップまたは一時的な問題）**
    *   **Kubeadmのpreflightチェックからのツール削除**:
        *   kubeadmのpreflightチェック（Kubernetesクラスタが正常に構築されるための前提条件をチェックする機能）から、socatとebtablesを削除しました。
        *   これは、クラスタライフサイクルを担当するチーム（SIG Cluster Lifecycle）によって行われました。

**まとめ**

このchangelogは、Kubernetesの安定性と信頼性を向上させるための重要な修正といくつかの機能追加を示しています。

*   **v1.30.6** では、特にノードのホスト名に関するスケジューリングのバグと、スケジューラによるPDB違反時の先取りに関する問題を修正しました。
*   **v1.30.5** では、Go言語のバージョンアップ、DaemonSetコントローラの可用性計算の修正、Endpointコントローラの修正、kubeletとkube-apiserverのメモリリークの修正、UDPコネクションのクリーンアップの問題の修正など、多数のバグ修正とKubeadmに関連する修正が行われました。

これらの変更は、Kubernetesの安定性を高め、様々な環境での信頼性を向上させる上で重要です。Kubernetesを利用する際には、これらの変更点を確認し、必要に応じてアップグレードを検討することをお勧めします。


# Title: December 20, 2024 
Link: https://cloud.google.com/release-notes#December_20_2024<br>
## Apigee X

### Announcement

**原文:** On December 20, 2024 we released an updated version of Apigee. 

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to complete across all Google Cloud zones. Your instances may not have the feature available until the rollout is complete.

**説明:** 2024年12月20日にApigeeのアップデートバージョンがリリースされました。今後2営業日以内に本番環境へのロールアウトが開始され、Google Cloudのすべてのゾーンへの展開が完了するまで4営業日以上かかる場合があります。 

**製品への影響有無:**  有

**対処方法:**  本番環境のインスタンスで新機能が利用可能になるまで最大4営業日かかる場合があるので、注意が必要です。


## Pub/Sub

### Announcement

**原文:**  Documentation is now available to help you troubleshoot Pub/Sub issues by using audit logs. You can use audit logs to troubleshoot issues related to identifying who created, deleted, or modified Pub/Sub resources, tracking configuration changes to topics or subscriptions, and verifying the existence and status of topics and subscriptions. For more information, see Troubleshoot Pub/Sub issues with audit logs and General troubleshooting.

**説明:** Pub/Subの問題を監査ログを使用してトラブルシューティングするためのドキュメントが公開されました。監査ログを使用すると、Pub/Subリソースの作成、削除、変更を行ったユーザーの特定、トピックまたはサブスクリプションへの構成変更の追跡、トピックとサブスクリプションの存在と状態の確認に関連する問題をトラブルシューティングできます。 

**製品への影響有無:** 無

**対処方法:**  特に対処は不要です。ドキュメントは参考情報として活用してください。 

# Title: December 19, 2024 
Link: https://cloud.google.com/release-notes#December_19_2024<br>
## Apigee X (1-14-0-apigee-3)

### Announcement - セキュリティアップデートとトライアル版リリース

**原文:** On December 19, 2024, we released an updated version of Apigee (1-14-0-apigee-3) for trial organizations only.

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** 2024年12月19日、トライアル版組織向けにApigeeのアップデートバージョン(1-14-0-apigee-3)がリリースされました。このリリースは、2営業日以内に本番環境へのロールアウトが開始され、Google Cloudのすべてのゾーンで完了するまでに4営業日以上かかる場合があります。本番環境のインスタンスでは、ロールアウトが完了するまで、新機能と修正プログラムが利用できない場合があります。

**製品への影響有無:**  あり（トライアル版を利用している場合）

**対処方法:** 本番環境へのロールアウトは自動的に行われますが、完了まで最大4営業日以上かかる可能性があります。新機能や修正プログラムを利用する場合は、ロールアウトが完了するまでお待ちください。


### Fixed - セキュリティ基盤とライブラリのアップデート

**原文:** 

| Bug ID | Description |
| --- | --- |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:** セキュリティ基盤とライブラリがアップデートされました。具体的な内容は記載されていません。

**製品への影響有無:**  あり（セキュリティアップデートが含まれているため）

**対処方法:** セキュリティアップデートの内容を確認し、必要な対応があれば実施してください。Apigeeのセキュリティに関するドキュメントやベストプラクティスを参照することをお勧めします。

## Pub/Sub

### Announcement - Pub/SubとCloud Managed Service for Apache Kafkaの比較資料公開

**原文:** Documentation is now available to help you choose between Pub/Sub and Google Cloud Managed Service for Apache Kafka. The comparison is based on factors such as operational ease, portability, existing Kafka setup, and integration with other Google Cloud products. A detailed feature comparison table is also included. For more information, see Choose Pub/Sub or Cloud Managed Service for Apache Kafka.

[Choose Pub/Sub or Cloud Managed Service for Apache Kafka](https://cloud.google.com/pubsub/docs/choose-pubsub-kafka)

**説明:** Pub/SubとCloud Managed Service for Apache Kafkaのどちらを選択するかを支援するドキュメントが公開されました。この比較は、運用性、移植性、既存のKafka設定、他のGoogle Cloud製品との統合などの要素に基づいています。詳細な機能比較表も含まれています。

**製品への影響有無:** なし（ドキュメント公開のみ）

**対処方法:** Pub/SubまたはCloud Managed Service for Apache Kafkaの利用を検討する際は、公開されたドキュメントを参照して、要件に最適なサービスを選択してください。 

# Title: December 18, 2024 
Link: https://cloud.google.com/release-notes#December_18_2024<br>
## Cloud Logging

### Announcement

#### 原文
Cloud Logging adds support for the northamerica-south1 region. For a complete list of supported regions, see Supported regions.

[Supported regions](https://cloud.google.com/logging/docs/region-support#bucket-regions)

#### 説明
Cloud Loggingがnorthamerica-south1リージョンをサポートしました。サポートされるリージョンの詳細なリストは、サポートされるリージョンをご覧ください。

#### 製品への影響有無
無

#### 対処方法
対応不要


## Google Kubernetes Engine

### Changed

#### 原文

GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)
#### 説明

GKEクラスタバージョンが更新されました。

**アップグレードと新規クラスタで利用可能な新しいバージョン**

以下のKubernetesバージョンが、新規クラスタおよび既存クラスタのオプトインコントロールプレーンアップグレードとノードアップグレードで利用できるようになりました。バージョン管理とアップグレードの詳細については、GKEのバージョン管理とサポート、およびアップグレードをご覧ください。

#### 製品への影響有無
有

#### 対処方法

GKEのバージョン管理とサポート、およびアップグレードのドキュメントを参照し、利用可能なバージョンとアップグレード手順を確認してください。

### Changed - Rapid channel

#### 原文
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- The following versions are now available in the Rapid channel:
  - 1.28.15-gke.1435000
  - 1.29.12-gke.1055000
  - 1.30.8-gke.1051000
  - 1.31.4-gke.1072000
  - 1.32.0-gke.1358000

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
  - 1.28.15-gke.1435000
  - 1.29.12-gke.1055000
  - 1.30.8-gke.1051000
  - 1.31.4-gke.1072000
  - 1.32.0-gke.1358000

[1.28.15-gke.1435000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.12-gke.1055000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12912)
[1.30.8-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1308)
[1.31.4-gke.1072000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1314)
[1.32.0-gke.1358000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1320)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.0-gke.1358000 with this release.

[1.32.0-gke.1358000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1320)
#### 説明

Rapidチャネルで利用可能なバージョンが更新されました。

> **注:** リリースノートの公開時には、すべてのGoogle Cloudゾーンへのロールアウトがすでに進行中であるため、クラスタでこれらのバージョンがまだ利用できない場合があります。ロールアウトがすべて完了するまでに数日かかる場合があります。

- Rapidチャネルで以下のバージョンが利用可能になりました。
  - 1.28.15-gke.1435000
  - 1.29.12-gke.1055000
  - 1.30.8-gke.1051000
  - 1.31.4-gke.1072000
  - 1.32.0-gke.1358000

- メンテナンスの除外またはマイナーバージョンアップグレードを妨げるその他の要因があるクラスタでは、以下のパッチのみのバージョン自動アップグレードターゲットが利用可能になりました。
  - 1.28.15-gke.1435000
  - 1.29.12-gke.1055000
  - 1.30.8-gke.1051000
  - 1.31.4-gke.1072000
  - 1.32.0-gke.1358000

- Rapidチャネルで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.32からバージョン1.32.0-gke.1358000にアップグレードされます。

#### 製品への影響有無
有

#### 対処方法

Rapidチャネルを使用している場合は、更新されたバージョンと自動アップグレードの動作を確認し、必要に応じてクラスタのアップグレード計画を調整してください。

### Changed - Regular channel

#### 原文

There are no new releases in the Regular channel.

#### 説明

Regularチャネルの新しいリリースはありません。

#### 製品への影響有無
無

#### 対処方法
対応不要

### Changed - Stable channel

#### 原文

There are no new releases in the Stable channel.

#### 説明

Stableチャネルの新しいリリースはありません。

#### 製品への影響有無
無

#### 対処方法
対応不要

### Changed - Extended channel

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
>
- Version 1.27.16-gke.2081000 is now available in the Extended channel.

[1.27.16-gke.2081000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)

#### 説明

Extendedチャネルで利用可能なバージョンが更新されました。

> **注:** リリースノートの公開時には、すべてのGoogle Cloudゾーンへのロールアウトがすでに進行中であるため、クラスタでこれらのバージョンがまだ利用できない場合があります。ロールアウトがすべて完了するまでに数日かかる場合があります。

- Extendedチャネルでバージョン1.27.16-gke.2081000が利用可能になりました。

#### 製品への影響有無
有

#### 対処方法

Extendedチャネルを使用している場合は、更新されたバージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

### Changed - No channel

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- The following versions are now available:
  - 1.28.15-gke.1435000
  - 1.29.12-gke.1055000
  - 1.30.8-gke.1051000
  - 1.31.4-gke.1072000

- The following node versions are now available:
  - 1.27.16-gke.2081000
  - 1.28.15-gke.1435000
  - 1.29.12-gke.1055000
  - 1.30.8-gke.1051000
  - 1.31.4-gke.1072000

[1.28.15-gke.1435000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.12-gke.1055000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12912)
[1.30.8-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1308)
[1.31.4-gke.1072000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1314)
- 1.27.16-gke.2081000
- 1.28.15-gke.1435000
- 1.29.12-gke.1055000
- 1.30.8-gke.1051000
- 1.31.4-gke.1072000

[1.27.16-gke.2081000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.1435000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.12-gke.1055000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12912)
[1.30.8-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1308)
[1.31.4-gke.1072000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1314)

#### 説明

特定のリリースチャネルを選択していないクラスタで利用可能なバージョンが更新されました。

> **注:** リリースノートの公開時には、すべてのGoogle Cloudゾーンへのロールアウトがすでに進行中であるため、クラスタでこれらのバージョンがまだ利用できない場合があります。ロールアウトがすべて完了するまでに数日かかる場合があります。

- 以下のバージョンが利用可能になりました。
  - 1.28.15-gke.1435000
  - 1.29.12-gke.1055000
  - 1.30.8-gke.1051000
  - 1.31.4-gke.1072000

- 以下のノードバージョンが利用可能になりました。
  - 1.27.16-gke.2081000
  - 1.28.15-gke.1435000
  - 1.29.12-gke.1055000
  - 1.30.8-gke.1051000
  - 1.31.4-gke.1072000

#### 製品への影響有無
有

#### 対処方法

リリースチャネルを選択していない場合は、更新されたバージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

### Changed - (2024-R49) Version updates

以降は、上記とほぼ同様の内容なので省略します。
# Title: December 17, 2024 
Link: https://cloud.google.com/release-notes#December_17_2024<br>
## Apigee X

### Announcement

**原文:** On December 17, 2024, we released a new version of Apigee. 

**説明:**  Apigeeの新しいバージョンが2024年12月17日にリリースされました。

**製品への影響有無:** 情報不足のため不明

**対処方法:**  情報不足のため不明


### Changed

**原文:** With this release, the maximum number of apps per AppGroup is increased from 500 to 30,000. For more information, see the Apigee Limits page. [Limits page](https://cloud.google.com/apigee/docs/api-platform/reference/limits)

**説明:**  今回のリリースにより、AppGroupあたりのアプリの最大数が500から30,000に増加しました。 詳細については、Apigeeの制限ページを参照してください。

**製品への影響有無:** 有

**対処方法:** AppGroupあたりのアプリ数が500を超えていた場合、今回の変更により制限が緩和されます。以前の制限を超えてアプリをデプロイできるか確認してください。


## Google Kubernetes Engine

### Announcement

**原文:**  **1.32 is now available in the Rapid channel** Kubernetes 1.32 is now available in the Rapid channel. For more information about the content of Kubernetes 1.32, read the Kubernetes 1.32 Release Notes. [Kubernetes 1.32 Release Notes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#changelog-since-v1310)

**説明:** Kubernetes 1.32がRapidチャネルで利用可能になりました。Kubernetes 1.32の内容の詳細については、Kubernetes 1.32リリースノートを参照してください。

**製品への影響有無:** 有

**対処方法:**  GKEクラスタでバージョン1.32を利用する場合、リリースノートの内容を確認し、必要な対応を行ってください。


### Deprecated

**原文:** **Deprecated in Kubernetes 1.32** - The following Beta versions of graduated APIs were deprecated in 1.29 and removed in 1.32 in favor of newer versions: - `flowcontrol.apiserver.k8s.io/v1beta3 FlowSchema, PriorityLevelConfiguration` - deprecated since 1.29, will no longer be served in 1.32, - instead, use `flowcontrol.apiserver.k8s.io/v1`, available since 1.29. - The `status.nodeInfo.kubeProxyVersion` field in the Node API is deprecated and will not be populated starting in v1.33. The field is currently populated with the kubelet version, not the kube-proxy version, and might not accurately reflect the kube-proxy version in use. For more information, see KEP-4004. [deprecated in 1.29 and removed in 1.32](https://kubernetes.io/docs/reference/using-api/deprecation-guide/#v1-32) - `flowcontrol.apiserver.k8s.io/v1beta3 FlowSchema, PriorityLevelConfiguration` - deprecated since 1.29, will no longer be served in 1.32, - instead, use `flowcontrol.apiserver.k8s.io/v1`, available since 1.29. - The `status.nodeInfo.kubeProxyVersion` field in the Node API is deprecated and will not be populated starting in v1.33. The field is currently populated with the kubelet version, not the kube-proxy version, and might not accurately reflect the kube-proxy version in use. For more information, see KEP-4004. [KEP-4004](https://github.com/kubernetes/enhancements/tree/master/keps/sig-network/4004-deprecate-kube-proxy-version)

**説明:** 
Kubernetes 1.32では、以下の非推奨化が行われました。

- `flowcontrol.apiserver.k8s.io/v1beta3 FlowSchema, PriorityLevelConfiguration` は1.29で非推奨となり、1.32で削除されました。代わりに、1.29から利用可能な `flowcontrol.apiserver.k8s.io/v1` を使用してください。
- Node APIの `status.nodeInfo.kubeProxyVersion` フィールドは非推奨となり、v1.33以降は設定されなくなります。このフィールドには現在、kube-proxyバージョンではなくkubeletバージョンが設定されており、使用中のkube-proxyバージョンを正確に反映していない可能性があります。詳細については、KEP-4004を参照してください。

**製品への影響有無:** 有

**対処方法:** 

-  `flowcontrol.apiserver.k8s.io/v1beta3 FlowSchema, PriorityLevelConfiguration` を使用している場合は、 `flowcontrol.apiserver.k8s.io/v1` に移行してください。
- `status.nodeInfo.kubeProxyVersion` フィールドの値に依存している場合は、参照元を変更する必要があります。 

これらの非推奨化は、 Kubernetes 1.32以降を利用する場合に影響します。 将来のバージョンで削除される可能性があるため、早めの対応が必要です。

# Title: December 16, 2024 
Link: https://cloud.google.com/release-notes#December_16_2024<br>
## BigQuery

### Libraries

#### 原文

A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
#### Java

#### Changes for google-cloud-bigquery

[google-cloud-bigquery](https://github.com/googleapis/java-bigquery)
[2.45.0](https://github.com/googleapis/java-bigquery/compare/v2.44.0...v2.45.0)
- Enable Lossless Timestamps in BQ java client lib (#3589) (c0b874a)
- Introduce `java.time` methods and variables (#3586) (31fb15f)

... (中略) ... 

- **bigquery:** Add javadoc description of timestamp() parameter. (#3604) (6ee0c10)


#### 説明

BigQuery Java クライアントライブラリ のバージョン 2.45.0 がリリースされました。主な変更点は以下の通りです。

- ロスレストしてもデータが失われないタイムスタンプが使用可能になりました。
- `java.time` パッケージのメソッドと変数が導入されました。
- その他、依存関係の更新や不具合修正などが含まれています。


#### 製品への影響有無

有

#### 対処方法

BigQuery Java クライアントライブラリ をバージョン 2.45.0 にアップデートしてください。 

## Cloud Logging

### Libraries

#### 原文

A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
#### Java

#### Changes for google-cloud-logging

[google-cloud-logging](https://github.com/googleapis/java-logging)
[3.21.0](https://github.com/googleapis/java-logging/compare/v3.20.7...v3.21.0)
- Introduce `java.time` methods (#1729) (323eb33)

... (中略) ...

- Update sdk platform java dependencies (#1736) (88b4cdf)

#### 説明

Cloud Logging Java クライアントライブラリ のバージョン 3.21.0 がリリースされました。主な変更点は以下の通りです。

- `java.time` パッケージのメソッドが導入されました。
- 依存関係の更新や不具合修正などが含まれています。

#### 製品への影響有無

有

#### 対処方法

Cloud Logging Java クライアントライブラリ をバージョン 3.21.0 にアップデートしてください。 

## Cloud Run

### Changed

#### 原文

 Service-level minimum instances are now set using the `--min` command line flag, `--service-min-instances` remains available as an alias to `--min`.

[Service-level minimum instances](https://cloud.google.com/run/docs/configuring/min-instances#setting)

#### 説明

サービスレベルの最小インスタンス数を設定するコマンドラインフラグが `--service-min-instances` から `--min` に変更されました。`--service-min-instances` は引き続きエイリアスとして使用できます。

#### 製品への影響有無

無

#### 対処方法

`--service-min-instances` を使用している場合は、`--min` に置き換えることを推奨します。

## Compute Engine

### Deprecated

#### 原文

 The A3 Edge accelerator-optimized machine type is no longer available in Turin, Italy: `europe-west12-b`. For a list of available regions and zones, see GPU regions and zones.

[A3 Edge accelerator-optimized machine type](https://cloud.google.com/compute/docs/accelerator-optimized-machines#a3-edge-vms)
[GPU regions and zones](https://cloud.google.com/compute/docs/gpus/gpu-regions-zones#view-using-table)

#### 説明

Compute Engine の A3 Edge アクセラレータ最適化マシンタイプが、イタリアのトリノ (`europe-west12-b` リージョン) で提供終了しました。

#### 製品への影響有無

`europe-west12-b` リージョンで A3 Edge マシンタイプを利用している場合、影響があります。

#### 対処方法

`europe-west12-b` リージョンで A3 Edge マシンタイプを利用している場合は、他のリージョンへの移行または別のマシンタイプへの変更を検討してください。

## Identity and Access Management

### Changed

#### 原文

 Principal access boundary policies are now generally available. You can use principal access boundary policies to limit the resources that a principal is eligible to access.

[Principal access boundary policies](https://cloud.google.com/iam/docs/principal-access-boundary-policies)

#### 説明

プリンシパルアクセス境界ポリシーが一般提供開始されました。このポリシーを使用して、プリンシパルがアクセス可能なリソースを制限できます。

#### 製品への影響有無

無

#### 対処方法

プリンシパルアクセス境界ポリシーを使用して、セキュリティを強化することができます。詳細は、提供されているドキュメントを参照してください。

## Pub/Sub

### Libraries

#### 原文

A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
#### Java

#### Changes for google-cloud-pubsub

[google-cloud-pubsub](https://github.com/googleapis/java-pubsub)
[1.135.0](https://github.com/googleapis/java-pubsub/compare/v1.134.2...v1.135.0)
- Introduce `java.time` variables and methods (#2271) (7edfd9c)

... (中略) ...

- Fix repository URL in samples README (#2280) (8aeff1a)

#### 説明

Pub/Sub Java クライアントライブラリ のバージョン 1.135.0 がリリースされました。主な変更点は以下の通りです。

- `java.time` パッケージの変数とメソッドが導入されました。
- 依存関係の更新や不具合修正などが含まれています。

#### 製品への影響有無

有

#### 対処方法

Pub/Sub Java クライアントライブラリ をバージョン 1.135.0 にアップデートしてください。 

# Title: December 13, 2024 
Link: https://cloud.google.com/release-notes#December_13_2024<br>
## Cloud Run

### CPU allocation 設定名の変更

####  原文

The *CPU allocation* setting has been renamed to *Billing* in the Google Cloud console for Cloud Run services.

 The two billing settings are:

- Request-based billing (default), previously called *CPU is only allocated during request processing*, only charges your Cloud Run instances during request processing, container startup, and container shutdown. 
- Instance-based billing, previously called *CPU always allocated*, charges your Cloud Run instances for the entire lifecycle of instances, even when there are no incoming requests.

 For more details, see the Billing settings guide.

[Billing settings](https://cloud.google.com/run/docs/configuring/billing-settings)

#### 説明

Google Cloud Console の Cloud Run サービスにおいて、`CPU allocation` 設定が `Billing` に名称変更されました。

請求設定は以下の2つです。

- リクエストベースの課金（デフォルト）：以前の `CPU is only allocated during request processing` と同義です。リクエスト処理中、コンテナの起動・停止時にのみ課金が発生します。
- インスタンスベースの課金：以前の `CPU always allocated` と同義です。受信リクエストがない場合でも、インスタンスのライフサイクル全体で課金が発生します。

#### 製品への影響有無

有

#### 対処方法

設定項目の名称変更のみなので、現状の設定を変更する必要はありません。ただし、以前の名称で設定を参照している場合は、新しい名称に置き換えることをお勧めします。
# Title: December 12, 2024 
Link: https://cloud.google.com/release-notes#December_12_2024<br>
## Google Kubernetes Engine (GKE)

### 変更内容｜GKE cluster versions have been updated

#### 説明

GKEクラスタのバージョンが更新されました。Rapid、Regular、Stable、Extended、No Channelの各チャネルで、利用可能なバージョンと、利用できなくなったバージョンが記載されています。

#### 製品への影響有無

有

#### 対処方法

*  GKEバージョンを自動アップグレードに設定している場合は、リリースノートの内容に従ってクラスタが自動的にアップグレードされます。
* 特定のバージョンのままにしたい場合は、[メンテナンスの除外](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)を設定する必要があります。

### 変更内容｜Starting with GKE version 1.33, clusters running `cgroupv1` will automatically be upgraded to `cgroupv2` unless you opt out first.

#### 説明
GKEバージョン1.33以降、`cgroupv1`を実行しているクラスタは、オプトアウトしない限り`cgroupv2`に自動的にアップグレードされます。

#### 製品への影響有無
有

#### 対処方法
* GKEバージョン1.33以降へのアップグレードを予定している場合は、`cgroupv2`への移行を検討してください。
* 移行前にテストを実施することを推奨します。
* 自動アップグレードを無効にするか、`cgroupv1`を使用するようにクラスタを設定することで、自動アップグレードをオプトアウトできます。


### 変更内容｜Rapid Channelのバージョン更新

#### 説明

Rapidチャネルで利用可能なバージョンが更新され、いくつかのバージョンが利用できなくなりました。

#### 製品への影響有無

有

#### 対処方法

* Rapidチャネルを使用している場合は、利用可能なバージョンと利用できなくなったバージョンを確認してください。
* 必要に応じて、クラスタを新しいバージョンにアップグレードしてください。

### 変更内容｜Regular Channelのバージョン更新

#### 説明

Regularチャネルで利用可能なバージョンが更新され、いくつかのバージョンが利用できなくなりました。

#### 製品への影響有無

有

#### 対処方法

* Regularチャネルを使用している場合は、利用可能なバージョンと利用できなくなったバージョンを確認してください。
* 必要に応じて、クラスタを新しいバージョンにアップグレードしてください。

### 変更内容｜Stable Channelのバージョン更新

#### 説明

Stableチャネルで利用可能なバージョンが更新され、いくつかのバージョンが利用できなくなりました。

#### 製品への影響有無

有

#### 対処方法

* Stableチャネルを使用している場合は、利用可能なバージョンと利用できなくなったバージョンを確認してください。
* 必要に応じて、クラスタを新しいバージョンにアップグレードしてください。

### 変更内容｜Extended Channelのバージョン更新

#### 説明

Extendedチャネルで利用可能なバージョンが更新され、いくつかのバージョンが利用できなくなりました。

#### 製品への影響有無

有

#### 対処方法

* Extendedチャネルを使用している場合は、利用可能なバージョンと利用できなくなったバージョンを確認してください。
* 必要に応じて、クラスタを新しいバージョンにアップグレードしてください。

### 変更内容｜No Channelのバージョン更新

#### 説明

Noチャネルで利用可能なバージョンが更新され、いくつかのバージョンが利用できなくなりました。

#### 製品への影響有無

有

#### 対処方法

* Noチャネルを使用している場合は、利用可能なバージョンと利用できなくなったバージョンを確認してください。
* 必要に応じて、クラスタを新しいバージョンにアップグレードしてください。


**注記** 

上記のリリースノートはGKEに関するもののみです。 Google Cloud Composer 2に関する情報は含まれていません。 

# Title: December 11, 2024 
Link: https://cloud.google.com/release-notes#December_11_2024<br>
## Cloud Composer

### Announcement

**原文:**

In January 2025, we plan to release Cloud Composer 2 versions that will always use the environment's service account for performing PyPI packages installations:

- New Cloud Composer 2 environments created in versions 2.10.2 and later will have this change.
- Currently, Cloud Composer 2 environments use the default Cloud Build service account if it exists (and the environment's service account if it doesn't). Depending on the way Cloud Build is configured in your project, this might mean that the default Cloud Compute service account or the legacy Cloud Build service account might be used by your environment. We recommend to configure Cloud Build to adhere to the principle of least privilege.
- Make sure to check the Cloud Build default service account change page for information about changes to the default Cloud Build service account.
- Cloud Composer 3 environments already use the environment's service account, and are not impacted by this change.

**説明:**

2025年1月より、Cloud Composer 2バージョン2.10.2以降で作成される環境では、PyPIパッケージのインストールに、常に環境のサービスアカウントが使用されるようになります。

現在、Cloud Composer 2環境では、デフォルトのCloud Buildサービスアカウントが存在する場合はそれが、存在しない場合は環境のサービスアカウントが使用されます。これは、Cloud Buildがプロジェクトでどのように構成されているかによっては、デフォルトのCloud ComputeサービスアカウントまたはレガシーCloud Buildサービスアカウントが環境で使用される可能性があるを意味します。Cloud Buildを最小権限の原則に従って構成することをお勧めします。

Cloud Buildのデフォルトサービスアカウントの変更については、Cloud Buildのデフォルトサービスアカウントの変更ページをご確認ください。

Cloud Composer 3環境では、既に環境のサービスアカウントが使用されているため、この変更の影響はありません。

**影響有無:** 将来的に影響あり

**対処方法:** 

- Cloud Composer 2 をバージョン 2.10.2 以降にアップグレードする予定がある場合は、PyPI パッケージのインストールに環境のサービスアカウントが使用されるように準備してください。
- Cloud Build の構成を確認し、最小権限の原則に従って構成されていることを確認してください。


### Fixed

**原文:**

*(Cloud Composer 3)* It is now possible to upgrade an environment if the `[sentry]sentry_on` Airflow configuration option is set to `true`.

**説明:**

(Cloud Composer 3) Airflow設定オプションの`[sentry]sentry_on`が`true`に設定されている場合でも、環境をアップグレードできるようになりました。

**影響有無:** 無

**対処方法:**  なし


### Fixed

**原文:**

Cloud Composer no longer adds any missing IAM permissions to the Cloud Storage bucket when it is used to create an environment with a custom environment's bucket. Make sure that the environment's service account has permissions from the Composer Worker role on the bucket.

**説明:** 

カスタム環境のバケットを使用して環境を作成する場合、Cloud Composerは、Cloud Storageバケットに必要なIAM権限が不足していても追加しなくなりました。環境のサービスアカウントが、バケットに対するComposer Workerロールの権限を持っていることを確認してください。

**影響有無:** 有

**対処方法:** 

カスタム環境のバケットを使用している場合は、環境のサービスアカウントにComposer Workerロールのバケットに対する権限が付与されていることを確認してください。

### Changed

**原文:**

The `COMPOSER_AGENT_BUILD_SERVICE_ACCOUNT` environment variable is changed to reserved. This change improves the security of Cloud Composer environments.

**説明:**

環境変数`COMPOSER_AGENT_BUILD_SERVICE_ACCOUNT`が予約済みになり、Cloud Composer環境のセキュリティが向上しました。

**影響有無:** 有

**対処方法:**

`COMPOSER_AGENT_BUILD_SERVICE_ACCOUNT` 環境変数を使用している場合は、使用を中止してください。

### Changed

**原文:**

Increased allowed timeouts when detecting tasks stuck in the "queued" state during the Airflow worker liveness check. This change makes it less likely that checks will incorrectly fail in specific scenarios. This change is gradually rolled out to all regions supported by Cloud Composer.

**説明:**

Airflowワーカーのlivenessチェック中に「queued」状態になっているタスクを検出する際のタイムアウト許容時間が増加しました。この変更により、特定のシナリオでチェックが誤って失敗する可能性が低くなります。この変更は、Cloud Composerでサポートされているすべてのリージョンに徐々に展開されます。

**影響有無:** 無

**対処方法:**  なし

### Changed

**原文:**

*(Cloud Composer 2)* Airflow worker liveness check configuration was changed to be consistent with the configuration used in Cloud Composer 3. In particular, this change increases the timeout, giving the liveness check more time to detect unhealthy Airflow workers. This change is gradually rolled out to all regions supported by Cloud Composer.

**説明:**

(Cloud Composer 2) Airflowワーカーのlivenessチェック構成が、Cloud Composer 3で使用されている構成と一致するように変更されました。具体的には、この変更によりタイムアウトが長くなり、livenessチェックが異常なAirflowワーカーを検出するための時間が長くなります。この変更は、Cloud Composerでサポートされているすべてのリージョンに徐々に展開されます。

**影響有無:** 無

**対処方法:**  なし


### Changed

**原文:**

New Airflow builds are available in Cloud Composer 3:

- composer-3-airflow-2.10.2-build.4 (default)
- composer-3-airflow-2.9.3-build.11

**説明:**

Cloud Composer 3で新しいAirflowビルドが利用可能になりました。

- composer-3-airflow-2.10.2-build.4 (デフォルト)
- composer-3-airflow-2.9.3-build.11

**影響有無:** 無

**対処方法:**  なし


### Changed

**原文:** 

New images are available in Cloud Composer 2:

- composer-2.10.1-airflow-2.10.2 (default)
- composer-2.10.1-airflow-2.9.3

**説明:**

Cloud Composer 2で新しいイメージが利用可能になりました。

- composer-2.10.1-airflow-2.10.2 (デフォルト)
- composer-2.10.1-airflow-2.9.3

**影響有無:** 無

**対処方法:**  なし


### Deprecated

**原文:**

Cloud Composer version 2.5.3 has reached its end of support period.

**説明:**

Cloud Composerバージョン2.5.3はサポート終了に達しました。

**影響有無:** 有

**対処方法:** 

Cloud Composer バージョン 2.5.3 を使用している場合は、サポートされているバージョンにアップグレードしてください。


## Compute Engine

### Changed

**原文:**

C3 bare metal instances are available in the following additional zones:

- **c3-highcpu-192-metal**: asia-southeast1-a and c, europe-west4-c, us-east1-d, us-east4-c, us-east5-a, us-west1-a and b
- **c3-standard-192-metal**: europe-west1-b and c, europe-west4-b and c, us-east1-d, us-east4-a, us-west1-a and b
- **c3-highmem-192-metal**: europe-west4-c, us-east4-a and c, us-west1-a and b

**説明:**

C3 bare metalインスタンスが、以下の追加ゾーンで利用可能になりました。

- **c3-highcpu-192-metal**: asia-southeast1-a, asia-southeast1-c, europe-west4-c, us-east1-d, us-east4-c, us-east5-a, us-west1-a, us-west1-b
- **c3-standard-192-metal**: europe-west1-b, europe-west1-c, europe-west4-b, europe-west4-c, us-east1-d, us-east4-a, us-west1-a, us-west1-b
- **c3-highmem-192-metal**: europe-west4-c, us-east4-a, us-east4-c, us-west1-a, us-west1-b

**影響有無:** 無

**対処方法:**  なし

# Title: December 10, 2024 
Link: https://cloud.google.com/release-notes#December_10_2024<br>
## Apigee X
### Announcement
**原文:** On December 10, 2024, we released an updated version of Apigee (1-14-0-apigee-2).

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** Apigeeのアップデートバージョン(1-14-0-apigee-2)がリリースされました。本番環境へのロールアウトは2営業日以内に開始され、Google Cloudのすべてのゾーンで完了するまで4営業日以上かかる場合があります。

**影響有無:** 無
**対処方法:** 特に対応は不要です。本番環境への反映は数日かかる可能性があります。

### Fixed

**原文:**
| Bug ID | Description |
| --- | --- |
| **357880539** | **Resolved issue with missing span in the Apigee UI for distributed trace.** |
| **237656263** | **Resolved issue with ServiceCallout policy not working in async mode as expected.** |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:** 以下のバグが修正されました。
- 分散トレーシングにおいて、Apigee UIでスパンが表示されない問題が修正されました。
- ServiceCalloutポリシーが非同期モードで期待通りに動作しない問題が修正されました。
- セキュリティインフラストラクチャとライブラリが更新されました。

**影響有無:** 有 (過去のバージョンで発生していた問題は修正済み)
**対処方法:** 特に対応は不要です。

---------------------------------------------

## Cloud SQL for PostgreSQL
### Changed
**原文:** Cloud SQL now offers notifications for maintenance that's either begun or completed. See the Overview of maintenance on Cloud SQL instances. To find out how to sign up for notifications and check your instances for upcoming maintenance, see Find and set maintenance windows.

[Overview of maintenance on Cloud SQL](https://cloud.google.com/sql/docs/postgres/maintenance)
[Find and set maintenance windows](https://cloud.google.com/sql/docs/postgres/set-maintenance-window)

**説明:** Cloud SQLで、開始または完了したメンテナンスに関する通知が提供されるようになりました。通知のサインアップ方法と、今後のメンテナンスについてインスタンスを確認する方法については、記載されたURLを参照してください。

**影響有無:** 無
**対処方法:** 特に対応は不要です。

---------------------------------------------

## Google Kubernetes Engine
### Changed
**原文:** GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

 The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

**説明:** GKEクラスタバージョンが更新されました。新しいクラスタ、および既存クラスタのオプトインコントロールプレーンアップグレードとノードアップグレードで、以下のKubernetesバージョンが利用可能になりました。バージョン管理とアップグレードの詳細については、記載されたURLを参照してください。

**影響有無:** 無
**対処方法:** 特に対応は不要です。

### Rapid channel
**原文:**  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

以下、原文に記載されている各バージョン等の情報は省略します。

**説明:** Rapidチャネルにおいて、利用可能なKubernetesバージョン、デフォルトバージョン、自動アップグレードターゲットなどが更新されました。

**影響有無:** 有 (Rapidチャネルの自動アップグレード設定をしている場合)
**対処方法:** 自動アップグレードが有効になっているクラスタは、記載されたバージョンに自動的にアップグレードされます。アップグレードの内容を確認し、必要があればメンテナンスウィンドウを設定してください。

### Regular channel, Stable channel, Extended channel, No channel

**原文:** 上記と同様のため省略

**説明:** 上記と同様、各チャネル及びチャネル設定がない場合において、利用可能なKubernetesバージョン、デフォルトバージョン、自動アップグレードターゲットなどが更新されました。

**影響有無:** 有 (各チャネルの自動アップグレード設定をしている場合)
**対処方法:** 自動アップグレードが有効になっているクラスタは、記載されたバージョンに自動的にアップグレードされます。アップグレードの内容を確認し、必要があればメンテナンスウィンドウを設定してください。

 
**注記:** 

- リリースノートは膨大な情報を含む場合があり、ここでは一部のみを抜粋して説明しています。詳細については、原文全体および参照されているドキュメントをご確認ください。
- リリースノートは定期的に更新されます。最新の情報については、公式のGoogle Cloudリリースノートを参照してください。 

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
