## Kubernetes v1.32.2 リリースノート解説

# V1.32.3

**全体的な概要:**

このリリースは、主にバグ修正と安定性向上に重点を置いています。特に、v1.32 で発生したいくつかの問題が修正されています。

**変更点の種類別解説:**

*   **API Change (APIの変更):**
    *   **DRA (Dynamic Resource Allocation):** 動的リソース割り当てに関連して、CEL式（設定の評価に使う数式のようなもの）の処理コストの見積もりが不正確だった問題を修正しました。これによって、不要なコスト計算がschedulerで行われるのを防ぎます。

*   **Bug or Regression (バグ修正または退行):**

    *   **OrderedNamespaceDeletion:** `OrderedNamespaceDeletion`という新しい機能を追加しました。（機能フラグを有効にする必要があります）この機能が有効になっていると、Namespaceを削除する際に、他のリソースよりも先にPodのリソースを削除するようになります。これは、ワークロードのセキュリティを確保するために重要です。
    *   **register-gen:** コード生成ツールで、必要なパッケージのimport文が不足していた問題を修正しました。
    *   **exec/attach/portforward:** Websocketクライアントを使用した場合に、exec、attach、portforwardのリクエストで接続が不安定になるというv1.30からの問題を修正しました。
    *   **postStart hooks:** `postStart`フック（Pod起動後に実行される処理）を指定したPodが起動しないというv1.32からの問題を修正しました。
    *   **kubelet:** kubeletの再起動後に、ノードがステータスを報告できず、証明書の更新に失敗する可能性があるというv1.32からの問題を修正しました。
    *   **kube-apiserver:** OIDC認証と匿名認証の設定が競合する場合の検証に関する問題や、`/flagz`エンドポイントのレスポンスに関する問題を修正しました。
    *   **kube-proxy:** UDPサービスでExternal IPまたはLoadBalancer IPを使用している場合に、kube-proxyが大量のCPUを消費していた問題を修正しました。
    *   **kube-proxy:** 大量のUDPワークフローが存在する環境で、kube-proxyでメモリリークが発生する可能性があったv1.32からの問題を修正しました。
    *   **Kubeadm:** 設定ファイルにUpgradeConfigurationがない場合にpanicが発生する問題を修正しました。
    *   **ConsistentListFromCache:** Kubernetes 1.31以降で発生した、複数のnamespaceを跨いだAPIリクエストでレイテンシが増加する問題を修正しました。
    *   **RoleにWatch権限を追加:** 以下のRoleに`Watch`権限を追加しました。これらのRoleは、Kubernetesの内部コンポーネントによって使用されます。
        *   `system:controller:cronjob-controller`
        *   `system:controller:endpoint-controller`
        *   `system:controller:endpointslice-controller`
        *   `system:controller:endpointslicemirroring-controller`
        *   `system:controller:horizontal-pod-autoscaler`
        *   `system:controller:node-controller`
        *   `system:controller:pod-garbage-collector`
        *   `system:controller:storage-version-migrator-controller`

*   **Dependencies (依存関係):**
    *   `github.com/vishvananda/netlink`というライブラリのバージョンが更新されました。

**特に注目すべき点:**

*   v1.32で発生したバグの修正がいくつか含まれています。v1.32にアップデートした場合は、これらの修正が適用されていることを確認してください。
*   `OrderedNamespaceDeletion`機能は、Namespaceの削除時のセキュリティを向上させる可能性があります。必要に応じて、この機能を有効にすることを検討してください。

**初心者向けの補足:**

*   "Regression"（退行）とは、新しいバージョンで以前のバージョンよりも悪い動作が発生することを意味します。このリリースでは、いくつかのRegressionが修正されています。
*   "Feature Gate" (機能フラグ)とは、新しい機能を有効または無効にするための設定です。`OrderedNamespaceDeletion`を有効にするには、Kubernetesの設定を変更する必要があります。
*   "Role"とは、Kubernetesのリソースに対するアクセス権限を定義するものです。このリリースでは、いくつかのRoleに`Watch`権限が追加されています。`Watch`権限は、リソースの変更を監視するために使用されます。

**まとめ:**

このリリースは、Kubernetesの安定性と信頼性を向上させるための重要な修正を含んでいます。v1.32を使用している場合は、できるだけ早くこのバージョンにアップデートすることをお勧めします。

# V1.32.2
今回のリリース（v1.32.2）は、主にセキュリティ脆弱性の修正とバグフィックスが中心です。特に重要なのは、NodeのDoS攻撃につながるセキュリティ問題への対応です。

### 重要：セキュリティ関連情報

* **CVE-2025-0426：Kubelet Checkpoint API を利用した Node の Denial of Service 攻撃の脆弱性**
    * **内容:** 認証されていない kubelet の読み取り専用 HTTP エンドポイントに対して大量のコンテナチェックポイントリクエストを送信することで、Node のディスク容量を圧迫し、サービスを停止させる（Denial of Service: DoS）攻撃が可能になる脆弱性が見つかりました。
    * **影響を受けるバージョン:**
        * kubelet v1.30.0 から v1.30.9
        * kubelet v1.31.0 から v1.31.5
        * kubelet v1.32.0 から v1.32.1
    * **修正されたバージョン:**
        * kubelet 1.29.14
        * kubelet 1.30.10
        * kubelet 1.31.6
        * kubelet 1.32.2
    * **推奨:** 上記の影響を受けるバージョンの kubelet を使用している場合は、速やかに修正されたバージョンにアップデートしてください。
    * **CVSS 評価:** Medium (6.2)

**要約:**  KubernetesのNodeが、認証なしでアクセスできるKubeletのAPIを通じて、大量のリクエストによってディスクを圧迫され、動かなくなる可能性がある問題が修正されました。影響を受けるバージョンを使っている場合は、すぐにアップデートが必要です。

### 変更点

* **Feature**
    * Kubernetesのビルドに使われるGo言語のバージョンが、1.23.5から1.23.6に更新されました。これは、パフォーマンスやセキュリティの改善に貢献します。
* **Bug or Regression (バグ修正と機能の後退修正)**
    * **Portworxボリュームの移行に関する修正:** Portworxのセキュリティ機能が有効なクラスタで、CSI移行が正しく動作しない問題を修正しました。
    * **ServiceAccountNodeAudienceRestriction機能の後退修正:** AzureFileボリュームを使用している場合に発生するエラーを修正するために、この機能を一旦無効化しました。もしこの機能を有効にしている場合は、v1.32では使用しないようにしてください。
    * **Kubeadmの修正:**
        * CRI（コンテナランタイムインターフェース）からのサンドボックスイメージにエラーが発生した場合に、イメージがプルされない問題を修正しました。
        * EtcdへのAPI呼び出しタイムアウト設定が無視されていた問題を修正しました。
* **その他**
    * 内部的な修正が行われました。
* **依存関係**
    * 依存関係の追加、変更、削除はありません。

**要約:** バグ修正として、Portworxボリュームの移行、ServiceAccountNodeAudienceRestriction機能、Kubeadm関連の問題が修正されました。

### 補足

* **Kubelet:** Kubernetes の各 Node 上で動作するエージェントで、コンテナの起動や停止、状態監視などを行います。
* **CSI (Container Storage Interface):** Kubernetes がストレージプロバイダーと連携するための標準インターフェースです。
* **Portworx:** Kubernetes 環境向けのエンタープライズグレードのストレージソリューションです。
* **Kubeadm:** Kubernetes クラスタを簡単に構築・管理するためのツールです。
* **Etcd:** Kubernetes クラスタの設定情報などを保存する分散 Key-Value ストアです。

### まとめ

今回のリリースは、セキュリティ問題の修正が最優先事項です。影響を受けるバージョンを使用している場合は、早急なアップデートを推奨します。また、バグ修正も含まれているため、安定性向上のためにアップデートを検討してください。

# v1.32.1
主にセキュリティに関する重要な情報と、いくつかのバグ修正、そして機能改善が含まれています。

**最も重要なセキュリティ情報：CVE-2024-9042について**

今回のリリースで最も重要なのは、CVE-2024-9042というセキュリティ脆弱性への対応です。これは、KubernetesのWindowsノードに存在する脆弱性で、以下の状況で悪用される可能性があります。

*   **影響を受けるバージョン:**
    *   kubelet <= v1.29.12
    *   kubelet <= v1.30.8
    *   kubelet <= v1.31.4
    *   kubelet = v1.32.0
*   **何が問題か？:**
    *   この脆弱性を悪用すると、ノードの`/logs`エンドポイントにアクセスできるユーザーが、そのノード上で任意のコマンドを実行できるようになります。つまり、攻撃者がKubernetesのシステムを乗っ取ることができる可能性があります。
*   **どうすればいい？:**
    *   影響を受けるバージョンを使用している場合は、すぐに修正されたバージョン（下記）にアップグレードしてください。
        *   kubelet 1.29.13
        *   kubelet 1.30.9
        *   kubelet 1.31.5
        *   kubelet 1.32.1
*   **誰が発見した？:**
    *   この脆弱性はPeled, Tomer氏によって報告され、Aravindh Puthiyaprambil氏によって修正されました。
*   **深刻度は？:**
    *   CVSSスコアはMedium（5.9）と評価されています。これは、攻撃が成功する可能性は低いものの、影響が大きいことを示しています。

**まとめると、このセキュリティ脆弱性は、Windowsノードを使用しているKubernetes環境において、非常に重要な問題です。早急に最新バージョンにアップグレードしてください。**

**その他の変更点**

セキュリティ問題の修正以外にも、いくつかの変更点があります。

*   **APIの変更:**
    *   Dynamic Resource Allocation (DRA) API：同じリソースを共有できるPodの最大数が32から256に増加しました。ただし、この変更を適用した状態でKubernetesをv1.32.0にダウングレードすると、エラーが発生しますので注意してください。
*   **機能追加:**
    *   KubernetesがGo 1.23.4でビルドされるようになりました。これは、Kubernetesのパフォーマンスや安定性を向上させる可能性があります。
*   **バグ修正:**
    *   multipathストレージに関するバグが修正されました。これにより、iSCSIやFibre Channelデバイスが正しく認識されるようになります。
    *   StatefulSetオブジェクトの処理に関するバグが修正され、`revisionHistoryLimit`に負の値が設定されている場合に発生していたパニックが解消されました。
    *   kubeadmのアップグレードに関するバグが修正され、`node.skipPhases`の設定が正しく適用されるようになります。
    *   kubeadmでアドオンが無効化されている場合、アップグレード時にそれらのアドオンがスキップされるようになりました。

**依存関係の変更**

依存関係の追加、変更、削除はありません。

# V1.31
# V1.31.7

**全体の概要**

このリリースは、バグ修正と安定性向上に重点を置いています。 新機能の追加というよりは、既存の機能の改善と問題点の解消が主な目的です。

**変更点（種類別）**

*   **バグまたはリグレッション**

    *   **名前空間削除の順番制御機能（OrderedNamespaceDeletion）**
        *   新しい機能として、`OrderedNamespaceDeletion`というFeature Gateが追加されました。
        *   これを有効にすると、名前空間を削除する際に、Pod（コンテナを動かすための最小単位）が他のリソースよりも先に削除されます。
        *   これにより、ワークロードのセキュリティが向上します。 例えば、Podが削除される前に他のリソースが削除されてしまい、Podが孤立して悪用される、といったリスクを減らすことができます。
    *   **WebSocketクライアントの接続安定性の問題修正**
        *   v1.30以降で発生していた、WebSocketクライアントを使った`exec`（コンテナ内でのコマンド実行）、`attach`（コンテナへの接続）、`portforward`（ポート転送）のリクエストにおける接続安定性の問題を修正しました。
        *   WebSocketは、リアルタイムな双方向通信に使われる技術で、kubectlなどのツールがコンテナとやり取りする際に利用しています。
    *   **kubeadmの設定ファイルに関するパニック修正**
        *   kubeadm（Kubernetesクラスタの構築・管理ツール）において、設定ファイル内に`UpgradeConfiguration`が見つからない場合にパニックが発生する問題を修正しました。
    *   **/metrics/slisエンドポイントの常時利用可能化**
        *   kubelet（各ノードで動作するエージェント）が提供する`/metrics/slis`エンドポイントが常に利用可能になるように修正しました。
        *   このエンドポイントは、Kubernetesのサービスレベル指標（SLI）を収集するために使われます。
    *   **キャッシュからのリスト取得に関するパフォーマンス低下の修正**
        *   v1.31以降のデフォルト設定で発生していた、`ConsistentListFromCache`機能に関連するパフォーマンス低下を修正しました。
        *   複数の名前空間にわたって、APIリクエスト（作成や更新）が頻繁に発生する場合に、レイテンシ（応答時間）が増加する問題が解消されました。

*   **その他（クリーンアップまたは不安定なテストの修正）**

    *   **Goのバージョンアップ**
        *   Kubernetes 1.31は、Go 1.23でビルドされるようになりました。
        *   GoはKubernetesの開発に使われているプログラミング言語で、バージョンアップによりパフォーマンスやセキュリティが向上します。

*   **依存関係**

    *   変更はありません。

**まとめ**

このリリースは、Kubernetesクラスタの安定性とパフォーマンスを向上させるための修正が含まれています。 特に、WebSocketクライアントの接続安定性や、APIリクエストのパフォーマンスに関する修正は、多くのユーザーにとってメリットがあるでしょう。 `OrderedNamespaceDeletion`機能は、セキュリティを重視する環境で役立ちます。

# V1.31.6
はい、承知いたしました。リリースノートの内容をわかりやすく解説します。

**重要なセキュリティ情報**

このリリースには、Kubernetesのセキュリティに関する重要な修正が含まれています。

*   **CVE-2025-0426: Kubelet Checkpoint API を利用したノードのサービス拒否（DoS）攻撃**

    *   **概要:** Kubernetesのある脆弱性が発見されました。認証されていないKubeletの読み取り専用HTTPエンドポイントに対して、大量のコンテナチェックポイント要求を送信することで、ノードのディスク容量を圧迫し、サービス拒否（DoS）攻撃を引き起こす可能性があります。
    *   **影響を受けるバージョン:**
        *   kubelet v1.30.0 から v1.30.9
        *   kubelet v1.31.0 から v1.31.5
        *   kubelet v1.32.0 から v1.32.1
    *   **修正されたバージョン:**
        *   kubelet 1.29.14
        *   kubelet 1.30.10
        *   kubelet 1.31.6
        *   kubelet 1.32.2
    *   **深刻度:** 中 (Medium)
    *   **対策:** 上記の修正バージョンにkubeletをアップデートしてください。
    *   **わかりやすい説明:**
        *   Kubeletという、各ノードで動くKubernetesの重要なコンポーネントに脆弱性が見つかりました。
        *   この脆弱性を悪用すると、誰でもKubeletに対して大量のリクエストを送りつけることで、ノードのディスクがいっぱいになり、ノードが正常に動作しなくなる可能性があります（サービス拒否攻撃）。
        *   この問題を解決するために、Kubeletを上記の修正バージョンにアップデートする必要があります。

**変更点**

*   **機能改善**
    *   Kubernetesのビルドに使用するGo言語のバージョンが更新されました。
        *   Go 1.22.11 → Go 1.22.12
*   **バグ修正**
    *   CRD（CustomResourceDefinition）にバージョン情報がない場合に、kube-apiserverのOpenAPIコントローラーでnilポインタエラーが発生する問題を修正しました。
    *   PortworxボリュームのCSI移行に関する問題を修正しました（Portworxのセキュリティ機能が有効な場合）。
    *   Kubeadm: CRIからのサンドボックスイメージにエラーがある場合にイメージがpullされないバグを修正しました。
    *   Kubeadm: etcdクライアント操作でv1beta4 Timeouts.EtcdAPICallフィールドが考慮されず、デフォルトのタイムアウト2分が常に使用されていたバグを修正しました。
*   **その他**
    *   特になし
*   **依存関係**
    *   変更なし

**まとめ**

このリリースは、主にセキュリティに関する重要な修正が含まれています。特に、CVE-2025-0426の脆弱性は、サービス拒否攻撃につながる可能性があるため、影響を受けるバージョンのkubeletを使用している場合は、速やかに修正バージョンにアップデートすることを強く推奨します。

また、いくつかのバグ修正も含まれており、安定性の向上に貢献します。

**初心者向け補足**

*   **kubelet:** Kubernetesの各ノードで動作し、コンテナの起動や管理を行う重要なコンポーネントです。
*   **ノード:** Kubernetesクラスタを構成する物理または仮想マシンです。
*   **サービス拒否（DoS）攻撃:** 大量のトラフィックやリクエストを送りつけることで、サーバーやネットワークを過負荷状態にし、正常なサービスを妨害する攻撃です。
*   **CRD（CustomResourceDefinition）:** Kubernetes APIを拡張し、独自のカスタムリソースを定義するための仕組みです。
*   **Portworx:** Kubernetes向けのストレージソリューションです。
*   **CSI（Container Storage Interface）:** コンテナオーケストレーションシステム（Kubernetesなど）が、様々なストレージプロバイダーを利用するための標準的なインターフェースです。
*   **Kubeadm:** Kubernetesクラスタを簡単に構築・管理するためのツールです。
*   **etcd:** Kubernetesクラスタの設定情報や状態を保存する分散キーバリューストアです。

この説明で、リリースノートの内容がより理解しやすくなったでしょうか？もし、まだ不明な点があれば、遠慮なく質問してください。

# v1.31.5
Kubernetesの重要なセキュリティ問題を修正したものです。特に、Windowsノードを使用している場合に注意が必要です。また、いくつかのバグ修正やGoのバージョンアップも含まれています。

**重要なセキュリティ情報 (CVE-2024-9042):**

* **問題点:** KubernetesのWindowsノードにおいて、特定のAPI（`nodes/*/logs/query`）を介して、悪意のあるユーザーがホスト上で任意のコマンドを実行できる脆弱性が見つかりました。
* **影響:** この脆弱性を悪用されると、攻撃者がコンテナを抜け出して、ノード（サーバー）自体を乗っ取ることが可能になる可能性があります。
* **影響を受けるバージョン:**
    * kubelet <= v1.29.12
    * kubelet <= v1.30.8
    * kubelet <= v1.31.4
    * kubelet = v1.32.0
* **修正されたバージョン:**
    * kubelet 1.29.13
    * kubelet 1.30.9
    * kubelet 1.31.5
    * kubelet 1.32.1
* **対策:** 上記の修正されたバージョンにkubeletをアップグレードする必要があります。特に、Windowsノードを使っている場合は、早急な対応が必要です。
* **重要度:** Medium（CVSS: 5.9）と評価されていますが、悪用されるとシステム全体に影響が出る可能性があるため、軽視できません。

**変更点 (Changes by Kind):**

* **APIの変更:**
    * 特筆すべきAPIの変更はありません。
* **機能 (Feature):**
    * Kubernetesが使用するGoのバージョンが1.22.10にアップグレードされました。
        * Goのバージョンアップは、セキュリティやパフォーマンス向上に寄与します。
* **バグ修正 (Bug or Regression):**
    * **ストレージ:**
        * multipathで接続されたiSCSIやFibre Channelデバイスで、パーティションが正しく認識されないバグを修正しました。
        * これにより、ストレージデバイスが正常に利用できるようになります。
    * **kube-controller-manager:**
        * StatefulSetオブジェクトの`revisionHistoryLimit`が負の数の場合、panicが発生するバグを修正しました。
    * **kubeadm:**
        * `kubeadm upgrade node`コマンドで、`UpgradeConfiguration`の`node.skipPhases`が無視されるバグを修正しました。
        * アップグレード時に特定のフェーズをスキップできるようになります。
    * **kubelet:**
        * ボリュームが切り離されたと判定されるタイミングで、実際のマウント状態をチェックしないバグを修正しました。
        * これにより、Podが削除時にTerminating状態から抜け出せなくなる問題を解決しました。
* **依存関係 (Dependencies):**
    * 変更なし


# v1.30.10
はい、承知いたしました。このリリースノートの内容を、Kubernetes 初心者の方にも分かりやすく解説します。

**重要なお知らせ：セキュリティ脆弱性 CVE-2025-0426**

このリリースには、Kubernetesのノードがサービス停止（DoS）攻撃を受ける可能性のあるセキュリティ上の問題に対処するための修正が含まれています。

**何が問題なのか？**

*   **攻撃経路:** 認証されていない（誰でもアクセスできる）kubelet の読み取り専用HTTPエンドポイントに、コンテナのチェックポイントを要求する大量のリクエストを送信することで、攻撃が可能です。
*   **影響:** 大量の要求により、ノードのディスクがいっぱいになり、ノードが正常に動作しなくなる可能性があります。（サービス停止攻撃）
*   **影響を受けるバージョン:**
    *   kubelet v1.30.0 から v1.30.9
    *   kubelet v1.31.0 から v1.31.5
    *   kubelet v1.32.0 から v1.32.1
*   **修正されたバージョン:**
    *   kubelet 1.29.14
    *   kubelet 1.30.10
    *   kubelet 1.31.6
    *   kubelet 1.32.2

**どうすれば良いか？**

もしあなたが上記の「影響を受けるバージョン」のkubeletを使用している場合は、できるだけ早く「修正されたバージョン」にアップデートしてください。

**セキュリティ評価**

この脆弱性の深刻度はMediumと評価されています。

*   CVSSスコア: 6.2
*   CVSS:3.1/AV:L/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H

    *   AV:L (攻撃元がローカルである)
    *   AC:L (攻撃が容易である)
    *   PR:N (権限が不要である)
    *   UI:N (ユーザー操作が不要である)
    *   S:U (スコープが変更されない)
    *   C:N (機密性に影響がない)
    *   I:N (完全性に影響がない)
    *   A:H (可用性に重大な影響がある)

**その他の変更点**

*   **機能改善:**
    *   cAdvisor が v0.49.2 に更新されました。cAdvisorは、コンテナのリソース使用状況を監視するためのツールです。
    *   Kubernetes のビルドに使用される Go のバージョンが 1.22.11 および 1.22.12 に更新されました。Go は Kubernetes の開発に使われているプログラミング言語です。
*   **バグ修正:**
    *   kubeadm（Kubernetes クラスタを構築するためのツール）において、etcd クライアントのタイムアウト設定が正しく適用されないバグが修正されました。
*   **その他:**
    *   内部的な整理や改善が行われました。
*   **依存関係の更新:**
    *   github.com/google/cadvisor: v0.49.0 → v0.49.2

**まとめ**

このリリースは、セキュリティ上の重要な修正を含んでいます。特に、kubelet のバージョンを確認し、必要に応じてアップデートすることを強く推奨します。

**初心者向け補足**

*   **kubelet:** Kubernetes の各ノード上で動作し、コンテナの実行や管理を行うコンポーネントです。
*   **CVE:** 脆弱性の識別番号です。
*   **DoS攻撃:** サービスを意図的に停止させる攻撃です。
*   **kubeadm:** Kubernetes クラスタを簡単に構築するためのツールです。
*   **etcd:** Kubernetes の設定情報などを保存するデータベースです。

この解説が、Kubernetes の理解に役立つことを願っています。もし他に質問があれば、遠慮なく聞いてください。


# v1.30.9
セキュリティに関する脆弱性の修正が含まれている点です。

**セキュリティに関する重要な情報**

*   **脆弱性 (CVE-2024-9042):** Windowsノードにおけるコマンドインジェクションの脆弱性が発見されました。
    *   **どういうこと？:** KubernetesのAPIを使って、特定の条件を満たすユーザーがWindowsノードのログを閲覧する際、悪意のあるコードを実行できてしまう可能性がありました。
    *   **影響範囲:** `kubelet` (Kubernetesのエージェント) の特定のバージョン (v1.29.12, v1.30.8, v1.31.4, v1.32.0) が影響を受けます。
    *   **対策:** `kubelet` を修正済みのバージョン (v1.29.13, v1.30.9, v1.31.5, v1.32.1) にアップデートする必要があります。
    *   **誰が報告した？:** Peled, Tomer氏が発見し、Aravindh Puthiyaprambil氏が修正しました。
    *   **重要度:** 中 (Medium) と評価されていますが、悪用されると機密情報が漏洩したり、システムが操作される可能性があります。

**その他の変更点**

*   **APIの変更:** 特筆すべきAPIの変更はありません。
*   **機能:**
    *   Kubernetesのビルドに使われるGoのバージョンが `1.22.10` にアップデートされました。
        *   **なぜ重要？:** Goのアップデートは、パフォーマンス向上やセキュリティ修正、新機能の追加につながることがあります。
*   **バグ修正:**
    *   Windowsノードで、`SecurityContext` を指定したPodの起動に失敗するバグが修正されました。
    *   マルチパス構成のストレージデバイスが正しく認識されないバグが修正されました。
    *   `StatefulSet` オブジェクトの `revisionHistoryLimit` が負の数の場合に、`kube-controller-manager` がパニックを起こすバグが修正されました。
    *   `kubelet` が、ボリュームの状態を正しく把握しないことで、Podが `Terminating` 状態から抜け出せなくなるバグが修正されました。
*   **依存関係:** 依存関係の追加、変更、削除はありません。

# v1.32.0
**重要なアップグレードに関する注意点**

* v1.32には、緊急のアップグレードに関する注意点はありません。これは、アップグレードがスムーズに行える可能性が高いことを意味します。

**変更点（種類別）**

**1. 非推奨（Deprecation）**

* **`DisableNodeKubeProxyVersion` Feature Gate のデフォルトオフへの変更:**  v1.29で非推奨とされた`DisableNodeKubeProxyVersion` という機能が、デフォルトでオフに戻されました。これは、非推奨の発表から1年間の猶予期間を設けるというKubernetesのポリシーに沿ったものです。具体的には、この機能が有効になっている場合、Nodeオブジェクトの`kubeProxyVersion`フィールドが自動的にクリアされる動作が、デフォルトでオフになります。
* **ServiceAccount の `kubernetes.io/enforce-mountable-secrets` アノテーションの非推奨:** `ServiceAccount`のメタデータにある`kubernetes.io/enforce-mountable-secrets`アノテーションが非推奨になりました。ただし、削除の期限は設定されていません。マウントされたシークレットへのアクセスを分離するには、別々の名前空間を使用することが推奨されます。

**2. APIの変更（API Change）**

* **カスタムスケジューラプラグイン開発者向け:** `preemption`インターフェースの`PodEligibleToPreemptOthers`に、コンテキスト情報(`ctx`)が追加されました。カスタムスケジューラプラグインを開発している場合は、この変更に合わせてプラグインを更新する必要があります。
* **`NodeToStatusMap`の変更:** `NodeToStatusMap`がマップから構造体に変更され、エントリへのアクセス方法が公開されました。また、マップに存在しないノードの状態を示す`absentNodesStatus`が追加されました。アウトオブツリーのPostFilterプラグイン開発者は、`NodeToStatusMap`の使用箇所を更新する必要があります。また、将来的には`NodeToStatusMap`の名前が`NodeToStatusReader`に変更される予定です。
* **Podリソースサイズ変更用の `/resize` サブリソースの追加:** Podのリソースサイズ変更をリクエストするための新しい`/resize`サブリソースが追加されました。Podのリソース変更操作には、新しいサブリソースを利用するようにKubernetesクライアントコードを更新する必要があります。
* **破損したリソースの安全でない削除機能の追加:** 破損したリソースを安全に削除する機能が追加されました。これはデフォルトで無効になっており、`--feature-gates=AllowUnsafeMalformedObjectDeletion=true`オプションを設定することで有効化できます。また、新しい削除オプション`ignoreStoreReadErrorWithClusterBreakingPotential`が導入されました。このオプションはデフォルトでは設定されておらず、下位互換性を維持します。破損したリソースの安全でない削除を実行するには、削除リクエストでオプションを有効にする必要があります。
* **Kubelet設定に `singleProcessOOMKill` フラグを追加:** Kubelet設定に `singleProcessOOMKill` フラグが追加されました。これを`true`に設定すると、cgroups v2で単一プロセスOOMキルが有効になります。このモードでは、コンテナ内で単一のプロセスがOOMキルされた場合、残りのプロセスはOOMキルされません。
* **Kube-apiserver に `/flagz` エンドポイントを追加:**  Kube-apiserverに `/flagz` エンドポイントが追加されました。
* **PodLogOptions に `Stream` フィールドを追加:** `PodLogOptions` に `Stream` フィールドが追加され、コンテナの特定のログストリーム（stdoutまたはstderr）をクライアントがリクエストできるようになりました。特定の `Stream` と `TailLines` の組み合わせはサポートされていないことに注意してください。
* **非同期Podプリエンプションのアルファサポートの追加:** `SchedulerAsyncPreemption` feature gate を有効にすると、スケジューラがプリエンプションを非同期でトリガーするAPI呼び出しを実行し、パフォーマンスが向上します。
* **`ResourceClaim.Status` にドライバー所有のフィールドを追加:** 割り当てられたデバイスごとに、デバイスステータスデータを報告するドライバー所有のフィールドが `ResourceClaim.Status` に追加されました。
* **DRA評価用のCELの上限コストの強制:** APIサーバーとスケジューラは、CEL式を評価するために必要なコストとランタイムステップの上限を強制するようになりました。
* **コンテナ再起動間のバックオフ遅延の変更機能の追加:**  `CrashLoopBackOff`状態のコンテナの、ノードごとのコンテナ再起動間の最大バックオフ遅延を変更する機能が追加されました。この機能を設定するには、`KubeletCrashLoopBackoffMax` feature gateを有効にし、kubelet設定ファイルで`CrashLoopBackOff.MaxContainerRestartPeriod`フィールドを "1s" と "300s" の間で設定します。
* **Pod検索ドメインでのドット` . `とアンダースコア` _ `の許可:**  Pod検索ドメインで単一のドット` . `またはアンダースコア` _ `を含むことができるようになりました。
* **`batch.kubernetes.io/cronjob-scheduled-timestamp` アノテーションの安定版への昇格:** CronJobからスケジュールされたJobオブジェクトに追加されるアノテーション`batch.kubernetes.io/cronjob-scheduled-timestamp`が安定版に昇格しました。
* **ReadWriteOncePodボリュームに対するfsGroupポリシーの適用:** ReadWriteOncePodボリュームにfsGroupポリシーが適用されるようになりました。
* **Pod APIでのpodレベルリソースのサポート:** Pod APIが、podレベルのリソースに対する`spec`レベルでの`resources`をサポートするように変更されました。
* **`ContainerStatus.AllocatedResources` のfeature gate制御:** `ContainerStatus.AllocatedResources`が、`InPlacePodVerticalSaclingAllocatedStatus`という個別のfeature gateで制御されるようになりました。
* **`Coordination.v1alpha1` APIの廃止と`coordination.v1alpha2`への置き換え:** `Coordination.v1alpha1` APIが廃止され、`coordination.v1alpha2`に置き換えられました。アップグレード前に、古い`coordination.v1alpha1`タイプを削除する必要があります。
* **DRAの不透明なデバイス構成パラメータの長さ制限:** DRAの不透明なデバイス構成パラメータの長さが制限されました。アドミッション時に、Kubernetesは10KiBのサイズ制限を適用します。
* **DRAのスケジューリング高速化:** DRAを使用してPodをスケジューリングする速度が、シナリオによっては最大16倍高速になりました。
* **`DeviceRequestAllocationResult` 構造体への "AdminAccess" フィールドの追加:**  `DeviceRequestAllocationResult` 構造体に、割り当てを処理する際に`DeviceRequest`の対応するフィールドの代わりに使うべき"AdminAccess"フィールドが追加されました。
* **構造化された認証構成での `k8s.io` と `kubernetes.io` 名前空間キーの禁止:** 構造化された認証構成で `k8s.io` および `kubernetes.io` 名前空間の追加キーが許可されなくなりました。
* **`NestedNumberAsFloat64` のバグ修正:** `NestedNumberAsFloat64` が非常に大きな `int64` 値にアクセスする際に、エラーではなく丸められた `float64` 値を返す可能性があったバグが修正されました。
* **ソフトエビクションによる `spec.terminationGracePeriodSeconds` の上書きを防ぐ機能:** ソフトエビクションの `MaxPodGracePeriodSeconds` によってPodの `spec.terminationGracePeriodSeconds` が常に上書きされるバグが修正されました。この機能を有効にするには `AllowOverwriteTerminationGracePeriodSeconds` feature gate を有効にします。
* **Jobの`ManagedBy`フィールドのベータ版への昇格:** Jobの `ManagedBy` フィールドがベータ版に昇格しました。
* **Podレベルの `securityContext` 内の `seLinuxChangePolicy` フィールドのアルファ版導入:**  `SELinuxChangePolicy` feature gate の下で、Podレベルの `securityContext` 内に新しいアルファ版の `seLinuxChangePolicy` フィールドが導入されました。これにより、`SELinuxMount` 機能が有効になっている場合に、SELinuxラベル付きでPodボリュームをマウントしないことを選択できます。
* **ミューテーションアドミッションポリシー用の `v1alpha1` APIの導入:** CEL式による拡張可能なアドミッション制御を可能にするミューテーションアドミッションポリシー用の `v1alpha1` API が導入されました。
* **システム予約およびkube予約スライスへの圧縮可能リソース設定の導入:** システム予約およびkube予約スライスに圧縮可能なリソース設定が導入されました。
* **kube-apiserver の `StructuredAuthorizationConfiguration` feature gate のGAへの昇格:**  `StructuredAuthorizationConfiguration` feature gate がGAに昇格しました。`--authorization-config` フラグで `apiserver.config.k8s.io/v1` バージョンの`AuthorizationConfiguration`を受け入れるようになりました。
* **kube-proxy での conntrack テーブルとのサービス/エンドポイント変更の調整:** kube-proxy がサービスとエンドポイントの変更を conntrack テーブルと調整し、古いUDPフローエントリのみをクリーンアップするようになりました。
* **kube-scheduler からのボリューム制限プラグインの削除:** `AzureDiskLimits`、`CinderLimits`、`EBSLimits`、`GCEPDLimits` プラグインが kube-scheduler から削除されました。
* **kubelet のイメージクレデンシャルプロバイダ設定ファイルでの厳密なデシリアライゼーション:** kubelet の`--image-credential-provider-config`ファイルが、厳密なデシリアライゼーションでロードされるようになりました。
* **NodeRestriction アドミッションでのオーディエンス値の検証:** NodeRestrictionアドミッションが、kubeletがサービスアカウントトークンをリクエストしているオーディエンス値が、pod specボリュームの一部であることを検証するようになりました。
* **`CustomResourceFieldSelectors` の安定版への昇格:** `CustomResourceFieldSelectors` が安定版に昇格し、デフォルトで有効になりました。
* **`StatefulSetAutoDeletePVC` feature gate の安定版への昇格:**  `StatefulSetAutoDeletePVC` feature gate がベータ版から安定版に昇格しました。
* **クラシック動的リソース割り当て (DRA) のすべてのサポートの削除:** クラシックDRAのすべてのサポートが削除されました。Kubernetesは、Podへの動的リソース割り当てに、構造化パラメータモデル(アルファ版)のみを使用するようになりました。
* **`HPAContainerMetrics` feature gate の削除:**  `HPAContainerMetrics` というGAのfeature gate が削除されました。
* **kubectl コマンドでのサブリソースフラグの制限の削除:** kubectlコマンドでのサブリソースフラグの制限が削除されました。
* **Kubelet API認証の見直し:** 新しいサブリソースでKubelet API認証が見直され、Kubeletエンドポイントに対するよりきめ細かい認証チェックとアクセス制御が可能になりました。
* **動的リソース割り当て (DRA) のコア機能のベータ版への昇格:** DRAのコア機能がベータ版に昇格しました。
* **`node-monitor-grace-period` のデフォルト値の引き上げ:** `node-monitor-grace-period` のデフォルト値が 50秒 に引き上げられました。
* **`ResourceSliceList` のフィールド名の修正:** `resource/v1alpha3.ResourceSliceList` の `listMeta` フィールドが正しく `metadata` に修正されました。
* **ブックマークイベントへのアノテーションの追加:** Watchストリームリクエスト用の合成「ブックマーク」イベントに新しいアノテーション`kubernetes.io/initial-events-list-blueprint`が追加されました。
* **CRD検証ルールでのCEL予約キーワードの直接使用のサポート:** CRD検証ルールが、オブジェクト検証式でCEL予約キーワードをフィールド名として直接使用できるようになりました。
* **`persistentVolumeClaimRetentionPolicy` の不正確な説明の修正:**  `persistentVolumeClaimRetentionPolicy` の不正確な説明が修正されました。
* **X.509クライアント証明書認証での認証情報IDの生成:** Kube-apiserverへのX.509クライアント証明書認証で、監査ログで使用するための認証情報ID（証明書の署名から派生）が生成されるようになりました。

**3. 機能（Feature）**

* **ノードメモリマネージャのWindowsサポートの追加:** ノードメモリマネージャがWindowsをサポートするようになりました。
* **kube-controller-manager に `--concurrent-daemonset-syncs` フラグを追加:**  kube-controller-manager に、デーモンセットコントローラのワーカー数を設定する `--concurrent-daemonset-syncs` コマンドラインフラグが追加されました。
* **kube-apiserver に `/statusz` エンドポイントを追加:** kube-apiserver に `/statusz` エンドポイントが追加されました。
* **デバイスプラグインのヘルスチェックの追加:**  デバイスプラグインのgRPC登録サーバーのヘルスチェックが追加されました。
* **kubelet メトリクス `container_aligned_compute_resources_count` の追加:**  アラインされたコンピューティングリソースを取得するコンテナの数を報告する kubelet メトリクス `container_aligned_compute_resources_count` が追加されました。
* **kubelet メトリクスの追加:**  静的ポリシー使用時にcpumanagerによって管理されるCPUプールに関する情報を報告するkubeletメトリクスが追加されました。
* **volumeattributesclass-protection-controller の追加:** kube-controller-manager に、VolumeAttributesClassオブジェクトに保護用ファイナライザを管理する新しいコントローラ volumeattributesclass-protection-controller が追加されました。
* **CPUマネージャー静的ポリシーの `strict-cpu-reservation` オプションの追加:** CPUマネージャーの静的ポリシーに、新しい `strict-cpu-reservation` オプションが追加されました。このオプションを有効にすると、`reservedSystemCPUs` のCPUコアが、システムデーモンと割り込み処理のみに厳密に使用されるようになり、ワークロードには使用できなくなります。
* **ノードステータス更新負荷の分散:** Kubeletの `nodeStatusReportFrequency` の最大50％の1回限りのランダムな期間を追加し、時間の経過とともにノードステータス更新負荷を均等に分散するのに役立てています。
* **local-up-cluster.sh でのリーダー選出の有効化オプション:** `local-up-cluster.sh` で、LEADER_ELECT CLI フラグを使用してリーダー選出を有効にするオプションが追加されました。
* **systemd watchdog の統合のサポートの追加:**  kubelet にsystemd watchdog統合のサポートが追加されました。
* **DRAノード操作とDRA gRPC呼び出しのレイテンシー測定メトリクスの追加:**  DRAノード操作とDRA gRPC呼び出しのレイテンシーを測定するメトリクスが追加されました。
* **Goクライアントコードライブラリ (client-go) の新機能追加:**  metadataクライアントの `List()` メソッドで、コレクションをフェッチするときにAPIストリーミングを有効にできるようになりました。
* **`kubectl get PriorityClass -owide` 使用時の `preemptionPolicy` フィールドの追加:** `kubectl get PriorityClass -owide` を使用すると、`preemptionPolicy` フィールドが表示されるようになりました。
* **`status.containerStatuses[].resources` 内の拡張Podリソースのステータスの追加:**  `status.containerStatuses[].resources` フィールド内に、拡張Podリソースのステータスが追加されました。
* **サービスアカウントトークンの外部署名のアルファサポートの追加:** サービスアカウントトークンの外部署名を可能にするアルファ機能がkube-apiserverに追加されました。
* **CBOR形式のサポート:** APIリクエストとレスポンスの本文、およびカスタムリソースのストレージエンコーディングとしてCBORを許可する`CBORServingAndStorage` feature gateが追加されました。
* **Watchキャッシュの新しい実装:** `list` 動詞のWatchキャッシュに btree データ構造を使用した新しい実装が採用されました。
* **PreStopライフサイクルのsleepアクションでのゼロ値の許可:** PreStopライフサイクルのスリープアクションでゼロ値を使用できるようになりました。
* **CRIでのWindowsのCPUアフィニティのサポート:** CRIがWindowsのCPUアフィニティをサポートするようになりました。
* **サイドカーコンテナのOOMスコア調整の変更:** サイドカーコンテナのOOM調整が、Pod内の通常のコンテナのOOMスコア調整以下になるように変更されました。
* **クライアント-go のログ機能の改善:**  クライアント-go で、リクエスト/レスポンスのログが、正確なソースコードの位置とともに記録されるようになりました。
* **DRAメトリクスの追加:** リソース要求コントローラーが、`ResourceClaims` の総数と割り当てられた`ResourceClaims`の数を追跡するメトリクスを維持するようになりました。
* **Windowsノードでの正常なシャットダウン機能の有効化:** Windowsノードで正常なシャットダウン機能が有効になりました。
* **kube-controller-manager の `--concurrent-job-syncs` フラグのオーファンポッドプロセッサでの動作:**  kube-controller-manager の `--concurrent-job-syncs` フラグがオーファンポッドプロセッサで動作するようになりました。
* **In-place resize での整数CPUリクエストを持つ保証付き Pod のリサイズ制限:** In-place resize のベータリリースで、静的なCPUとメモリポリシーが設定されたノード上で整数CPUリクエストを持つ保証付きPodのリサイズが許可されなくなりました。
* **ディスカバリーグループマネージャーへのグループリスターインターフェースの拡張:** ディスカバリーグループマネージャーが、グループリスナーインターフェースで拡張されました。
* **システムデーモンの再ロード時のPodの垂直スケーリングの更新のオーバーライド回避:**  systemd使用時に、システムデーモンの再ロード時に、Podの垂直スケーリングの更新がオーバーライドされないようになりました。
* **kubectl describe でのイメージボリュームの表示修正:** `kubectl describe` で、イメージボリュームを持つPodが表示されない問題が修正されました。
* **匿名認証設定可能エンドポイント機能のベータ版への昇格:** 匿名認証に設定可能なエンドポイントを許可する `AnonymousAuthConfigurableEndpoints` feature gate がベータ版に昇格し、デフォルトで有効になりました。
* **kubelet メモリマネージャーのGAへの昇格:** kubelet メモリマネージャーがGAに昇格しました。
* **`SchedulerQueueingHints` のベータ版への昇格:**  `SchedulerQueueingHints` がベータ版に昇格し、デフォルトで有効になりました。
* **`WatchList` feature gate のベータ版への昇格:**  kube-apiserver の `WatchList` feature gate がベータ版に昇格し、KCMに対して `WatchListClient` が有効になりました。
* **CSILimitプラグインでのキューヒントの実装:** `CSILimit`プラグインに、PersistentVolumeClaim/Addイベント用のキューヒントが実装されました。
* **スケジューラプラグイン用の新しいクラスターイベントの実装:** スケジューラプラグイン用の新しいクラスターイベント `UpdatePodSchedulingGatesEliminated` および `UpdatePodTolerations` が実装されました。
* **`NodeAffinity` プラグインでのノードのキューヒントの改善:** `NodeAffinity` プラグインのノードキューヒントが、Podをスケジュール不可にする無関係な変更を無視することで改善されました。
* **`NodeResourceFit` プラグインでのノードのキューヒントの改善:** `NodeResourceFit` プラグインのノードキューヒントが、Podをスケジュール不可にする無関係な変更を無視することで改善されました。
* **ジョブ削除イベント処理時のジョブコントローラのパフォーマンスの向上:** ジョブコントローラがジョブ削除イベントを処理する際のパフォーマンスが向上しました。
* **ジョブ更新イベント処理時のジョブコントローラのパフォーマンスの向上:** ジョブコントローラがジョブ更新イベントを処理する際のパフォーマンスが向上しました。
* **リソースラベル変換をメトリクスに追加:** リソース固有の検証に使用できる `on_operations_total` メトリクスに追加のリソースラベル変換が含まれました。
* **kubelet でのアドミッション拒否数の追跡メトリクスの追加:** アドミッション中に拒否されたPodの数を追跡するための新しいメトリクス `kubelet_admission_rejections_total` が追加されました。
* **JWT認証での `jti` クレームの設定:**  JWT認証で、`jti` クレーム（存在し、文字列値の場合）が、監査ログで使用するための認証情報IDとして設定されるようになりました。
* **kube-apiserver での `AuthorizeWithSelectors` および `AuthorizeNodeWithSelectors` のベータ版への昇格:** kube-apiserver で、`AuthorizeWithSelectors` および `AuthorizeNodeWithSelectors` のfeature gate がベータ版に昇格しました。
* **kube-apiserver での `--requestheader-uid-headers` フラグの追加:** kube-apiserver で、認証ヘッダーから認証ユーザーのUIDを取得するための `--requestheader-uid-headers` フラグが追加されました。
* **kube-proxy でのヘッドレスサービスの監視回避:** kube-proxy が、ヘッドレスサービスの監視を回避するために、サービスで `clusterIP!=None` のフィールドセレクターを使用するようになりました。
* **`kubeadm upgrade apply` でのフェーズサブコマンドのサポート:** `kubeadm upgrade apply` でフェーズサブコマンドがサポートされました。
* **`kubeadm upgrade node` での `addon` および `post-upgrade` フェーズのサポート:**  `kubeadm upgrade node` で `addon` および `post-upgrade` フェーズがサポートされました。
* **kubeadm での証明書の有効期限に関する警告の追加:** 証明書の有効期間がCA証明書の有効期間よりも長い場合に、kubeadmが検証警告を追加するようになりました。
* **kubeadm での `NodeLocalCRISocket` feature gate の追加:**  `NodeLocalCRISocket` feature gate が追加されました。
* **kubeadm での `--config` フラグと `kubeadm init phase addon` のサブフェーズの `--print-manifest` フラグの組み合わせの許可:** kubeadm で `--config` フラグと `kubeadm init phase addon` のサブフェーズの `--print-manifest` フラグを組み合わせることが許可されました。
* **`WaitForAllControlPlaneComponents` feature gate が有効な場合のコントロールプレーンコンポーネントのアドレスの考慮:** `WaitForAllControlPlaneComponents` feature gate が有効な場合、コントロールプレーンコンポーネントの `--bind-address` または `--advertise-address` および `--secure-port` が考慮されるようになりました。
* **kubeadm での不明なコマンド名の処理:**  kubeadm で不明なコマンド名が渡された場合の処理が改善されました。
* **kubeadm での `EtcdLearnerMode` feature gate のGAへの昇格:**  kubeadm で `EtcdLearnerMode` feature gate がGAに昇格しました。
* **kubelet でのカーネルバージョンが5.8より古い場合のcgroup v2ログとイベントの追加:** kubelet で、カーネルバージョンが5.8より古い場合のcgroup v2に関するログとイベントが追加されました。
* **Kubernetes の Go バージョンの更新:** Kubernetes が Go 1.23.3 でビルドされるようになりました。
* **StatefulSet からの Pod に追加されるラベル `apps.kubernetes.io/pod-index` と Indexed Job からの Pod に追加されるラベル `batch.kubernetes.io/job-completion-index` の安定版への昇格:** StatefulSet からの Pod に追加されるラベル `apps.kubernetes.io/pod-index` と Indexed Job からの Pod に追加されるラベル `batch.kubernetes.io/job-completion-index` が安定版に昇格しました。
* **`LoadBalancerIPMode` feature gate のGAへの昇格:**  `LoadBalancerIPMode` feature gate がGAに昇格しました。
* **`kubectl debug` でのカスタムプロファイリング機能のロック:** `kubectl debug` でのカスタムプロファイリング機能が`true`にロックされました。
* **`ScalingReplicaSet` イベントの出力の変更:** `ScalingReplicaSet` イベントの出力が変更されました。
* **`PodLifecycleSleepAction` のGAへの昇格:** `PodLifecycleSleepAction` がGAに昇格しました。
* **sysctl `net.ipv4.tcp_rmem` と `net.ipv4.tcp_wmem` の Pod でのデフォルト使用の許可:**  カーネルバージョンが 4.15 以上の Pod で、sysctl `net.ipv4.tcp_rmem` と `net.ipv4.tcp_wmem` をデフォルトで使用できるようになりました。
* **InPlacePodVerticalScaling のベータ版への昇格に向けたPod検証の準備:**  InPlacePodVerticalScaling のベータ版への昇格に向けたPod検証の準備が行われました。
* **`RecoverVolumeExpansionFailure` feature gate のベータ版への昇格:** `RecoverVolumeExpansionFailure` feature gate がベータ版に昇格しました。
* **`RetryGenerateName` の安定版への昇格:** `RetryGenerateName` が安定版に昇格し、デフォルトで有効になりました。
* **`SizeMemoryBackedVolumes` の安定版への昇格:** `SizeMemoryBackedVolumes` が安定版に昇格しました。
* **`RelaxedEnvironmentVariableValidation` feature gate のベータ版への昇格:**  `RelaxedEnvironmentVariableValidation` feature gate がベータ版に昇格し、デフォルトで有効になりました。
* **`StrictCostEnforcementForVAP` および `StrictCostEnforcementForWebhooks` feature gate の昇格:**  `StrictCostEnforcementForVAP` および `StrictCostEnforcementForWebhooks` feature gate が昇格しました。
* **`ServiceAccountTokenJTI`、`ServiceAccountTokenPodNodeInfo`、`ServiceAccountTokenNodeBindingValidation` feature gate のGAへの昇格:** `ServiceAccountTokenJTI`、`ServiceAccountTokenPodNodeInfo`、`ServiceAccountTokenNodeBindingValidation` feature gate がGAに昇格しました。
* **`kubectl explain` 説明の改行の調整:** `kubectl explain` の説明の改行が調整されました。
* **ノード容量からのアタッチ可能ボリューム制限の削除:**  kubelet起動時のノード容量から、次のボリュームタイプのアタッチ可能ボリューム制限が削除されました。
* **Kubernetes の Go バージョンの 1.23.0 へのロールバック:** Kubernetes のビルドに使用される Go バージョンが 1.23.0 にロールバックされました。
* **スケジューラでの `QueueingHint` の `inflight_events` メトリクスのサポート:** スケジューラで、`QueueingHint` の `inflight_events` メトリクスがサポートされるようになりました。
* **リモートオプション付きe2eノードテストのカスタムネットワークパラメータ指定のサポート:** リモートオプション付きのe2eノードテスト実行時にカスタムネットワークパラメータを指定する機能がサポートされました。
* **Jobコントローラでのサイドカーコンテナの再起動カウントの考慮:** Jobコントローラが、Podを削除するときにサイドカーコンテナの再起動カウントを考慮するようになりました。
* **`TopologyManagerPolicyOptions` feature gate のGAへの昇格:** `TopologyManagerPolicyOptions` feature gate がGAに昇格しました。
* **VolumeBindingプラグインのCSIDriverイベントでのキューヒントの実装:** スケジューラで、VolumeBindingプラグインのCSIDriverイベントに `QueueingHint` が実装され、スケジューリングのスループットが向上しました。
* **スケジューラのゲート付きPodの再試行の改善:** スケジューラがゲート付きPodをより適切に再試行し、バックオフペナルティも与えるようになりました。
* **スケジューラメトリクスでの予期しないラベル値の表示:** スケジューラメトリクスで、許可されていないラベル値が「予期しない」として表示されるようになりました。
* **コントロールプレーンの信頼アンカーパブリッシャーの更新:** コントロールプレーンの信頼アンカーパブリッシャーが更新され、kube-apiserver サービス証明書署名者に関連付けられた新しい `ClusterTrustBundle` オブジェクトを作成および管理するようになりました。
* **system-validators の更新:** system-validators が v1.9.0 に更新されました。
* **system-validators の更新:** system-validators が v1.9.1 に更新されました。
* **スケジューラでの特定のノードイベントのサブスクライブ:**  `SchedulerQueueingHint` が有効になっている場合、スケジューラのインツリープラグインが特定のノードイベントをサブスクライブして、Podを再キューに入れるかどうかを決定するようになりました。
* **スケジュールキューでのキャッシュされたイベントの早期クリア:** `SchedulerQueueingHints` が有効になっている場合、スケジューラが使用するメモリを削減するために、スケジュールキューにキャッシュされたイベントをできるだけ早くクリアするようになりました。
* **WindowsでのCPUおよびトポロジマネージャーのサポート:**  WindowsでのCPUおよびトポロジマネージャーがサポートされるようになりました。

**4. ドキュメント（Documentation）**

* **kube-controller-manager フラグのドキュメントの明確化:** kube-controller-manager の `--allocate-node-cidrs`、`--cluster-cidr`、`--service-cluster-ip-range` フラグのドキュメントが明確化されました。
* **kubectl wait の `--for=create` オプションのドキュメント:** `kubectl wait` の `--for=create` オプションのドキュメントが追加されました。
* **`apiserver_admission_webhook_fail_open_count` および `apiserver_admission_webhook_request_total` メトリクスのドキュメントの修正:** `apiserver_admission_webhook_fail_open_count` および `apiserver_admission_webhook_request_total` メトリクスのドキュメントが修正されました。
* **kubeadm の出力の修正:**  `kubeadm init` コマンド実行時に表示される、コントロールプレーンの参加手順に関する誤解を招く出力が修正されました。
* **kubelet `--cloud-provider=external` での `--node-ip` フラグの使用方法のドキュメント:**  `--cloud-provider=external` を使用する kubelet で、デフォルトゲートウェイのIPを使用してノードを作成し、外部クラウドプロバイダーに責任を委任する `--node-ip` フラグの使用方法のドキュメントが追加されました。
* **リクエストヘッダーUID伝播に関するドキュメント:** アルファ版の `RemoteRequestHeaderUID` feature gate の背後にあるリクエストヘッダーUID伝播に関するドキュメントが追加されました。

**5. テストの失敗（Failing Test）**

* **kubeletプラグインのWindowsでの再登録の修正:**  再登録期間が15ミリ秒未満の場合、kubeletプラグインがWindowsで正しく再登録されるようになりました。

**6. バグまたは回帰（Bug or Regression）**

* **イメージボリュームソースタイプに関連するバグ修正:** kubeletがコンテナのCRIマウントを構築する際に、`image`ボリュームソースタイプを参照すると、読み取り専用、伝播、再帰的な読み取り専用などの欠落しているマウント属性をCRI実装に渡すようになり、コンテナマウントの読み取り専用フィールドが明示的にfalseに設定されている場合でも、イメージボリュームプラグインがマウントを読み取り専用にする必要があるため、kubeletはCRI実装にreadOnlyをtrueとして渡すようになりました。
* **`image`ボリュームソースタイプと`/etc/hosts`へのマウントに関するバグ修正:**  `image`ボリュームソースタイプが使用され、コンテナ内の`/etc/hosts`にマウントされている場合に、Podが予期せず実行されるバグが修正されました。
* **ConfigMap、Secret、DownwardAPI、Projectedでのパスの重複に関する警告の追加:** ConfigMap、Secret、DownwardAPI、Projected でのパスの重複に関する警告が追加されました。ソースを持つProjectedVolumeの場合の警告も追加されました。
* **Apiserver修復コントローラーのエラー処理の改善:** Apiserver修復コントローラーが、ブートストラップ中のetcdエラーに対して回復力を持つようになり、失敗するまで30秒間再試行するようになりました。
* **`applyconfiguration-gen` での重複メソッドとあいまいなメンバーアクセス生成の修正:**  `applyconfiguration-gen` が、型が同じ名前の複数のメンバーで終わる場合に、重複するメソッドとあいまいなメンバーアクセスを生成しなくなりました。
* **ブックマークイベントの即時送信:** ブックマークイベントが、watchCacheストア内のすべてのアイテムが処理された直後に送信されるようになり、クライアントの動作の一貫性が向上しました。
* **DRAに関連する複数の問題の修正:** `allocationMode: all` に関連するいくつかの問題が修正されました。
* **DRAドライバーがPod作成後に開始された場合のスケジューリングの問題の修正:** DRAドライバーが、そのドライバーからのリソースを必要とするPodの作成後に開始された場合、スケジュールできないPodを再スケジュールする試行が行われなかった問題が修正されました。
* **スケジューラキューヒント機能有効時のPodのスタック問題の修正:** スケジューラキューヒント機能を有効にすると、生成された`ResourceClaim`の名前を記録してもスケジュールがトリガーされなかったため、Podがスケジュール不可としてしばらくスタックしていた問題が修正されました。
* **システムコンポーネントのメトリクスでの許可されないラベル値の表示:**  許可されないラベル値が、すべてのシステムコンポーネントのメトリクスで「予期しない」として表示されるようになりました。
* **kubectl cp での出力ストリームの破棄とタイムアウトの追加:**  ローカルからPodにコピーするときの `kubectl cp` の宛先パスチェックの出力ストリームが破棄され、このチェックに3秒のタイムアウトが追加されました。
* **kube-controller-manager の service-lb-controller ループのクラッシュを引き起こす可能性のある1.31の回帰の修正:**  kube-controller-manager の service-lb-controller ループのクラッシュを引き起こす可能性のある1.31の回帰が修正されました。
* **Windowsでのkubelet起動の問題を修正:** Windowsで kubelet を起動する際に発生した 1.31 の回帰が修正されました。
* **APIエミュレーションバージョニングでの1.31の回帰の修正:** APIエミュレーションバージョニングが共存するリソースを尊重するようになった 1.31 の回帰が修正されました。
* **エンドポイントコントローラのバグ修正:**  エンドポイントコントローラが、エンドポイントオブジェクトが切り捨てられた後に(1000個を超えるエンドポイントアドレスを受信した場合)エンドポイントオブジェクトを調整できなかったバグが修正されました。
* **ガベージコレクターコントローラのバグ修正:** キャッシュ同期エラーにより、ガベージコレクターコントローラが永久にブロックされる可能性があったバグが修正されました。
* **ノードのホスト名ラベルがノード名と一致しない場合に発生する問題の修正:**  ノードのホスト名ラベルがノード名と一致しない場合、ホスト名を使用する `nodeAffinity` でPersistentVolumeにバインドされたPodが、誤ったノードにスケジュールされたり、スケジュールエラーが発生したりする可能性があった問題が修正されました。
* **PodCIDRがノード削除前に解放されたバグの修正:** `podCIDR`がノード削除前に解放されていたバグが修正されました。
* **kubeletの初期化失敗に関するバグの修正:** kubeletが、cgroup v2とsystemd cgroupマネージャーでcpuset cgroupが削除されたために、`failed to initialize top level QOS containers: root container [kubepods] doesn't exist` というエラーで一時的に失敗するバグが修正されました。
* **ノード再起動後のInitコンテナのフェーズに関するバグの修正:** ノード再起動後、通常のInitコンテナが実行を完了していなかった場合、通常のInitコンテナを持つPodのフェーズが保留中にならなかったバグが修正されました。
* **スケジューラがノード削除をプラグインに正しく通知しなかったバグの修正:** スケジューラが、ノード削除をプラグインに正しく通知しなかったバグが修正...（トークンの上限に達したため、レスポンスは省略されています。より長いレスポンスが必要な場合は、トークンの上限を増やしてみてください。）
