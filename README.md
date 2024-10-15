Kubernetes v1.31 リリースノート日本語説明

このリリースノートは、Kubernetes v1.31へのアップグレードに関する重要な変更点をまとめたものです。特に緊急性の高い項目と、対応が必要な項目について説明します。

**緊急度の高いアップグレードに関する注意事項 (必ずアップグレード前に読んでください)**

* **スケジューラのキューイングヒントの改善:**  `SchedulerQueueingHints` 機能ゲートを有効にすると、スケジューラはPodの更新時に、その更新がPodをスケジューラブルにするかどうかを判定する際に、登録されているQueueingHintを使用するようになりました。以前は、スケジューラブルでないPodが更新された場合、常にactiveQ/backoffQに戻していましたが、全ての更新がPodをスケジューラブルにするわけではありません。  この変更により、スケジューラブルでないPodが更新された場合、少なくとも一つのQueueingHintがQueueを返す場合のみ、activeQ/backoffQに戻されるようになります。

  **カスタムスケジューラプラグイン開発者への対応:**  カスタムプラグインで、Podの更新によって解決できる拒否理由がある場合、Pod/Updateイベントに対するQueueingHintを実装する必要があります。例えば、「schedulable=false」ラベルを持つPodを拒否するカスタムプラグインの場合、「schedulable=false」ラベルが削除されたらPodがスケジューラブルになるので、このラベルの変更があった場合にQueueを返すQueueingHintを実装する必要があります。


* **`--keep-terminated-pod-volumes` フラグの削除:** 2017年に非推奨となったKubeletフラグ`--keep-terminated-pod-volumes`が削除されました。


* **ボリューム拡張失敗時の状態変化の削減:** ボリューム拡張失敗時の状態変化のノイズを削減し、特定の失敗を実行不可能としてマークするようになりました。

  **対応が必要な事項:**  `RecoverVolumeExpansionFailure` アルファ機能ゲートを使用している場合、アップグレード後にいくつかのオブジェクトを更新する必要があります。`status.allocatedResourceStatus`が"ControllerResizeFailed"または"NodeResizeFailed"に設定されている既存のPersistentVolumeClaimについては、`status.allocatedResourceStatus`をクリアしてください。


**種類別の変更点**

**非推奨化**

* **kubeadm:**  `init kubelet-finilize` サブフェーズの `experimental-cert-rotation` が非推奨となり、使用すると警告が出力されます。将来的に削除されるため、代わりに `enable-client-cert-rotation` を使用してください。
* **PersistentVolume (PV):**  非推奨の注釈 `volume.beta.kubernetes.io/mount-options` を使用してPVを作成または更新しようとすると、警告が表示されます。
* **CephFS/RBD ボリュームプラグインの削除:** CephFSボリュームプラグイン(`kubernetes.io/cephfs`)とCephRBDボリュームプラグイン(`kubernetes.io/rbd`)が削除されました。これらを使用していた場合は、CephFS CSIドライバ (https://github.com/ceph/ceph-csi/) またはRBD CSIドライバ (https://github.com/ceph/ceph-csi/) に移行し、アプリケーションを再デプロイする必要があります。
* **Kube-scheduler の非CSIボリューム制限プラグインの非推奨化:** AzureDiskLimits、CinderLimits、EBSLimits、GCEPDLimitsプラグインが非推奨となり、1.32で削除されます。これらはNodeVolumeLimitsプラグインで置き換えられます。
* **kubeadm の `RootlessControlPlane` 機能ゲートの非推奨化:**  コアKubernetesの`UserNamespacesSupport`機能ゲートがベータ版になったため、非推奨となりました。 kubeadmがユーザーネームスペースポッドでコントロールプレーンを実行できるようになったら完全に削除されます。それまでは、非推奨の`RootlessControlPlane`機能ゲートを引き続き使用するか、静的ポッドマニフェストにkubeadmパッチを適用して`UserNamespacesSupport`をオプトインできます。
* `k8s.io/legacy-cloud-providers` の削除: レガシーなクラウドプロバイダー統合コードが削除されました。


**APIの変更**

* **動的リソース割り当て (DRA):** DRAドライバのDaemonSetは、ResourceSliceの書き込みとResourceClaimオブジェクトの読み取りを許可するサービスアカウントでデプロイする必要があります。
* その他多数のAPI変更があります(NodeへのUserNamespacesフィールドの追加、Coordinated Leader Electionのアルファ版追加など)。詳細についてはリリースノートを参照ください。


**機能追加**

* **kubeadm:** CoreDNSデプロイメントをパッチ適用できるようになりました。
* **kubeadm:**  `--experimental-output` フラグが非推奨となり、代わりに `--output` フラグが追加されました。
* カスタムスケジューラプラグイン開発者への対応：`EnqueueExtensions` インターフェースの `EventsToRegister` に `ctx` パラメータと `error` 戻り値が追加されました。
* その他多数の機能追加があります(kubectl waitへの`--for=create` オプションの追加、TopologyManagerポリシーオプションの追加など)。詳細についてはリリースノートを参照ください。


**バグ修正と回帰修正**

* 多数のバグ修正と、以前のリリースにおける回帰修正が含まれています。詳細についてはリリースノートを参照ください。


**その他の変更点 (クリーンアップなど)**

* `kubectl exec` コマンドにおける`--`セパレータの必須化
* `kubectl describe service`/`kubectl describe ingress` でのEndpointsSliceの使用
* DRAドライバのv1alpha2 Kubelet gRPC APIの非サポート
* いくつかの機能ゲートの削除
* その他多数のクリーンアップと改善が含まれています。詳細についてはリリースノートを参照ください。


**対応が必要な項目のまとめ:**

* カスタムスケジューラプラグインの修正 (QueueingHintの実装)
* `RecoverVolumeExpansionFailure` 機能ゲートを使用している場合のPersistentVolumeClaimの更新
* CephFS/RBDボリュームプラグインを使用している場合のCSIドライバへの移行とアプリケーションの再デプロイ
* Kube-schedulerの非CSIボリューム制限プラグインのNodeVolumeLimitsプラグインへの置き換え
* DRAドライバのDaemonSetのサービスアカウントの修正
* kubeadm関連の設定変更 (v1beta4 APIへの移行など)
* DRAドライバのv1alpha2 Kubelet gRPC APIからの更新


この説明はリリースノートの要約であり、詳細については元のリリースノートを参照してください。  アップグレード前に、全ての変更点と対応が必要な事項を十分に確認し、計画を立てて実行することが重要です。  特に、カスタムスケジューラプラグインやDRAドライバを使用している場合は、細心の注意を払ってください。
