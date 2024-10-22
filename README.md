
Title: October 21, 2024
Link: https://cloud.google.com/release-notes#October_21_2024
## Cloud Logging リリースノート 분석

### 1. Go Libraries 업데이트

**原文 (英語)**

#### Changes for logging/apiv2

[logging/apiv2](https://github.com/googleapis/google-cloud-go/tree/main/logging/apiv2)
[1.12.0](https://github.com/googleapis/google-cloud-go/compare/logging/v1.11.0...logging/v1.12.0)
- **logging:** Add support for Go 1.23 iterators (84461c0)

[84461c0](https://github.com/googleapis/google-cloud-go/commit/84461c0ba464ec2f951987ba60030e37c8a8fc18)
- **logging:** Bump dependencies (2ddeb15)
- **logging:** Fixed input validation for X-Cloud-Trace-Context; encoded spanID from XCTC header into hex string. (#10979) (a157558)
- **logging:** Update google.golang.org/api to v0.191.0 (5b32644)

[2ddeb15](https://github.com/googleapis/google-cloud-go/commit/2ddeb1544a53188a7592046b98913982f1b0cf04)
[#10979](https://github.com/googleapis/google-cloud-go/issues/10979)
[a157558](https://github.com/googleapis/google-cloud-go/commit/a157558fd92adb1e6f608d5764316652e06dcd02)
[5b32644](https://github.com/googleapis/google-cloud-go/commit/5b32644eb82eb6bd6021f80b4fad471c60fb9d73)


**説明**

Cloud LoggingのGo用クライアントライブラリ `logging/apiv2` がバージョン1.12.0にアップデートされました。主な変更点は以下のとおりです。

- Go 1.23のイテレータのサポートが追加されました。
- 依存関係が更新されました。
- `X-Cloud-Trace-Context` ヘッダーの入力検証を修正し、spanIDを16進数文字列にエンコードするようにしました。
- `google.golang.org/api` がバージョン `v0.191.0` にアップデートされました。

**製品への影響有無**

* Google Cloud Composer, Google Kubernetes Engineを利用している場合、Go言語でCloud Loggingを利用するアプリケーションに影響する可能性があります。

**対処方法**

* Go 1.23を利用する場合は、最新バージョン `logging/apiv2` v1.12.0 を利用するようにしてください。
* 上記以外の環境でも最新バージョンを利用することを推奨します。

---

### 2. Python Libraries 업데이트

**原文 (英語)**
#### Changes for google-cloud-logging

[google-cloud-logging](https://github.com/googleapis/python-logging)
[3.11.3](https://github.com/googleapis/python-logging/compare/v3.11.2...v3.11.3)
- 16-bit hexadecimal formatting for XCTC span IDs (#946) (1f2b190)

[#946](https://github.com/googleapis/python-logging/issues/946)
[1f2b190](https://github.com/googleapis/python-logging/commit/1f2b190c0d1a7125d9412c157915d0011cdd4c47)


**説明**

Cloud LoggingのPython用クライアントライブラリ `google-cloud-logging` がバージョン 3.11.3 にアップデートされました。主な変更点は `X-Cloud-Trace-Context`  (XCTC) ヘッダーの span ID が16進数表記でフォーマットされるようになったことです。

**製品への影響有無**

* Google Cloud Composer, Google Kubernetes Engineを利用している場合、Python言語でCloud Loggingを利用するアプリケーションに影響する可能性があります。

**対処方法**

* 最新バージョン `google-cloud-logging` v3.11.3 を利用するようにしてください。

--- 

**참고** 

* ご利用のアプリケーションで上記ライブラリを利用している場合は、変更内容をご確認の上、最新バージョンへのアップデートをご検討ください。 
* 今回のリリースノートに記載されている変更点は、GoとPythonのクライアントライブラリに関するもののみです。 
* Google Cloud Composer, Google Kubernetes Engine のバージョン (Composer version 2.7.1、Airflow version 2.7.3、GKE 1.29, 1.30) への直接的な影響はありません。 

Title: October 18, 2024
Link: https://cloud.google.com/release-notes#October_18_2024
## Cloud Load Balancing: HTTP/2 Request Parsing Stricter 

**Original Announcement (English):**

Previously, the classic external Application Load Balancer had lenient HTTP/2 request parsing that did not reject requests containing certain invalid characters in the request path. The same requests would have been rejected if they had arrived over HTTP/1 or HTTP/3.

Now, all HTTP requests, including HTTP/2 requests, are rejected if the path contains a character that isn't one of the following:

- An allowed ASCII character specified in RFC 3986, sections 3.3 and 3.4.
- One of the following special allowed characters: `[  ]  { } | ^`

All other characters must be properly URL encoded. 

You can identify rejected requests in the proxy logs by looking for the following:

- `responseCode`: 400
- `response_code_details`: `invalid_http2_client_header_format`


**Explanation (Japanese):**

従来、Classic External Application Load Balancer は、リクエストパスに特定の無効な文字が含まれていても、HTTP/2 リクエストを拒否しない、緩やかなパース処理を行っていました。 同じリクエストが HTTP/1 や HTTP/3 で到着した場合には拒否されていました。

今回の変更により、HTTP/2 リクエストを含むすべての HTTP リクエストにおいて、パスに以下のいずれかの文字が含まれていない場合は拒否されるようになりました。

- RFC 3986 のセクション 3.3 および 3.4 で規定されている、許可された ASCII 文字。
- 以下の特殊な許可文字：`[  ]  { } | ^`

その他の文字はすべて、適切に URL エンコードする必要があります。

拒否されたリクエストは、プロキシログで以下を探すことで識別できます。

- `responseCode`: 400
- `response_code_details`: `invalid_http2_client_header_format`

**製品への影響有無:**

- Classic External Application Load Balancer を利用しており、URLパスに許可されていない文字列を含むHTTP/2リクエストを送信している場合、影響を受ける可能性があります。

**対処方法:**

- URLパスに許可されていない文字列が含まれている場合は、RFC 3986 に基づいて適切にURLエンコードしてください。 

Title: October 17, 2024
Link: https://cloud.google.com/release-notes#October_17_2024
## Google Kubernetes Engine リリースノート 분석

このリリースノートは、Google Kubernetes Engine (GKE) の各チャネル(Rapid, Regular, Stable, Extended, No channel) における Kubernetes バージョンのアップデート情報を提供しています。

各チャネルで、利用可能なバージョン、廃止されたバージョン、自動アップグレードの対象バージョンが記載されています。

**以下、製品・アナウンス単位の説明と、製品への影響有無、対処方法です。**

**製品**: Google Kubernetes Engine

**対象バージョン**:  1.27, 1.28, 1.29, 1.30, 1.31

**各チャネル共通**:

* **説明**: GKE クラスタバージョンが更新されました。新しいバージョンがアップグレードと新規クラスタに利用可能になりました。
* **製品への影響**: 各チャネルで利用可能な Kubernetes バージョン、廃止されたバージョン、自動アップグレード対象バージョンが変更されます。
* **対処方法**: 
    * 各チャネルの変更点を把握し、利用したいバージョンが利用可能かどうかを確認してください。
    * 自動アップグレードが有効になっているクラスタは、自動的に新しいバージョンにアップグレードされます。
    * メンテナンスの除外などによりマイナーバージョンへのアップグレードができないクラスタのために、パッチのみのバージョンアップグレードターゲットも提供されています。

**Rapid channel**:

* **説明**:  
    * 新しいバージョン: 1.28.14-gke.1340000, 1.29.9-gke.1496000, 1.30.5-gke.1443001, 1.31.1-gke.1846000 が利用可能になりました。
    * 廃止されたバージョン: 1.28.14-gke.1175000, 1.31.1-gke.1621000 は廃止されました。

**Regular channel**:

* **説明**:
    * 廃止されたバージョン: 1.28.14-gke.1004000, 1.29.8-gke.1278000 は廃止されました。
    * 自動アップグレード:
        * 1.27 から 1.28.14-gke.1099000
        * 1.28 から 1.29.9-gke.1177000
    * パッチのみの自動アップグレード:
        * 1.28 から 1.28.14-gke.1099000
        * 1.29 から 1.29.9-gke.1177000

**Stable channel**:

* **説明**:
    * デフォルトバージョン: 1.30.4-gke.1348001 が Stable チャネルのクラスタ作成時のデフォルトバージョンになりました。
    * 新しいバージョン: 1.28.14-gke.1004000, 1.29.8-gke.1278000, 1.30.5-gke.1014001 が利用可能になりました。
    * 廃止されたバージョン: 1.28.13-gke.1049000, 1.29.8-gke.1096000, 1.30.3-gke.1969002 は廃止されました。
    * 自動アップグレード:
        * 1.27 から 1.28.13-gke.1119000
        * 1.28 から 1.29.8-gke.1211000
        * 1.29 から 1.30.4-gke.1348001
    * パッチのみの自動アップグレード:
        * 1.28 から 1.28.13-gke.1119000
        * 1.29 から 1.29.8-gke.1211000
        * 1.30 から 1.30.4-gke.1348001

**Extended channel**:

* **説明**:
    * 新しいバージョン: 1.27.16-gke.1681000 が利用可能になりました。
    * 廃止されたバージョン: 1.27.16-gke.1576000, 1.28.14-gke.1004000, 1.29.8-gke.1278000 は廃止されました。
    * 自動アップグレード:
        * 1.28 から 1.28.14-gke.1099000
        * 1.29 から 1.29.9-gke.1177000 

**No channel**:

* **説明**:
    * 新しいバージョン: 1.28.14-gke.1340000, 1.29.9-gke.1496000, 1.30.5-gke.1443001 が利用可能になりました。
    * 新しいノードバージョン: 1.27.16-gke.1681000, 1.28.14-gke.1340000, 1.29.9-gke.1496000, 1.30.5-gke.1443001 が利用可能になりました。
    * 廃止されたバージョン: 1.28.13-gke.1049000, 1.28.14-gke.1175000, 1.29.8-gke.1096000, 1.30.3-gke.1969001 は廃止されました。
    * 自動アップグレード:
        * 1.27 から 1.28.14-gke.1099000
        * 1.28 から 1.29.9-gke.1177000
        * 1.29 から 1.30.4-gke.1348001
    * パッチのみの自動アップグレード:
        * 1.28 から 1.28.14-gke.1099000
        * 1.29 から 1.29.9-gke.1177000
        * 1.30 から 1.30.4-gke.1348001

**Google Cloud Composer については、リリースノートに記載がありません。**

Title: October 16, 2024
Link: https://cloud.google.com/release-notes#October_16_2024
## Cloud Composer リリースノート

### Announcement: 新しい Cloud Composer リリース開始 (2024年10月16日)
**原文:** A new Cloud Composer release has started on **October 16, 2024**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.

**説明:** 新しい Cloud Composer リリースの展開が開始されました。記載されている変更点や新機能は、リージョンによってはまだ利用できない可能性があります。

**製品への影響有無:**  あり (新バージョンへのアップグレードに伴う変更)

**対処方法:** リリースノートの内容を確認し、必要な対応を行ってください。


### Fixed: プライベートIP環境のアップグレード失敗を修正
**原文:** Fixed a bug where upgrading a private IP environment could fail because of an invalid CIDR range.

**説明:** 無効なCIDR範囲が原因で、プライベートIP環境のアップグレードが失敗する問題が修正されました。

**製品への影響有無:** あり (以前は問題があったが修正された)

**対処方法:** 特に対処は不要です。


### Changed: Airflowのデフォルトバージョンが2.9.3に変更
**原文:** The default version of Airflow is changed to 2.9.3.

**説明:** Cloud Composer で使用される Airflow のデフォルトバージョンが 2.9.3 に変更されました。

**製品への影響有無:** あり (Airflowのバージョンが変わるため、互換性に影響が出る可能性がある)

**対処方法:** Airflow 2.9.3 との互換性を確認してください。


### Changed: Airflow 2.9.1 の提供終了
**原文:** Airflow 2.9.1 is no longer included in Cloud Composer images and builds.

**説明:** Cloud Composer のイメージとビルドで Airflow 2.9.1 が提供終了になりました。

**製品への影響有無:** あり (Airflow 2.9.1 を使用している場合はアップグレードが必要)

**対処方法:** Airflow 2.9.3 にアップグレードしてください。


### Changed: Cloud Composer 3 で利用可能な Airflow ビルド
**原文:** New Airflow builds are available in Cloud Composer 3:

[Airflow builds](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-3)
- composer-3-airflow-2.9.3-build.3 (default)
- composer-3-airflow-2.7.3-build.19

**説明:** Cloud Composer 3 で新しい Airflow ビルドが利用可能になりました。

**製品への影響有無:** あり (新しいビルドが利用可能になった)

**対処方法:** 必要に応じて新しいビルドを使用してください。


### Changed: Cloud Composer 2.9.7 イメージの提供開始
**原文:** Cloud Composer 2.9.7 images are available:

[images](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-2)
- composer-2.9.7-airflow-2.9.3 (default)
- composer-2.9.7-airflow-2.7.3

**説明:** Cloud Composer 2.9.7 イメージが利用可能になりました。

**製品への影響有無:**  あり (新しいイメージが利用可能になった)

**対処方法:** 必要に応じて新しいイメージを使用してください。



## Compute Engine リリースノート

### Deprecated: SLES 12 SP5 の提供終了 (2024年10月31日)
**原文:** **End of life:** On October 31, 2024, SLES 12 SP5  and SLES 12 SP5 for SAP are reaching end of life and the images will be deprecated on Google Cloud. If you use SLES 12 SP5  or SLES 12 SP5 for SAP images in your project, review Long Term Service Support Pack (LTSS) options.

[Long Term Service Support Pack (LTSS) options](https://cloud.google.com/compute/docs/images/premium/sles-faq#ltss)

**説明:** SLES 12 SP5 および SLES 12 SP5 for SAP は、2024 年 10 月 31 日に提供終了となります。この日以降、Google Cloud でのイメージは非推奨となります。プロジェクトで SLES 12 SP5 または SLES 12 SP5 for SAP イメージを使用している場合は、長期サービスサポートパック (LTSS) のオプションを確認してください。

**製品への影響有無:** あり (SLES 12 SP5 を使用している場合は、サポートが受けられなくなる)

**対処方法:**  LTSSのオプションを検討するか、サポートされているバージョンにアップグレードしてください。


## Google Kubernetes Engine リリースノート

### Changed: スケジューラーメトリクスに新しいメトリクスが追加
**原文:** In GKE version 1.31.1-gke.1621000 and later, the `kube_pod_resource_request` metric and the `kube_pod_resource_limit` metric are exported as part of the the scheduler metrics package.

[scheduler metrics package](https://cloud.google.com/kubernetes-engine/docs/how-to/control-plane-metrics#scheduler)

**説明:**  GKE バージョン 1.31.1-gke.1621000 以降では、`kube_pod_resource_request` メトリックと `kube_pod_resource_limit` メトリックがスケジューラーメトリクスパッケージの一部としてエクスポートされるようになりました。

**製品への影響有無:** あり (新しいメトリクスが利用可能になった)

**対処方法:** 必要に応じて、新しいメトリクスを使用してください。 

Title: October 15, 2024
Link: https://cloud.google.com/release-notes#October_15_2024
## Google Kubernetes Engine のアップデート内容について

### Fixed

**原文:**
On GKE Autopilot clusters running version 1.30 and later, partner workloads that set AppArmor profiles might unexpectedly be rejected at admission. This might include installations of Prisma Defender, Wiz Runtime Sensor, Sentinel One Agent, Checkpoint CloudGuard, Aqua Security Enforcer and Splunk OTEL Collector.

The following GKE versions contain a fix for this issue:

- 1.30.5-gke.1355000 and later
- 1.31.1-gke.1621000 and later

Clusters in any release channel can be created on or upgraded to these versions. For details, see Manually upgrading the control plane.

[Manually upgrading the control plane](https://cloud.google.com/kubernetes-engine/docs/how-to/upgrading-a-cluster#upgrade_cp)

**説明:**
GKE Autopilot クラスタバージョン 1.30 以降で、AppArmor プロファイルを 設定するパートナーワークロードが、 Prisma Defender, Wiz Runtime Sensor, Sentinel One Agent, Checkpoint CloudGuard, Aqua Security Enforcer, Splunk OTEL Collector などで、アドミッション時に予期せず拒否される問題がありました。バージョン 1.30.5-gke.1355000 以降、または 1.31.1-gke.1621000 以降で修正されています。

**製品への影響有無:**
GKE Autopilot クラスタバージョン 1.30 以降で上記パートナー製品を利用している場合、影響があります。

**対処方法:**
クラスタをバージョン 1.30.5-gke.1355000 以降、または 1.31.1-gke.1621000 以降にアップグレードしてください。

## Changed

**原文:**
For newly-created VPC Peering-based clusters running version 1.27 or later, traffic from the `kube-apiserver` to nodes routes through the Konnectivity service. For existing VPC Peering-based clusters, GKE gradually migrates your cluster to use the Konnectivity service.

[the Konnectivity service](https://kubernetes.io/docs/concepts/architecture/control-plane-node-communication/#konnectivity-service)

**説明:**
バージョン 1.27 以降で新しく作成された VPC Peering ベースのクラスタでは、`kube-apiserver` からノードへのトラフィックが Konnectivity サービスを経由してルーティングされるようになりました。既存の VPC Peering ベースのクラスタの場合、GKE は Konnectivity サービスを使用するようにクラスタを徐々に移行します。

**製品への影響有無:**
バージョン 1.27 以降の GKE クラスタを利用している場合、影響があります。Konnectivity サービスを利用するための設定変更が必要になる可能性があります。

**対処方法:**
Konnectivity サービスの利用に関するドキュメントを参照し、必要に応じて設定を変更してください。
Title: October 14, 2024
Link: https://cloud.google.com/release-notes#October_14_2024
## BigQuery - Libraries - Java - google-cloud-bigquery 2.43.1

**原文**

- Update actions/checkout action to v4.2.1 (#3520) (ad8175a)
- Update actions/upload-artifact action to v4.4.1 (#3521) (dc21975)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20240919-2.0.0 (#3514) (9fe3829)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.37.0 (bf4d37a)
- Update github/codeql-action action to v2.26.11 (#3517) (ac736bb)
- Update github/codeql-action action to v2.26.12 (#3522) (fdf8dc4)

**説明**

BigQuery Javaライブラリ (google-cloud-bigquery) のバージョン2.43.1がリリースされました。主な変更点は以下の通りです。

* 依存関係の更新:
    * `actions/checkout` アクションを v4.2.1 にアップデート
    * `actions/upload-artifact` アクションを v4.4.1 にアップデート
    * `com.google.apis:google-api-services-bigquery` を v2-rev20240919-2.0.0 にアップデート
    * `com.google.cloud:sdk-platform-java-config` を v3.37.0 にアップデート
    * `github/codeql-action` アクションを v2.26.12 にアップデート

**製品への影響**

* BigQuery Javaライブラリを利用している場合は、最新バージョンへのアップデートを検討してください。
* 今回のアップデートは主に依存関係の更新であるため、既存のコードへの影響は限定的と考えられますが、最新バージョンへのアップデート前に動作確認を行うことをお勧めします。

**対処方法**

* BigQuery Javaライブラリを最新バージョン (2.43.1) にアップデートしてください。


## Cloud Logging - Libraries - Java - google-cloud-logging 3.20.4

**原文**

- **deps:** Update the Java code generator (gapic-generator-java) to 2.47.0 (90b88ee)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.37.0 (#1702) (1f7da17)

**説明**

Cloud Logging Javaライブラリ (google-cloud-logging) のバージョン 3.20.4 がリリースされました。主な変更点は以下の通りです。

* 依存関係の更新:
    * Java コードジェネレーター (gapic-generator-java) を 2.47.0 にアップデート
    * `com.google.cloud:sdk-platform-java-config` を v3.37.0 にアップデート

**製品への影響**

* Cloud Logging Java ライブラリを利用している場合は、最新バージョンへのアップデートを検討してください。
* 今回のアップデートは主に依存関係の更新であるため、既存のコードへの影響は限定的と考えられますが、最新バージョンへのアップデート前に動作確認を行うことをお勧めします。

**対処方法**

* Cloud Logging Javaライブラリを最新バージョン (3.20.4) にアップデートしてください。


## Cloud Storage - Libraries - Java - google-cloud-storage 2.43.2

**原文**

- Plumb list blobs match glob option for grpc transport (#2759) (207abd1)
- Update dependency com.google.api:gapic-generator-java to v2.47.0 (#2750) (9041f24)
- Update dependency com.google.apis:google-api-services-storage to v1-rev20240924-2.0.0 (#2719) (7b19831)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.37.0 (#2751) (003d6fa)
- Update googleapis/sdk-platform-java action to v2.47.0 (#2749) (befa415)

**説明**

Cloud Storage Java ライブラリ (google-cloud-storage) のバージョン 2.43.2 がリリースされました。主な変更点は以下の通りです。

* 機能追加:
    * gRPCトランスポートで `list blobs match glob` オプションが利用可能になりました。
* 依存関係の更新:
    * `com.google.api:gapic-generator-java` を v2.47.0 にアップデート
    * `com.google.apis:google-api-services-storage` を v1-rev20240924-2.0.0 にアップデート
    * `com.google.cloud:sdk-platform-java-config` を v3.37.0 にアップデート
    * `googleapis/sdk-platform-java` アクションを v2.47.0 にアップデート

**製品への影響**

* Cloud Storage Java ライブラリを利用している場合は、最新バージョンへのアップデートを検討してください。
* gRPCトランスポートを利用している場合は、`list blobs match glob` オプションが利用可能になります。
* 今回のアップデートは主に依存関係の更新と機能追加であるため、既存のコードへの影響は限定的と考えられますが、最新バージョンへのアップデート前に動作確認を行うことをお勧めします。

**対処方法**

* Cloud Storage Javaライブラリを最新バージョン (2.43.2) にアップデートしてください。

**質問におけるGKE, Composerへの言及について**

今回のリリースノートには、Google Kubernetes Engine 1.29, 1.30 および Google Cloud Composer2 (Compoer version 2.7.1、Airflow version 2.7.3)に関する情報は含まれていません。
