はい、Kubernetes v1.32 の変更内容について、分かりやすく解説します。このchangelogは、開発者やKubernetes管理者がシステムをアップグレードする際に注意すべき点や、新機能、変更点などをまとめたものです。

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
