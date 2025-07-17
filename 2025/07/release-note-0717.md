
# Title: July 16, 2025 
Link: https://cloud.google.com/release-notes#July_16_2025<br>
# Google Kubernetes Engine
## Changed
原文: To enable upcoming support for mTLS and client certificates, Google Front Ends
(GFEs) that power GKE DNS-based control plane public endpoints will add client
certificate requests during the TLS handshake. Requests are already incorporated
into GKE DNS-based control plane public endpoints where hostnames end with
`us-central1.gke.goog`. For all other GKE DNS-based control plane public
endpoints, this will roll out between August 18, 2025 and August 22, 2025.

Until mTLS and client certificate configuration options are available, the
following details apply:

- A client certificate request in a TLS handshake *doesn't* mean that `kubectl`
(or other compatible clients) must provide a client certificate. Client
certificates are neither mandatory nor configurable.
- TLS libraries in current operating systems send a "no client certificate"
response to the public endpoint's client certificate request.
- GKE DNS-based control plane public endpoints will **not** enforce client
certificates or mTLS requirements until a future announcement about
configuration options.

If you use an intermediate proxy between `kubectl` (or other compatible
clients) and a GKE DNS-based control plane public endpoint, ensure that it fully
adheres to
Section 7.4.4 of RFC 5246,
Section 4.4.2 of RFC 8446,
or
Section 4.4.2.4 of RFC 8446.

説明：
Google Kubernetes Engine (GKE) は、将来のmTLS（相互TLS）およびクライアント証明書のサポートを可能にするため、GKEのDNSベースのコントロールプレーン公開エンドポイントを処理するGoogle Front Ends (GFEs) がTLSハンドシェイク時にクライアント証明書のリクエストを追加するようになります。この変更は、`us-central1.gke.goog`で終わるホスト名のエンドポイントでは既に適用されており、その他のGKE DNSベースのコントロールプレーン公開エンドポイントでは、2025年8月18日から8月22日の間に順次展開されます。

現時点では、クライアント証明書の設定オプションが提供されるまで、以下の点に留意してください。
*   TLSハンドシェイクにおけるクライアント証明書のリクエストは、`kubectl`等のクライアントが証明書を提供する義務を意味するものではありません。クライアント証明書は必須ではなく、設定もできません。
*   現在のOSのTLSライブラリは、公開エンドポイントからのクライアント証明書リクエストに対して「クライアント証明書なし」という応答を送信します。
*   GKE DNSベースのコントロールプレーン公開エンドポイントは、今後の設定オプションに関する発表があるまで、クライアント証明書やmTLS要件を強制することはありません。

もし`kubectl`等のクライアントとGKEコントロールプレーン公開エンドポイントの間に中間プロキシを使用している場合、そのプロキシがRFC 5246のセクション7.4.4、RFC 8446のセクション4.4.2、またはRFC 8446のセクション4.4.2.4に完全に準拠していることを確認してください。

影響有無：
**限定的な影響**
*   **直接的な影響は低い**：クライアント証明書の提示は現時点では必須ではなく、設定もできないため、通常の`kubectl`操作や既存のワークロードに直接的な影響はありません。
*   **プロキシを使用している場合に潜在的な影響**：`kubectl`とGKEコントロールプレーンの間に中間プロキシを使用している環境では、そのプロキシがTLSハンドシェイクにおけるクライアント証明書のリクエスト処理について、指定されたRFCに準拠していない場合、接続が失敗する可能性があります。

対処方法：
1.  **プロキシの確認**：もし`kubectl`（または互換性のあるクライアント）とGKE DNSベースのコントロールプレーン公開エンドポイントの間に中間プロキシを使用している場合は、そのプロキシがRFC 5246 Section 7.4.4、RFC 8446 Section 4.4.2、またはRFC 8446 Section 4.4.2.4の仕様に完全に準拠しているかを確認してください。準拠していない場合は、プロキシのアップデートまたは設定変更を検討する必要があります。
2.  **今後の発表への注意**：現時点では追加の対応は不要ですが、将来的にmTLSの強制やクライアント証明書の設定オプションが提供される可能性があります。Google Cloudのリリースノートや公式ドキュメントを継続的に確認し、必要に応じて対応を計画してください。

用語説明：
*   **mTLS (相互TLS: Mutual Transport Layer Security)**: 通常のTLS（HTTPSなどで使われる）がクライアントからサーバーへの一方向認証であるのに対し、mTLSはクライアントとサーバーの両方が互いの身元を証明するためにデジタル証明書を提示し、相互に認証を行う通信プロトコルです。より厳格なセキュリティが求められる環境で利用されます。
*   **TLSハンドシェイク**: TLSプロトコルを使用して安全な通信チャネルを確立する際に行われる一連の通信ステップです。このプロセスで、使用する暗号スイートの決定、サーバー証明書の検証、鍵交換などが行われます。今回はこのハンドシェイク中にサーバー側がクライアント証明書を要求するようになります。
*   **Google Front Ends (GFEs)**: Googleのインフラストラクチャの一部で、Googleの様々なサービスへの外部からのトラフィックを処理します。GFEは負荷分散、DDoS防御、SSL/TLS終端（クライアントからの暗号化通信を復号する）など、多岐にわたる機能を提供し、Googleのサービスのスケーラビリティとセキュリティを支えています。
*   **GKE DNS-based control plane public endpoints**: GKEクラスタのコントロールプレーン（Kubernetes APIサーバーなど）に外部からアクセスするための公開エンドポイントです。通常、`*.gke.goog`のようなDNS名で提供され、`kubectl`コマンドなどがこのエンドポイントに接続してクラスタを管理します。
*   **RFC 5246 / RFC 8446**: それぞれTLSバージョン1.2およびTLSバージョン1.3のプロトコル仕様を定義したインターネット標準文書（Request For Comments）です。これらの文書は、TLSプロトコルの動作に関する詳細な技術要件を定めています。

# Vertex AI
## Feature
原文: Added Gemma 3 fine-tuning notebook using Axolotl docker with support for 1b, 4b, 12b, and 27b variants.

説明：
Vertex AIに、Googleが開発したGemma 3モデルのファインチューニング（追加学習）を行うための新しいノートブックが追加されました。このノートブックは、大規模言語モデルのトレーニング・ファインチューニングツールキットであるAxolotlをDockerコンテナとして利用しており、Gemma 3の10億（1B）、40億（4B）、120億（12B）、270億（27B）パラメータの各バリアントに対応しています。

影響有無：
**影響なし**
*   これは新機能の追加であり、既存のVertex AIの利用状況やワークロード、設定に影響を与えるものではありません。現在Vertex AIでGemma 3モデルを使用していない、またはファインチューニングを行っていない場合には、特に何も影響はありません。

対処方法：
*   既存のサービスに対する特別な対処は不要です。
*   もしGemma 3モデルのファインチューニングに興味がある場合、Vertex AIのノートブック環境でこの新しい機能を利用することを検討できます。

用語説明：
*   **Gemma 3**: Googleが開発したオープンな大規模言語モデル（LLM）ファミリーの最新バージョンです。高性能でありながら比較的小規模なモデルも提供され、様々な用途で利用可能です。
*   **ファインチューニング (Fine-tuning)**: 事前学習済みの大規模言語モデルを、特定のタスクや独自のデータセットに合わせて追加で学習させるプロセスです。これにより、モデルの汎用性を保ちつつ、特定の領域での性能を向上させることができます。
*   **Axolotl**: 大規模言語モデル（LLM）のトレーニングやファインチューニングを効率的に行うためのオープンソースツールキットです。PyTorchなどのフレームワーク上で動作し、様々なLLMのモデルアーキテクチャや最適化手法に対応しています。
*   **Docker**: アプリケーションとその依存関係をすべてまとめて「コンテナ」と呼ばれる独立したパッケージとして動作させるためのプラットフォームです。これにより、開発環境と本番環境での動作の一貫性が保証され、環境構築が容易になります。
*   **1b, 4b, 12b, 27b variants**: これはGemma 3モデルの異なるサイズ（パラメータ数）を示しており、それぞれ10億、40億、120億、270億のパラメータを持つモデルバリアントを指します。パラメータ数が多いほど一般的にモデルの表現力は高まりますが、計算リソースも多く必要になります。
# Title: July 15, 2025 
Link: https://cloud.google.com/release-notes#July_15_2025<br>
# Compute Engine
## Changed
原文: Compute flexible committed use discounts (CUDs) offer expanded coverage by
supporting the following resources and services:

- Memory-optimized M1, M2, M3, and M4 VMs
- Compute-optimized H3 instances
- Cloud Run services with request-based billing
- Cloud Run Functions

 To receive the expanded coverage for flexible CUDs, you must opt in to the new
spend-based CUD model. Cloud Billing accounts that meet specific criteria are
automatically opted into the new model. On January 21, 2026, all remaining
accounts will automatically migrate to the new model. You can opt in before that
date to start receiving the expanded coverage. To learn more about the new model
and the opt-in details, see
Spend-based CUDs program improvements.

[Spend-based CUDs program improvements](https://cloud.google.com/docs/cuds-multiprice)
 To learn more about this change and how your flexible CUDs apply after you opt
in, see
Compute flexible CUDs.

[Compute flexible CUDs](https://cloud.google.com/compute/docs/instances/committed-use-discounts-overview#spend_based)

説明:
Google Cloud Compute Engineのフレキシブルなコミットメント利用割引 (CUDs) の対象範囲が拡張されました。これにより、以下のリソースおよびサービスがCUDsの割引対象となります。
*   メモリ最適化VM (M1, M2, M3, M4)
*   コンピュート最適化H3インスタンス
*   リクエストベース課金のCloud Runサービス
*   Cloud Run Functions

この拡張された割引適用を受けるためには、新しい費用ベースのCUD（Spend-based CUD）モデルへのオプトインが必要です。特定の条件を満たすCloud請求先アカウントは自動的に新しいモデルにオプトインされますが、2026年1月21日には全てのアカウントが自動的に新しいモデルへ移行します。それ以前にオプトインすることで、早期に拡張された割引適用を受けることが可能です。

影響有無:
**影響なし（プラスの機会あり）**

*   **直接的な負の影響はありません。** 既存のCompute Engineの稼働や既存のCUD契約に破壊的な変更はありません。
*   **コスト最適化の機会が増加します。** もし現在、上記の対象VMタイプ (M1, M2, M3, M4, H3) やCloud Runサービスを利用しており、かつSpend-based CUDモデルにオプトインしていない場合、オプトインすることでこれらのサービスにもCUD割引が適用され、全体的なクラウド費用を削減できる可能性があります。

対処方法:
1.  **既存リソースの確認**: 現在利用しているCompute Engine VMインスタンスの中に、M1, M2, M3, M4, H3インスタンスが含まれているか、またCloud RunサービスおよびCloud Run Functionsを利用しているかを確認してください。
2.  **Spend-based CUDモデルへの移行検討**: 上記リソースを利用している場合、Spend-based CUDモデルへの早期オプトインを検討し、割引メリットを享受することをお勧めします。詳細については、提供されているドキュメント「Spend-based CUDs program improvements」を参照してください。
3.  **自動移行の認識**: 2026年1月21日には全てのアカウントが自動的に新しいモデルに移行するため、それまでに新しいモデルの仕組みや自身の利用状況への影響を理解しておくことを推奨します。

用語説明:
*   **Committed Use Discounts (CUDs)**: コミットメント利用割引。Google Cloudのリソースを1年または3年の期間で利用することをコミットすることで得られる割引です。リソースタイプやリージョンを指定するリソースベースCUDと、費用全体に適用される費用ベースCUDがあります。
*   **Flexible CUDs**: フレキシブルなコミットメント利用割引。特定のVMファミリーやリージョンに縛られず、より広範囲の Compute Engine リソースに適用できるCUDです。
*   **Spend-based CUD model**: 費用ベースのCUDモデル。リソースの種類やリージョンに関わらず、対象となるサービスの利用費全体に対して割引が適用される新しいCUDモデルです。従来の特定リソースタイプに紐づくモデルよりも柔軟性が高い特徴があります。
*   **Memory-optimized VMs (M1, M2, M3, M4)**: 大容量メモリを必要とするワークロード（例：インメモリデータベース、SAP HANAなど）向けに最適化されたVMインスタンスシリーズです。
*   **Compute-optimized H3 instances**: 高性能コンピューティング (HPC) や大規模な並列処理、シミュレーションなど、高いCPU性能を必要とするワークロード向けに最適化されたVMインスタンスです。
*   **Cloud Run**: フルマネージドのサーバーレスプラットフォームで、コンテナ化されたアプリケーションをデプロイ・実行できます。リクエストに応じて自動的にスケーリングし、使用したリソースに対してのみ課金されます。
*   **Cloud Run Functions**: Cloud Run上で実行される、イベント駆動型のサーバーレス関数です。HTTPリクエストやPub/Subメッセージなどのイベントに応答してコードを実行します。
# Title: July 14, 2025 
Link: https://cloud.google.com/release-notes#July_14_2025<br>
# Cloud Composer
## Changed
原文: We're changing the way we provide support dates for Airflow builds in Cloud Composer 3. Before this change, some Airflow builds had their end of support date listed as "To be announced" until a later Airflow version became available. We're deprecating this approach for all builds that are released after July 01, 2025.

We are now providing support dates that depend on a date when a particular Airflow build was released:

- We are introducing the standard support period of 12 months after the release date.
- All Airflow builds that didn't have an end of support date when this change was introduced are supported until July 1, 2026. Because of this change, some Airflow builds released before July 1, 2025 are supported for longer than the standard support period. 
- All Airflow builds that had their support date shorter than 12 months are now supported for 12 months since the date of their initial release.
- All builds released after July 1, 2025 will use the standard support period.

[standard support period](https://cloud.google.com/composer/docs/composer-versioning-overview#version-deprecation-and-support)

説明: Cloud Composer 3におけるAirflowビルドのサポート期間提供方法が変更されます。以前は一部のAirflowビルドのサポート終了日が「To be announced（未定）」とされていましたが、このアプローチは2025年7月1日以降にリリースされるすべてのビルドで廃止されます。今後は、特定のAirflowビルドがリリースされた日付に基づいてサポート期間が提供されます。
主な変更点は以下の通りです。
- **標準サポート期間の導入**: リリース日から12ヶ月間の標準サポート期間が導入されます。
- **既存ビルドの延長**: この変更が導入された時点でサポート終了日が未定だったAirflowビルドは、2026年7月1日までサポートされます。これにより、2025年7月1日以前にリリースされた一部のビルドは、標準サポート期間より長くサポートされることになります。
- **短期サポートビルドの延長**: サポート期間が12ヶ月未満だったAirflowビルドは、初期リリース日から12ヶ月間サポートされるようになります。
- **将来のビルド**: 2025年7月1日以降にリリースされるすべてのビルドには、標準サポート期間が適用されます。

影響有無: **影響なし**
理由: 現在ご利用のCloud ComposerはComposer 2 (version 2.7.1) であり、このリリースノートで言及されている変更はCloud Composer 3に限定されています。Composer 2のサポートポリシーには直接影響しません。ただし、将来的にCloud Composer 3へのアップグレードを検討する際には、この新しいサポートポリシーが適用されるため考慮が必要です。

対処方法: 現時点での対応は不要です。将来Composer 3への移行を計画する際に、この変更がサポート期間計画に与える影響を評価してください。

用語説明:
*   **Airflowビルド**: Apache Airflowの特定のバージョンと、それに含まれる依存関係や設定がパッケージ化されたCloud Composer環境の実行イメージを指します。
*   **サポート期間**: Google Cloudが特定の製品バージョンや機能に対して、セキュリティアップデート、バグ修正、技術サポートを提供する期間を指します。
*   **Cloud Composer 3**: Google Cloudが提供するマネージドApache AirflowサービスであるCloud Composerのメジャーバージョンの一つです。Composer 2とは異なるアーキテクチャや機能が導入されています。

# Cloud Logging
## Libraries
原文: A weekly digest of client library updates from across the Cloud SDK.
## Java
原文: ## Changes for google-cloud-logging
[google-cloud-logging](https://github.com/googleapis/java-logging)
[3.23.0](https://github.com/googleapis/java-logging/compare/v3.22.6...v3.23.0)
- Next release from main branch is 3.23.0 (#1826) (f0ef15f)
[#1826](https://github.com/googleapis/java-logging/issues/1826)
[f0ef15f](https://github.com/googleapis/java-logging/commit/f0ef15f609a3400460bd8074bdd05014cc388743)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.50.1 (#1828) (44c3094)
[#1828](https://github.com/googleapis/java-logging/issues/1828)
[44c3094](https://github.com/googleapis/java-logging/commit/44c3094e23450f1a8e6bb397f209b17cf37a4345)

説明: Google Cloud LoggingのJavaクライアントライブラリ`google-cloud-logging`がバージョン3.22.6から3.23.0に更新されました。この更新には、内部的な変更として`com.google.cloud:sdk-platform-java-config`の依存関係がv3.50.1にアップデートされたことが含まれます。機能的な大きな変更や破壊的変更は報告されていません。

影響有無: **不明（アプリケーション依存）**
理由: 現在のシステムでJava言語を使用しており、`google-cloud-logging`クライアントライブラリを直接利用している場合に影響を受ける可能性があります。この更新は主に内部的な依存関係のアップデートであるため、通常、既存のコードに直接的な影響を与える可能性は低いと考えられますが、新しいバージョンでデプロイする際には互換性の確認が必要です。

対処方法:
1.  **利用状況の確認**: お使いのJavaアプリケーションが`google-cloud-logging`ライブラリを使用しているか確認してください。
2.  **アップグレードの検討**: 利用している場合、ライブラリのバージョンアップを検討してください。
3.  **テスト**: バージョンアップを行う場合は、テスト環境で十分な動作確認を実施し、既存のログ出力処理に問題がないことを確認してください。特に、依存関係の変更が予期せぬ副作用を引き起こさないか確認することが重要です。

用語説明:
*   **クライアントライブラリ**: 特定のクラウドサービス（この場合はCloud Logging）のAPIとやり取りを容易にするために提供される、プログラミング言語ごとのコードパッケージです。開発者はこれを使用することで、HTTPリクエストなどを直接記述することなくサービスを利用できます。
*   **依存関係 (Dependency)**: あるソフトウェアコンポーネントが、その機能を実現するために他のソフトウェアコンポーネントを必要とすることを指します。ライブラリの依存関係が更新されると、そのライブラリの動作や互換性に影響を与える可能性があります。
*   **Cloud SDK**: Google Cloud Platformのサービスを管理・操作するためのツールセット（CLIツールやクライアントライブラリなど）の総称です。

# Google Kubernetes Engine
## Fixed
原文: Windows NVMe attached disks are supported only in GKE version 1.33.2-gke.1240000 and later. In earlier GKE versions, creating PersistentVolumeClaims on Windows nodes that use NVMe volumes results in errors. For more information about the disk interface types that are used by machine families, see the Compute Engine Machine series comparison.
If you have Windows workloads that use machine families that support only NVMe, upgrade your clusters to version 1.33.2-gke.1240000 or later.

説明: GKEのWindowsノードにおいて、NVMeインターフェースのディスクがGKEバージョン1.33.2-gke.1240000以降でのみサポートされるようになりました。これより古いGKEバージョンでは、NVMeボリュームを使用するWindowsノード上でPersistentVolumeClaim（PVC）を作成しようとするとエラーが発生していました。この問題が解決されたため、WindowsワークロードでNVMeディスクを利用する場合は、指定されたバージョン以降へのアップグレードが必要です。

影響有無: **影響なし（現在の環境にWindowsノードの利用がない場合）**
理由: 現在のGKEクラスターでWindowsノードを使用しておらず、かつNVMeディスクを利用する予定もない場合、この修正による直接的な影響はありません。ただし、将来的にWindowsノードとNVMeディスクの組み合わせを使用する可能性がある場合は、この情報を考慮する必要があります。

対処方法:
1.  **利用状況の確認**: お使いのGKEクラスターでWindowsノードを使用しているか、また、NVMeインターフェースのディスクを利用する予定があるかを確認してください。
2.  **アップグレードの検討**: もしWindowsノードでNVMeディスクを使用している、または使用を計画している場合で、GKEクラスターのバージョンが1.33.2-gke.1240000より古い場合は、指定バージョン以降へアップグレードすることを検討してください。

用語説明:
*   **NVMe (Non-Volatile Memory Express)**: 高速なSSDストレージを接続するためのインターフェース仕様です。従来のSATA接続と比較して、より高いスループットと低いレイテンシを提供します。
*   **PersistentVolumeClaim (PVC)**: Kubernetesにおいて、ストレージリソースを要求（クレーム）するためのAPIオブジェクトです。アプリケーションが永続ストレージを必要とする際に利用します。
*   **Windowsノード**: GKEクラスター内で、Windows Serverオペレーティングシステムを実行しているノード（仮想マシン）を指します。Windowsベースのコンテナワークロードを実行する際に使用されます。
*   **GKEバージョン**: Google Kubernetes Engineのコントロールプレーンおよびノードで実行されるKubernetesのバージョンです。特定の機能や修正は特定のGKEバージョンで提供されます。
*   **マシンシリーズ**: Compute Engineが提供する仮想マシンのタイプ（例: N2, E2, C3など）で、CPU、メモリ、利用可能なディスクインターフェースなどに特徴があります。

# Pub/Sub
## Libraries
原文: A weekly digest of client library updates from across the Cloud SDK.
## Python
原文: ## Changes for google-cloud-pubsub
[google-cloud-pubsub](https://github.com/googleapis/python-pubsub)
[2.31.0](https://github.com/googleapis/python-pubsub/compare/v2.30.0...v2.31.0)
- Add MessageTransformationFailureReason to IngestionFailureEvent (#1427) (8ab13e1)
[#1427](https://github.com/googleapis/python-pubsub/issues/1427)
[8ab13e1](https://github.com/googleapis/python-pubsub/commit/8ab13e1b71c151f0146548e7224dd38c9d719a88)
- Surface Fatal Stream Errors to Future; Adjust Retryable Error Codes (#1422) (e081beb)
[#1422](https://github.com/googleapis/python-pubsub/issues/1422)
[e081beb](https://github.com/googleapis/python-pubsub/commit/e081beb29056035304d365ec9c50fa7ffbac6886)

説明: Google Cloud Pub/SubのPythonクライアントライブラリ`google-cloud-pubsub`がバージョン2.30.0から2.31.0に更新されました。このアップデートには以下の機能追加とバグ修正が含まれています。
-   **機能追加**: `IngestionFailureEvent`に`MessageTransformationFailureReason`が追加され、メッセージ変換失敗時の理由がより詳細にわかるようになりました。
-   **バグ修正**: ストリームに関する致命的なエラー（Fatal Stream Errors）が`Future`オブジェクトでより適切に扱われるようになり、リトライ可能なエラーコードが調整されました。これにより、エラーハンドリングと堅牢性が向上します。

影響有無: **不明（アプリケーション依存）**
理由: 現在のシステムでPython言語を使用しており、`google-cloud-pubsub`クライアントライブラリを直接利用している場合に影響を受ける可能性があります。特に、Pub/Subメッセージの処理におけるエラーハンドリングの改善が含まれているため、より詳細なエラー情報の取得や、堅牢なストリーム処理が期待できます。既存のアプリケーションがこれらの新しい機能や修正を利用しない場合でも、バージョンアップによる安定性向上は期待できます。

対処方法:
1.  **利用状況の確認**: お使いのPythonアプリケーションが`google-cloud-pubsub`ライブラリを使用しているか確認してください。
2.  **アップグレードの検討**: 利用している場合、ライブラリのバージョンアップを検討してください。
3.  **テスト**: バージョンアップを行う場合は、テスト環境で十分な動作確認を実施し、特にPub/Subメッセージの送受信、エラーハンドリング、再試行ロジックに問題がないことを確認してください。`IngestionFailureEvent`や`Fatal Stream Errors`のハンドリングを改善したい場合は、コードの変更も検討してください。

用語説明:
*   **クライアントライブラリ**: 特定のクラウドサービス（この場合はCloud Pub/Sub）のAPIとやり取りを容易にするために提供される、プログラミング言語ごとのコードパッケージです。
*   **IngestionFailureEvent**: Pub/Subにおいて、メッセージの取り込み（Ingestion）に失敗した際に発生するイベントやその情報を格納するオブジェクトを指します。
*   **MessageTransformationFailureReason**: メッセージの変換処理が失敗した際の具体的な理由を示す情報です。これにより、失敗の原因を特定しやすくなります。
*   **Fatal Stream Errors**: Pub/Subのストリーム処理において発生する、回復不可能な重大なエラーを指します。
*   **Future**: 非同期処理の結果を表現するためのオブジェクトです。ここでは、Pub/Subのメッセージ送信や受信処理の結果がFutureオブジェクトを通じて通知され、エラーもそこに反映されることを意味します。
# Title: July 11, 2025 
Link: https://cloud.google.com/release-notes#July_11_2025<br>
リリースノートを元に、製品ごとの影響調査結果を以下に報告いたします。

# Google Kubernetes Engine
## Changed
原文:
> **Note:** Your clusters might not have these versions available. Rollouts are
already in progress when we publish the release notes, and can take multiple
days to complete across all Google Cloud zones.
>
> - The following versions are now available in the Extended channel:
>     - 1.28.15-gke.2461000
>     - 1.29.15-gke.1614000
>     - 1.30.12-gke.1320000
>     - 1.31.9-gke.1287000
>     - 1.32.4-gke.1767000
>     - 1.33.2-gke.1043000
> (以下、Rapid/Regular/Stable/No channelのバージョン更新情報、および総括的なアナウンスが続くため省略)
> GKE cluster versions have been updated.
> **New versions available for upgrades and new clusters.**
> The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

説明：
Google Kubernetes Engine (GKE) の各リリースチャンネル（Extended, Rapid, Regular, Stable）および一般提供（No channel）において、新しいKubernetesバージョンが利用可能になりました。これらのバージョンは、新規クラスタの作成、既存クラスタのコントロールプレーンおよびノードのアップグレードに利用できます。

利用可能になった主なバージョンは以下の通りです。
*   **Extended channel:** 1.28.15-gke.2461000 から 1.33.2-gke.1043000 まで
*   **Rapid channel:** 1.30.12-gke.1340000 から 1.33.2-gke.1240000 まで
*   **Regular channel:** 1.30.12-gke.1320000 から 1.33.2-gke.1043000 まで
*   **Stable channel:** 1.30.12-gke.1246000 から 1.32.4-gke.1603000 まで
*   **No channel (一般提供):** コントロールプレーンおよびノードの最新版として、1.30.12-gke.1340000 から 1.33.2-gke.1240000 (コントロールプレーン)、1.28.15-gke.2461000 から 1.33.2-gke.1240000 (ノード) が利用可能です。

影響有無：
直接的な影響はありません。本アナウンスは新しいバージョンが利用可能になったことを示すものであり、既存のクラスタが直ちにアップグレードされるわけではありません。ただし、自動アップグレードが有効なクラスタでは、設定されたメンテナンスウィンドウ中にこれらの新バージョンへアップグレードされる可能性があります。
当社で利用中のGoogle Cloud Composer 2 (Compoer version 2.7.1、Airflow version 2.7.3) 環境はGKE上で動作しますが、Composerの基盤となるGKEバージョンはGoogle Cloud Composer側で管理されており、ユーザーが直接GKEバージョンを操作することは通常ありません。Composerの特定のバージョンがサポートするGKEバージョン範囲内で動作するため、今回のGKEのバージョン更新がComposer環境に直接的な影響を与える可能性は低いと判断します。

対処方法：
*   現在ご利用のGKEクラスタのバージョンとリリースチャンネルを確認し、アップグレード計画に影響があるか検討してください。
*   自動アップグレードが有効なクラスタの場合、Kubernetesのマイナーバージョンアップグレードに伴う潜在的な非互換性がないか、アプリケーションの互換性テストを実施することを推奨します。
*   GKEのバージョンアップグレードに関する詳細は、公式ドキュメント「[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)」および「[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)」を参照してください。

用語説明：
*   **GKEリリースチャンネル (Release Channels):** GKEクラスタのKubernetesバージョンの更新頻度と安定性レベルを管理するための設定です。Rapid、Regular、Stable、Extendedの4種類があり、Rapidが最も早く最新バージョンが提供され、Extendedが最も長期間サポートされるバージョンを提供します。
*   **コントロールプレーン (Control Plane):** Kubernetesクラスタの管理層であり、APIサーバー、スケジューラー、コントローラーマネージャーなどのコンポーネントが含まれます。
*   **ノード (Node):** Kubernetesクラスタのワーカーマシンで、Podが実際に動作するCompute Engine VMインスタンスです。

---

# Security Command Center
## Feature
原文:
> Notebook Security Scanner is a built-in package vulnerability detection service of Security Command Center. This feature is available in Preview to the Security Command Center Premium or Enterprise tier.
> You can enable and use Notebook Security Scanner to detect vulnerabilities in Python packages that are used in Colab Enterprise notebooks (files with the `ipynb` filename extension) and resolve those package vulnerability findings.

説明：
Security Command Center に Notebook Security Scanner という新機能が追加されました。この機能は、Colab Enterprise ノートブック (ipynbファイル) で使用されているPythonパッケージの脆弱性を検出する組み込みサービスです。本機能は、Security Command Center の Premium または Enterprise ティアでプレビューとして利用可能です。

影響有無：
影響はありません。これは新機能の追加であり、既存のサービスや構成に直接的な影響を与えるものではありません。当社の環境ではColab Enterpriseノートブックを直接利用していないため、現時点での関連性はありません。

対処方法：
Colab Enterpriseノートブックを利用しており、そのセキュリティ体制強化に関心がある場合は、Security Command Center Premium/Enterpriseティアを有効化し、本機能を試すことを検討してください。

用語説明：
*   **Security Command Center (SCC):** Google Cloud のセキュリティ状態管理および脆弱性検出サービスです。組織全体のセキュリティインサイトを提供します。
*   **Colab Enterprise:** Google Cloud 上で大規模な機械学習ワークフローを構築・実行するためのコラボレーションノートブック環境です。

---

# Vertex AI
## Feature
原文:
> To reduce the cost of running your inference jobs, you can now use flex-start VMs, which are powered by Dynamic Workload Scheduler. Flex-start VMs offer significant discounts and are well-suited for
short-duration workloads. This feature is available in Preview.
> For more information, see Use DWS flex-start VMs with inference.

説明：
Vertex AI の推論ジョブにおいて、コスト削減のための新しい機能として flex-start VMs が利用可能になりました。このVMはDynamic Workload Scheduler (DWS) によって駆動され、大幅な割引が提供されるため、短期間のワークロードに特に適しています。本機能は現在プレビュー段階です。

影響有無：
影響はありません。これは新機能の追加であり、既存のサービスや構成に直接的な影響を与えるものではありません。当社の環境ではVertex AIの推論ジョブをflex-start VMsで実行する構成は現在利用していないため、現時点での関連性はありません。

対処方法：
Vertex AIで推論ジョブを実行しており、特に短期間のワークロードにおいてコスト削減を検討している場合は、本機能を試すことを検討してください。詳細については、公式ドキュメント「[Use DWS flex-start VMs with inference](https://cloud.google.com/vertex-ai/docs/general/dws-flex-start-vms-inference)」を参照してください。

用語説明：
*   **Vertex AI:** Google Cloud が提供する機械学習プラットフォームです。データの準備からモデルの構築、デプロイ、管理まで、機械学習のライフサイクル全体をサポートします。
*   **推論ジョブ (Inference Jobs):** トレーニング済みの機械学習モデルを使用して、新しいデータに対して予測を行う処理です。
*   **flex-start VMs:** Dynamic Workload Scheduler (DWS) によって管理されるVMで、短期間のワークロード向けにコスト効率の高いリソース提供を目的としています。
# Title: July 09, 2025 
Link: https://cloud.google.com/release-notes#July_09_2025<br>
# Cloud Composer

## Announcement
原文: A new Cloud Composer release has started on **July 9, 2025**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.
説明: 2025年7月9日から新しいCloud Composerのリリースが開始されました。このリリースは現在展開中であり、記載されている変更や機能がまだ利用できないリージョンがある可能性があります。
影響有無: **影響なし**。これは新しいリリースが開始されたことの事前アナウンスであり、現在の環境に直接的な変更や影響を与えるものではありません。今後のリリース内容に注意を払う必要はありますが、即座の対応は不要です。
対処方法: 特になし。今後のリリースノートを継続的に確認し、関連する変更がないか注視してください。
用語説明: なし。

## Changed
原文: We are gradually rolling out a change that **switches the default version** from Cloud Composer 2 to Cloud Composer 3 in the Cloud Composer API.

In regions where the change is rolled out, a Cloud Composer 3 environment is created by default when a version is not specified in Google Cloud CLI, Cloud Composer API, or Terraform. If you use automation scripts to provision Cloud Composer 2 environments, make sure that you explicitly specify a Cloud Composer 2 version.

In this release, the change is rolling out in the following regions: africa-south1, asia-northeast2, asia-south2, asia-southeast2, europe-southwest1, europe-west10, europe-west12, europe-west8, me-central1, me-central2, me-west1, southamerica-west1, and us-south1.
説明: Cloud Composer APIにおけるデフォルトバージョンが、Cloud Composer 2からCloud Composer 3に順次切り替えられます。これにより、Google Cloud CLI、Cloud Composer API、またはTerraformを使用してバージョンを明示的に指定せずに新しい環境を作成した場合、デフォルトでCloud Composer 3環境が作成されるようになります。自動化スクリプトでCloud Composer 2環境をプロビジョニングしている場合は、明示的にCloud Composer 2のバージョンを指定する必要があります。この変更は、アフリカ、アジアの一部、ヨーロッパの一部、中東、南米、us-south1などの特定のリージョンから展開されます。
影響有無: **影響あり**。現在Cloud Composer 2 (2.7.1) を利用しており、新規環境のプロビジョニングを自動化スクリプト（gcloud CLI、Cloud Composer API、Terraformなど）で行っている場合、バージョンを明示的に指定していないと、意図せずCloud Composer 3環境が作成される可能性があります。特に、お客様の利用リージョンが影響対象に含まれる場合は注意が必要です。
対処方法:
1.  新規にCloud Composer環境をプロビジョニングする際に使用している全ての自動化スクリプト（gcloud CLIコマンド、APIコール、Terraform設定など）を確認してください。
2.  Cloud Composer 2環境を意図して作成する場合、`composer-2.x.x-airflow-x.x.x` のように、Cloud Composerのバージョンを明示的に指定するようにスクリプトを修正してください。
3.  お客様が利用されているCloud Composer環境のリージョンが、今回の変更が適用されるリージョンリストに含まれていないか確認してください。
用語説明:
*   **プロビジョニング (Provisioning)**: ITインフラストラクチャやサービスを準備し、利用可能な状態にすることを指します。ここでは、Cloud Composer環境を新規に作成するプロセスを意味します。
*   **Google Cloud CLI (gcloud CLI)**: Google Cloudのサービスをコマンドラインから管理するためのツールです。
*   **Cloud Composer API**: プログラムからCloud Composer環境を作成、管理するためのAPIです。
*   **Terraform**: インフラストラクチャをコードとして定義し、自動的にプロビジョニングおよび管理するためのオープンソースツールです。

## Changed
原文: *(Available without upgrading)* During Cloud Composer 2 environment operations, a more informative error message is returned when an environment's web server has connectivity issues.
説明: Cloud Composer 2環境の運用中、ウェブサーバーに接続問題が発生した場合に、より詳細で情報量の多いエラーメッセージが返されるようになります。この変更は環境のアップグレードなしで利用可能です。
影響有無: **影響なし**。この変更はエラーメッセージの改善であり、既存のCloud Composer 2環境の動作に負の影響を与えるものではありません。むしろトラブルシューティングが容易になるため、運用上のメリットがあります。
対処方法: 特になし。
用語説明:
*   **ウェブサーバー (Web Server)**: Cloud Composerにおいて、AirflowのWeb UIを提供するサーバーコンポーネントを指します。

## Changed
原文: New Airflow builds are available in Cloud Composer 3:
- composer-3-airflow-2.10.5-build.9 (default)
- composer-3-airflow-2.9.3-build.29
説明: Cloud Composer 3向けに新しいAirflowビルド（イメージ）が利用可能になりました。デフォルトは`composer-3-airflow-2.10.5-build.9`です。
影響有無: **影響なし**。現在利用中のCloud Composerのバージョンは2 (Composer 2.7.1) であり、この変更はCloud Composer 3向けのものです。したがって、現在の環境には直接的な影響はありません。
対処方法: 特になし。
用語説明:
*   **Airflow builds**: 特定のAirflowバージョンとCloud Composerの組み合わせで提供される、実行環境となるイメージのことです。

## Changed
原文: New images are available in Cloud Composer 2:
- composer-2.13.7-airflow-2.10.5 (default)
- composer-2.13.7-airflow-2.9.3
説明: Cloud Composer 2向けに新しいイメージが利用可能になりました。`composer-2.13.7-airflow-2.10.5`がデフォルト、`composer-2.13.7-airflow-2.9.3`も選択可能です。
影響有無: **影響あり**。現在、Cloud Composer 2 (2.7.1、Airflow 2.7.3) をご利用中です。新しいイメージではAirflowのバージョンが2.9.3または2.10.5に更新されており、これらの新機能や修正を利用したい場合は、既存環境のアップグレードが必要になります。Airflowのバージョンアップに伴い、DAGの互換性確認や、利用しているPythonパッケージ、カスタムプラグインの動作確認が必要になる可能性があります。
対処方法:
1.  新しいAirflowバージョン（2.9.3または2.10.5）の新機能、変更点、非推奨機能などを公式ドキュメントで確認してください。
2.  既存のDAGやカスタムコードが新しいAirflowバージョンで問題なく動作するか、テスト環境で十分に検証してください。
3.  アップグレードを実施する場合は、[Cloud Composer 環境の更新](https://cloud.google.com/composer/docs/update-environments)のドキュメントを参照し、計画的に実施してください。
用語説明:
*   **イメージ (Image)**: Cloud Composer環境の基盤となるソフトウェアスタック（OS、Airflow、依存パッケージなど）をパッケージ化したものです。環境をアップグレードする際に、新しいイメージが適用されます。

## Deprecated
原文: Cloud Composer versions 2.8.4 and 2.8.5 have reached their end of support period.
説明: Cloud Composerのバージョン2.8.4および2.8.5が、サポート終了期間に達しました。
影響有無: **影響なし**。現在利用中のCloud Composerのバージョンは2.7.1であり、このリストに含まれていません。したがって、現在の環境に直接的な影響はありません。
対処方法: 特になし。ただし、現在ご利用中の2.7.1も将来的にサポート終了を迎えるため、定期的にバージョンアップロードマップを確認し、将来的なアップグレード計画を検討することをお勧めします。
用語説明:
*   **サポート終了 (End of Support period)**: 製品や特定のバージョンに対して、ベンダーからの技術サポート、セキュリティパッチ、バグ修正などの提供が終了する期間を指します。サポートが終了したバージョンを使い続けると、セキュリティリスクや問題発生時の対応が困難になる可能性があります。

---

# Cloud Service Mesh

## Announcement
原文: **1.25.3-asm.8 is now available for in-cluster Cloud Service Mesh.**

You can now download 1.25.3-asm.8 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.25.3 subject to the list of supported features. Cloud Service Mesh version 1.25.3-asm.8 uses envoy v1.33.4-dev.
説明: in-cluster Cloud Service Mesh向けにバージョン1.25.3-asm.8が利用可能になりました。このバージョンはIstio 1.25.3の機能をサポートしており、Envoy v1.33.4-devを使用しています。
影響有無: **影響なし**。お客様の利用サービスにCloud Service Meshは含まれていません。
対処方法: 特になし。
用語説明:
*   **in-cluster Cloud Service Mesh**: Anthos Service Mesh (ASM) のデプロイモードの一つで、サービスメッシュのコントロールプレーンがユーザーのGKEクラスタ内にデプロイされる形式を指します。
*   **Istio**: マイクロサービス間の通信を管理、保護、監視するためのオープンソースのサービスメッシュプラットフォームです。
*   **Envoy**: Istioで使用される高性能なオープンソースのエッジおよびサービスプロキシです。

## Announcement
原文: **1.24.6-asm.4 is now available for in-cluster Cloud Service Mesh.**

You can now download 1.24.6-asm.4 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.24.6 subject to the list of supported features. Cloud Service Mesh version 1.24.6-asm.4 uses envoy v1.32.7-dev.
説明: in-cluster Cloud Service Mesh向けにバージョン1.24.6-asm.4が利用可能になりました。このバージョンはIstio 1.24.6の機能をサポートしており、Envoy v1.32.7-devを使用しています。
影響有無: **影響なし**。お客様の利用サービスにCloud Service Meshは含まれていません。
対処方法: 特になし。
用語説明: 上記の「in-cluster Cloud Service Mesh」、「Istio」、「Envoy」と同様です。

## Changed
原文: **1.23.6-asm.11 is now available for in-cluster Cloud Service Mesh.**

You can now download 1.23.6-asm.11 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.23.6 subject to the list of supported features. Cloud Service Mesh version 1.23.6-asm.11 uses envoy v1.31.9-dev.
説明: in-cluster Cloud Service Mesh向けにバージョン1.23.6-asm.11が利用可能になりました。このバージョンはIstio 1.23.6の機能をサポートしており、Envoy v1.31.9-devを使用しています。
影響有無: **影響なし**。お客様の利用サービスにCloud Service Meshは含まれていません。
対処方法: 特になし。
用語説明: 上記の「in-cluster Cloud Service Mesh」、「Istio」、「Envoy」と同様です。
# Title: July 08, 2025 
Link: https://cloud.google.com/release-notes#July_08_2025<br>
# BigQuery
## Announcement
原文: Starting August 1, 2025, GoogleSQL will become the default dialect for queries run from the command line interface (CLI) or API. To use LegacySQL, you will need to explicitly specify it in your requests or set the configuration setting `default_sql_dialect_option` to `'default_legacy_sql'` at the project or organization level.
[set the configuration setting](https://cloud.google.com/bigquery/docs/reference/standard-sql/data-definition-language#alter_project_set_options_statement)

説明:
2025年8月1日より、BigQueryのコマンドラインインターフェース (CLI) またはAPI経由で実行されるクエリのデフォルトSQL方言が、GoogleSQLに変更されます。Legacy SQLを継続して使用する場合は、クエリごとに明示的にLegacy SQLを指定するか、プロジェクトまたは組織レベルで `default_sql_dialect_option` 設定を `'default_legacy_sql'` に設定する必要があります。

影響有無:
**影響がある可能性があります。**
現在、CLIまたはAPIからLegacy SQLをデフォルトとして使用しているクエリがある場合、2025年8月1日以降、これらのクエリはGoogleSQLとして解釈されるため、構文エラーや意図しない結果を引き起こす可能性があります。Cloud ConsoleなどのUIからのクエリでは、クエリエディタでSQL方言を選択できるため、直接的な影響は少ないですが、デフォルト設定に依存している場合は注意が必要です。

対処方法:
1.  **現行状況の確認**: 現在、CLIまたはAPI経由でLegacy SQLをデフォルトとして使用しているワークロードがないか確認してください。
2.  **GoogleSQLへの移行**: 該当するクエリが存在する場合、2025年8月1日までにGoogleSQLへの移行を強く推奨します。GoogleSQLはより多くの機能とパフォーマンスの利点を提供します。
3.  **Legacy SQLの継続利用**: GoogleSQLへの移行が困難な場合は、以下のいずれかの対応を検討してください。
    *   **クエリごとの明示的指定**: 各APIリクエストまたはbqコマンドにおいて、Legacy SQLを明示的に指定するオプションを追加します。
    *   **プロジェクト/組織レベルでの設定変更**: プロジェクトまたは組織のレベルで `default_sql_dialect_option` を `'default_legacy_sql'` に設定します。この設定は、そのスコープ内のすべてのクエリに影響を与えるため、慎重な評価とテストが必要です。

用語説明:
*   **GoogleSQL**: BigQueryの標準SQL方言であり、ANSI SQL 2011に準拠しています。より現代的なSQL機能を提供し、推奨されています。
*   **Legacy SQL**: BigQueryの以前のSQL方言です。GoogleSQLとは構文やセマンティクスが異なる部分があります。
*   **CLI (Command Line Interface)**: コマンドラインからBigQueryを操作するためのツール群（例: `bq` コマンド）。
*   **API**: プログラムからBigQueryサービスを操作するためのインターフェース（例: REST API、クライアントライブラリ）。

---

# Google Cloud Armor
## Changed
原文: Cloud Armor preconfigured WAF rules can now inspect up to the first 64kB (either 8kB, 16kB, 32kB, 48kB, or 64kB) of the POST or PATCH request body content in Preview.
[preconfigured WAF rules](https://cloud.google.com/armor/docs/waf-rules)
[request body content](https://cloud.google.com/armor/docs/security-policy-overview#post-body)

説明:
Google Cloud Armorの事前構成WAFルールにおいて、POSTまたはPATCHリクエストのボディコンテンツの検査可能な最大サイズが、従来の8KBから64KB（8KB, 16KB, 32KB, 48KB, 64KBのいずれかを選択可能）まで拡張されました。この機能は現在プレビュー版として提供されています。

影響有無:
**直接的な影響はありません。**
この変更は、Cloud Armorのセキュリティ機能の強化であり、既存のWAFルールの動作に自動的に変更を加えるものではありません。より大きなリクエストボディに対するWAF検査を必要とする場合に、セキュリティポリシーを強化する選択肢が増えるというポジティブな影響があります。

対処方法:
*   もし現在Cloud Armorを利用しており、WAFルールによるPOST/PATCHリクエストボディの検査深度を向上させたいニーズがある場合、この新機能の利用を検討してください。
*   具体的な設定変更は、Cloud Armorのセキュリティポリシー内で、WAFルール（シグネチャ）を設定する際に、検査対象のボディサイズを指定するオプションを確認してください。
*   本機能はプレビュー段階であるため、本番環境への適用前には十分なテストと評価を実施し、機能の安定性や意図しない副作用がないことを確認してください。

用語説明:
*   **Cloud Armor**: Google Cloudが提供するDDoS攻撃対策およびWeb Application Firewall (WAF) サービスです。
*   **WAF (Web Application Firewall)**: WebアプリケーションをSQLインジェクション、クロスサイトスクリプティング (XSS) などのWebベースの攻撃から保護するファイアウォールです。
*   **Preconfigured WAF rules**: Cloud Armorが提供する、OWASP Top 10などの一般的なWebアプリケーション脆弱性に対応する既製のWAFルールセットです。
*   **POST/PATCH request body**: HTTPのPOSTまたはPATCHメソッドで送信されるリクエストの本体（ペイロード）部分です。通常、クライアントからサーバーへデータを送信するために使用されます。
*   **Preview**: Google Cloudにおいて、一般公開前の機能やサービスを示す用語です。プレビュー版は、機能が変更される可能性や、サポートレベルが限定的である場合があります。本番環境での利用には注意が必要です。