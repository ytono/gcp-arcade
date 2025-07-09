# Title: July 08, 2025 
Link: https://cloud.google.com/release-notes#July_08_2025<br>
Google Cloudのインフラエンジニアとして、リリースノートの調査結果をご報告いたします。

---

# BigQuery
## Announcement
**原文**: Starting August 1, 2025, GoogleSQL will become the default dialect for queries run from the command line interface (CLI) or API. To use LegacySQL, you will need to explicitly specify it in your requests or set the configuration setting `default_sql_dialect_option` to `'default_legacy_sql'` at the project or organization level.

[set the configuration setting](https://cloud.google.com/bigquery/docs/reference/standard-sql/data-definition-language#alter_project_set_options_statement)

**説明**:
2025年8月1日より、BigQueryのコマンドラインインターフェース（CLI）またはAPI経由で実行されるクエリのデフォルトのSQL方言が、GoogleSQLに変更されます。もし現在Legacy SQLを使用しており、引き続きLegacy SQLを利用したい場合は、以下のいずれかの対応が必要になります。
1.  クエリを送信する際に明示的にLegacy SQLを指定する。
2.  プロジェクトまたは組織レベルで`default_sql_dialect_option`設定を`'default_legacy_sql'`に設定する。

**影響有無**:
*   **影響あり**：現在、CLIまたはAPI経由でBigQueryに対してLegacy SQLクエリを実行している場合は、2025年8月1日以降、デフォルトの変更によりクエリが失敗する可能性があります。
*   **影響なし**：
    *   Web UI（BigQueryコンソール）からクエリを実行している場合。
    *   既にCLIやAPI経由でもGoogleSQLをデフォルトで利用している場合。
    *   2025年8月1日より前に、Legacy SQLを使用するCLI/APIクエリがない場合。
*   この変更は将来の日付であり、猶予期間が十分に設けられています。

**対処方法**:
現在、CLIまたはAPI経由でBigQueryに対してLegacy SQLを利用しているかどうかを確認してください。
Legacy SQLを利用している場合は、2025年8月1日までに以下のいずれかの対応を検討してください。
1.  **既存のLegacy SQLクエリをGoogleSQLに移行する。** これが長期的に推奨されるアプローチです。
2.  **CLIまたはAPIからクエリを実行する際に、明示的にLegacy SQLを指定するようコードを変更する。** 例えば、`bq query --use_legacy_sql 'SELECT ...'`のように指定します。
3.  **プロジェクトまたは組織レベルでデフォルトのSQL方言設定を変更する。** リンク先のドキュメントを参照し、`ALTER PROJECT SET OPTIONS (default_sql_dialect_option = 'default_legacy_sql');`のような形で設定を適用します。これにより、プロジェクト内のすべてのCLI/APIクエリでLegacy SQLがデフォルトとして扱われます。

**用語説明**:
*   **GoogleSQL**: BigQueryで推奨されている標準SQL方言です。SQL標準に準拠しており、より多くの機能と最適化が提供されます。
*   **Legacy SQL**: BigQueryの初期に提供されていた独自のSQL方言です。現在ではGoogleSQLへの移行が推奨されています。
*   **CLI (Command Line Interface)**: コマンドラインからサービスを操作するためのインターフェースです。BigQueryでは`bq`コマンドが該当します。
*   **API (Application Programming Interface)**: プログラムからサービスを操作するためのインターフェースです。
*   **default_sql_dialect_option**: BigQueryのプロジェクトまたは組織レベルで設定できるオプションで、デフォルトのSQL方言を指定します。

---

# Google Cloud Armor
## Changed
**原文**: Cloud Armor preconfigured WAF rules can now inspect up to the first 64kB (either 8kB, 16kB, 32kB, 48kB, or 64kB) of the POST or PATCH request body content in Preview.

[preconfigured WAF rules](https://cloud.google.com/armor/docs/waf-rules)
[request body content](https://cloud.google.com/armor/docs/security-policy-overview#post-body)

**説明**:
Google Cloud Armorの事前構成済みWAFルールにおいて、POSTまたはPATCHリクエストのボディ内容の検査対象サイズが、最大64KB（8KB、16KB、32KB、48KB、64KBのいずれか）まで拡張されました。この機能は現在、Preview（プレビュー）段階で提供されています。

**影響有無**:
*   **影響なし（機能追加）**：これはCloud Armorの機能拡張であり、既存のWAFルールの動作を変更するものではありません。既存のCloud Armorポリシーに直接的な変更や影響はありません。
*   **メリット**：より大きなリクエストボディを持つアプリケーションに対するWAF保護を強化できるオプションが増えました。
*   **留意点**：この機能は「Preview」段階であるため、本番環境での利用には注意が必要です。

**対処方法**:
即座の対処は不要です。
もし、現在POSTやPATCHリクエストのボディサイズが大きく、従来のWAF検査範囲では不十分だと感じている場合、この新機能を評価することを検討してください。
*   Cloud Armorセキュリティポリシーの設定を見直し、より大きなリクエストボディの検査が必要なユースケースがあるか確認します。
*   この機能を利用する場合は、Preview機能であることを理解した上で、十分なテストを実施し、その効果と副作用（例えば、パフォーマンスへの影響など）を評価してください。

**用語説明**:
*   **Google Cloud Armor**: Google Cloud上で実行されるWebアプリケーションやサービスを、DDoS攻撃やOWASP Top 10などのWebアプリケーション攻撃から保護するセキュリティサービスです。
*   **WAF (Web Application Firewall)**: Webアプリケーションへの不正なアクセスや攻撃を検出・ブロックするファイアウォールです。
*   **事前構成済みWAFルール (Preconfigured WAF rules)**: 一般的なWebアプリケーションの脆弱性（SQLインジェクション、クロスサイトスクリプティングなど）に対応するためにCloud Armorが事前に用意しているルールセットです。
*   **POST/PATCH request body content**: HTTPリクエストメソッドのPOSTまたはPATCHでクライアントからサーバーに送信される、リクエストの本体（ペイロード）部分です。通常、フォームデータやJSON、XMLなどのアプリケーションデータが含まれます。
*   **Preview**: Google Cloudにおける機能の公開ステータスの一つです。一般公開（GA: General Availability）前の段階であり、機能が変更される可能性や、SLAが提供されない場合があります。テストや評価目的での利用が推奨されます。
# Title: July 02, 2025 
Link: https://cloud.google.com/release-notes#July_02_2025<br>
Google Cloud のリリースノート調査結果を以下の通りご報告いたします。

---

# Cloud Composer

## Changed
原文: Cloud Composer 1 and Cloud Composer 2 environments with version 2.0.x are **approaching their end of life**. We're planning to deprecate them in the following way:
- Starting **September 15, 2025**, you will no longer be able to create new Cloud Composer 1 environments.
- On **September 15, 2026**, all Cloud Composer 1 and Cloud Composer 2 version 2.0.x environments will reach their planned end of life, and you **won't be able to use them**.
Cloud Composer 2 environments with versions later than 2.1.0 and all Cloud Composer 3 environments are not affected by this deprecation.
We recommend planning migration to Cloud Composer 3 or upgrading your Cloud Composer 2 environments to a later version.
[migration to Cloud Composer 3](https://cloud.google.com/composer/docs/latest/migrate-composer-1-to-3)

説明: Cloud Composer 1 および Cloud Composer 2 のバージョン 2.0.x が、2026年9月15日をもってサポート終了（End of Life: EoL）となり、使用できなくなることが発表されました。Cloud Composer 1 の新規環境作成は2025年9月15日からできなくなります。バージョン 2.1.0 以降の Cloud Composer 2 およびすべての Cloud Composer 3 環境は、このサポート終了の影響を受けません。対象バージョンをご利用の場合、Cloud Composer 3 への移行、または Cloud Composer 2 のより新しいバージョンへのアップグレードが推奨されています。

影響有無: **影響なし**
理由: 現在ご利用の Cloud Composer2 のバージョンは 2.7.1 であり、リリースノートで示されている EoL の対象バージョン（2.0.x）よりも新しいバージョン（2.1.0 以降）に該当するため、このサポート終了の影響は受けません。

対処方法:
直ちに対処は不要です。ただし、GCPサービスは継続的なアップデートが行われるため、将来的な安定性と最新機能の利用のため、定期的なバージョンアップグレード計画の検討を推奨します。

用語説明:
*   **End of Life (EoL)**: 製品やサービスのサポートが終了し、利用が推奨されなくなる、または利用できなくなる状態を指します。セキュリティアップデートやバグ修正が提供されなくなるため、対象バージョンからの移行が必要になります。

---

# Google Kubernetes Engine

## Changed
原文:
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- The following versions are now available in the Extended channel:
    - 1.28.15-gke.2456000
    - 1.29.15-gke.1607000
    - 1.30.12-gke.1279000
    - 1.31.9-gke.1218000
    - 1.32.4-gke.1698000
    - 1.33.1-gke.1744000
- The following versions are now available:
    - 1.30.12-gke.1333000
    - 1.31.10-gke.1021000
    - 1.32.6-gke.1013000
    - 1.33.2-gke.1043000
    - 1.33.2-gke.1111000
- The following node versions are now available:
    - 1.28.15-gke.2456000
    - 1.29.15-gke.1607000
    - 1.30.12-gke.1333000
    - 1.31.10-gke.1021000
    - 1.32.6-gke.1013000
    - 1.33.2-gke.1111000
- The following versions are now available in the Rapid channel:
    - 1.30.12-gke.1333000
    - 1.31.10-gke.1021000
    - 1.32.6-gke.1013000
    - 1.33.2-gke.1111000
- The following versions are now available in the Regular channel:
    - 1.30.12-gke.1279000
    - 1.31.9-gke.1218000
    - 1.32.4-gke.1698000
    - 1.33.1-gke.1744000
- The following versions are now available in the Stable channel:
    - 1.30.12-gke.1208000
    - 1.31.9-gke.1119000
- GKE cluster versions have been updated.
**New versions available for upgrades and new clusters.**
The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades.
[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

説明: 各GKEリリースチャネル（Extended, Rapid, Regular, Stable）およびノードバージョンにおいて、新しいGKEバージョンが利用可能になったことがアナウンスされました。これらは新規クラスターの作成や既存クラスターのコントロールプレーンおよびノードのアップグレードに利用できます。現行のバージョン 1.31 に対しても、1.31.9-gke.xxxx や 1.31.10-gke.xxxx などの新しいマイナーバージョンが提供されています。

影響有無: **直接的な影響なし**
理由: これは既存のクラスターに対して自動的に適用される変更ではなく、新しいGKEバージョンが利用可能になったという通知です。現在稼働中のGKE 1.31 クラスターの機能や動作に直ちに影響を与えるものではありません。

対処方法:
直ちに対処は不要です。ただし、セキュリティパッチの適用や新機能の利用、サポート期間の延長などのメリットを享受するため、定期的なGKEクラスターのバージョンアップグレード計画を検討し、これらの新しいバージョンへのアップグレードを推奨します。アップグレードの際は、GKEのバージョンアップグレードに関するベストプラクティス（ステージング環境でのテスト、ロールアウト戦略など）に従ってください。

用語説明:
*   **GKE リリースチャネル (Release Channels)**: GKE クラスターのバージョンアップグレードの頻度と安定性を制御するための設定です。`Stable` (安定性重視、リリース頻度低)、`Regular` (一般的な推奨、バランス型)、`Rapid` (最新機能、リリース頻度高)、``Extended` (長期サポート、特定のバージョンを長期で利用) などがあります。
*   **コントロールプレーン (Control Plane)**: Kubernetes クラスターの脳に当たる部分で、API サーバー、スケジューラー、コントローラーマネージャーなどが含まれます。クラスターの状態を管理し、操作を受け付けます。
*   **ノード (Node)**: Kubernetes クラスター内でワークロード（Pod）が実際に実行される仮想マシンまたは物理マシンです。

# Title: July 02, 2025 
Link: https://cloud.google.com/release-notes#July_02_2025<br>
# Cloud Composer
## Changed
原文: Cloud Composer 1 and Cloud Composer 2 environments with version 2.0.x are **approaching their end of life**. We're planning to deprecate them in the following way:

- Starting **September 15, 2025**, you will no longer be able to create new Cloud Composer 1 environments.
- On **September 15, 2026**, all Cloud Composer 1 and Cloud Composer 2 version 2.0.x environments will reach their planned end of life, and you **won't be able to use them**.

Cloud Composer 2 environments with versions later than 2.1.0 and all Cloud Composer 3 environments are not affected by this deprecation.

We recommend planning
migration to Cloud Composer 3
or upgrading your Cloud Composer 2 environments to a later version.

[migration to Cloud Composer 3](https://cloud.google.com/composer/docs/latest/migrate-composer-1-to-3)

説明：
Cloud Composer 1 および Cloud Composer 2 のバージョン 2.0.x が、サポート終了（End of Life: EoL）に近づいていることがアナウンスされました。

*   **2025年9月15日**以降、新規のCloud Composer 1 環境は作成できなくなります。
*   **2026年9月15日**には、すべてのCloud Composer 1 環境とCloud Composer 2 のバージョン 2.0.x 環境がEoLに達し、これらの環境は利用できなくなります。

一方で、Cloud Composer 2 のバージョン 2.1.0 以降の環境、およびすべてのCloud Composer 3 環境は、この非推奨化の影響を受けません。Google Cloud は、Cloud Composer 3 への移行、または既存のCloud Composer 2 環境をより新しいバージョンにアップグレードすることを推奨しています。詳細は、[Cloud Composer 3 への移行](https://cloud.google.com/composer/docs/latest/migrate-composer-1-to-3)ドキュメントを参照してください。

影響有無：
**影響なし。**
お客様が現在ご利用のCloud Composer 2 環境のバージョンは2.7.1であり、これは非推奨化対象である2.0.xバージョンではなく、リリースノートに明確に記載されている通り2.1.0以降のバージョンに該当するため、この非推奨化による直接的な影響はありません。

対処方法：
この非推奨化に対する直接的な対処は不要です。
Google Cloud のベストプラクティスに従い、今後も継続して安定した運用を行うため、定期的なComposer環境のアップグレードや、将来的なCloud Composer 3 への移行計画については、中長期的な視点で検討を続けることを推奨します。

用語説明：
*   **End of Life (EoL)**: ソフトウェアやハードウェア製品のサポートライフサイクルが終了する日付。EoLを過ぎると、通常、バグ修正、セキュリティパッチの提供、技術サポートが終了し、製品の利用が推奨されなくなります。
*   **Deprecation (非推奨化)**: ある機能、API、または製品バージョンが、将来的に利用不可となる予定があることを事前にユーザーに通知するプロセス。非推奨化された項目は、通常、一定期間は引き続き利用可能ですが、新しいプロジェクトでの利用は推奨されず、代替手段への移行が促されます。

# Title: July 01, 2025 
Link: https://cloud.google.com/release-notes#July_01_2025<br>
Google Cloud のリリースノート調査結果を以下の通り報告いたします。

# Cloud Composer

## Announcement
原文: A new Cloud Composer release has started on **July 1, 2025**. This release is in progress at the moment. Listed changes might not be available in some regions yet.
説明: Cloud Composerの新しいリリースが2025年7月1日に開始されるというアナウンスです。現在、リリースの展開が進行中であり、記載された変更内容がすべてのリージョンで利用可能になるまでには時間がかかる可能性があることを示しています。
影響有無: **影響なし**
理由: これは将来のリリース開始日に関するアナウンスであり、現在のCloud Composer 2.7.1環境に直接的な影響はありません。情報提供を目的としたものです。
対処方法: 特になし。今後のCloud Composerの更新に関する情報として認識してください。
用語説明:
*   **リリースサイクル (Release Cycle)**: ソフトウェア製品のバージョンアップや新機能の提供が定期的に行われる期間やプロセスを指します。

## Changed
原文: This release includes internal infrastructure improvements to Cloud Composer. There are no user-visible changes.
説明: このリリースには、Cloud Composerの内部インフラストラクチャに対する改善が含まれています。これらの変更はユーザーから直接見えるものではなく、既存のワークロードや設定に影響を与えるものではありません。
影響有無: **影響なし**
理由: リリースノートに「ユーザー可視な変更なし (no user-visible changes)」と明記されているため、既存のCloud Composer 2.7.1環境の動作や利用方法に変更はありません。これにより、プラットフォームの安定性や効率が向上する可能性があります。
対処方法: 特になし。自動的に適用される基盤改善であり、特別な対応は不要です。
用語説明:
*   **内部インフラストラクチャ (Internal Infrastructure)**: サービスを動作させるための基盤となるネットワーク、コンピューティングリソース、ストレージ、データベースなどのシステム内部構成を指します。ユーザーが直接操作するAPIやUIではなく、その下層で動作する部分です。
*   **ユーザー可視な変更 (User-visible changes)**: ユーザーが操作するインターフェース、機能、設定、APIなど、直接利用者が認識できる変更のことです。

## Changed
原文: New Airflow builds are available in Cloud Composer 3:
[Airflow builds](https://cloud.google.com/composer/docs/composer-versions#images-composer-3)
- composer-3-airflow-2.10.5-build.8 (default)
- composer-3-airflow-2.9.3-build.28
[composer-3-airflow-2.10.5-build.8](https://cloud.google.com/composer/docs/versions-packages#composer-3-airflow-2-10-5-build-8)
[composer-3-airflow-2.9.3-build.28](https://cloud.google.com/composer/docs/versions-packages#composer-3-airflow-2-9-3-build-28)
説明: Cloud Composer 3環境向けに、新しいAirflowビルドイメージ（`composer-3-airflow-2.10.5-build.8`と`composer-3-airflow-2.9.3-build.28`）が利用可能になったことを示しています。`composer-3-airflow-2.10.5-build.8`がデフォルトとして提供されます。
影響有無: **影響なし**
理由: 現在利用されている環境はCloud Composer 2 (Composer version 2.7.1) であるため、Cloud Composer 3向けの変更は直接適用されません。
対処方法: 特になし。将来的にCloud Composer 3への移行を検討する際の参考情報となります。
用語説明:
*   **Airflowビルド (Airflow Build)**: 特定のCloud ComposerバージョンとAirflowバージョンの組み合わせで提供される環境イメージを指します。Google Cloudによって最適化され、必要な依存関係が組み込まれています。
*   **Composer 3**: Cloud Composerの主要なメジャーバージョンアップグレードであり、基盤となるインフラストラクチャや機能がCloud Composer 2から大きく変更されています。

## Changed
原文: New images are available in Cloud Composer 2:
[images](https://cloud.google.com/composer/docs/composer-versions#images-composer-2)
- composer-2.13.6-airflow-2.10.5 (default)
- composer-2.13.6-airflow-2.9.3
[composer-2.13.6-airflow-2.10.5](https://cloud.google.com/composer/docs/versions-packages#composer-2-13-5-airflow-2-10-5)
[composer-2.13.6-airflow-2.9.3](https://cloud.google.com/composer/docs/versions-packages#composer-2-13-5-airflow-2-9-3)
説明: Cloud Composer 2環境向けに、新しいイメージが利用可能になったことを示しています。具体的には、Composer 2.13.6 と Airflow 2.10.5 の組み合わせ (`composer-2.13.6-airflow-2.10.5`) と、Composer 2.13.6 と Airflow 2.9.3 の組み合わせ (`composer-2.13.6-airflow-2.9.3`) です。`composer-2.13.6-airflow-2.10.5` がデフォルトとして提供されます。
影響有無: **間接的な影響あり（アップグレードの検討推奨）**
理由: 現在利用中のCloud Composer環境は `Composer version 2.7.1, Airflow version 2.7.3` です。リリースノートに記載されている新しいイメージは `Composer 2.13.6, Airflow 2.10.5 / 2.9.3` であり、現行バージョンよりも新しいバージョンです。これらの新しいイメージは、Airflowの新しい機能、バグ修正、セキュリティパッチを含んでいる可能性があります。既存の環境が自動的にアップグレードされることはありませんが、最新の機能やセキュリティ恩恵を受けるためには、計画的なアップグレードの検討が推奨されます。
対処方法:
1.  **アップグレード計画の検討**: 現行のCloud Composer 2.7.1環境を新しいイメージバージョン（特に `composer-2.13.6-airflow-2.10.5`）へアップグレードすることを計画してください。
2.  **互換性確認**: Airflow 2.7.3からAirflow 2.10.5へのアップグレードには、DAG (Directed Acyclic Graph) やカスタムプラグインの互換性確認が必要です。Airflowの公式ドキュメントでバージョン間の変更点、特に非互換な変更（Breaking Change）を確認してください。
3.  **テスト環境での検証**: 本番環境に適用する前に、必ずステージング環境や開発環境で十分なテストを実施し、DAGの正常動作、依存パッケージの動作、パフォーマンスへの影響などを検証してください。
4.  **アップグレード手順の確認**: Google Cloudの公式ドキュメントに記載されているCloud Composerのアップグレード手順に従い、慎重に実施してください。
用語説明:
*   **Composer イメージ (Composer Image)**: Cloud Composer環境を構築するための、OS、Airflow本体、Python、各種ライブラリ、およびCloud Composer固有のコンポーネションが含まれる定義済みのテンプレートです。
*   **Airflow バージョン (Airflow Version)**: Apache AirflowというOSSのワークフロー管理ツール自体のバージョンです。
*   **後方互換性 (Backward Compatibility)**: 新しいバージョンのソフトウェアが、古いバージョンのソフトウェアで作成されたデータやコードを問題なく処理できる性質のことです。
*   **非互換性 (Breaking Change)**: ソフトウェアの新しいバージョンが、古いバージョンで動作していたコードやデータとの互換性を失う変更のことです。これにより、既存のアプリケーションやワークフローが動作しなくなる可能性があります。
*   **DAG (Directed Acyclic Graph)**: Airflowにおけるワークフローの定義で、タスクとその実行順序をグラフ形式で表現したものです。
  
# Title: June 30, 2025 
Link: https://cloud.google.com/release-notes#June_30_2025<br>
# BigQuery
## Changed
原文:
```
- **bigquery:** Integrate Otel in client lib (#3747) (6e3e07a)
- **bigquery:** Integrate Otel into retries, jobs, and more (#3842) (4b28c47)
- **bigquery:** Add MY_VIEW_DATASET_NAME*TEST* to resource clean up sample (#3838) (b1962a7)
- Remove version declaration of open-telemetry-bom (#3855) (6f9f77d)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.66.0 (#3835) (69be5e7)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.68.0 (#3858) (d4ca353)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.49.2 (#3853) (cf864df)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.50.0 (#3861) (eb26dee)
- Update dependency io.opentelemetry:opentelemetry-bom to v1.51.0 (#3840) (51321c2)
- Update ossf/scorecard-action action to v2.4.2 (#3810) (414f61d)
```
説明：
BigQueryのJavaクライアントライブラリ `google-cloud-bigquery` のバージョン2.52.0への更新です。主な変更点は以下の通りです。
*   OpenTelemetryとの連携が強化され、クライアントライブラリ内部でのリトライ処理やジョブ実行におけるテレメトリデータ（トレース、メトリクス）の収集が可能になりました。
*   リソースクリーンアップのサンプルコードに新しいビューデータセット名が追加されました。
*   OpenTelemetry BOM (Bill of Materials) のバージョン宣言が削除され、依存関係の管理が改善されました。
*   BigQuery Connection APIおよびGoogle Cloud SDKプラットフォームのJava設定、OpenTelemetry BOMなど、各種依存ライブラリのバージョンが更新されました。

影響有無：
影響なし。
本変更はBigQueryのJavaクライアントライブラリの機能追加と依存関係の更新です。
*   Google Cloud Composer 2 (Airflow 2.7.3) はPythonベースであるため、このJavaクライアントライブラリの変更による直接的な影響はありません。BigQueryとの連携にはPythonクライアントライブラリが使用されます。
*   Google Kubernetes Engine (GKE) 1.31上で稼働しているアプリケーションが、BigQueryとの連携にこのJavaクライアントライブラリを明示的に使用している場合、新機能（OpenTelemetry連携強化など）を利用するためにはライブラリのバージョンアップが必要です。既存のアプリケーションの動作に破壊的な変更は含まれていません。機能追加であるため、パフォーマンスやセキュリティに対するネガティブな影響もありません。

対処方法：
新機能であるOpenTelemetry連携を利用したい場合、または最新の依存関係に更新したい場合は、BigQuery Javaクライアントライブラリのバージョンアップをご検討ください。既存のアプリケーションに影響を与えないため、緊急の対応は不要です。

用語説明：
*   **OpenTelemetry (Otel)**: アプリケーションやサービスからテレメトリデータ（トレース、メトリクス、ログ）を収集するためのオープンソースの標準仕様およびツール群です。これにより、分散システムにおける観測可能性（Observability）が向上します。
*   **BOM (Bill of Materials)**: Java Mavenプロジェクトで依存関係のバージョンを一元的に管理するための特別なPOMファイルです。複数の依存関係のバージョン間の互換性を保証しやすくなります。
*   **GAPIC (Google API Client Libraries)**: GoogleのAPI定義から自動生成されるクライアントライブラリのフレームワークです。

---

# Cloud Logging
## Changed
原文:
```
- Regenerate gapic yaml and service yaml for logging by augmentation configs (9023895)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.50.0 (#1821) (af4edc5)
- Update googleapis/sdk-platform-java action to v2.60.0 (#1822) (0a96dd5)
```
説明：
Cloud LoggingのJavaクライアントライブラリ `google-cloud-logging` のバージョン3.22.6への更新です。主な変更点は以下の通りです。
*   GAPIC YAMLとサービスYAMLが、拡張設定（augmentation configs）に基づいて再生成されました。これはAPI定義の内部的な更新であり、クライアントライブラリの生成プロセスを改善するものです。
*   Google Cloud SDKプラットフォームのJava設定およびgoogleapis/sdk-platform-java actionなど、各種依存ライブラリのバージョンが更新されました。

影響有無：
影響なし。
本変更はCloud LoggingのJavaクライアントライブラリの内部的な更新と依存関係の更新です。
*   Google Cloud Composer 2 (Airflow 2.7.3) はPythonベースであるため、このJavaクライアントライブラリの変更による直接的な影響はありません。
*   Google Kubernetes Engine (GKE) 1.31上で稼働しているアプリケーションが、Cloud Loggingへの連携にこのJavaクライアントライブラリを明示的に使用している場合でも、内部的な改善が主であるため、既存のアプリケーションの動作に破壊的な変更は含まれていません。パフォーマンスやセキュリティに対するネガティブな影響もありません。

対処方法：
既存のアプリケーションに影響を与えないため、緊急の対応は不要です。安定性の向上や最新の依存関係を利用したい場合は、Cloud Logging Javaクライアントライブラリのバージョンアップをご検討ください。

用語説明：
*   **GAPIC YAML / サービスYAML**: Google APIのインターフェース定義やサービス固有の設定を記述するYAMLファイルです。これらのファイルからクライアントライブラリのコードが自動生成されます。
*   **Augmentation Configs**: GAPIC生成プロセスにおいて、追加の設定や修正を適用するための設定ファイルです。

---

# Cloud Storage
## Changed
原文:
```
- Fix Journaling BlobWriteSessionConfig to properly handle multiple consecutive retries (#3166) (895bfbd)
- Update dependency com.google.cloud.opentelemetry:exporter-trace to v0.36.0 (#3162) (41a1030)
- Update sdk-platform-java dependencies (#3164) (c22a131)
```
説明：
Cloud StorageのJavaクライアントライブラリ `google-cloud-storage` のバージョン2.53.2への更新です。主な変更点は以下の通りです。
*   `Journaling BlobWriteSessionConfig` における、複数連続リトライの適切な処理に関するバグが修正されました。これにより、ジャーナリングを使用したBLOB書き込みセッションの信頼性が向上します。
*   OpenTelemetryトレースエクスポーターおよびSDKプラットフォームのJava依存関係が更新されました。

影響有無：
影響なし（またはポジティブな影響）。
本変更はCloud StorageのJavaクライアントライブラリのバグ修正と依存関係の更新です。
*   Google Cloud Composer 2 (Airflow 2.7.3) はPythonベースであるため、このJavaクライアントライブラリの変更による直接的な影響はありません。
*   Google Kubernetes Engine (GKE) 1.31上で稼働しているJavaアプリケーションが、`Journaling BlobWriteSessionConfig` を使用してCloud StorageへのBLOB書き込みを行っており、かつ複数連続リトライの問題に直面していた場合、この更新を適用することで問題が解決され、安定性が向上します。この修正はバグ修正であり、既存の動作に破壊的な変更をもたらすものではありません。

対処方法：
もしアプリケーションが `Journaling BlobWriteSessionConfig` を使用しており、複数リトライ時の問題に遭遇している場合は、Cloud Storage Javaクライアントライブラリのバージョンアップを強く推奨します。それ以外の場合でも、安定性向上のため、バージョンアップを検討しても良いでしょう。

用語説明：
*   **Journaling BlobWriteSessionConfig**: Cloud Storageへの大きなオブジェクト（BLOB）を書き込む際に、ジャーナリング機構を利用して書き込み処理の信頼性や整合性を高めるための設定です。書き込みの途中で障害が発生した場合でも、以前の状態に復元したり、中断したところから再開したりするのに役立ちます。

---

# Pub/Sub
## Changed
原文:
```
- Update dependency com.google.cloud:google-cloud-bigquery to v2.51.0 (#2457) (d74215a)
- Update dependency com.google.cloud:google-cloud-core to v2.58.0 (#2443) (d4599d9)
- Update dependency com.google.cloud:google-cloud-storage to v2.53.1 (#2452) (b4af237)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.50.0 (#2461) (715916a)
- Update dependency com.google.cloud.opentelemetry:exporter-trace to v0.36.0 (#2440) (50a3eb9)
- Update dependency com.google.protobuf:protobuf-java-util to v4.31.1 (#2442) (a0be1bb)
- Update dependency org.easymock:easymock to v5.6.0 (#2069) (5f144a4)
- Update googleapis/sdk-platform-java action to v2.60.0 (#2462) (ee8e5c7)
- Update googleapis/sdk-platform-java action to v2.60.0 (#2464) (7a0af37)
```
説明：
Pub/SubのJavaクライアントライブラリ `google-cloud-pubsub` のバージョン1.140.2への更新です。主な変更点は以下の通りです。
*   BigQuery、Cloud Storage、Google Cloud Coreライブラリ、SDKプラットフォームのJava設定、OpenTelemetryトレースエクスポーター、Protobufユーティリティ、Easymockなど、複数の依存ライブラリのバージョンが更新されました。

影響有無：
影響なし。
本変更はPub/SubのJavaクライアントライブラリの依存関係の更新のみです。
*   Google Cloud Composer 2 (Airflow 2.7.3) はPythonベースであるため、このJavaクライアントライブラリの変更による直接的な影響はありません。
*   Google Kubernetes Engine (GKE) 1.31上で稼働しているアプリケーションが、Pub/Subとの連携にこのJavaクライアントライブラリを明示的に使用している場合、依存関係の更新が含まれます。通常、依存関係の更新は互換性の向上やセキュリティ修正が目的であり、既存のアプリケーションの動作に破壊的な変更は含まれていません。

対処方法：
既存のアプリケーションに影響を与えないため、緊急の対応は不要です。最新の依存関係を利用したい場合は、Pub/Sub Javaクライアントライブラリのバージョンアップをご検討ください。

用語説明：
*   **Protobuf (Protocol Buffers)**: Googleが開発した、構造化データをシリアライズするための言語に依存しない、プラットフォームに依存しない、拡張可能なメカニズムです。RPC（Remote Procedure Call）やデータ永続化によく使用されます。
*   **Easymock**: Javaでモックオブジェクトを作成するためのライブラリです。単体テストなどで依存するコンポーネントの振る舞いをシミュレートするために使用されます。

---

# Spanner
## Changed
原文:
```
**Go Client Library (spanner/admin/database/apiv1)**
- **spanner/spansql:** Add support for TOKENIZE_JSON. (#12338) (72225a5)
- **spanner/spansql:** Support EXISTS in query parsing (#12439) (f5cb67b)
- **spanner:** Add new change_stream.proto (40b60a4)
- **spanner:** Add option for how to call BeginTransaction (#12436) (2cba13b)
- **spanner:** Wrap proto mutation (#12497) (e655889)
- **spanner:** Pointer type custom struct decoder (#12496) (ac3cafb)

**Java Client Library (google-cloud-spanner)**
- Enable ALTS hard bound token in DirectPath (#3904) (2b0f2ff)
- Enable grpc and afe metrics (#3896) (706f794)
- Last statement sample (#3830) (2f62816)
- **spanner:** Add new change_stream.proto (f385698)
- Directpath_enabled attribute (#3897) (53bc510)
- Update dependency io.opentelemetry:opentelemetry-bom to v1.50.0 (#3887) (94b879c)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.49.0 (#3909) (3de8502)
- Update googleapis/sdk-platform-java action to v2.59.0 (#3910) (aed8bd6)
- Allow JDBC to configure directpath for connection (#3929) (d754f1f)
- Support getOrNull and getOrDefault in Struct (#3914) (1dc5a3e)
- Use multiplexed sessions for read-only transactions (#3917) (37fdc27)
- Allow zero durations to be set for connections (#3916) (43ea4fa)
- Add snippet for Repeatable Read configuration at client and transaction (#3908) (ff3d212)
- Update SpannerSample.java to align with best practices (#3625) (7bfc62d)
```
説明：
SpannerのGoクライアントライブラリ `spanner/admin/database/apiv1` とJavaクライアントライブラリ `google-cloud-spanner` の複数のバージョン更新です。

**Goクライアントライブラリ (バージョン1.83.0):**
*   Spanner SQLの解析機能が強化され、`TOKENIZE_JSON` 関数および `EXISTS` 句のサポートが追加されました。
*   Spanner Change Streams機能に関連する `change_stream.proto` が追加されました。
*   `BeginTransaction` 呼び出しのオプションが追加され、Proto mutationのラップやポインタ型カスタム構造体デコーダが改善されました。

**Javaクライアントライブラリ (バージョン6.95.0, 6.95.1, 6.96.0):**
*   DirectPath接続におけるセキュリティ強化（ALTS hard bound token）と、gRPCおよびAFE（Application Frontend）に関するメトリクス収集機能が有効化されました。
*   Spanner Change Streams機能に関連する `change_stream.proto` が追加され、DirectPath関連の属性が追加されました。
*   JDBCドライバ経由でのDirectPath接続設定が可能になり、`Struct` オブジェクトで `getOrNull` および `getOrDefault` メソッドがサポートされました。
*   読み取り専用トランザクションでマルチプレックスセッションを使用する機能が導入され、パフォーマンス向上が期待されます。
*   接続設定におけるゼロ継続時間の指定が許可され、`Repeatable Read` トランザクション設定に関するサンプルコードが追加・更新されました。
*   OpenTelemetry BOM、SDKプラットフォームのJava設定など、各種依存ライブラリのバージョンが更新されました。

影響有無：
影響なし（またはポジティブな影響）。
本変更はSpannerのGoおよびJavaクライアントライブラリにおける機能追加、改善、および依存関係の更新が主です。
*   Google Cloud Composer 2 (Airflow 2.7.3) はPythonベースであるため、これらのJava/Goクライアントライブラリの変更による直接的な影響はありません。
*   Google Kubernetes Engine (GKE) 1.31上で稼働しているアプリケーションが、Spannerとの連携にこれらのJavaまたはGoクライアントライブラリを明示的に使用している場合、以下の影響が考えられます。
    *   **機能追加**: `TOKENIZE_JSON`、`EXISTS`、Change Streams、DirectPath関連の強化、`Struct` メソッドの追加など、多くの新機能が追加されています。これらは既存のアプリケーションの動作に破壊的な変更をもたらすものではなく、これらの新機能を利用したい場合にライブラリのバージョンアップが必要です。
    *   **パフォーマンス向上**: 読み取り専用トランザクションでのマルチプレックスセッション使用やDirectPathの改善は、アプリケーションのSpannerとの通信パフォーマンスにプラスの影響を与える可能性があります。
    *   **セキュリティ強化**: DirectPathにおけるALTS hard bound tokenの有効化はセキュリティ面での改善です。
    *   **依存関係更新**: 通常、互換性の向上やセキュリティ修正が目的であり、既存のアプリケーションの動作に破壊的な影響はありません。

対処方法：
Spannerの新しいSQL関数やChange Streamsなどの新機能を活用したい場合、またはパフォーマンスやセキュリティの改善を享受したい場合は、利用しているGoまたはJavaクライアントライブラリのバージョンアップをご検討ください。既存のアプリケーションの動作には影響を与えないため、緊急の対応は不要です。

用語説明：
*   **DirectPath**: Google Cloudサービスのバックエンドに直接接続するための高帯域幅、低レイテンシの通信パスです。通常、内部的に使用され、アプリケーションのパフォーマンスを向上させます。
*   **ALTS (Application Layer Transport Security)**: Googleが開発した認証および暗号化プロトコルで、アプリケーション層でセキュアな通信を確立します。`hard bound token` は、トークンを特定のネットワーク接続に厳密に紐付けることでセキュリティを強化する仕組みです。
*   **gRPC**: Googleが開発した、高パフォーマンスなオープンソースのRPC（Remote Procedure Call）フレームワークです。
*   **AFE (Application Frontend)**: Google Cloudのサービスへのリクエストを処理するフロントエンドシステムです。負荷分散、認証、APIルーティングなどを担当します。
*   **Spanner Change Streams**: Spannerデータベースのデータ変更をリアルタイムでキャプチャし、Pub/Subなどの他のサービスにストリーミングする機能です。データ同期、監査、分析などに利用されます。
*   **Multiplexed Sessions**: データベース接続において、複数のトランザクションやクエリを単一の物理的な接続上で並行して処理する技術です。これにより、接続のオーバーヘッドを削減し、スループットとレイテンシを改善します。
*   **Repeatable Read**: データベースのトランザクション分離レベルの一つで、トランザクションの実行中に同じデータを複数回読み取った場合に、常に同じ結果が返されることを保証します。


# Title: June 30, 2025 
Link: https://cloud.google.com/release-notes#June_30_2025<br>
ご担当者様

Google Cloudのリリースノートに基づき、構築済みのサービスへの影響調査結果を以下にご報告いたします。貴社環境として、Google Cloud Composer 2 (Compoer version 2.7.1, Airflow version 2.7.3) および Google Kubernetes Engine 1.31 をご利用とのことですが、今回のリリースノートは主に各言語のクライアントライブラリの更新に関するものです。これらの更新は、貴社が開発・運用しているアプリケーションが該当言語（Java/Go）のクライアントライブラリを直接利用している場合に影響があります。Google Cloud Composer や Google Kubernetes Engine のサービス基盤自体への直接的な影響はございません。

---

# Cloud Storage

## Changed

原文:
A weekly digest of client library updates from across the Cloud SDK.
**Java**
**Changes for google-cloud-storage**
[google-cloud-storage](https://github.com/googleapis/java-storage)
[2.53.2](https://github.com/googleapis/java-storage/compare/v2.53.1...v2.53.2)
- Fix Journaling BlobWriteSessionConfig to properly handle multiple consecutive retries (#3166) (895bfbd)
- Update dependency com.google.cloud.opentelemetry:exporter-trace to v0.36.0 (#3162) (41a1030)
- Update sdk-platform-java dependencies (#3164) (c22a131)

説明:
Cloud StorageのJavaクライアントライブラリ `google-cloud-storage` バージョン2.53.2がリリースされました。このバージョンでは、`BlobWriteSessionConfig` における連続するリトライ処理の不具合が修正され、信頼性が向上しています。また、OpenTelemetryのトレースエクスポーターやSDKプラットフォームのJava依存関係のアップデートが含まれています。

影響有無:
*   **影響有無**: 軽微な影響あり（主に改善）
*   **理由**: このアップデートは主にバグ修正と依存ライブラリの更新であり、既存のAPIや機能に非互換な変更は含まれていません。Javaクライアントライブラリを使用してCloud Storageへの書き込みを行い、特に`BlobWriteSessionConfig`における連続リトライ処理の問題に直面していたアプリケーションにとっては、安定性向上の恩恵があります。Google Cloud ComposerはPythonベースであるため直接的な影響はありません。Google Kubernetes Engine上で稼働するJavaアプリケーションがこのライブラリを使用している場合は、安定性向上のメリットを享受できます。

対処方法:
*   JavaでCloud Storageを操作するアプリケーションを開発・運用している場合、このライブラリのバージョンへのアップデートを検討してください。特に、上記のリトライ問題に遭遇している場合は、アップデートにより問題が解決する可能性があります。
*   アップデート実施の際は、常にテスト環境での十分な検証を実施することを推奨します。

用語説明:
*   **BlobWriteSessionConfig**: Google Cloud Storageにオブジェクト（Blob）を書き込む際のセッション設定を管理するクラスです。特に大容量ファイルのアップロードなどで使用されます。
*   **Journaling**: システムの変更履歴を記録するプロセスです。ここでは、Cloud Storageへの書き込み操作の進行状況を記録し、障害発生時やリトライ時に整合性を保つためのメカニズムを指します。
*   **OpenTelemetry**: クラウドネイティブなソフトウェアのための、ベンダーに依存しないオブザーバビリティ（可観測性）データ（トレース、メトリクス、ログ）の収集およびエクスポートを目的としたオープンソースプロジェクトです。アプリケーションの動作を監視・分析するために利用されます。

---

# Spanner

## Changed (Go Client Library)

原文:
A monthly digest of client library updates from across the Cloud SDK.
**Go**
**Changes for spanner/admin/database/apiv1**
[spanner/admin/database/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/spanner/admin/database/apiv1)
[1.83.0](https://github.com/googleapis/google-cloud-go/compare/spanner/v1.82.0...spanner/v1.83.0)
- **spanner/spansql:** Add support for TOKENIZE_JSON. (#12338) (72225a5)
- **spanner/spansql:** Support EXISTS in query parsing (#12439) (f5cb67b)
- **spanner:** Add new change_stream.proto (40b60a4)
- **spanner:** Add option for how to call BeginTransaction (#12436) (2cba13b)
- **spanner:** Wrap proto mutation (#12497) (e655889)
- **spanner:** Pointer type custom struct decoder (#12496) (ac3cafb)

説明:
SpannerのGoクライアントライブラリ `spanner/admin/database/apiv1` バージョン1.83.0がリリースされました。このバージョンでは、Spanner SQLにおける`TOKENIZE_JSON`関数のサポート、`EXISTS`句のクエリ解析サポートといった機能拡張が含まれます。また、新しい`change_stream.proto`の追加、`BeginTransaction`呼び出しオプションの追加、およびカスタム構造体デコーダーの改善も行われています。

影響有無:
*   **影響有無**: 軽微な影響あり（新機能追加）
*   **理由**: これらの変更は主に新機能の追加や既存機能の拡張であり、既存のAPIやアプリケーションの動作に非互換な変更をもたらすものではありません。Google Cloud ComposerはPythonベースであるため直接的な影響はありません。Google Kubernetes Engine上でGo言語のアプリケーションを運用している場合、これらの新しいSpanner SQL機能やAPIの恩恵を受けることができます。

対処方法:
*   GoでSpannerを操作するアプリケーションを開発・運用しており、追加された新機能（例: `TOKENIZE_JSON`、`EXISTS`句など）の利用を検討する際は、このライブラリのバージョンへのアップデートを実施してください。
*   既存のアプリケーションの動作に影響を与える可能性は低いですが、依存関係の更新を行う際は、テスト環境での十分な検証を推奨します。

用語説明:
*   **TOKENIZE_JSON**: Spanner SQLでJSONデータをより詳細に解析・検索するための新しい関数であると推測されます。具体的には、JSON文字列を構成要素（トークン）に分解し、特定の条件に基づいて処理することを可能にする可能性があります。
*   **EXISTS句**: SQLにおいて、サブクエリが任意の行を返すかどうかをテストするために使用される述語です。`EXISTS`句のサポートにより、Goクライアントライブラリを使用したSpannerクエリの表現力が向上します。
*   **Change Streams**: Spannerデータベースのデータ変更イベントをほぼリアルタイムでキャプチャし、Google Cloud Pub/Subなどの他のサービスにストリーミングする機能です。データの同期、監査、分析パイプラインの構築に利用されます。

## Changed (Java Client Library)

原文:
**Java**
**Changes for google-cloud-spanner**
[google-cloud-spanner](https://github.com/googleapis/java-spanner)
[6.95.0](https://github.com/googleapis/java-spanner/compare/v6.94.0...v6.95.0)
- Enable ALTS hard bound token in DirectPath (#3904) (2b0f2ff)
- Enable grpc and afe metrics (#3896) (706f794)
- Last statement sample (#3830) (2f62816)
- **spanner:** Add new change_stream.proto (f385698)
- Directpath_enabled attribute (#3897) (53bc510)
- Update dependency io.opentelemetry:opentelemetry-bom to v1.50.0 (#3887) (94b879c)
[6.95.1](https://github.com/googleapis/java-spanner/compare/v6.95.0...v6.95.1)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.49.0 (#3909) (3de8502)
- Update googleapis/sdk-platform-java action to v2.59.0 (#3910) (aed8bd6)
[6.96.0](https://github.com/googleapis/java-spanner/compare/v6.95.1...v6.96.0)
- Allow JDBC to configure directpath for connection (#3929) (d754f1f)
- Support getOrNull and getOrDefault in Struct (#3914) (1dc5a3e)
- Use multiplexed sessions for read-only transactions (#3917) (37fdc27)
- Allow zero durations to be set for connections (#3916) (43ea4fa)
- Add snippet for Repeatable Read configuration at client and transaction (#3908) (ff3d212)
- Update SpannerSample.java to align with best practices (#3625) (7bfc62d)

説明:
SpannerのJavaクライアントライブラリ `google-cloud-spanner` バージョン6.95.0, 6.95.1, 6.96.0 が立て続けにリリースされました。
これらのリリースには、DirectPathにおけるALTSハードバウンドトークンの有効化によるセキュリティ強化、gRPCおよびAFEメトリクス有効化による監視機能の強化、新しい`change_stream.proto`の追加、JDBC経由でのDirectPath接続設定の許可、`Struct`クラスにおける`getOrNull`および`getOrDefault`メソッドのサポートなどが含まれます。また、読み取り専用トランザクションでの多重化セッションの利用により、パフォーマンス向上が期待できます。

影響有無:
*   **影響有無**: 軽微な影響あり（機能強化、パフォーマンス改善、セキュリティ強化）
*   **理由**: これらの変更は、主に既存機能の安定性、パフォーマンス、セキュリティ、監視機能、および利便性を向上させるものであり、既存のアプリケーションの動作に非互換な変更をもたらす可能性は低いと考えられます。読み取り専用トランザクションで多重化セッションが利用されるようになることで、既存のワークロードにおいてもパフォーマンスの改善が期待できます。Google Cloud ComposerはPythonベースであるため直接的な影響はありません。Google Kubernetes Engine上でJavaアプリケーションを運用している場合は、これらの機能強化やパフォーマンス改善の恩恵を享受できます。

対処方法:
*   JavaでSpannerを操作するアプリケーションを開発・運用している場合、セキュリティ強化、パフォーマンス改善、監視機能の恩恵を受けるために、このライブラリの最新バージョンへのアップデートを強く推奨します。
*   特に、DirectPathを利用している環境や、読み取り専用トランザクションのパフォーマンスがボトルネックになっている場合、アップデートによる改善が期待できます。
*   アップデート実施の際は、テスト環境での十分な検証を推奨します。

用語説明:
*   **ALTS (Application Layer Transport Security)**: Google独自の認証・認可・暗号化プロトコルであり、Googleのインフラストラクチャ内でサービス間の通信セキュリティを強化するために設計されています。
*   **DirectPath**: Google Cloudのサービスへのアクセスパスの一つで、従来のロードバランサやプロキシを介さず、クライアントから直接バックエンドサービスに接続することで、低レイテンシと高スループットを実現します。
*   **gRPC**: Googleが開発したオープンソースの高性能Remote Procedure Call (RPC) フレームワークです。SpannerのクライアントライブラリはgRPCを基盤としています。
*   **AFE (Application Front End)**: Googleのグローバルなネットワークインフラストラクチャにおける最前線に位置するサービスで、リクエストのルーティング、負荷分散、DDoS防御、SSLオフロードなどの機能を提供します。
*   **Multiplexed Sessions (多重化セッション)**: 複数のデータベース操作やトランザクションを単一の物理的なネットワーク接続やセッション上で並行して実行する技術です。これにより、リソースの利用効率が向上し、接続の確立にかかるオーバーヘッドが削減され、レイテンシが低減される可能性があります。
# Title: June 27, 2025 
Link: https://cloud.google.com/release-notes#June_27_2025<br>
## Google Cloud Composer2 (Compoer version 2.7.1、Airflow version 2.7.3)
今回のリリースノートには、Google Cloud Composerに関する変更は含まれておりません。したがって、現在のサービスへの影響はありません。

## Cloud Billing
### Changed
原文: **New fields added to Cloud Billing data exports to BigQuery**

To prepare for expanding the spend-based committed use discounts (CUD)s program, we added new data fields to the schema for Cloud Billing standard and detailed data exports to BigQuery. These new fields add more information about the prices charged for your Google Cloud usage and consumption models.

To learn more, see Billing data and SKU updates for spend-based CUDs.

[Billing data and SKU updates for spend-based CUDs](https://cloud.google.com/billing/docs/resources/multiprice-cuds)

説明: コミット済み利用割引（CUDs）プログラムの拡張に備え、Google Cloudの課金データをBigQueryへエクスポートする際の標準および詳細データのエクスポートスキーマに新しいデータフィールドが追加されました。これらの新しいフィールドは、Google Cloudの利用料金や消費モデルに関する追加情報を提供します。

影響有無: 軽微な影響。
既存のBigQueryテーブルのスキーマに新しいカラムが追加されますが、これは非破壊的な変更です。現在BigQueryに課金データをエクスポートしている場合、既存のクエリやデータ処理パイプラインに直接的なエラーは発生しません。しかし、新しいフィールドを活用してより詳細なコスト分析を行う場合は、クエリやレポートを更新する必要があります。

対処方法:
1.  現在BigQueryで課金データを利用している場合は、新しいフィールドの追加による影響がないことを確認してください。通常、既存のクエリは新しいフィールドを無視するため問題ありません。
2.  追加された新しいフィールド（例えば、料金や消費モデルに関する詳細）を利用して、より詳細なコスト分析や最適化を行いたい場合は、BigQueryのクエリやデータ処理パイプラインを更新することを検討してください。詳細については、関連ドキュメント[Billing data and SKU updates for spend-based CUDs](https://cloud.google.com/billing/docs/resources/multiprice-cuds)を参照してください。

用語説明:
*   **Committed Use Discounts (CUDs)**: コミット済み利用割引。特定のGoogle Cloudサービスについて、一定期間（通常1年または3年）の最小利用量にコミットすることで得られる割引です。これにより、オンデマンド料金よりも大幅に低い料金でサービスを利用できます。
*   **BigQuery**: Google Cloudが提供する、フルマネージドでスケーラブルなエンタープライズデータウェアハウスサービスです。ペタバイト規模のデータも高速に分析できます。
*   **スキーマ (Schema)**: データベースやデータウェアハウスにおけるデータの構造を定義するものです。テーブルにおけるカラム名、データ型、制約などを指します。

## Google Kubernetes Engine
### Changed
原文: GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

説明: GKEクラスターの新しいバージョンがリリースされ、新規クラスターの作成や既存クラスターのコントロールプレーンおよびノードのアップグレードで選択できるようになりました。

影響有無: 影響なし（機会の提供）。
既存のGKEクラスター（バージョン1.31）に自動的に変更が適用されるものではありません。新しいバージョンが利用可能になったことを通知するものであり、クラスターの運用に直接的な影響はありませんが、将来的なアップグレードの選択肢が増えました。

対処方法:
現在のGKEクラスターはバージョン1.31です。この変更は、新しいバージョンの提供を知らせるものです。既存のクラスターの自動アップグレード設定を確認し、必要に応じて新しいマイナーバージョンまたはパッチバージョンへのアップグレードを計画することを推奨します。アップグレードの際は、公式ドキュメントの[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)および[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)を参照し、アプリケーションの互換性を十分にテストしてください。

用語説明:
*   **GKE (Google Kubernetes Engine)**: Google Cloudが提供する、Kubernetesをフルマネージドで実行できるサービスです。コンテナ化されたアプリケーションのデプロイ、管理、スケーリングを容易にします。
*   **Control Plane (コントロールプレーン)**: Kubernetesクラスターの頭脳部分にあたるコンポーネント群（APIサーバー、スケジューラー、コントローラーマネージャーなど）です。クラスターの状態を管理し、操作を調整します。
*   **Node (ノード)**: Kubernetesクラスターにおいて、コンテナ化されたアプリケーションを実行するワーカーマシン（VMインスタンスなど）です。

---

### Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Rapid channel:

- 1.30.12-gke.1320000
- 1.31.9-gke.1287000
- 1.32.4-gke.1767000
- 1.33.1-gke.1959000
- 1.33.2-gke.1043000

- 1.30.12-gke.1320000
- 1.31.9-gke.1287000
- 1.32.4-gke.1767000
- 1.33.1-gke.1959000
- 1.33.2-gke.1043000

[1.30.12-gke.1320000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.9-gke.1287000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1319)
[1.32.4-gke.1767000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
[1.33.1-gke.1959000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1331)
[1.33.2-gke.1043000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1332)

説明: Rapidリリースチャネルにおいて、新しいGKEバージョンが利用可能になりました。これにはKubernetes 1.30、1.31、1.32、1.33のパッチバージョンが含まれます。リリースノート公開時点でロールアウトが進行中であり、全ゾーンへの展開には数日かかる場合があります。

影響有無: 軽微な影響。
現在のGKEクラスターがバージョン1.31であり、**Rapidチャネル**を使用している場合、新しいパッチバージョンである1.31.9-gke.1287000へのアップグレードが利用可能になります。自動アップグレードが有効になっているクラスターでは、今後このバージョンに更新される可能性があります。

対処方法:
Rapidチャネルを利用しているクラスターの場合、自動アップグレード設定によっては、このバージョンに更新される可能性があります。事前にアプリケーションの互換性テストを行い、必要に応じてアップグレードを計画してください。Rapidチャネルは新機能や修正が最も早く提供されますが、安定性には注意が必要です。

用語説明:
*   **GKE Release Channels (リリースチャネル)**: GKEクラスターのバージョンと機能のリリース頻度と安定性を制御する設定です。`Rapid`、`Regular`、`Stable`、`Extended`などのチャネルがあります。`Rapid`チャネルは最も早く新機能やパッチを提供しますが、予期せぬ変更や非互換性が含まれる可能性が最も高いチャネルです。

---

### Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Stable channel:

- 1.30.12-gke.1168000
- 1.31.9-gke.1044001
- 1.32.4-gke.1415000

- 1.30.12-gke.1168000
- 1.31.9-gke.1044001
- 1.32.4-gke.1415000

[1.30.12-gke.1168000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.9-gke.1044001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1319)
[1.32.4-gke.1415000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)

説明: Stableリリースチャネルにおいて、新しいGKEバージョンが利用可能になりました。これにはKubernetes 1.30、1.31、1.32のパッチバージョンが含まれます。リリースノート公開時点でロールアウトが進行中であり、全ゾーンへの展開には数日かかる場合があります。

影響有無: 軽微な影響。
現在のGKEクラスターがバージョン1.31であり、**Stableチャネル**を使用している場合、新しいパッチバージョンである1.31.9-gke.1044001へのアップグレードが利用可能になります。自動アップグレードが有効になっているクラスターでは、今後このバージョンに更新される可能性があります。

対処方法:
Stableチャネルを利用しているクラスターの場合、自動アップグレード設定によっては、このバージョンに更新される可能性があります。事前にアプリケーションの互換性テストを行い、計画的にアップグレードを進めてください。Stableチャネルは、より高い安定性が期待されるチャネルです。

用語説明:
*   **Stable Channel**: GKEリリースチャネルの一つで、広範なテストと検証が行われたバージョンが提供されます。本番環境での利用に適しています。

---

### Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Extended channel:

- 1.28.15-gke.2445000
- 1.29.15-gke.1594000
- 1.30.12-gke.1246000
- 1.31.9-gke.1176000
- 1.32.4-gke.1603000
- 1.33.1-gke.1584000

- The following versions are no longer available in the Extended channel:

- 1.27.16-gke.2820000
- 1.27.16-gke.2853000
- 1.27.16-gke.2894000

- 1.28.15-gke.2445000
- 1.29.15-gke.1594000
- 1.30.12-gke.1246000
- 1.31.9-gke.1176000
- 1.32.4-gke.1603000
- 1.33.1-gke.1584000

[1.28.15-gke.2445000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.15-gke.1594000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.12-gke.1246000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.9-gke.1176000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1319)
[1.32.4-gke.1603000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
[1.33.1-gke.1584000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1331)
- 1.27.16-gke.2820000
- 1.27.16-gke.2853000
- 1.27.16-gke.2894000

説明: Extendedリリースチャネルにおいて、新しいGKEバージョンが利用可能になりました。これにはKubernetes 1.28、1.29、1.30、1.31、1.32、1.33のパッチバージョンが含まれます。同時に、以前のいくつかの1.27.16-gke.xバージョンは利用できなくなりました。リリースノート公開時点でロールアウトが進行中であり、全ゾーンへの展開には数日かかる場合があります。

影響有無: 軽微な影響。
現在のGKEクラスターがバージョン1.31であり、**Extendedチャネル**を使用している場合、新しいパッチバージョンである1.31.9-gke.1176000へのアップグレードが利用可能になります。自動アップグレードが有効になっているクラスターでは、今後このバージョンに更新される可能性があります。現在1.27.xを使用していないため、利用不可になったバージョンによる直接的な影響はありません。

対処方法:
Extendedチャネルを利用しているクラスターの場合、自動アップグレード設定によっては、このバージョンに更新される可能性があります。事前にアプリケーションの互換性テストを行い、計画的にアップグレードを進めてください。

用語説明:
*   **Extended Channel**: GKEリリースチャネルの一つで、他のチャネルよりも長期間のサポートが提供されるバージョンが利用可能です。通常、保守的なアップグレードスケジュールを好むユーザー向けです。

---

### Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available:

- 1.30.12-gke.1320000
- 1.31.9-gke.1287000
- 1.32.4-gke.1767000
- 1.33.1-gke.1959000

- The following node versions are now available:

- 1.28.15-gke.2445000
- 1.29.15-gke.1594000
- 1.30.12-gke.1320000
- 1.31.9-gke.1287000
- 1.32.4-gke.1767000
- 1.33.1-gke.1959000
- 1.33.2-gke.1043000

- 1.30.12-gke.1320000
- 1.31.9-gke.1287000
- 1.32.4-gke.1767000
- 1.33.1-gke.1959000

[1.30.12-gke.1320000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.9-gke.1287000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1319)
[1.32.4-gke.1767000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
[1.33.1-gke.1959000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1331)
- 1.28.15-gke.2445000
- 1.29.15-gke.1594000
- 1.30.12-gke.1320000
- 1.31.9-gke.1287000
- 1.32.4-gke.1767000
- 1.33.1-gke.1959000
- 1.33.2-gke.1043000

[1.28.15-gke.2445000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.15-gke.1594000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.12-gke.1320000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.9-gke.1287000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1319)
[1.32.4-gke.1767000](https://github.cloud.google.com/kubernetes-engine/versioning)
[1.33.1-gke.1959000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1331)
[1.33.2-gke.1043000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1332)

説明: GKEのコントロールプレーンおよびノードの新しいバージョンが、どのリリースチャネルに属するかに関わらず一般的に利用可能になりました。これにはKubernetes 1.30、1.31、1.32、1.33のコントロールプレーンバージョンと、1.28から1.33までのノードバージョンが含まれます。

影響有無: 軽微な影響。
現在のGKEクラスターがバージョン1.31であるため、コントロールプレーンとノードの両方で1.31.9-gke.1287000が利用可能になったことを意味します。これはアップグレードの選択肢が増えることを示します。自動アップグレードが有効なクラスターは、設定されたリリースチャネルに応じてこれらのバージョンに更新される可能性があります。

対処方法:
クラスターのリリースチャネル設定と自動アップグレードのポリシーを確認し、必要に応じてアップグレードを計画してください。特にノードのバージョンアップグレードは、ワークロードへの影響を最小限に抑えるため、計画的に実施することが重要です。

---

### Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Regular channel:

- 1.30.12-gke.1246000
- 1.31.9-gke.1176000
- 1.32.4-gke.1603000
- 1.33.1-gke.1584000

- 1.30.12-gke.1246000
- 1.31.9-gke.1176000
- 1.32.4-gke.1603000
- 1.33.1-gke.1584000

[1.30.12-gke.1246000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.9-gke.1176000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1319)
[1.32.4-gke.1603000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
[1.33.1-gke.1584000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1331)

説明: Regularリリースチャネルにおいて、新しいGKEバージョンが利用可能になりました。これにはKubernetes 1.30、1.31、1.32、1.33のパッチバージョンが含まれます。リリースノート公開時点でロールアウトが進行中であり、全ゾーンへの展開には数日かかる場合があります。

影響有無: 軽微な影響。
現在のGKEクラスターがバージョン1.31であり、**Regularチャネル**を使用している場合、新しいパッチバージョンである1.31.9-gke.1176000へのアップグレードが利用可能になります。自動アップグレードが有効になっているクラスターでは、今後このバージョンに更新される可能性があります。

対処方法:
Regularチャネルを利用しているクラスターの場合、自動アップグレード設定によっては、このバージョンに更新される可能性があります。事前にアプリケーションの互換性テストを行い、計画的にアップグレードを進めてください。Regularチャネルは、Rapidチャネルよりも安定性が高く、Stableチャネルよりも早く新機能が提供されるバランスの取れたチャネルです。

用語説明:
*   **Regular Channel**: GKEリリースチャネルの一つで、迅速なパッチ適用と新機能の提供がありつつ、ある程度の安定性が確保されたバージョンが提供されます。多くの本番環境で推奨されるチャネルです。
# Title: June 25, 2025 
Link: https://cloud.google.com/release-notes#June_25_2025<br>
以下にGoogle Cloudのリリースノートに関する調査結果を報告いたします。

---

# Artifact Registry

## Announcement

**原文:**
Artifact Registry generic repositories are now generally available.

[generally available](https://cloud.google.com/products?#product-launch-stages)
Generic repositories store versioned, immutable artifacts that don't have to adhere to any specific package format in Artifact Registry. You can store and manage arbitrary files such as archives, binaries, and media files with no package specifications or management clients.

To get started with generic repositories, see the quickstart.

[quickstart](https://cloud.google.com/artifact-registry/docs/generic/store-generic)

**説明:**
Artifact Registry において、特定のパッケージ形式に縛られない「ジェネリックリポジトリ (generic repositories)」が正式リリース（Generally Available: GA）されました。この新機能により、Artifact Registry を使用して、アーカイブファイル、バイナリ、メディアファイルなど、任意の種類のファイルをバージョン管理された不変のアーティファクトとして保存および管理できるようになります。これにより、これまでは対応していなかった多様なビルド成果物やプロジェクト資産を、Artifact Registryで一元的に管理するパスが提供されます。

**影響有無:**
**影響なし。**
この変更は、既存のArtifact Registryの機能に対する追加であり、お客様が現在ご利用中のサービスや設定に直接的な変更や非互換性をもたらすものではありません。Google Cloud ComposerやGoogle Kubernetes Engine (GKE) は、通常、DockerイメージやPythonパッケージなどの特定のパッケージ形式のアーティファクトをArtifact Registryから利用しますが、今回の「ジェネリックリポジトリ」のGAは、それらの既存のワークロードに影響を与えるものではありません。

**対処方法:**
**現時点での対応は不要です。**
この新機能は、既存の運用に影響を与えるものではなく、任意で活用できるものです。もし、CI/CDパイプラインにおいて、特定のパッケージ形式に属さない任意のファイル（例：Terraformモジュール、シェルスクリプト、静的アセット、カスタム設定ファイルなど）をバージョン管理し、集中管理したいという要件がある場合に、本機能の導入を検討してください。

**用語説明:**
*   **Artifact Registry:** Google Cloudが提供するユニバーサルパッケージマネージャサービスです。Dockerイメージ、Maven、npm、Python、Go、Debian、RPMなど、さまざまなパッケージ形式のアーティファクトを一元的に保存、管理、配布できます。セキュリティ、スケーラビリティ、可用性に優れています。
*   **Generic repositories (ジェネリックリポジトリ):** Artifact Registry の一種で、特定のパッケージ形式の制約を受けずに、任意のファイル（アーカイブ、バイナリ、メディアファイルなど）を保存・バージョン管理できるリポジトリタイプです。これにより、より広範なアーティファクト管理のニーズに対応できます。
*   **Generally Available (GA):** Google Cloudの製品ライフサイクルにおけるステージの一つです。この段階に達した製品や機能は、本番環境での利用が推奨され、安定性、機能、サービスレベル契約 (SLA) が保証されます。通常、この段階以降で大幅な変更や非推奨化が行われることは稀です。
*   **Immutable artifacts (不変のアーティファクト):** 一度作成またはデプロイされた後に変更ができない、あるいは変更が推奨されないアーティファクトを指します。これにより、デプロイの再現性が保証され、意図しない変更による問題を防ぐことができます。これは、セキュアで信頼性の高いソフトウェア開発ライフサイクルにおいて重要な概念です。

# Title: June 24, 2025 
Link: https://cloud.google.com/release-notes#June_24_2025<br>
## Google Kubernetes Engine

### Changed
原文: Starting on September 1, 2025, GKE version upgrades can proceed even if existing resources violate custom organization policy constraints. GKE allows upgrade-only operations to occur as long as the operation doesn't introduce new policy violations.

説明:
この変更は2025年9月1日から適用されます。既存のGoogle Kubernetes Engine (GKE) クラスタのリソースがカスタム組織ポリシー制約に違反している場合でも、GKEのバージョンアップグレードが実行できるようになります。ただし、アップグレード操作自体が新たに組織ポリシー違反を発生させない場合に限ります。これまでのGKEアップグレードでは、既存のポリシー違反がアップグレードをブロックする要因となるケースがありましたが、この変更により、既存の違反があるクラスタでもスムーズにアップグレードを進めることが可能になり、クラスタの最新化を促進することを目的としています。

影響有無:
*   **影響なし（むしろ好影響）**
*   **理由**: 現在、組織ポリシー違反が存在するためにGKEクラスタのバージョンアップグレードが阻害されているケースがある場合、2025年9月1日以降はアップグレードが可能になるため、クラスタのライフサイクル管理が容易になります。これにより、セキュリティパッチの適用や新機能の利用が促進され、運用面でのメリットが期待されます。既存の違反は解消されないままアップグレードが完了するため、ポリシー遵守の取り組みは引き続き必要です。

対処方法:
*   **直接的な対処は不要**: この変更はGKEのアップグレード動作の緩和であり、お客様側で設定変更などの直接的な対処は必要ありません。
*   **推奨事項**: GKEクラスタがカスタム組織ポリシーに違反している場合は、この変更によってアップグレードが可能になったとしても、引き続きポリシーを遵守するよう是正措置を講じることを強く推奨します。GKEのバージョンアップグレードが容易になることで、これまでポリシー違反が原因でアップグレードを躊躇していたクラスタについても、最新バージョンへの更新計画を立て直す良い機会となります。

用語説明:
*   **組織ポリシー制約 (Organization Policy Constraints)**: Google Cloudの組織全体にわたって、リソースの作成や設定に特定のルールや制限を設けるための機能です。これにより、セキュリティ、コンプライアンス、コスト管理などの目的で、一貫性のあるリソース構成を強制できます。例えば、「特定のリージョンにのみリソースをデプロイ可能にする」といった制約を設定できます。
*   **GKEバージョンアップグレード**: Google Kubernetes Engine (GKE) クラスタのKubernetesバージョンを新しいバージョンに更新するプロセスです。セキュリティ脆弱性の修正、新機能の導入、パフォーマンスの向上などが含まれます。GKEは自動アップグレード機能も提供していますが、手動でのアップグレードも可能です。
# Title: June 23, 2025 
Link: https://cloud.google.com/release-notes#June_23_2025<br>
ご担当者様

Google Cloudのリリースノートに関するお問い合わせ、ありがとうございます。
Cloud Storage のクライアントライブラリの更新について、構築済みのサービスへの影響を調査いたしました。

---

# Cloud Storage

## Libraries - Java

### Changed

原文:
- Cancel the future in RemoteStorageHelper#forceDelete when TimeoutException happens (#3136) (e6007d5)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.59.0 (7dba9f0)
- Update dependency com.google.apis:google-api-services-storage to v1-rev20250605-2.0.0 (#3143) (17a80d8)
- Update sdk-platform-java dependencies (#3152) (2f78192)

説明：
Google Cloud Storage Java クライアントライブラリ (`google-cloud-storage`) バージョン 2.53.1 の更新です。
この更新には以下の変更が含まれます：
1.  `RemoteStorageHelper#forceDelete` メソッドにおいて、`TimeoutException` が発生した際に Future オブジェクトが適切にキャンセルされないバグが修正されました。これにより、リソースリークや予期せぬ動作を防ぎます。
2.  Java コードジェネレータ (gapic-generator-java) および `com.google.apis:google-api-services-storage`、`sdk-platform-java` などの内部依存ライブラリのバージョンが更新されました。

影響有無：
**影響は低い可能性がありますが、GKE上のJavaアプリケーションでは考慮が必要です。**
*   **Google Cloud Composer2**: Composer は主に Python ベースであり、通常 Java ライブラリを直接利用しないため、直接的な影響はほぼありません。
*   **Google Kubernetes Engine (GKE)**: GKE 上で稼働している Java アプリケーションが `google-cloud-storage` ライブラリを使用している場合、この更新の影響を受ける可能性があります。特に `RemoteStorageHelper#forceDelete` メソッドを使用しており、タイムアウト時の挙動に問題が発生していた場合は、この修正により改善が見込まれます。依存ライブラリの更新は、通常は後方互換性が保たれますが、稀に既存のアプリケーションとの予期せぬ挙動や依存関係の競合を引き起こす可能性も考慮する必要があるため、更新時には互換性テストが推奨されます。

対処方法：
*   GKE 上で Java アプリケーションが `google-cloud-storage` ライブラリを使用しており、上記バグ（特に `RemoteStorageHelper#forceDelete` のタイムアウト問題）に該当する、またはライブラリの最新化を図る場合は、アプリケーションで使用している `google-cloud-storage` ライブラリを最新バージョン (2.53.1 以降) に更新することを検討してください。
*   更新に際しては、開発環境やステージング環境で十分な機能テストと性能テストを実施し、既存のアプリケーションに影響がないことを確認してください。

用語説明：
*   **Future**: Java の並行処理において、非同期に実行される処理の結果を表現するオブジェクトです。処理の完了を待機したり、結果を取得したりするために使用されます。
*   **TimeoutException**: 設定された時間内に処理が完了しなかった場合にスローされる例外です。
*   **GAPIC Generator (Google API Client Library Generator)**: Google Cloud の API のためのクライアントライブラリのコードを、API 定義から自動生成するためのツールです。これにより、開発者は API を簡単に利用できます。

## Libraries - Python

### Changed

原文:
- Add a check for partial response data (#1487) (7e0412a)
- Add trove classifier for Python 3.13 (0100916)
- **deps:** Require google-crc32c >= 1.1.3 (0100916)
- **deps:** Require protobuf >= 3.20.2, < 7.0.0 (0100916)
- **deps:** Require requests >= 2.22.0 (0100916)
- Remove setup.cfg configuration for creating universal wheels (#1448) (d3b6b3f)
- Resolve issue where pre-release versions of dependencies are installed (0100916)
- Segmentation fault in tink while writing data (#1490) (2a46c0b)
- Move quickstart to top of readme (#1451) (53257cf)
- Update README to break infinite redirect loop (#1450) (03f1594)

説明：
Google Cloud Storage Python クライアントライブラリ (`google-cloud-storage`) バージョン 3.1.1 の更新です。
この更新には以下の主要な変更が含まれます：
1.  部分的なレスポンスデータに対するチェックが追加され、堅牢性が向上しました。
2.  Python 3.13 のサポートを示す Trove Classifier が追加されました。
3.  以下の依存ライブラリのバージョン要件が更新されました: `google-crc32c >= 1.1.3`, `protobuf >= 3.20.2, < 7.0.0`, `requests >= 2.22.0`。
4.  依存関係のプレリリースバージョンが誤ってインストールされる問題が解決されました。
5.  データ書き込み中に内部で使用される `tink` ライブラリでセグメンテーション違反が発生する深刻なバグが修正されました。
6.  ユニバーサルホイール作成のためのビルド設定の削除、および README ドキュメントの改善が行われました。

影響有無：
**Composer および GKE 上のPythonアプリケーションで、特にデータ書き込み処理を行っている場合に影響がある可能性があります。**
*   **Google Cloud Composer2 (Compoer version 2.7.1、Airflow version 2.7.3)**: Composer は Python ベースであり、Airflow DAG やカスタムプラグインで `google-cloud-storage` ライブラリを頻繁に利用します。もし現在の環境でデータ書き込み処理においてセグメンテーション違反の問題に遭遇している場合、この更新は非常に重要です。また、依存関係のバージョン要件（特に `protobuf` の範囲指定）の変更は、Airflow 環境内にインストールされている他のライブラリとの間で依存関係の競合を引き起こす可能性があるため、注意深い確認が必要です。
*   **Google Kubernetes Engine (GKE)**: GKE 上で稼働している Python アプリケーションが `google-cloud-storage` ライブラリを使用している場合、この更新の影響を受けます。特に、データ書き込み時にセグメンテーション違反が発生していた場合は、この修正により問題が解決される可能性があります。依存関係のバージョン要件の変更は、アプリケーション全体の依存ライブラリの整合性を確認するきっかけとなる場合があります。

対処方法：
*   Google Cloud Composer の Airflow DAG や GKE 上の Python アプリケーションで `google-cloud-storage` ライブラリを使用している場合、最新バージョン (3.1.1 以降) への更新を強く検討してください。
*   特に、データ書き込み時にセグメンテーション違反の問題に遭遇している場合は、この更新を優先的に実施することを推奨します。
*   Composer 環境の場合、DAG の `requirements.txt` ファイル内で `google-cloud-storage` のバージョンを更新し、デプロイ前に他の依存ライブラリとの間でバージョン競合がないか、または互換性があるかを `pip check` やテスト環境での十分な検証を通じて確認してください。
*   GKE 上のアプリケーションの場合も、コンテナイメージを再ビルドし、テスト環境で互換性と機能の検証を実施してください。

用語説明：
*   **Trove classifier**: Python パッケージのメタデータの一部で、PyPI (Python Package Index) にアップロードされる際に、そのパッケージがサポートする Python のバージョン、オペレーティングシステム、ライセンスなどの情報を示す分類子です。
*   **google-crc32c**: CRC32C (Cyclic Redundancy Check 32-bit for Castagnoli polynomial) チェックサムを計算するための Python ライブラリです。Google Cloud Storage では、アップロードされたデータの整合性を検証するために使用されることがあります。
*   **protobuf (Protocol Buffers)**: Google が開発した、構造化されたデータをシリアライズするための言語に依存しない、プラットフォームに依存しない、拡張可能なメカニズムです。データ通信やデータ保存に用いられます。
*   **requests**: Python で最も広く使われている HTTP クライアントライブラリの一つです。ウェブサービスへのリクエスト送信などを容易に行うことができます。
*   **Segmentation fault**: プログラムが許可されていないメモリ領域にアクセスしようとしたときに発生する、深刻な実行時エラーです。通常、プログラムのクラッシュにつながります。
*   **tink**: Google が開発したオープンソースのクロスプラットフォームな暗号化ライブラリです。`google-cloud-storage` ライブラリが内部的に暗号化関連の処理で利用している可能性があります。

---

# Title: June 16, 2025 
Link: https://cloud.google.com/release-notes#June_16_2025<br>
# Cloud Composer
## Announcement
原文:
We're planning to phase out the APIs that aren't required by Cloud Composer 3.

- Starting **February 27, 2026**, the following APIs will **become fully detachable**. Deactivating these APIs won't cause the deactivation of the Cloud Composer API:

- artifactregistry.googleapis.com
- cloudbuild.googleapis.com
- container.googleapis.com
- pubsub.googleapis.com
- sqladmin.googleapis.com

- Starting **May 27, 2026**, these APIs **will no longer be enabled automatically** when you enable the Cloud Composer API. To create Cloud Composer 2 environments in new projects, the group of detached APIs must be enabled manually.

 Existing Cloud Composer 3 and Cloud Composer 2 environments in projects where the Cloud Composer API is already enabled will not be impacted. You can do the following:

- After **February 27, 2026**, if your project has only Cloud Composer 3 environments, then you can manually disable the detached APIs.
- After **February 27, 2026**, if your project has Cloud Composer 2 environments, then we recommend keeping these APIs enabled because disabling them might lead to environment's malfunction.
- After **May 27, 2026**, if you use automation scripts to provision Cloud Composer 2 environments, then make sure that the listed APIs are enabled in addition to the Cloud Composer API.

説明：
Cloud Composer 3では不要となる一部のGoogle Cloud APIについて、段階的に変更を行うというアナウンスです。

1.  **2026年2月27日以降**:
    *   `artifactregistry.googleapis.com`, `cloudbuild.googleapis.com`, `container.googleapis.com`, `pubsub.googleapis.com`, `sqladmin.googleapis.com` の各APIが「完全に分離可能 (fully detachable)」になります。これは、これらのAPIを無効化してもCloud Composer APIが自動的に無効化されることはなくなるという意味です。
    *   **既存のCloud Composer 2環境があるプロジェクトでは、これらのAPIを有効のままにしておくことが推奨されます。無効化すると環境が正しく動作しなくなる可能性があります。**
    *   Cloud Composer 3環境のみのプロジェクトでは、これらのAPIを手動で無効化できるようになります。

2.  **2026年5月27日以降**:
    *   Cloud Composer APIを有効にした際に、上記のAPIが**自動的に有効化されなくなります**。
    *   **新しいプロジェクトでCloud Composer 2環境を作成する場合、Cloud Composer APIに加えて、上記のAPIも手動で有効化する必要があります。**
    *   Cloud Composer 2環境のプロビジョニングに自動化スクリプトを使用している場合、スクリプトがこれらのAPIを有効にするように修正・確認する必要があります。

既存のCloud Composer 2およびCloud Composer 3環境には影響はありません。

影響有無：
**影響あり（将来的な新規プロビジョニングおよび運用方針）**

*   **現在の稼働中のComposer 2 (2.7.1) 環境**: 直接的な影響はありません。現在稼働している環境は引き続き正常に動作します。
*   **将来的なComposer 2環境の新規プロビジョニング**: 2026年5月27日以降、新しいプロジェクトでCloud Composer 2環境を構築する際には、これまで自動で有効化されていた関連APIを明示的に手動で有効化する必要があります。自動化スクリプトを利用している場合は、スクリプトの修正が必要になります。
*   **既存Composer 2環境の運用方針**: 2026年2月27日以降に、リソース最適化などの目的でこれらのAPIを無効化しようとした場合、既存のComposer 2環境が誤動作する可能性があるため、無効化は非推奨となります。

対処方法：

*   **既存のCloud Composer 2環境**:
    *   特に追加の対処は不要です。
    *   ただし、2026年2月27日以降も、記載されているAPI (`artifactregistry.googleapis.com`, `cloudbuild.googleapis.com`, `container.googleapis.com`, `pubsub.googleapis.com`, `sqladmin.googleapis.com`) は**無効化しない**でください。これらを無効化すると、Cloud Composer 2環境が誤動作する可能性があります。

*   **将来的にCloud Composer 2環境を新規でプロビジョニングする可能性がある場合（2026年5月27日以降）**:
    *   **手動で環境を構築する場合**: Cloud Composer APIを有効化するだけでなく、上記の5つのAPIも明示的に有効化する手順を計画に含めてください。
    *   **自動化スクリプト（例: Terraform, gcloudコマンドスクリプト）で環境を構築する場合**: 2026年5月27日以降に、これらのAPIを有効化するステップがスクリプトに含まれているか確認し、必要に応じて修正してください。具体的には、`gcloud services enable` コマンドでこれらのAPIを有効化する行を追加するなどです。

*   **長期的な視点**:
    *   Cloud Composer 3への移行を計画することで、より効率的なAPI利用が可能になります。このアナウンスは、Cloud Composer 3への移行を促すメッセージとも捉えられます。

用語説明：
*   **Cloud Composer API**: Google Cloud上でApache Airflowをマネージドサービスとして利用するためのAPIです。このAPIを有効にすることで、Composer環境の作成や管理が可能になります。
*   **fully detachable**: 「完全に分離可能」という意味で、あるサービスAPI（この場合はCloud Composer API）の有効/無効とは連動しなくなり、独立して有効/無効を切り替えられる状態を指します。
*   **artifactregistry.googleapis.com**: Google CloudのArtifact Registryサービスを操作するためのAPIです。DockerイメージやMavenパッケージなどを管理し、Cloud ComposerではAirflowイメージの保存などに利用されます。
*   **cloudbuild.googleapis.com**: Google Cloud Buildサービスを操作するためのAPIです。CI/CDパイプラインを構築し、Cloud Composer環境のデプロイやアップデートプロセスの一部で使用されることがあります。
*   **container.googleapis.com**: Google Kubernetes Engine (GKE) サービスを操作するためのAPIです。Cloud Composerは内部的にGKEクラスタ上で動作しており、このAPIはComposer環境の基盤となるGKEクラスタの管理に不可欠です。
*   **pubsub.googleapis.com**: Google Cloud Pub/Subサービスを操作するためのAPIです。非同期メッセージングサービスであり、Cloud ComposerではAirflowのタスクログ転送やイベント通知などに利用されることがあります。
*   **sqladmin.googleapis.com**: Google Cloud SQL Admin APIです。Cloud SQLインスタンスの管理に使用され、Cloud ComposerではAirflowメタデータデータベースとしてCloud SQLが利用されるため、このAPIも Composer環境の動作に必須です。
# Title: June 13, 2025 
Link: https://cloud.google.com/release-notes#June_13_2025<br>
# Identity and Access Management
## Changed
原文: Conditions that check the tags for a resource can also check other attributes, such as the resource name of the timestamp of the request. This feature is available in Preview. For more information, see Resource tags.

[Resource tags](https://cloud.google.com/iam/docs/conditions-attribute-reference#resource-tags)

説明:
Google Cloud IAM Conditionsにおいて、リソースに付与されたタグだけでなく、リソース名やリクエストのタイムスタンプといった他の属性も条件として利用できるようになりました。この機能は現在プレビュー版として提供されており、より詳細な属性ベースのアクセス制御が可能になります。

影響有無:
**影響なし。**
これはIAM Conditionsの機能拡張であり、「Preview」段階の機能であるため、既存のIAMポリシーの動作を変更するものではありません。現在構築されているGoogle Cloud Composer 2やGKE 1.31環境のIAMポリシーは、この変更によって自動的に挙動が変わることはありません。明示的にこの新機能を利用しない限り、既存のワークロードに影響はありません。

対処方法:
**対応不要。**
既存の環境への直接的な影響はないため、現時点での対処は必要ありません。将来的により詳細なアクセス制御を実装する際に、この機能を活用することを検討してください。

用語説明:
*   **IAM Conditions (Identity and Access Management Conditions):** Google CloudのIAMポリシーに設定できる条件であり、特定の属性（例：リソースのタイプ、リクエストのIPアドレス、リソースタグなど）が満たされた場合にのみ、アクセスを許可または拒否する機能です。これにより、よりきめ細やかなアクセス制御（Attribute-Based Access Control: ABAC）を実現します。
*   **Preview:** Google Cloudにおけるソフトウェアのリリース段階の一つです。この段階の機能は一般公開（GA: General Availability）前であり、機能が変更される可能性や、本番環境での利用には推奨されない場合があります。主にテストやフィードバック収集のために提供されます。
*   **Resource tags (リソースタグ):** Google Cloudリソースに付与できるキーと値のペアからなるメタデータです。タグはリソースの識別、整理、そしてIAM Conditionsでのアクセス制御などに利用できます。これまでのリソースタグは、組織やフォルダレベルで定義され、リソースへのアクセス制御に利用されていました。今回の更新で、リソース名やタイムスタンプといったさらに詳細な属性と組み合わせることが可能になります。

# Title: June 10, 2025 
Link: https://cloud.google.com/release-notes#June_10_2025<br>
Google Cloudインフラエンジニアとして、ご提示いただいたリリースノートについて、構築済みのサービスへの影響有無を調査し、以下の通りご回答いたします。

---

# BigQuery
## Changed
原文: An updated version of the ODBC driver for BigQuery is now available.
[ODBC driver for BigQuery](https://cloud.google.com/bigquery/docs/reference/odbc-jdbc-drivers#odbc_release_3121009)

説明: BigQueryに接続するためのOpen Database Connectivity (ODBC) ドライバーの最新バージョンがリリースされました。このアップデートには、機能改善やバグ修正が含まれている可能性があります。

影響有無:
*   **影響無し（ただし、利用状況による）**: 既存のBigQuery接続でODBCドライバーを**利用していない場合**、直接的な影響はありません。
*   **影響無し（ただし、更新推奨）**: 既存のBigQuery接続でODBCドライバーを**利用している場合**でも、現在のバージョンが直ちに使用できなくなるわけではありません。しかし、新バージョンは安定性やパフォーマンスの向上、あるいはセキュリティ修正を含む可能性があるため、積極的な更新が推奨されます。今回の変更は機能追加や変更ではなく、ドライバーの新しいバージョンが利用可能になったという通知です。

対処方法:
1.  BigQueryデータへのアクセスにODBCドライバーを使用しているシステムがあるか確認してください。
2.  ODBCドライバーを使用している場合、提供されているリンク（[ODBC driver for BigQuery](https://cloud.google.com/bigquery/docs/reference/odbc-jdbc-drivers#odbc_release_3121009)）を参照し、新しいドライバーのリリースノートや変更点を確認してください。
3.  必要に応じて、新しいバージョンのODBCドライバーをダウンロードし、テスト環境で互換性と機能の動作確認を行った上で、本番環境への適用を検討・計画してください。

用語説明:
*   **ODBC (Open Database Connectivity)**: データベースにアクセスするための標準的なAPI (Application Programming Interface) です。これにより、アプリケーションは特定のデータベースシステムに依存することなく、共通の方法でデータにアクセスできます。ODBCドライバーは、このAPIを介して特定のデータベース（この場合はBigQuery）との通信を可能にするソフトウェアコンポーネントです。

---

# Compute Engine
## Security
原文: A vulnerability (CVE-2025-2884) affecting Shielded VMs using virtual Trusted Platform Module (vTPM) was discovered and is being addressed. For more information, see the GCP-2025-031 security bulletin.
[GCP-2025-031 security bulletin](https://cloud.google.com/compute/docs/security-bulletins#gcp-2025-031)

説明: virtual Trusted Platform Module (vTPM) を使用しているShielded VMに影響を与える潜在的なセキュリティ脆弱性（CVE-2025-2884）が発見されました。Google Cloudはこの脆弱性に対して現在対応を進めています。詳細については、提供されているセキュリティ速報（GCP-2025-031）を参照してください。

影響有無:
*   **潜在的な影響有り**: 構築済みのサービスでCompute Engineを使用しており、特に**Shielded VMがvTPMを有効にしてデプロイされている場合**、この脆弱性の影響を受ける可能性があります。
*   この脆弱性はGoogle Cloudによって「対応中」とされており、通常、パッチ適用や回避策が提供されることが予想されます。直接的なシステムの停止やパフォーマンス低下といった即時の影響は報告されていませんが、セキュリティ上のリスクが存在します。
*   Google Kubernetes Engine (GKE) はCompute Engineインスタンスをノードとして利用するため、GKEクラスタのノードプールでShielded VMかつvTPMが有効になっている場合も間接的に影響を受ける可能性があります。Google Cloud Composer2もCompute Engine上に構築されるため、同様に基盤となるVMの設定によっては影響を受ける可能性があります。

対処方法:
1.  まず、提供されているセキュリティ速報（[GCP-2025-031 security bulletin](https://cloud.google.com/compute/docs/security-bulletins#gcp-2025-031)）を直ちに参照し、脆弱性の詳細、影響範囲、Google Cloudからの推奨されるアクションや回避策を確認してください。
2.  現在稼働中のCompute Engineインスタンス、GKEノードプール、およびComposer環境において、Shielded VMが有効になっており、かつvTPMが使用されているかどうかを確認してください。
    *   Compute Engineインスタンスの場合、VMインスタンスの詳細ページで「Shielded VM」セクションを確認します。
3.  セキュリティ速報の指示に従い、必要な対策（例: インスタンスの更新、再デプロイ、特定の構成変更）を速やかに実施してください。Google Cloudがプラットフォームレベルで対応を進めている場合、ユーザー側での追加の対応が不要なケースもありますが、常に速報で最新の情報を確認することが重要です。

用語説明:
*   **Shielded VM**: Google Cloudが提供する仮想マシン (VM) のセキュリティ機能セットです。UEFIセキュアブート、仮想Trusted Platform Module (vTPM)、整合性モニタリングなどの機能を提供し、悪意のあるソフトウェアによる改ざんや不正なアクセスからVMを保護します。
*   **vTPM (virtual Trusted Platform Module)**: ハードウェアのTrusted Platform Module (TPM) を仮想化したものです。VM内でセキュアブートの検証、機密データの暗号化、鍵の生成と保護など、ハードウェアベースのセキュリティ機能を提供するために使用されます。
*   **CVE (Common Vulnerabilities and Exposures)**: 既知のサイバーセキュリティの脆弱性に対して与えられる国際的な識別子です。これにより、脆弱性の情報共有と追跡が容易になります。
*   **Security Bulletin (セキュリティ速報)**: ベンダー（この場合はGoogle Cloud）が自社製品・サービスにおいて発見されたセキュリティ脆弱性に関する詳細情報、影響、推奨される対策などを公開する文書です。
# Title: June 09, 2025 
Link: https://cloud.google.com/release-notes#June_09_2025<br>
## API Gateway
### Announcement
原文: On June 9, 2025, we released an updated version of API Gateway.
説明: API Gatewayの更新版が2025年6月9日にリリースされるという将来のアナウンスです。現時点での具体的な変更内容は記載されていません。
影響有無: 現時点では影響なし。これは将来のリリースに関する事前アナウンスであり、具体的な機能変更や破壊的変更が示されていないため、現行のサービス運用には影響しません。
対処方法: 特になし。ただし、2025年6月9日以降にAPI Gatewayを利用しているシステムへの影響調査を行うためのアラートとして認識しておくことが推奨されます。

## BigQuery
### Libraries
原文:
A weekly digest of client library updates from across the Cloud SDK.
Changes for google-cloud-bigquery 2.51.0
- **bigquery:** Job creation mode GA (#3804) (a21cde8)
- **bigquery:** Support Fine Grained ACLs for Datasets (#3803) (bebf1c6)
- Rollback netty.version to v4.1.119.Final (#3827) (94c71a0)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.65.0 (#3787) (0574ecc)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20250511-2.0.0 (#3794) (d3bf724)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.49.0 (#3811) (2c5ede4)

説明: BigQuery Javaクライアントライブラリ `google-cloud-bigquery` のバージョン 2.51.0 での更新です。
主な変更点は以下の通りです。
*   **Job creation mode GA**: ジョブ作成モードが一般提供（GA）になりました。これは、BigQueryのジョブ（クエリ、ロード、エクスポートなど）を作成する際により詳細な制御が可能になる機能と推測されます。
*   **Support Fine Grained ACLs for Datasets**: データセットに対する詳細なアクセス制御リスト（ACL）がサポートされました。これにより、データセット内の特定のテーブルやビューに対するアクセス権をより細かく設定できるようになります。セキュリティとデータガバナンスの強化に繋がります。
*   その他、`netty.version` のロールバックや、各種依存ライブラリのバージョンアップデートが含まれます。

影響有無: 影響は限定的。
*   **Google Cloud Composer2 (Compoer version 2.7.1、Airflow version 2.7.3)**: Composerは主にPythonベースのAirflowが動作するため、直接このJavaクライアントライブラリを利用している可能性は低いです。ただし、Composerの内部コンポーネントがJavaベースでBigQueryと連携している場合、間接的な影響がある可能性はゼロではありませんが、通常は Composer のバージョンアップ時に吸収されます。
*   **Google Kubernetes Engine 1.31**: GKE上で稼働するJavaアプリケーションが、この `google-cloud-bigquery` クライアントライブラリを直接利用してBigQueryを操作している場合、影響があります。
    *   **新機能**: 「Job creation mode GA」と「Fine Grained ACLs for Datasets」は新機能のため、これらを利用することでアプリケーションの機能拡張やセキュリティ強化が可能になります。既存のコードに破壊的な変更をもたらすものではありません。
    *   **依存ライブラリの更新**: これらの更新は通常、安定性やパフォーマンスの向上、セキュリティ修正などが目的であり、既存のアプリケーション動作に直接的な破壊的変更をもたらす可能性は低いですが、互換性テストは推奨されます。

対処方法:
*   アプリケーションで `google-cloud-bigquery` Javaクライアントライブラリを直接利用している場合:
    *   最新バージョン（2.51.0）へのアップデートを検討してください。
    *   新機能（Job creation mode GA, Fine Grained ACLs for Datasets）を活用したい場合は、アプリケーションコードの改修を検討してください。
    *   アップデートによる既存機能への影響がないか、十分にテストを実施してください。
*   Composer 2を利用している場合: 特段の対処は不要です。Composerの基盤ライブラリはGoogle Cloud側で管理されており、必要に応じてComposerの新しいバージョンでこれらの機能が取り込まれます。

用語説明:
*   **クライアントライブラリ (Client Library)**: Google Cloudのサービスと連携するために、特定のプログラミング言語（この場合はJava）で提供されるSDK（Software Development Kit）の一部。サービスAPIへのアクセスを容易にします。
*   **GA (General Availability)**: 一般提供。サービスや機能が正式にリリースされ、本番環境での利用が推奨される状態を指します。ベータ版やアルファ版と異なり、機能の安定性、互換性、サポート体制が保証されます。
*   **ACL (Access Control List)**: アクセス制御リスト。リソース（この場合はBigQueryデータセット）に対して、どのユーザーやサービスアカウントがどのような権限を持つか（読み取り、書き込みなど）を定義するリストです。
*   **Netty**: 高性能なネットワークアプリケーション（クライアントおよびサーバー）を迅速に開発するための非同期イベント駆動型ネットワークアプリケーションフレームワーク。Javaライブラリの依存関係として広く利用されています。

## Cloud Logging
### Libraries
原文:
A weekly digest of client library updates from across the Cloud SDK.
Changes for google-cloud-logging 3.22.5
- **deps:** Update the Java code generator (gapic-generator-java) to 2.59.0 (f2362fb)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.49.0 (#1813) (c15da84)

説明: Cloud Logging Javaクライアントライブラリ `google-cloud-logging` のバージョン 3.22.5 での更新です。
主な変更点は、依存ライブラリのバージョンアップデート（`gapic-generator-java`、`sdk-platform-java-config`）です。機能追加や変更に関する直接的な記述はありません。
影響有無: 影響は限定的。
*   **Google Cloud Composer2 (Compoer version 2.7.1、Airflow version 2.7.3)**: BigQueryと同様に、Composerは主にPythonベースであり、直接このJavaクライアントライブラリを利用している可能性は低いです。
*   **Google Kubernetes Engine 1.31**: GKE上で稼働するJavaアプリケーションが、この `google-cloud-logging` クライアントライブラリを直接利用してログを出力している場合、影響があります。
    *   機能に関する変更がないため、既存のログ出力機能に影響を与える可能性は非常に低いですが、依存ライブラリの更新は安定性やパフォーマンスの改善、セキュリティ脆弱性の修正を含むことがあります。

対処方法:
*   アプリケーションで `google-cloud-logging` Javaクライアントライブラリを直接利用している場合:
    *   安定性向上や潜在的なセキュリティ修正のために、最新バージョン（3.22.5）へのアップデートを検討してください。
    *   アップデートによる既存機能への影響がないか、十分にテストを実施してください。
*   Composer 2を利用している場合: 特段の対処は不要です。

用語説明:
*   **deps (Dependencies)**: 依存関係の略。ソフトウェアが動作するために必要な他のソフトウェアコンポーネントやライブラリを指します。
*   **gapic-generator-java**: Google API Client Generator for Java の略。Google CloudのAPI定義（通常はProtocol BuffersとgRPC）から、Java言語用のクライアントライブラリコードを自動生成するためのツールです。

## Cloud Storage
### Libraries
原文:
A weekly digest of client library updates from across the Cloud SDK.
Changes for google-cloud-storage 2.53.0
- Expose BucketInfo.getProject as a BigInteger (#3119) (64bbb60), closes #3023
- **storagecontrol:** Add Anywhere cache control APIs (06572b7)
- **storagecontrol:** Add Client Libraries Storage IntelligenceConfig (06572b7)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.58.0 (06572b7)
- Update dependency com.google.apis:google-api-services-storage to v1-rev20250521-2.0.0 (#3118) (e1be49e)
- Update dependency com.google.apis:google-api-services-storage to v1-rev20250524-2.0.0 (#3127) (2a4499d)
- Update sdk-platform-java dependencies (#3129) (31cd058)
- Add explicit Optional annotations to fields that have always been treated as optional (53b6927)
- Add note that Bucket.project output format is always project number format (53b6927)
- Add note that managedFolders are supported for GetIamPolicy and SetIamPolicy (53b6927)

説明: Cloud Storage Javaクライアントライブラリ `google-cloud-storage` のバージョン 2.53.0 での更新です。
主な変更点は以下の通りです。
*   **BucketInfo.getProject の BigInteger 型への変更**: `BucketInfo.getProject()` メソッドの戻り値の型が `String` から `BigInteger` に変更されました。これにより、プロジェクト番号がより適切に扱われるようになりますが、このメソッドを使用している既存コードでは型変換エラーが発生する可能性があります。これは破壊的変更（Breaking Change）に該当します。
*   **Anywhere cache control APIs の追加**: グローバルなCloud Storageバケットで、ユーザーに近いロケーションにデータをキャッシュすることで読み取りパフォーマンスを向上させる「Anywhere cache」に関連するAPIが追加されました。
*   **Client Libraries Storage IntelligenceConfig の追加**: ストレージの利用状況を最適化するためのインテリジェンス機能の設定に関連する機能が追加されました。
*   その他、依存ライブラリの更新や、Optionalアノテーションの追加、`Bucket.project` の出力形式に関する注記、Managed Foldersに関する注記などが含まれます。

影響有無: 影響あり。特にGKE上でJavaアプリケーションを稼働させている場合に注意が必要です。
*   **Google Cloud Composer2 (Compoer version 2.7.1、Airflow version 2.7.3)**: BigQueryやLoggingと同様、Composerは主にPythonベースのため、直接このJavaクライアントライブラリを利用している可能性は低いですが、Composerの内部コンポーネントがJavaベースでCloud Storageと連携している場合、間接的な影響がある可能性はあります。ただし、このライブラリの破壊的変更がComposerの動作に影響を与える場合は、通常Composerのバージョンアップで対応されます。
*   **Google Kubernetes Engine 1.31**: GKE上で稼働するJavaアプリケーションが、この `google-cloud-storage` クライアントライブラリを直接利用してCloud Storageを操作している場合、影響があります。
    *   **`BucketInfo.getProject()` の型変更**: このメソッドをアプリケーションコードで利用している場合、`String`型で受け取っていた部分が`BigInteger`型に変更されるため、コンパイルエラーや実行時エラーが発生する可能性があります。これは互換性のない変更（Breaking Change）です。
    *   **新機能**: 「Anywhere cache control APIs」と「Storage IntelligenceConfig」は新機能のため、これらを利用しない限り既存の動作に影響はありませんが、パフォーマンス向上や最適化のために利用を検討できます。
    *   **依存ライブラリの更新**: 通常、安定性やパフォーマンスの向上、セキュリティ修正などが目的ですが、`BucketInfo.getProject()`の変更が最も大きな影響をもたらします。

対処方法:
*   アプリケーションで `google-cloud-storage` Javaクライアントライブラリを直接利用している場合:
    *   最新バージョン（2.53.0）へのアップデートを検討してください。
    *   特に **`BucketInfo.getProject()` を使用している箇所について、`BigInteger` 型で受け取るようにコードを修正する必要があります**。
        *   例: `String projectId = bucketInfo.getProject();` のようなコードは `BigInteger projectId = bucketInfo.getProject();` に変更し、必要に応じて `projectId.toString()` などで文字列に変換する対応が必要です。
    *   新機能（Anywhere cache, Storage IntelligenceConfig）を活用したい場合は、アプリケーションコードの改修を検討してください。
    *   アップデート後、破壊的変更による影響がないか、十分にテストを実施してください。
*   Composer 2を利用している場合: 特段の対処は不要です。Composerの基盤ライブラリはGoogle Cloud側で管理されており、この変更による影響はComposerのバージョンアップで吸収されます。

用語説明:
*   **BucketInfo**: Cloud Storageのバケットに関する情報（名前、プロジェクト、作成日時など）を保持するオブジェクトです。
*   **BigInteger**: Javaにおける任意精度の整数値を表すクラスです。非常に大きな整数を扱う際に使用されます。
*   **破壊的変更 (Breaking Change)**: ソフトウェアやAPIの変更のうち、以前のバージョンとの後方互換性がなくなり、既存のコードやシステムが動作しなくなる可能性のある変更を指します。
*   **Anywhere cache**: Cloud Storageのデータにグローバルなアクセス性を持たせつつ、ユーザーの物理的な近くにキャッシュを配置することで、読み取りレイテンシを削減する機能です。
*   **Managed Folders**: Cloud Storageにおけるオブジェクトの論理的なグループ化の機能で、ACLなどが設定可能です。# Title: June 06, 2025 
Link: https://cloud.google.com/release-notes#June_06_2025<br>
# Cloud Service Mesh
## Changed
原文: This change affects clusters using both the `TRAFFIC_DIRECTOR` and `ISTIOD` control plane implementations.

When using Cloud Service Mesh with Istio APIs, configuring an unsupported field or value in an Istio Custom Resources will be reflected as an error in the Mesh status API.

[unsupported field](https://cloud.google.com/service-mesh/docs/onboarding/unsupported-istio-apis)
In some cases, the validation webhook will also reject unsupported API usage with an error message indicating the specific unsupported API. For more information, see Common webhook error messages. You can mitigate these issues by amending the Istio Custom Resource to remove the specified unsupported API configuration.

[Common webhook error messages](https://cloud.google.com/service-mesh/docs/troubleshooting/troubleshoot-webhook#common_webhook_error_messages)

説明:
この変更は、`TRAFFIC_DIRECTOR`と`ISTIOD`の両方のコントロールプレーン実装を使用しているクラスタに影響します。
Cloud Service MeshでIstio APIを使用している場合、Istio Custom Resources（CR）内でサポートされていないフィールドや値が設定されていると、Mesh status APIにエラーとして表示されるようになります。
また、場合によっては、KubernetesのValidation WebhookがサポートされていないAPIの使用を拒否し、具体的なエラーメッセージを表示することがあります。
これらの問題は、該当するIstio Custom Resourceから、サポートされていないAPI設定を削除または修正することで緩和できます。詳細については、関連するドキュメントを参照してください。

影響有無: あり
現在、Cloud Service Meshを使用しており、Istio Custom Resources (CR) にIstioのサポート対象外のフィールドや値を設定している場合、影響があります。
この変更により、これまで暗黙的に無視されていた、あるいは明示的なエラーとして表面化しなかった不正な設定が、Mesh status APIにエラーとして報告されるようになり、またValidation Webhookによってデプロイや更新が拒否される可能性があります。
これは、既存の運用中の設定に問題がある場合に、その問題が顕在化するという意味で影響があります。
特に、Google Kubernetes Engine (GKE) 1.31上でCloud Service Meshを構築している場合、この変更の対象となります。Google Cloud Composerは直接的な影響を受けませんが、ComposerがGKEクラスタ上で実行されており、そのクラスタがCloud Service Meshを使用している場合は、間接的に影響を受ける可能性があります。

対処方法:
1.  **Mesh status APIの確認**: Mesh status APIを定期的に監視し、報告されるエラーがないかを確認します。
2.  **ログの監視**: GKEクラスタのログ、特にAdmission Webhook関連のログを監視し、Istio関連のValidation Webhookによる拒否エラーがないか確認します。
3.  **Istio Custom Resourcesの見直し**: エラーが報告された場合、または潜在的な問題を特定するために、現在デプロイされているIstio Custom Resources (VirtualService, Gateway, DestinationRuleなど) の設定内容を精査し、[サポートされていないフィールド](https://cloud.google.com/service-mesh/docs/onboarding/unsupported-istio-apis)が含まれていないかを確認します。
4.  **修正**: サポートされていない設定が発見された場合は、該当するフィールドや値を削除またはIstioがサポートする形式に修正し、再デプロイします。

用語説明:
*   **Cloud Service Mesh**: Google Cloudが提供する、Istioベースのマネージドなサービスメッシュプラットフォームです。マイクロサービス間のトラフィック管理、セキュリティ、観測性を提供します。
*   **TRAFFIC_DIRECTOR**: Google Cloudが提供するマネージドなトラフィックディレクターで、GKE環境におけるサービスメッシュのコントロールプレーンの一つとして機能します。Envoyプロキシにトラフィックルーティングルールを構成します。
*   **ISTIOD**: Istioのコントロールプレーンの主要コンポーネントです。Istioデータプレーン（Envoyプロキシ）を構成し、トラフィック管理、ポリシー、テレメトリ収集などを担当します。
*   **Istio Custom Resources (CR)**: KubernetesのCustom Resources Definition (CRD) を使用してIstioの設定を記述するためのリソースです。`VirtualService`、`Gateway`、`DestinationRule`などがこれにあたります。これらを介してサービスメッシュの振る舞いを定義します。
*   **Mesh status API**: Cloud Service Meshの現在の状態や、デプロイされている設定の有効性に関する情報を提供するAPIです。
*   **Validation Webhook**: KubernetesのAdmission Controllerの一種で、APIサーバーに送られてくるリソースオブジェクトがクラスタに永続化される前に、特定のルールに基づいてそのオブジェクトの内容を検証（変更はしない）します。Istioはこれを利用して、不正な設定が適用されるのを防ぎます。
# Title: June 05, 2025 
Link: https://cloud.google.com/release-notes#June_05_2025<br>
# Cloud Storage
## Changed
原文: The limit for the maximum number of prefixes and suffixes when using matchesPrefix and matchesSuffix lifecycle conditions across all rules on a bucket is increased from 50 to 1,000. For more information, see Quotas and limits.

[matchesPrefix and matchesSuffix lifecycle conditions](https://cloud.google.com/storage/docs/lifecycle#matchesprefix-suffix)
[Quotas and limits](https://cloud.google.com/storage/quotas#buckets)

説明:
Cloud Storageのバケットライフサイクル管理において、`matchesPrefix`および`matchesSuffix`条件で使用できるプレフィックスとサフィックスの合計数の上限が、バケット内の全てのルールを通じて50から1,000に引き上げられました。

影響有無:
影響なし。これは既存の制限を緩和する変更（上限の引き上げ）であり、現在稼働しているサービスや設定に悪影響を与えることはありません。むしろ、より多くのプレフィックス/サフィックスを指定できるようになり、柔軟なライフサイクル管理が可能になります。

対処方法:
現状の運用に影響がないため、必須の対処はありません。
もしこれまで50の制限に抵触し、複雑なライフサイクルルールを設定していた場合は、この上限緩和を活用してルールを統合・簡素化することを検討できます。

用語説明:
*   **Cloud Storage ライフサイクル管理 (Lifecycle Management):** Cloud Storageのオブジェクトのストレージクラスの変更、削除などのアクションを自動化する機能です。指定した条件（オブジェクトの経過日数、作成日、バージョン数、オブジェクト名など）に基づいて自動的にアクションを実行します。
*   **matchesPrefix / matchesSuffix:** Cloud Storageのライフサイクルルールで利用できる条件の一つです。オブジェクト名が特定のプレフィックス（前方一致）またはサフィックス（後方一致）に合致する場合にのみ、ルールを適用するかどうかを判断します。
*   **プレフィックス (Prefix):** ファイル名やオブジェクト名の先頭部分を指します。例えば、`logs/app_server/` はプレフィックスとして使われることがあります。
*   **サフィックス (Suffix):** ファイル名やオブジェクト名の末尾部分を指します。例えば、`.json` や `.gz` はサフィックスとして使われることがあります。
*   **クォータと上限 (Quotas and limits):** Google Cloudリソースの利用量や速度に設定されている上限値です。サービスの安定性やリソースの公平な利用を保証するために設定されています。
# Title: June 04, 2025 
Link: https://cloud.google.com/release-notes#June_04_2025<br>
はい、承知いたしました。BigQueryのリリースノートに基づき、構築済みのサービスへの影響を調査し、簡潔に回答いたします。

---

# BigQuery
## Changed
原文: The organization-level configuration settings for `default_sql_dialect_option` and `query_runtime` are unsupported.
[configuration settings](https://cloud.google.com/bigquery/docs/default-configuration)

**説明:**
BigQueryの組織レベルの設定において、これまで提供されていた `default_sql_dialect_option`（デフォルトのSQL方言設定）および `query_runtime`（クエリ実行ランタイム設定）の2つの構成設定が、サポート対象外となりました。これは、組織全体に適用されるこれらの設定が、今後機能しなくなるか、または推奨されないことを意味します。

**影響有無:**
**影響あり。**
もし、貴社の環境でBigQueryの組織レベルの設定として `default_sql_dialect_option` または `query_runtime` のいずれかを明示的に使用している場合、これらの設定は今後適用されなくなるか、予期せぬ動作を引き起こす可能性があります。これにより、BigQueryクエリの動作（特にSQL方言の解釈や実行環境）が意図せず変更される可能性があり、既存のワークロードに影響を与える可能性があります。これは、既存機能の動作変更であり、非互換性のある変更（Breaking Change）と見なすべきです。

**対処方法:**
1.  **現状確認:** まず、現在BigQueryの組織レベルで `default_sql_dialect_option` や `query_runtime` が設定されているかを確認してください。これらの設定は通常、組織ポリシーやBigQuery Admin APIなどを通じて構成されます。
2.  **依存関係の特定:** もし設定されている場合は、それらの設定に依存して動作しているBigQueryクエリやデータパイプラインがないかを確認してください。
3.  **代替手段の検討と移行:**
    *   **SQL方言:** `default_sql_dialect_option` の代わりに、クエリの先頭に `#standardSQL` や `#legacySQL` と明示的に記述するか、プログラムからクエリを実行する際にAPI/クライアントライブラリでSQL方言を指定してください。
    *   **クエリランタイム:** `query_runtime` に対応する代替機能があるかは、BigQueryの最新ドキュメントを確認する必要があります。もし特定のランタイム要件がある場合は、今後のBigQueryの機能拡張や推奨される実行オプションを参照し、個別クエリやプロジェクトレベルでの設定を検討してください。
    *   **プロジェクト/ユーザーレベルでの設定:** 組織レベルでの設定が不要な場合は、BigQueryのプロジェクトレベルやユーザーレベルで同様の設定ができないか検討し、必要に応じて移行してください。
4.  **動作確認:** 設定変更後、影響を受ける可能性のあるBigQueryクエリやワークロードが期待通りに動作するかを十分にテストしてください。
公式ドキュメント ([https://cloud.google.com/bigquery/docs/default-configuration](https://cloud.google.com/bigquery/docs/default-configuration)) を参照し、これらの設定の代替手段や推奨される構成方法について最新の情報を確認することを強く推奨します。

**用語説明:**
*   **`default_sql_dialect_option`:** BigQueryでクエリを実行する際にデフォルトで適用されるSQL方言（例: Google標準SQL、レガシーSQL）を設定するオプションです。
*   **`query_runtime`:** BigQueryクエリの実行環境やランタイムに関する設定です。特定の実行環境（例: Spanner互換ランタイムなど、将来的な拡張を含む）を指定するために使用される可能性があったオプションです。
*   **組織レベル設定 (Organization-level configuration settings):** Google Cloudの組織全体に適用される設定のことです。これらはプロジェクトやフォルダよりも上位の階層で、一貫したポリシーやデフォルト値を組織全体に強制するために使用されます。
*   **Unsupported (サポート対象外):** その機能がGoogle Cloudによって積極的に開発、維持、保証されなくなった状態を指します。既存の機能は動作し続けるかもしれないが、将来的に削除されたり、予期しない動作をする可能性があり、新しい実装では使用を避けるべきです。
# Title: June 03, 2025 
Link: https://cloud.google.com/release-notes#June_03_2025<br>
承知いたしました。Google Cloudのリリースノートを元に、構築済みのサービスへの影響調査結果を報告します。

---

# Apigee X
## Announcement
原文: On June 3, 2025, we released an updated version of Apigee.

説明：
Apigee Xの新しいバージョンが2025年6月3日にリリースされたというアナウンスです。このアナウンス自体には、具体的な機能追加、変更、修正、非推奨化、あるいは料金体系の変更に関する詳細は含まれていません。単に新しいバージョンが利用可能になったことを通知しています。

影響有無：
**無し**
このアナウンスは、特定の機能変更やサービス動作に直接的な影響を与える情報を含んでいないため、現在のApigee Xの運用に即座の影響はありません。しかし、Apigee Xのバージョンアップが行われたことを示しており、今後の詳細なリリースノートや変更履歴を確認し、新バージョンで導入された変更点を把握する必要があります。

対処方法：
現時点では具体的な対処は不要です。しかし、以下の対応を推奨します。
*   **詳細情報の確認**: 今後のApigee Xの詳細なリリースノートや、Google Cloudの公式ドキュメント、Apigeeのリリースノートページ（[Google Cloud Apigee のリリースノート](https://cloud.google.com/apigee/docs/release-notes)などを参照）を継続的に確認してください。
*   **変更点の把握**: 新バージョンで導入された具体的な変更点（新機能、非推奨機能、APIの変更、パフォーマンスの改善または劣化、セキュリティパッチ、料金体系の変更、Breaking Changeなど）を把握し、利用中のApigeeプロキシやAPI管理戦略への影響を評価してください。
*   **テストと移行計画**: もし新バージョンで重要な変更やBreaking Changeが含まれる場合は、本番環境への適用前にテスト環境で影響を評価し、必要に応じて移行計画を策定してください。

用語説明：
*   **Apigee X**: Google Cloudが提供するエンタープライズ向けのAPI管理プラットフォームです。APIの設計、セキュリティ、デプロイ、監視、収益化などを一元的に行い、デジタルエクスペリエンスを迅速に提供できるようにします。
*   **更新されたバージョン (Updated Version)**: ソフトウェアやサービスの新しい版を指します。通常、バグ修正、パフォーマンス改善、新機能の追加、セキュリティ脆弱性の対処などが含まれます。
*   **Breaking Change**: 既存の互換性を損なう変更のことです。この変更が導入されると、既存のコードや設定が動作しなくなる可能性があります。APIやライブラリのバージョンアップ時に特に注意が必要です。
# Title: June 02, 2025 
Link: https://cloud.google.com/release-notes#June_02_2025<br>
## Apigee X
### Announcement
原文: On June 2, 2025, we released an updated version of Apigee (1-15-0-apigee-5).
> Note: Rollouts of this release began today and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

説明: Apigeeの新しいバージョン `1-15-0-apigee-5` が2025年6月2日にリリースされました。このリリースは現在、全てのGoogle Cloudゾーンへの展開が進行中であり、完了まで4営業日以上かかる場合があります。展開が完了するまでは、一部の機能や修正が利用できない可能性があります。

影響有無: 影響なし。
Apigee X はマネージドサービスであるため、Googleによって自動的にアップデートされます。お客様側で直接的な操作は不要ですが、新機能や修正が環境に適用されるまでタイムラグが発生する可能性があります。

対処方法: 特になし。展開完了までお待ちください。
必要に応じて、環境への影響がないか基本的な動作監視を継続してください。

### Fixed
原文:
| Bug ID | Description |
| --- | --- |
| **410670597** | **Fixed the proxy response count metric (`proxy/response_count`) for EventFlow-enabled streaming proxies.** |
| **375360455** | **Resolved issues with connection termination when using HTTP streaming** Added automatic retries for connection reset due to upstream services. |
| **N/A** | **Updates to security infrastructure and libraries.** |
| **N/A** | **`x-b3` trace headers will be sent only when distributed tracing is enabled.** In previous releases Apigee was sending `x-b3` trace headers even when distributed tracing was disabled. This was an unexpected behavior which is fixed in this release. |
Added automatic retries for connection reset due to upstream services.

説明:
1.  **EventFlow対応ストリーミングプロキシのメトリック修正**: EventFlowを有効にしたストリーミングプロキシにおける`proxy/response_count`メトリックの正確性が向上しました。
2.  **HTTPストリーミング接続終了問題の解決と自動リトライ追加**: HTTPストリーミング使用時の接続終了に関する問題が解決され、アップストリームサービスによる接続リセット時に自動リトライが追加されました。
3.  **セキュリティインフラストラクチャとライブラリの更新**: 基盤となるセキュリティインフラストラクチャとライブラリが更新され、全体的なセキュリティが強化されました。
4.  **`x-b3`トレースヘッダーの送信条件修正**: 分散トレーシングが無効な場合でも`x-b3`トレースヘッダーが送信される不適切な動作が修正され、今後は分散トレーシングが有効な場合にのみ送信されます。

影響有無: 影響なし。
上記はいずれも修正または改善であり、既存のシステム動作に負の影響を与えるものではありません。
-   メトリックの正確性向上は監視データに好影響をもたらします。
-   HTTPストリーミングの安定性向上は、関連するワークロードの可用性を高めます。
-   セキュリティ更新は、システムの堅牢性を強化します。
-   `x-b3`ヘッダーの修正は、分散トレーシングを無効にしている環境において、意図しないヘッダーの送信が停止されることで、より期待通りの動作になります。

対処方法: 特になし。
分散トレーシングを無効にしている環境で、過去に`x-b3`ヘッダーの存在に依存するようなカスタムロジックを実装していた場合は、その影響を確認してください（通常そのような実装は推奨されません）。

用語説明:
*   **EventFlow**: Apigeeのデータプレーン機能の一部で、プロキシのリクエスト/レスポンスフローを詳細に分析するための機能。
*   **`proxy/response_count` metric**: Apigee APIプロキシが処理したレスポンスの総数を表すメトリック。
*   **`x-b3` trace headers**: 分散トレーシングにおいて、リクエストのトレーシングコンテキストをサービス間で伝播するために使用されるHTTPヘッダーの一種。主にZipkinトレーシングシステムで利用される。
*   **Distributed Tracing (分散トレーシング)**: マイクロサービスアーキテクチャのような分散システムにおいて、単一のリクエストが複数のサービスを横断する際の処理経路とパフォーマンスを追跡・可視化する技術。

---

## BigQuery
### Libraries
説明: BigQueryのNode.js, Go, Pythonクライアントライブラリが更新されました。これらの更新には新機能の追加や改善が含まれます。

影響有無: 影響なし。
これらの変更はクライアントライブラリの更新であり、BigQueryサービス本体の動作に影響を与えるものではありません。現在使用しているアプリケーションがこれらのライブラリバージョンを使用していない限り、直接的な影響はありません。新機能を利用したい場合は、アプリケーションで利用しているクライアントライブラリをアップデートする必要があります。破壊的変更（Breaking Change）は含まれていません。

対処方法: 特になし。
新機能の利用や、ライブラリの最新の改善点を取り込みたい場合は、利用中の言語のBigQueryクライアントライブラリのアップグレードを検討してください。

#### Node.js
原文:
## Node.js
## Changes for @google-cloud/bigquery
[@google-cloud/bigquery](https://github.com/googleapis/nodejs-bigquery)
[8.1.0](https://github.com/googleapis/nodejs-bigquery/compare/v8.0.0...v8.1.0)
- Job creation mode GA (#1480) (b51359a)
- Support per-job reservation assignment (#1477) (8151e72)

説明: BigQuery Node.jsクライアントライブラリ `8.1.0` の変更点です。ジョブ作成モードがGA（一般提供）となり、ジョブごとのリザベーション割り当てがサポートされました。

#### Go
原文:
## Go
## Changes for bigquery/storage/apiv1beta1
[bigquery/storage/apiv1beta1](https://github.com/googleapis/google-cloud-go/tree/main/bigquery/storage/apiv1beta1)
[1.69.0](https://github.com/googleapis/google-cloud-go/compare/bigquery/v1.68.0...bigquery/v1.69.0)
- **bigquery/analyticshub:** Add support for Analytics Hub & Marketplace Integration (2aaada3)
- **bigquery/analyticshub:** Adding allow_only_metadata_sharing to Listing resource (2aaada3)
- **bigquery/analyticshub:** Adding CommercialInfo message to the Listing and Subscription resources (2aaada3)
- **bigquery/analyticshub:** Adding delete_commercial and revoke_commercial to DeleteListingRequest and RevokeSubscriptionRequest (2aaada3)
- **bigquery/analyticshub:** Adding DestinationDataset to the Subscription resource (2aaada3)
- **bigquery/analyticshub:** Adding routine field to the SharedResource message (2aaada3)
- **bigquery:** Add support for dataset view and update modes (#12290) (7c1f961)
- **bigquery:** Job creation mode GA (#12225) (1d8990d)

説明: BigQuery Goクライアントライブラリ `1.69.0` の変更点です。Analytics HubとMarketplaceの統合機能のサポートが追加され、データセットのビューおよび更新モード、ジョブ作成モードのGA化がサポートされました。

#### Python
原文:
## Python
## Changes for google-cloud-bigquery
[google-cloud-bigquery](https://github.com/googleapis/python-bigquery)
[3.34.0](https://github.com/googleapis/python-bigquery/compare/v3.33.0...v3.34.0)
- Job creation mode GA (#2190) (64cd39f)
- **deps:** Update all dependencies (#2184) (12490f2)
- Update query.py (#2192) (9b5ee78)
- Use query_and_wait in the array parameters sample (#2202) (28a9994)

説明: BigQuery Pythonクライアントライブラリ `3.34.0` の変更点です。ジョブ作成モードがGAとなり、全ての依存関係が更新されました。また、`query.py`の更新と、配列パラメータサンプルにおける`query_and_wait`の使用例が更新されました。

用語説明:
*   **Cloud SDK**: Google Cloud Platformのサービスをコマンドラインから操作したり、開発したりするためのツールキット群。クライアントライブラリも含まれる。
*   **GA (General Availability)**: 特定の機能やサービスが一般提供され、全てのユーザーが本番環境で利用できるようになった状態。サポート体制も整っている。

---

## Cloud Composer
**現在の環境: Cloud Composer 2 (Compoer version 2.7.1, Airflow version 2.7.3)**

### Announcement
原文: A new Cloud Composer release has started on **June 02, 2025**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.

説明: Cloud Composerの新しいリリースが2025年6月2日に開始されました。新機能や変更は全ての



=======================================================================



# Title: June 03, 2025 
Link: https://cloud.google.com/release-notes#June_03_2025<br>
Google Cloud インフラエンジニアとして、指定されたリリースノートに基づき、貴社サービスへの影響調査結果をご報告いたします。

---

# Apigee X
## Announcement
原文: On June 3, 2025, we released an updated version of Apigee.
説明: 2025年6月3日にApigeeの更新バージョンがリリースされる予定である、というアナウンスです。原文の"released"は過去形ですが、日付が未来であることから「リリースされる予定である」という告知と解釈されます。このアナウンス自体には、具体的な変更内容や新機能、既存機能への影響に関する詳細は含まれていません。
影響有無: 現時点（2024年6月）では、このアナウンスが指すリリースはまだ行われていないため、**直接的な影響はございません。** これは、将来のリリースに関する事前告知であり、現在のApigee X環境にすぐに変更や機能追加が適用されるものではありません。
対処方法: 現時点での即座の対応は不要です。しかし、2025年6月3日以降にリリースされるであろうApigeeの更新バージョンに関する詳細情報（例: リリースノート、非互換性のある変更、新機能、アップグレードパスなど）が公開された際には、その内容を確認し、貴社Apigee X環境への影響を再評価する必要があります。必要に応じて、更新バージョンの検証計画を立てることを推奨します。
用語説明:
*   **Apigee X**: Google Cloud が提供するAPI管理プラットフォームです。APIの設計、セキュアな公開、デプロイ、監視、スケーリングといったライフサイクル全般を管理します。
*   **Announcement**: 公式な発表や告知のことです。今回は将来のリリースに関する予告として使用されています。
*   **Updated version**: 既存のソフトウェアやサービスの改善、新機能追加、バグ修正などが行われた新しいバージョンを指します。
# Title: June 02, 2025 
Link: https://cloud.google.com/release-notes#June_02_2025<br>
Google Cloud リリースノートの調査結果について、製品ごとにお知らせいたします。

---

# Apigee X

## Announcement
原文: On June 2, 2025, we released an updated version of Apigee (1-15-0-apigee-5).
> **Note:** Rollouts of this release began today and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

説明: Apigee X の新バージョン (1-15-0-apigee-5) が2025年6月2日にリリースされました。このロールアウトは本日開始され、すべてのGoogle Cloudゾーンで完了するまでに4営業日以上かかる場合があります。ロールアウトが完了するまで、お客様のインスタンスで新機能や修正が利用できない可能性があります。

影響有無: 影響はありません。Apigee X はGoogle Cloudが管理するマネージドサービスであるため、バージョンアップはGoogle側で自動的に適用されます。既存のAPIプロキシやAPIプロダクトの動作に破壊的な変更をもたらすものではなく、主に機能改善やバグ修正が含まれています。新機能や修正はロールアウト完了後に利用可能となります。

対処方法: 特段の対処は不要です。ロールアウトが完了するのを待ち、新機能や修正の恩恵を受けることができます。

## Fixed
原文:
| Bug ID | Description |
| --- | --- |
| **410670597** | **Fixed the proxy response count metric (`proxy/response_count`) for EventFlow-enabled streaming proxies.** |
| **375360455** | **Resolved issues with connection termination when using HTTP streaming** Added automatic retries for connection reset due to upstream services. |
| **N/A** | **Updates to security infrastructure and libraries.** |
Added automatic retries for connection reset due to upstream services.

説明:
以下のバグが修正されました。
*   EventFlow が有効なストリーミングプロキシにおいて、プロキシの応答回数メトリック (`proxy/response_count`) の表示が修正されました。
*   HTTP ストリーミングを使用する際の接続終了に関する問題が解決され、アップストリームサービスからの接続リセットに対する自動リトライ機能が追加されました。
*   セキュリティインフラストラクチャとライブラリが更新されました。

影響有無: 影響はありません。これらの修正はバグの改善とセキュリティの強化、および接続安定性の向上を目的としており、既存のサービス動作に負の影響を与えることはありません。特に、HTTPストリーミングを利用している場合は接続の安定性が向上し、セキュリティ関連の更新はセキュリティ体制の強化に繋がります。

対処方法: 特段の対処は不要です。既存のサービスに対してポジティブな影響が期待されます。

---

# BigQuery

## Libraries
### Node.js
原文:
## Changes for @google-cloud/bigquery
[@google-cloud/bigquery](https://github.com/googleapis/nodejs-bigquery)
[8.1.0](https://github.com/googleapis/nodejs-bigquery/compare/v8.0.0...v8.1.0)
- Job creation mode GA (#1480) (b51359a)
- Support per-job reservation assignment (#1477) (8151e72)

説明: BigQuery Node.js クライアントライブラリのバージョン 8.1.0 がリリースされました。
*   BigQuery ジョブ作成モードがGA (General Availability) になりました。
*   ジョブごとのリザベーション割り当てがサポートされました。

影響有無: 影響はありません。Node.js クライアントライブラリの更新であり、既存のアプリケーションが明示的にこれらの新機能を利用するようにコードを変更しない限り、既存の動作に影響はありません。これらの機能は主に開発者向けの機能強化であり、安定版として利用できるようになりました。
お客様の環境ではGoogle Cloud Composer2 (Pythonベース) やGoogle Kubernetes Engine (Go, Java, Node.js, Pythonなど多様な言語を利用可能) をご利用とのことですが、Node.jsアプリケーションをBigQueryと連携させている場合にのみ関連します。

対処方法: Node.jsアプリケーションで BigQuery のジョブ作成モードやジョブごとのリザベーション割り当ての新機能を利用したい場合、クライアントライブラリをバージョン 8.1.0 にアップグレードすることを検討してください。

### Go
原文:
## Changes for bigquery/storage/apiv1beta1
[bigquery/storage/apiv1beta1](https://github.com/googleapis/google-cloud-go/tree/main/bigquery/storage/apiv1beta1)
[1.69.0](https://github.com/googleapis/google-cloud-go/compare/bigquery/v1.68.0...bigquery/v1.69.0)
- **bigquery/analyticshub:** Add support for Analytics Hub & Marketplace Integration (2aaada3)
- **bigquery/analyticshub:** Adding allow_only_metadata_sharing to Listing resource (2aaada3)
- **bigquery/analyticshub:** Adding CommercialInfo message to the Listing and Subscription resources (2aaada3)
- **bigquery/analyticshub:** Adding delete_commercial and revoke_commercial to DeleteListingRequest and RevokeSubscriptionRequest (2aaada3)
- **bigquery/analyticshub:** Adding DestinationDataset to the Subscription resource (2aaada3)
- **bigquery/analyticshub:** Adding routine field to the SharedResource message (2aaada3)
- **bigquery:** Add support for dataset view and update modes (#12290) (7c1f961)
- **bigquery:** Job creation mode GA (#12225) (1d8990d)

説明: BigQuery Go クライアントライブラリのバージョン 1.69.0 がリリースされました。
*   BigQuery Analytics Hub & Marketplace との連携機能が追加されました。
*   データセットのビューと更新モードのサポートが追加されました。
*   BigQuery ジョブ作成モードがGA (General Availability) になりました。

影響有無: 影響はありません。Go クライアントライブラリの更新であり、既存のアプリケーションが明示的にこれらの新機能を利用するようにコードを変更しない限り、既存の動作に影響はありません。Go言語で BigQuery を操作するアプリケーションをご利用の場合にのみ関連します。

対処方法: Goアプリケーションで BigQuery Analytics Hub やデータセットビュー・更新モード、GA化されたジョブ作成モードの新機能を利用したい場合、クライアントライブラリをバージョン 1.69.0 にアップグレードすることを検討してください。

### Python
原文:
## Changes for google-cloud-bigquery
[google-cloud-bigquery](https://github.com/googleapis/python-bigquery)
[3.34.0](https://github.com/googleapis/python-bigquery/compare/v3.33.0...v3.34.0)
- Job creation mode GA (#2190) (64cd39f)
- **deps:** Update all dependencies (#2184) (12490f2)
- Update query.py (#2192) (9b5ee78)
- Use query_and_wait in the array parameters sample (#2202) (28a9994)

説明: BigQuery Python クライアントライブラリのバージョン 3.34.0 がリリースされました。
*   BigQuery ジョブ作成モードがGA (General Availability) になりました。
*   すべての依存関係が更新されました。
*   `query.py` が更新され、配列パラメータのサンプルで `query_and_wait` が使用されるようになりました。

影響有無: 影響は低いですが、依存関係の更新が含まれるため、既存のワークロードでまれに影響がある可能性があります。Google Cloud Composer2 (Airflow) は Python 環境で動作しており、BigQuery との連携にこのライブラリを使用している可能性があります。GA 化は機能の安定性を示し、ポジティブな変更です。依存関係の更新は通常、バグ修正やセキュリティパッチ、パフォーマンス改善を含みますが、意図しない挙動の変更がないか、アップグレード前にテスト環境での確認を推奨します。

対処方法: Google Cloud Composer の Airflow DAGs やその他の Python アプリケーションで `google-cloud-bigquery` ライブラリを直接利用している場合、ライブラリのアップグレードを検討する前に、開発環境やテスト環境で既存のワークロードが正常に動作することを確認することを推奨します。新しいGA機能を利用したい場合はアップグレードが必要です。

---

# Pub/Sub

## Libraries
### Python
原文:
## Changes for google-cloud-pubsub
[google-cloud-pubsub](https://github.com/googleapis/python-pubsub)
[2.29.1](https://github.com/googleapis/python-pubsub/compare/v2.29.0...v2.29.1)
- Remove setup.cfg configuration for creating universal wheels (#1376) (60639c4)
- **sample:** Add samples for topic and subscription SMTs (#1386) (4d072e0)
- Update documentation for JavaScriptUDF to indicate that the `message_id` metadata field is optional instead of required (#1380) (be90054)
- Update readme links (#1409) (77ba05d)

説明: Pub/Sub Python クライアントライブラリのバージョン 2.29.1 がリリースされました。
*   ユニバーサルホイール作成のための `setup.cfg` 設定が削除されました。
*   トピックおよびサブスクリプションのSMT (Server-side Message Transformations) 用のサンプルが追加されました。
*   JavaScriptUDF のドキュメントが更新され、`message_id` メタデータフィールドが必須ではなくオプションであることが示されました。
*   READMEのリンクが更新されました。

影響有無: 影響はありません。これらの変更は、ライブラリのビルド設定、ドキュメントの更新、サンプルコードの追加が主であり、既存のAPIの挙動や機能に直接的な影響を与えるものではありません。Google Cloud Composer の Airflow DAGs で Pub/Sub を利用している場合でも、既存のコードに修正は不要です。

対処方法: 特段の対処は不要です。

---

# Spanner

## Libraries
### Go
原文:
## Changes for spanner/admin/database/apiv1
[spanner/admin/database/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/spanner/admin/database/apiv1)
[1.81.0](https://github.com/googleapis/google-cloud-go/compare/spanner/v1.80.0...spanner/v1.81.0)
- **spanner/spansql:** Add support for DROP SEARCH INDEX and ALTER SEARCH INDEX (#11961) (952cd7f)
- **spanner:** Row mismatch in SelectAll using custom type (#12222) (ce6a23a)
[1.81.1](https://github.com/googleapis/google-cloud-go/compare/spanner/v1.81.0...spanner/v1.81.1)
- **spanner:** Add support of AFE and GRPC metrics in client-side metrics (#12067) (7b77038)
[1.82.0](https://github.com/googleapis/google-cloud-go/compare/spanner/v1.81.1...spanner/v1.82.0)
- **spanner/admin/database:** Add throughput_mode to UpdateDatabaseDdlRequest to be used by Spanner Migration Tool. See https (#12287) (2a9d8ee)

説明: Spanner Go クライアントライブラリがバージョン 1.81.0、1.81.1、1.82.0 に更新されました。
*   Spanner SQL において、検索インデックスの `DROP SEARCH INDEX` および `ALTER SEARCH INDEX` がサポートされました。
*   カスタム型を使用した `SelectAll` での行の不一致バグが修正されました。
*   クライアントサイドメトリクスに AFE (Application Front End) および gRPC メトリクスのサポートが追加されました。
*   `UpdateDatabaseDdlRequest` に `throughput_mode` が追加され、Spanner Migration Tool で使用できるようになりました。

影響有無: 影響はありません。これらの変更は、Spannerの新機能への対応やバグ修正、メトリクス追加が主であり、既存のGoアプリケーションの動作に破壊的な変更をもたらすものではありません。

対処方法: GoアプリケーションでSpannerの新しいSQL機能やメトリクスを利用したい場合、クライアントライブラリのバージョンアップを検討してください。

### Java
原文:
## Changes for google-cloud-spanner
[google-cloud-spanner](https://github.com/googleapis/java-spanner)
[6.92.0](https://github.com/googleapis/java-spanner/compare/v6.91.1...v6.92.0)
- **spanner:** Do not export metrics during shutdown if prev export was less than 30 seconds ago (#12266) (8ad7511)
- **spanner:** Fix invalid trace in case of skipping trailers (#12235) (e54c439)
### Changes for google-cloud-spanner
#### 6.94.0 (2025-05-21)
[google-cloud-spanner](https://github.com/googleapis/java-spanner)
[6.94.0](https://github.com/googleapis/java-spanner/compare/v6.93.0...v6.94.0)
- [Internal] client-side metrics for afe latency and connectivity error (#3819) (a8dba0a)
- Support begin with AbortedException for manager interface (#3835) (5783116)
- Add throughput_mode to UpdateDatabaseDdlRequest to be used by Spanner Migration Tool. See https://github.com/GoogleCloudPlatform/spanner-migration-tool (3070f1d)
- Enable AFE and gRPC metrics for DP (#3852) (203baae)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.56.2 (11bfd90)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.58.0 (3070f1d)
- Remove trailing semicolons in DDL (#3879) (ca3a67d)
- Change server timing duration attribute to float as per w3c (#3851) (da8dd8d)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.57.0 (23b985c)
- Non-ASCII Unicode characters in code (#3844) (85a0820)
- Only close and return sessions once (#3846) (32b2373)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.46.2 (#3836) (2ee7f97)
[6.93.0](https://github.com/googleapis/java-spanner/compare/v6.92.0...v6.93.0)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.48.0 (#3869) (afa17f7)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.48.0 (#3880) (f3b00b6)
- Update dependency com.google.cloud.opentelemetry:exporter-metrics to v0.34.0 (#3861) (676b14f)
- Update dependency commons-io:commons-io to v2.19.0 (#3863) (80a6af8)
- Update dependency io.opentelemetry:opentelemetry-bom to v1.50.0 (#3865) (ae63050)
- Update googleapis/sdk-platform-java action to v2.58.0 (#3870) (d1e45fa)
- Update opentelemetry.version to v1.50.0 (#3866) (f7e09b8)
- Add samples for unnamed (positional) parameters (#3849) (035cadd)

説明: Spanner Java クライアントライブラリがバージョン 6.92.0、6.93.0、6.94.0 に更新されました。
*   シャットダウン時のメトリクスエクスポートやトレースに関するバグが修正されました。
*   AFEレイテンシや接続エラーに関するクライアントサイドメトリクスのサポートが追加・改善されました。
*   `UpdateDatabaseDdlRequest` に `throughput_mode` が追加され、Spanner Migration Tool で使用できるようになりました。
*   各種依存関係が更新されました。
*   DDLの末尾のセミコロンの削除や、サーバータイミングの属性変更など、細かな改善が行われました。
*   セッションのクローズと返却に関するロジックが修正されました。
*   名前なし（位置指定）パラメータのサンプルが追加されました。

影響有無: 影響はありません。これらの変更はバグ修正、パフォーマンス改善、機能追加、依存関係の更新が主であり、既存のJavaアプリケーションの動作に破壊的な変更をもたらすものではありません。Spannerとの連携において安定性や監視性が向上します。

対処方法: JavaアプリケーションでSpannerのこれらの改善や新機能を利用したい場合、クライアントライブラリのバージョンアップを検討してください。

### Node.js
原文:
## Changes for @google-cloud/spanner
[@google-cloud/spanner](https://github.com/googleapis/nodejs-spanner)
[8.0.0](https://github.com/googleapis/nodejs-spanner/compare/v7.21.0...v8.0.0)
- remove the arrify package (#2292)
- migrate to Node 18 (#2271)
- Add promise based signatures for createQueryPartitions (#2284) (255d8a6)
- Add promise based signatures on createReadPartitions (#2300) (7b8a1f7)
- Support promise based signatures for execute method (#2301) (bb857e1)
- **deps:** Update dependency @google-cloud/kms to v5 (#2289) (1ccb505)
- **deps:** Update dependency @google-cloud/precise-date to v5 (#2290) (44f7575)
- **deps:** Update dependency big.js to v7 (#2286) (0911297)
- Migrate to Node 18 (#2271) (cab3f22)
- Remove the arrify package (#2292) (e8f5ca1)

説明: Spanner Node.js クライアントライブラリがバージョン 8.0.0 に更新されました。これは**メジャーバージョンアップ**です。
*   `arrify` パッケージが削除されました。
*   Node.js 18 への移行が行われました。
*   `createQueryPartitions`、`createReadPartitions`、`execute` メソッドに Promise ベースのシグネチャが追加されました。
*   `@google-cloud/kms`、`@google-cloud/precise-date`、`big.js` などの依存関係が更新されました。

影響有無: 影響があります。本バージョンはメジャーバージョンアップ（8.0.0）であり、特に「`migrate to Node 18`」の記載から、Node.js 18より古いバージョンで動作するアプリケーションでは互換性の問題が発生する可能性があります。Google Kubernetes Engine (GKE) 上で Node.js アプリケーションが Spanner クライアントライブラリを使用している場合、アプリケーションの Node.js ランタイムバージョンと互換性を確認する必要があります。新しい Promise ベースのシグネチャは新機能であるため、既存のコールバックベースのコードに直接影響はありませんが、ライブラリの内部的な変更や依存関係の更新によって予期せぬ挙動が発生する可能性も考慮すべきです。

対処方法: Spanner Node.js クライアントライブラリをバージョン 8.0.0 にアップグレードする前に、以下の対応を強く推奨します。
1.  **Node.js ランタイムの確認**: アプリケーションが動作している Node.js のバージョンが 18 以降であることを確認してください。もし古いバージョンの場合は、Node.js 18へのアップグレードを検討し、アプリケーションの互換性テストを実施してください。
2.  **テスト環境での十分な検証**: メジャーバージョンアップであるため、既存のアプリケーションが正常に動作するかどうかを、テスト環境で徹底的に検証してください。
3.  **変更点の確認**: `arrify` パッケージの削除など、内部的な変更がアプリケーションに影響しないかを確認
# Title: May 30, 2025 
Link: https://cloud.google.com/release-notes#May_30_2025<br>
Google Cloud リリースノートに関する影響調査結果を報告します。

---

# Apigee X

## Announcement
原文: On May 30, 2025 we released an updated version of Apigee.
説明: Apigeeの更新版が2025年5月30日にリリースされたというアナウンスです。現時点では、具体的な変更内容や新機能、互換性に関する詳細情報は含まれていません。
影響有無: **影響なし (現時点では)**
理由: このアナウンスは将来のリリースに関するものであり、具体的な変更内容が明示されていません。したがって、現在稼働中のApigeeサービスに直接的な影響はありません。
対処方法: 現時点での対処は不要です。2025年5月30日以降に公開される詳細なリリースノートやドキュメントを確認し、互換性、新機能、非推奨事項などを評価する必要があります。

---

# Google Kubernetes Engine

## Changed
原文: GKE cluster versions have been updated.
**New versions available for upgrades and new clusters.**
The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades.
[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)
説明: GKEクラスタのKubernetesバージョンが更新されました。新しいクラスタの作成、および既存クラスタのコントロールプレーンとノードの手動アップグレード向けに、新しいバージョンが利用可能になりました。詳細については、GKEのバージョン管理とサポート、およびアップグレードに関するドキュメントを参照してください。
影響有無: **影響あり (間接的)**
理由: GKEクラスタの利用可能なバージョンが更新されたことを示します。現在利用中のGKE 1.31クラスタのオートアップグレードの挙動や、将来のアップグレード計画に影響を与える可能性があります。
対処方法:
1.  現在のGKEクラスタがどのリリースチャネル（Stable, Regular, Rapid, Extended）を利用しているか確認してください。
2.  オートアップグレードを有効にしている場合、設定されているメンテナンスウィンドウとメンテナンス除外期間を考慮し、今後どのバージョンにアップグレードされる可能性があるかを確認してください。
3.  利用可能な新しいGKEパッチバージョンへのアップグレードを計画し、アプリケーションの互換性を事前にテストすることを推奨します。

## Changed
原文: The insecure kubelet read-only port (`10255`) is disabled by default in all new clusters that run GKE version 1.32 and later. If you created your cluster using a GKE version earlier than 1.32, we recommend that you disable the insecure kubelet read-only port. For more information see Disable the kubelet read-only port in GKE clusters.
[Disable the kubelet read-only port in GKE clusters](https://cloud.google.com/kubernetes-engine/docs/how-to/disable-kubelet-readonly-port)
説明: GKEバージョン1.32以降で作成される新しいクラスタでは、セキュアでないkubeletの読み取り専用ポート（10255番）がデフォルトで無効化されます。GKEバージョン1.32より前に作成されたクラスタを使用している場合でも、この非セキュアなポートを無効にすることが推奨されています。
影響有無: **影響あり (推奨されるセキュリティ改善)**
理由: 現在のGKEクラスタがバージョン1.31であるため、この変更の直接的な影響は受けません。しかし、セキュリティのベストプラクティスとして、非セキュアなポートを無効にすることが推奨されています。
対処方法:
1.  既存のGKE 1.31クラスタでkubeletの読み取り専用ポート（10255番）が有効になっているか確認してください。
2.  このポートに依存する監視ツールやカスタムアプリケーションがないか確認してください。
3.  依存関係がない場合、推奨されるセキュリティ強化策としてポートを無効化することを検討してください。詳細な手順は、提供されたドキュメント「Disable the kubelet read-only port in GKE clusters」を参照してください。

## Changed
原文: There are no version updates for 2025-R21.
説明: 2025-R21リリースでは、バージョン更新がないことを示しています。
影響有無: **影響なし**
理由: 特定のリリースにおいてバージョン更新がないという情報であり、現在の運用に直接的な影響はありません。
対処方法: なし。

## Changed (Stable Channel)
原文: (Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.)
- The following versions are now available in the Stable channel:
    - 1.30.11-gke.1217000
    - 1.31.7-gke.1390000
- The following versions are no longer available in the Stable channel:
    - 1.30.11-gke.1131000
    - 1.31.7-gke.1212000
- Auto-upgrade targets are now available for the following minor versions:
    - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.11-gke.1157000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.31.7-gke.1265000 with this release.
- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
    - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.11-gke.1157000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.31 to version 1.31.7-gke.1265000 with this release.
説明: Stableチャネルで利用可能なGKEバージョンが更新されました。1.30および1.31の新しいパッチバージョンが利用可能になり、古いパッチバージョンは利用不可になりました。また、オートアップグレードのターゲットバージョンも更新され、特に1.31クラスタは1.31.7-gke.1265000へのパッチアップグレードが予定されています。
影響有無: **影響あり (自動アップグレードの可能性)**
理由: 現在のGKEクラスタがバージョン1.31であり、Stableチャネルを利用している場合、オートアップグレードが有効であれば、コントロールプレーンとノードが新しいパッチバージョン（1.31.7-gke.1265000）へアップグレードされる可能性があります。
対処方法:
1.  現在のGKEクラスタがStableチャネルを使用しているか確認してください。
2.  クラスタのオートアップグレード設定（メンテナンスウィンドウ、除外期間など）を確認し、計画外のアップグレードが発生しないよう注意してください。
3.  新しいパッチバージョンへのアップグレードに備え、アプリケーションの互換性を事前にテストすることを推奨します。

## Changed (Regular Channel)
原文: (Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.)
- Version 1.32.4-gke.1106006 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:
    - 1.30.12-gke.1086000
    - 1.31.8-gke.1113000
    - 1.32.4-gke.1236006
- The following versions are no longer available in the Regular channel:
    - 1.30.11-gke.1217000
    - 1.31.7-gke.1390000
    - 1.32.3-gke.1927009
- Auto-upgrade targets are now available for the following minor versions:
    - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.12-gke.1033000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.31.8-gke.1045000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.32.4-gke.1106006 with this release.
- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
    - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.12-gke.1033000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.8-gke.1045000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.32 to version 1.32.4-gke.1106006 with this release.
説明: Regularチャネルで利用可能なGKEバージョンが更新されました。新規クラスタのデフォルトバージョンが1.32.4-gke.1106006になりました。1.30、1.31、1.32の新しいパッチバージョンが利用可能になり、古いバージョンは利用不可になりました。オートアップグレードのターゲットも更新され、特に1.31クラスタは1.31.8-gke.1045000へのパッチアップグレード、または1.32.4-gke.1106006へのマイナーバージョンアップグレードが予定されています。
影響有無: **影響あり (自動アップグレードの可能性)**
理由: 現在のGKEクラスタがバージョン1.31であり、Regularチャネルを利用している場合、オートアップグレードが有効であれば、コントロールプレーンとノードが新しいパッチバージョン（1.31.8-gke.1045000）へ、またはマイナーバージョンアップグレードとして1.32.4-gke.1106006へアップグレードされる可能性があります。
対処方法:
1.  現在のGKEクラスタがRegularチャネルを使用しているか確認してください。
2.  クラスタのオートアップグレード設定（メンテナンスウィンドウ、除外期間など）を確認し、計画外のアップグレードが発生しないよう注意してください。
3.  新しいパッチバージョンまたはマイナーバージョンへのアップグレードに備え、アプリケーションの互換性を事前にテストすることを強く推奨します。特にマイナーバージョンアップグレードはKubernetes APIの非互換変更を含む可能性があるため、十分な検証が必要です。

## Changed (Rapid Channel)
原文: (Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.)
- Version 1.33.0-gke.2248000 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:
    - 1.30.12-gke.1168000
    - 1.31.9-gke.1044000
    - 1.32.4-gke.1415000
    - 1.33.1-gke.1107000
- The following versions are no longer available in the Rapid channel:
    - 1.30.12-gke.1086000
    - 1.31.9-gke.1005000
    - 1.33.0-gke.1868000
- Auto-upgrade targets are now available for the following minor versions:
    - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.12-gke.1151000 with this release.
- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
    - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.12-gke.1151000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.33 to version 1.33.0-gke.2248000 with this release.
説明: Rapidチャネルで利用可能なGKEバージョンが更新されました。新規クラスタのデフォルトバージョンが1.33.0-gke.2248000になりました。1.30、1.31、1.32、1.33の新しいパッチバージョンが利用可能になり、古いバージョンは利用不可になりました。オートアップグレードのターゲットも更新されています。
影響有無: **影響なし (間接的)**
理由: 現在のGKEクラスタがバージョン1.31であり、Rapidチャネルは通常、本番環境での利用が推奨されないため、直接的な影響は小さいと考えられます。しかし、将来のバージョンアップグレードの傾向を把握するために参考になります。
対処方法: 現時点での対処は不要ですが、将来的なアップグレードパスの検討材料として情報を把握しておくことが推奨されます。

## Changed (General Availability / Default)
原文: (Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.)
- Version 1.32.4-gke.1106006 is now the default version for cluster creation.
- The following versions are now available:
    - 1.30.12-gke.1168000
    - 1.31.9-gke.1044000
    - 1.32.4-gke.1415000
- The following node versions are now available:
    - 1.27.16-gke.2820000
    - 1.28.15-gke.2303000
    - 1.29.15-gke.1415000
    - 1.30.12-gke.1168000
    - 1.31.9-gke.1044000
    - 1.32.4-gke.1415000
- The following versions are no longer available:
    - 1.30.11-gke.1131000
    - 1.31.7-gke.1212000
    - 1.31.9-gke.1005000
    - 1.32.3-gke.1785003
    - 1.32.4-gke.1106000
- Auto-upgrade targets are now available for the following minor versions:
    - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.12-gke.1033000 with this release.
    - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.31.7-gke.1265000 with this release.
- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
    - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.12-gke.1033000 with this release.
    - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.31 to version 1.31.7-gke.1265000 with this release.
    - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.32 to version 1.32.4-gke.1106006 with this release.
説明: GKEクラスタ作成のデフォルトバージョンが1.32.4-gke.1106006になりました。広範なGKEバージョンとノードバージョンが更新され、利用可能になったバージョンと利用不可になったバージョンが示されています。オートアップグレードのターゲットも更新され、特に1.31クラスタは1.31.7-gke.1265000へのパッチアップグレードが予定されています。
影響有無: **影響あり (自動アップグレードの可能性)**
理由: 現在のGKEクラスタがバージョン1.31であり、オートアップグレードが有効な場合、コントロールプレーンとノードが新しいパッチバージョン（1.31.7-gke.1265000）へアップグレードされる可能性があります。また、新規クラスタのデフォルトバージョン変更は、今後の環境構築に影響します。
対処方法:
1.  クラスタのオートアップグレード設定を確認し、計画外のアップグレードが発生しないよう注意してください。
2.  新しいパッチバージョンへのアップグレードに備え、アプリケーションの互換性を事前にテストすることを推奨します。
3.  今後のGKEクラスタ新規作成時は、デフォルトバージョンが1.32系になることを認識し、計画に含めてください。

## Changed (Extended Channel)
原文: (Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.)
- Version 1.32.4-gke.1106006 is now the default version for cluster creation in the Extended channel.
- The following versions are now available in the Extended channel:
    - 1.27.16-gke.2771000
    - 1.27.16-gke.2820000
    - 1.28.15-gke.2239000
    - 1.28.15-gke.2303000
    - 1.29.15-gke.1325000
    - 1.29.15-gke.1415000
    - 1.30.12-gke.1086000
    - 1.31.8-gke.1113000
    - 1.32.4-gke.1236006
- The following versions are no longer available in the Extended channel:
    - 1.27.16-gke.2703000
    - 1.27.16-gke.2810000
    - 1.28.15-gke.2169000
    - 1.28.15-gke.2287000
    - 1.29.15-gke.1240000
    - 1.29.15-gke.1395000
    - 1.30.11-gke.1217000
    - 1.31.7-gke.1390000
    - 1.32.3-gke.1927009
- Auto-upgrade targets are now available for the following minor versions:
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.28.15-gke.2192000 with this release.
- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2732000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.2192000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.15-gke.1274000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.12-gke.1033000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.8-gke.1045000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.32 to version 1.32.4-gke.1106006 with this release.
説明: Extendedチャネルで利用可能なGKEバージョンが更新されました。新規クラスタのデフォルトバージョンが1.32.4-gke.1106006になりました。複数のGKEバージョンが利用可能になり、古いバージョンは利用不可になりました。オートアップグレードのターゲットも更新され、特に1.31クラスタは1.31.8-gke.1045000へのパッチアップグレードが予定されています。
影響有無: **影響なし (間接的)**
理由: 現在のGKEクラスタがバージョン1.31であり、Extendedチャネルを利用していない場合は直接的な影響はありません。ただし、GKEクラスタがこのチャネルに切り替わる場合、オートアップグレードの対象となる可能性があります。
対処方法: 現時点での対処は不要ですが、将来的にExtendedチャネルの利用を検討する場合は、その動向を把握しておくことが推奨されます。

---

**用語説明:**

*   **Google Cloud Composer2 (Compoer version 2.7.1, Airflow version 2.7.3)**: Google Cloud上でApache Airflowをマネージドサービスとして実行するためのプラットフォーム。指定されたバージョンは、Composerのメジャーバージョンと、その内部で実行されるAirflowのバージョンを示します。
*   **Google Kubernetes Engine (GKE) 1.31**: Google Cloud上でKubernetesクラスタをマネージドサービスとして提供するGKEの特定のバージョン。1.31はKubernetesのマイナーバージョンを指し、安定性や新機能に影響します。
*   **リリースチャネル (Release Channel)**: GKEクラスタのKubernetesバージョンが提供される頻度と安定性を決定する設定。主にRapid、Regular、Stable、Extendedチャネルがあり、新しい機能の早期アクセスと安定性のバランスを選択できます。
    *   **Rapid Channel**: 最新のKubernetesバージョンが最も早く提供されるが、安定性は保証されない。開発環境や新機能の検証向け。
    *   **Regular Channel**: 新機能と安定性のバランスが取れたチャネル。デフォルトで推奨されることが多い。
    *   **Stable Channel**: テストと検証が最も行われた、安定性の高いバージョンが提供される。本番環境で推奨されることが多い。
    *   **Extended Channel**: Stableチャネルよりも長期サポートが提供されるチャネル。特定の要件を持つ場合に選択される。
*   **オートアップグレード (Auto-upgrade)**: GKEクラスタのコントロールプレーンおよびノードが、Google Cloudによって自動的に新しいバージョンにアップグレードされる機能。メンテナンスウィンドウや除外期間を設定することで、アップグレードのタイミングを制御できます。
*   **kubelet read-only port (10255)**: Kubernetesノード上で動作するkubeletエージェントが提供する、監視や診断のための読み取り専用ポート。セキュリティ上の理由から、このポートは非推奨となり、デフォルトで無効化される傾向にあります。
*   **メンテナンスウィンドウ (Maintenance Window)**: GKEクラスタの自動アップグレードやその他のメンテナンス活動が行われることを許可する時間帯。
*   **メンテナンス除外 (Maintenance Exclusions)**: GKEクラスタの自動アップグレードを特定の期間、一時的に停止する設定。重要なイベント期間や、アプリケーションのデプロイ期間中にアップグレードを回避するために使用されます。
# Title: May 29, 2025 
Link: https://cloud.google.com/release-notes#May_29_2025<br>
はい、承知いたしました。Google Cloud のインフラエンジニアとして、提供されたリリースノートに基づき、構築済みのサービスへの影響有無を調査し、簡潔に回答いたします。

---

# Apigee X

## Announcement
**原文:** On May 29, 2025 we announced the shutdown schedule for the Apigee Classic UI.
**説明:** Apigee の旧UI (Apigee Classic UI) のシャットダウン計画が発表されました。これは、Apigee 管理機能がGoogle Cloud Consoleに完全に移行されるためです。
**影響有無:** 直接的な機能の変更ではありませんが、将来的にApigee Classic UIを利用している場合は管理インターフェースの変更が必要になります。
**対処方法:** 後述のDeprecationの項目で詳細をご確認ください。
**用語説明:**
*   **Apigee Classic UI:** Google Cloud Consoleに統合される前の、従来のApigee管理画面を指します。

## Announcement
**原文:** On May 29, 2025, we released an updated version of Apigee.
**説明:** Apigee の更新版がリリースされました。
**影響有無:** このアナウンス単体では、具体的な機能や互換性への直接的な影響は特定できません。一般的に、更新版のリリースは機能改善やバグ修正が含まれますが、現在の構成に即座に影響を与えるような破壊的変更は、通常、別途明確にアナウンスされます。
**対処方法:** 特にこのアナウンス項目に対する直接的な対処は不要です。詳細な変更内容については、別途Apigeeのリリースノートやドキュメントで確認することをお勧めします。
**用語説明:** なし

## Deprecated
**原文:**
The Apigee Classic UI will be shutdown as of August 29, 2025.
This is the final phase of moving Apigee to the Google Cloud console. Apigee in the Google Cloud console gives you the ability to manage all of your Apigee functionality in one place.
To prepare for the shutdown of the Apigee Classic UI, familiarize yourself with the new Apigee UI in Google Cloud console by reviewing UI overview.
[UI overview](https://cloud.google.com/apigee/docs/api-platform/fundamentals/ui-overview)
See Apigee Classic UI shutdown for details on shutdown dates and exception request.
[Apigee Classic UI shutdown](https://cloud.google.com/apigee/docs/deprecations/apigee-classic-ui)

**説明:** Apigee の従来のUI (Apigee Classic UI) が、**2025年8月29日**をもってシャットダウンされます。これにより、Apigee の全ての管理機能がGoogle Cloud Console上の新しいApigee UIに統合され、一元的に管理できるようになります。利用者は、シャットダウンに備えて新しいUIに慣れておくよう推奨されています。シャットダウンに関する詳細な情報や例外申請については、提供されたリンク先のドキュメントを参照してください。

**影響有無:** **重大な影響あり。** 現在Apigee Classic UIを利用してApigeeインスタンスの管理や運用を行っている場合、2025年8月29日以降はClassic UIにアクセスできなくなり、機能の操作ができなくなります。Apigeeの機能自体は引き続きGoogle Cloud Console経由で利用可能ですが、管理・運用方法の変更が必要となります。

**対処方法:**
1.  **利用状況の確認:** 現在Apigee Classic UIを使用しているかどうかを確認してください。特に、定期的な運用業務や特定の設定変更作業でClassic UIに依存していないか洗い出してください。
2.  **新しいUIへの移行準備:** Google Cloud Console内の新しいApigee UIの操作に慣れるための準備を開始してください。
    *   新しいUIの概要に関するドキュメントを確認する: [UI overview](https://cloud.google.com/apigee/docs/api-platform/fundamentals/ui-overview)
3.  **シャットダウン詳細の確認:** Apigee Classic UIのシャットダウンに関する詳細なドキュメントを確認し、シャットダウンの正確な日時、および組織の状況に応じた例外申請の可能性について理解してください。
    *   詳細ドキュメント: [Apigee Classic UI shutdown](https://cloud.google.com/apigee/docs/deprecations/apigee-classic-ui)
4.  **内部プロセスの見直し:** 新しいUIでの管理・運用プロセスをチーム内で共有し、必要に応じて既存のドキュメントやトレーニングを更新してください。

**用語説明:**
*   **Deprecated (非推奨):** 今後、その機能やサービスが廃止される予定であること、または利用が推奨されなくなることを意味します。通常、代替手段が提供されます。
*   **Google Cloud Console:** Google Cloudの各種サービス（Compute Engine, Cloud Storage, Apigeeなど）をウェブブラウザ上で一元的に管理・設定するためのグラフィカルユーザーインターフェースです。
*   **UI (User Interface):** ユーザーがシステムやソフトウェアとやり取りするための視覚的、操作的な要素のことです。
# Title: May 26, 2025 
Link: https://cloud.google.com/release-notes#May_26_2025<br>
以下、Google Cloudのリリースノートに対する影響調査結果です。

---

# BigQuery
## Libraries
原文: A weekly digest of client library updates from across the Cloud SDK.
説明: Cloud SDKに含まれるクライアントライブラリの週間更新の概要です。

## Changed (Java)
原文:
- Update dependency com.google.cloud:sdk-platform-java-config to v3.48.0 (#3790) (206f06d)
- Update netty.version to v4.2.1.final (#3780) (6dcd858)
- **bigquery:** Update TableResult.getTotalRows() docstring (#3785) (6483588)
説明: BigQueryのJavaクライアントライブラリ `google-cloud-bigquery` のバージョン2.50.1への更新です。内部依存ライブラリ (`sdk-platform-java-config`, `netty`) のバージョンアップと、`TableResult.getTotalRows()` メソッドのドキュメント文字列の修正が含まれています。
影響有無: なし。
理由: これはJavaクライアントライブラリの内部的な依存関係の更新とドキュメントの修正であり、BigQueryサービス自体や既存のJavaアプリケーションの動作に直接的な変更を強制するものではありません。
対処方法: JavaアプリケーションでBigQueryクライアントライブラリの特定のバージョンを固定している場合、新機能の利用や潜在的なバグ修正のために更新を検討できます。

## Changed (Python)
原文:
- Add ability to set autodetect_schema query param in update_table (#2171) (57f940d)
- Add dtype parameters to to_geodataframe functions (#2176) (ebfd0a8)
- Support job reservation (#2186) (cb646ce)
- Ensure AccessEntry equality and repr uses the correct `entity_type` (#2182) (0217637)
- Ensure SchemaField.field_dtype returns a string (#2188) (7ec2848)
説明: BigQueryのPythonクライアントライブラリ `google-cloud-bigquery` のバージョン3.33.0への更新です。`update_table` メソッドでの `autodetect_schema` クエリパラメータ設定機能の追加、`to_geodataframe` 関数への `dtype` パラメータ追加、ジョブ予約のサポート、および `AccessEntry` と `SchemaField` の動作に関する内部的な修正が含まれています。
影響有無: なし。
理由: これはPythonクライアントライブラリの新機能追加と内部的な修正であり、BigQueryサービス自体や既存のPythonアプリケーションの動作に直接的な変更を強制するものではありません。
対処方法: Pythonアプリケーションで新しい機能（例: ジョブ予約、スキーマ自動検出の指定）を利用したい場合は、クライアントライブラリを更新してください。既存のコードに影響はないと考えられますが、更新前にテスト環境での動作確認を推奨します。

---

# Cloud Composer
利用中のバージョン: Google Cloud Composer2 (Compoer version 2.7.1、Airflow version 2.7.3)

## Announcement
原文: A new Cloud Composer release has started on May 26, 2025. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.
説明: 2025年5月26日よりCloud Composerの新しいリリースが開始されたとのアナウンスです。新機能や変更が全リージョンに展開中であり、一部リージョンではまだ利用できない可能性があるとのことです。
影響有無: なし。
理由: これはリリース開始のアナウンスであり、具体的な変更内容は後続のセクションで示されます。現在の環境が自動的にアップデートされるわけではありません。
対処方法: 後続の具体的な変更内容を注視し、自身の環境への影響がないか確認します。

## Fixed (Cloud Composer 3)
原文: (Cloud Composer 3) It's now possible to override the default scopes of access tokens in all regions supported by Cloud Composer 3. This fix was announced previously and has finished gradually rolling out.
説明: Cloud Composer 3において、アクセストークンのデフォルトスコープを上書きできるようになった修正が、全リージョンで展開完了したとのことです。
影響有無: なし。
理由: これはCloud Composer 3に関する修正であり、現在の環境はCloud Composer 2 (2.7.1) のため直接的な影響はありません。
対処方法: なし。

## Changed (Airflow 2.10.5 and 2.9.3)
原文: (Airflow 2.10.5 and 2.9.3) The `apache-airflow-providers-cncf-kubernetes` package was upgraded to version 10.4.3 from version 10.1.0.
説明: Airflow 2.10.5および2.9.3において、Kubernetesプロバイダーパッケージ `apache-airflow-providers-cncf-kubernetes` がバージョン10.1.0から10.4.3にアップグレードされました。
影響有無: 可能性あり。
理由: 現在のAirflowバージョンは2.7.3であるため、この変更による直接的な影響はありません。しかし、将来的にCloud Composer 2環境をAirflow 2.9.3または2.10.5にアップグレードした場合、GKE関連のDAG (例: KubernetesPodOperatorを使用している場合) に影響が出る可能性があります。
対処方法: 将来的にAirflowバージョン2.9.3または2.10.5へのアップグレードを検討する際に、`apache-airflow-providers-cncf-kubernetes` の変更ログ（リンク参照）を確認し、GKE上で動作するDAGの互換性テストを実施してください。

## Changed (New Airflow builds are available in Cloud Composer 3)
原文:
- composer-3-airflow-2.10.5-build.4 (default)
- composer-3-airflow-2.9.3-build.24
説明: Cloud Composer 3向けの新しいAirflowビルドイメージ (`composer-3-airflow-2.10.5-build.4` と `composer-3-airflow-2.9.3-build.24`) が利用可能になりました。
影響有無: なし。
理由: これはCloud Composer 3向けの新しいイメージであり、現在の環境はCloud Composer 2のため直接的な影響はありません。
対処方法: なし。

## Changed (New images are available in Cloud Composer 2)
原文:
- composer-2.13.2-airflow-2.10.5 (default)
- composer-2.13.2-airflow-2.9.3
説明: Cloud Composer 2向けの新しいイメージ (`composer-2.13.2-airflow-2.10.5` と `composer-2.13.2-airflow-2.9.3`) が利用可能になりました。
影響有無: なし（現在のバージョンでは）。将来的に可能性あり。
理由: 現在のCloud Composerのバージョンは2.7.1、Airflowは2.7.3です。今回リリースされたイメージは `composer-2.13.2` であり、現在の環境が自動的にこの新しいイメージにアップグレードされるわけではありません。そのため、現在の運用には直接的な影響はありません。
対処方法: 将来的にComposer環境をこれらの新しいイメージにアップグレードを検討する際は、Airflowのバージョンアップ（2.7.3から2.9.3または2.10.5へ）に伴うDAGの互換性確認と、前述の `apache-airflow-providers-cncf-kubernetes` パッケージの変更（Cloud Composer 2.13.2イメージに含まれる可能性があります）による影響がないか、十分にテストしてください。

---

# Cloud Logging
## Announcement
原文: Cloud Logging begins enforcement of the new volume-based regional quotas. These quotas replace the single, global quota for the number of calls to write log entries. For more information, see Logging API quotas and limits.
説明: Cloud Loggingが、ログエントリ書き込みAPI呼び出しに対する新しいボリュームベースのリージョンクォータの適用を開始しました。これにより、従来の単一のグローバルクォータは置き換えられます。
影響有無: 可能性あり。
理由: ロギングのクォータ体系が変更されるため、特定のリージョンで大量のログを書き込んでいるワークロードがある場合、新しいリージョンごとのクォータに抵触する可能性があります。既存のグローバルクォータでは問題なかったが、リージョンクォータに分割されることで影響を受けるケースが考えられます。
対処方法:
1.  [Logging API quotas and limits](https://cloud.google.com/logging/quotas#api-limits) のドキュメントを確認し、新しいリージョンクォータの詳細を把握してください。
2.  Cloud Loggingのクォータ使用状況をモニタリングし、特にログ書き込みが多いリージョンでの使用量を確認してください。
3.  必要に応じて、ログの生成量を最適化するか、クォータの引き上げリクエストを検討してください。

## Libraries
原文: A weekly digest of client library updates from across the Cloud SDK.
説明: Cloud SDKに含まれるクライアントライブラリの週間更新の概要です。

## Changed (Java)
原文:
- **deps:** Update the Java code generator (gapic-generator-java) to 2.58.0 (45b4878)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.48.0 (#1808) (6327c51)
- Update googleapis/sdk-platform-java action to v2.58.0 (#1806) (b94da77)
説明: Cloud LoggingのJavaクライアントライブラリ `google-cloud-logging` のバージョン3.22.4への更新です。Javaコードジェネレータや内部依存ライブラリ (`sdk-platform-java-config`) のバージョンアップが含まれています。
影響有無: なし。
理由: これはJavaクライアントライブラリの内部的な依存関係の更新であり、Cloud Loggingサービス自体や既存のJavaアプリケーションの動作に直接的な変更を強制するものではありません。
対処方法: JavaアプリケーションでCloud Loggingクライアントライブラリの特定のバージョンを固定している場合、新機能の利用や潜在的なバグ修正のために更新を検討できます。

---

# Pub/Sub
## Libraries
原文: A weekly digest of client library updates from across the Cloud SDK.
説明: Cloud SDKに含まれるクライアントライブラリの週間更新の概要です。

## Changed (Go)
原文: pubsub/apiv1
説明: Pub/SubのGoクライアントライブラリ (`pubsub/apiv1`) の更新情報が提供されていますが、具体的な変更内容は記載されていません。
影響有無: なし（現時点では不明確）。
理由: リリースノートに具体的な変更内容が記載されていないため、現時点での影響を評価することはできません。一般的に、クライアントライブラリの更新は後方互換性を保ちつつ、バグ修正やパフォーマンス改善、新機能の追加が行われます。
対処方法: Goクライアントライブラリを使用してPub/Subにアクセスしている場合、提供されているリンク（`pubsub/apiv1`）からGitHubリポジトリの変更履歴を確認し、自身のワークロードに関連する変更がないか確認してください。必要に応じて、ライブラリの更新を検討し、テスト環境での動作確認を推奨します。

---

**用語説明:**

*   **Cloud SDK (Google Cloud SDK)**: Google Cloud とやり取りするためのツールセットです。コマンドラインツール (gcloud CLI) やクライアントライブラリなどが含まれます。
*   **クライアントライブラリ (Client Library)**: Google Cloud のサービスをプログラムから利用するためのSDK (Software Development Kit) の一部です。特定のプログラミング言語 (Java, Python, Goなど) で利用しやすいように、API呼び出しを抽象化して提供します。
*   **依存関係 (Dependency)**: プログラムやライブラリが正しく機能するために必要な、他のライブラリやコンポーネントのことです。
*   **Docstring (Documentation String)**: Pythonなどの言語で、関数、クラス、モジュールなどの目的や使い方を説明するために書かれる文字列のことです。他の言語ではJavadocsのようにドキュメントコメントとして機能します。
*   **autodetect_schema**: BigQueryにおいて、データをロードする際にテーブルのスキーマを自動的に推測する機能です。
*   **GeoDataFrame**: Pythonのpandasライブラリを拡張したGeoPandasライブラリで用いられるデータ構造で、地理空間データを扱うためのDataFrameです。
*   **ジョブ予約 (Job Reservation)**: BigQueryのオンデマンド料金モデルではなく、専用のスロット（計算リソース）を確保してクエリを実行する料金モデル（BigQuery Reservations）を利用するための機能です。
*   **AccessEntry**: BigQueryのテーブルやデータセットに対するアクセス制御エントリで、誰がどのような権限を持つかを定義します。
*   **SchemaField**: BigQueryのテーブルスキーマを構成する個々のフィールド（カラム）の定義です。
*   **Cloud Composer**: Google Cloud 上で動作するマネージドなApache Airflowサービスです。ワークフローのオーケストレーションに使用されます。
*   **Apache Airflow**: プログラムによってワークフローを作成、スケジュール、監視するためのプラットフォームです。
*   **apache-airflow-providers-cncf-kubernetes**: Apache Airflowのプロバイダーパッケージの一つで、Kubernetes関連の機能（例: KubernetesPodOperator）を提供します。
*   **Airflow Image**: Cloud Composer環境を構築するために使用される、Airflowと必要な依存関係が事前にバンドルされた仮想マシンイメージです。
*   **アクセストークン (Access Token)**: 認証が成功した後に発行されるセキュリティトークンで、APIへのアクセスを許可するために使用されます。
*   **スコープ (Scope)**: アクセストークンが許可するリソースや操作の範囲を定義するものです。
*   **リージョンクォータ (Regional Quota)**: Google Cloud のサービスが特定のリージョン（地域）ごとに設定する使用量の上限です。これに対し、グローバルクォータは全リージョンで共通の全体使用量の上限です。
*   **ボリュームベース (Volume-based)**: 使用量やデータ量に基づいて課金または制限が適用される方式です。

# Title: May 23, 2025 
Link: https://cloud.google.com/release-notes#May_23_2025<br>
# Google Kubernetes Engine

## Changed
原文: GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)
説明:
GKEクラスタのバージョンが更新され、新しいKubernetesバージョンが提供開始されました。これらのバージョンは、新規クラスタの作成、既存クラスタのコントロールプレーンおよびノードのアップグレードで選択可能になります。

影響有無: 影響あり
利用中のGKEクラスタがバージョン1.31の場合、新しいマイナーバージョンやパッチバージョンへのアップグレードパスが提供される可能性があります。これにより、より新しい機能やセキュリティ修正の恩恵を受けられます。

対処方法:
クラスタのバージョンアップグレード計画を確認し、必要に応じて新しいバージョンへのアップグレードを検討してください。自動アップグレードが有効な場合は、メンテナンスウィンドウの確認が必要です。

## Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.4-gke.1236006 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.30.12-gke.1151000
- 1.31.9-gke.1005000
- 1.32.4-gke.1236006
- 1.32.4-gke.1353000
- 1.33.0-gke.2248000

- The following versions are no longer available in the Rapid channel:

- 1.30.12-gke.1033000
- 1.31.7-gke.1390000
- 1.31.8-gke.1045000
- 1.32.3-gke.1927002
- 1.32.4-gke.1106000
- 1.32.4-gke.1236000
- 1.33.0-gke.1552000
- 1.33.0-gke.1712000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.12-gke.1086000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.8-gke.1113000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.4-gke.1236006 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.12-gke.1086000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.8-gke.1113000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.4-gke.1236006 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.33 to version 1.33.0-gke.1868000 with this release.

[1.32.4-gke.1236006](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
- 1.30.12-gke.1151000
- 1.31.9-gke.1005000
- 1.32.4-gke.1236006
- 1.32.4-gke.1353000
- 1.33.0-gke.2248000

[1.30.12-gke.1151000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.9-gke.1005000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1319)
[1.32.4-gke.1236006](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
[1.32.4-gke.1353000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
[1.33.0-gke.2248000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1330)
- 1.30.12-gke.1033000
- 1.31.7-gke.1390000
- 1.31.8-gke.1045000
- 1.32.3-gke.1927002
- 1.32.4-gke.1106000
- 1.32.4-gke.1236000
- 1.33.0-gke.1552000
- 1.33.0-gke.1712000

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.12-gke.1086000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.8-gke.1113000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.4-gke.1236006 with this release.

[1.30.12-gke.1086000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.8-gke.1113000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1318)
[1.32.4-gke.1236006](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.12-gke.1086000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.8-gke.1113000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.4-gke.1236006 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.33 to version 1.33.0-gke.1868000 with this release.

[1.30.12-gke.1086000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.8-gke.1113000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1318)
[1.32.4-gke.1236006](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
[1.33.0-gke.1868000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#v1330)
説明:
Rapidチャネルにおいて、新しいGKEバージョンが利用可能になり、一部の旧バージョンが利用不可になりました。
Rapidチャネルの新規クラスタ作成時のデフォルトバージョンは1.32.4-gke.1236006に変更されました。
また、自動アップグレードのターゲットバージョンが更新されました。特に、Rapidチャネルでバージョン1.31を利用しているクラスタは、バージョン1.32.4-gke.1236006へのマイナーバージョンアップグレードの対象となります。メンテナンス除外設定があるクラスタでも、パッチバージョン1.31.8-gke.1113000への自動アップグレードの対象となります。

影響有無: 影響あり
利用中のGKEクラスタがRapidチャネルのバージョン1.31を使用しており、自動アップグレードが有効になっている場合、クラスタは自動的に1.32系のバージョンへアップグレードされる可能性があります。Kubernetesのマイナーバージョンアップグレードは、APIの変更や非推奨機能の削除など、アプリケーションの互換性に影響を与えるBreaking Changeを含む場合があります。

対処方法:
1.  **影響確認:** 現在のGKEクラスタがRapidチャネルに属しているか確認してください。
2.  **互換性テスト:** バージョン1.32へのアップグレード前に、アプリケーションがKubernetes 1.32と互換性があることを十分にテストしてください。特に、非推奨のAPIを使用していないか確認が必要です。
3.  **メンテナンスウィンドウ/除外の確認:** 自動アップグレードのタイミングを制御するため、メンテナンスウィンドウや除外設定を確認し、必要に応じて調整してください。
4.  **手動アップグレードの検討:** アプリケーションの互換性テストが完了次第、手動で計画的にアップグレードを実施することも推奨されます。

## Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.3-gke.1927009 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.30.12-gke.1033000
- 1.31.8-gke.1045000
- 1.32.3-gke.1927009
- 1.32.4-gke.1106006

- The following versions are no longer available in the Regular channel:

- 1.30.11-gke.1157000
- 1.31.7-gke.1265000
- 1.32.3-gke.1785003
- 1.32.3-gke.1927002

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.11-gke.1217000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.31.7-gke.1390000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.32.3-gke.1927009 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.11-gke.1217000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.7-gke.1390000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.32 to version 1.32.3-gke.1927009 with this release.

[1.32.3-gke.1927009](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
- 1.30.12-gke.1033000
- 1.31.8-gke.1045000
- 1.32.3-gke.1927009
- 1.32.4-gke.1106006

[1.30.12-gke.1033000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13012)
[1.31.8-gke.1045000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1318)
[1.32.3-gke.1927009](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
[1.32.4-gke.1106006](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1324)
- 1.30.11-gke.1157000
- 1.31.7-gke.1265000
- 1.32.3-gke.1785003
- 1.32.3-gke.1927002

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.11-gke.1217000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.31.7-gke.1390000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.32.3-gke.1927009 with this release.

[1.30.11-gke.1217000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1390000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.3-gke.1927009](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.11-gke.1217000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.7-gke.1390000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.32 to version 1.32.3-gke.1927009 with this release.

[1.30.11-gke.1217000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1390000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.3-gke.1927009](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
説明:
Regularチャネルにおいても、新しいGKEバージョンが利用可能になり、一部の旧バージョンが利用不可になりました。
Regularチャネルの新規クラスタ作成時のデフォルトバージョンは1.32.3-gke.1927009に変更されました。
自動アップグレードのターゲットも更新され、Regularチャネルでバージョン1.31を利用しているクラスタは、バージョン1.32.3-gke.1927009へのマイナーバージョンアップグレードの対象となります。メンテナンス除外設定があるクラスタでも、パッチバージョン1.31.7-gke.1390000への自動アップグレードの対象となります。

影響有無: 影響あり
利用中のGKEクラスタがRegularチャネルのバージョン1.31を使用しており、自動アップグレードが有効になっている場合、クラスタは自動的に1.32系のバージョンへアップグレードされる可能性があります。Kubernetesのマイナーバージョンアップグレードは、APIの変更や非推奨機能の削除など、アプリケーションの互換性に影響を与えるBreaking Changeを含む場合があります。

対処方法:
1.  **影響確認:** 現在のGKEクラスタがRegularチャネルに属しているか確認してください。
2.  **互換性テスト:** バージョン1.32へのアップグレード前に、アプリケーションがKubernetes 1.32と互換性があることを十分にテストしてください。
3.  **メンテナンスウィンドウ/除外の確認:** 自動アップグレードのタイミングを制御するため、メンテナンスウィンドウや除外設定を確認し、必要に応じて調整してください。
4.  **手動アップグレードの検討:** アプリケーションの互換性テストが完了次第、手動で計画的にアップグレードを実施することも推奨されます。

## Changed
原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.2-gke.1297002 is now the default version for cluster creation in the Stable channel.
- The following versions are now available in the Stable channel:

- 1.30.11-gke.1157000
- 1.31.7-gke.1265000

- The following versions are no longer available in the Stable channel:

- 1.30.10-gke.1070000
- 1.31.6-gke.1064001
- 1.32.2-gke.1182003

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.11-gke.1131000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.31.7-gke.1212000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.11-gke.1131000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.31 to version 1.31.7-gke.1212000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.32 to version 1.32.2-gke.1297002 with this release.

[1.32.2-gke.1297002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.30.11-gke.1157000
- 1.31.7-gke.1265000

[1.30.11-gke.1157000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1
# Title: May 22, 2025 
Link: https://cloud.google.com/release-notes#May_22_2025<br>
承知いたしました。Google Cloudのリリースノートに基づき、各製品の変更点、影響、および推奨される対処方法についてご説明します。

---

# Apigee X

## Announcement
原文: On May 22, 2025, we released an updated version of Apigee.
説明: 2025年5月22日にApigeeの更新版がリリースされました。具体的な変更内容は、このアナウンスでは明記されていません。
影響有無: **影響なし**。このアナウンス自体は情報提供であり、既存のApigee環境に即座の機能的な変更や互換性の問題を引き起こすものではありません。今後の詳細なリリースノートを確認する必要があります。
対処方法: 特に対処は不要です。今後のApigeeに関する詳細なリリースノート（特に新機能、変更、非推奨、非互換性のある変更に関するもの）に注意を払い、利用中のApigeeバージョンと照らし合わせて互換性や推奨事項を確認してください。

---

# BigQuery

## Changed
原文: Starting September 15 2025, the `bigquery.datasets.getIamPolicy` IAM permission is required to view a dataset's access controls and to query the `INFORMATION_SCHEMA.OBJECT_PRIVILEGES` view. The `bigquery.datasets.setIamPolicy` permission is required to update a dataset's access controls or to create a dataset with access controls using the API. For more information on this change and how to opt into early enforcement, see Changes to dataset-level access controls.
説明: 2025年9月15日より、BigQueryのデータセットのアクセス制御に関するIAMパーミッション要件が変更されます。
*   データセットのアクセス制御の表示、および `INFORMATION_SCHEMA.OBJECT_PRIVILEGES` ビューのクエリには、`bigquery.datasets.getIamPolicy` IAMパーミッションが必須となります。
*   データセットのアクセス制御の更新、またはAPIを使用してアクセス制御付きデータセットを作成する際には、`bigquery.datasets.setIamPolicy` パーミッションが必須となります。
早期適用オプションも利用可能です。
影響有無: **影響あり**。
現在、これらのパーミッションが付与されていない状態でデータセットのアクセス制御の表示・更新、またはアクセス制御付きデータセットの作成を行っているアプリケーションやユーザーがいる場合、2025年9月15日以降（または早期適用した場合）に動作しなくなる可能性があります。特に、`INFORMATION_SCHEMA.OBJECT_PRIVILEGES` をクエリしてデータセットの権限情報を取得しているサービスアカウントやユーザーは影響を受けます。
対処方法:
1.  BigQueryデータセットのアクセス制御の表示、更新、またはアクセス制御付きデータセットの作成を行っているサービスアカウント、グループ、ユーザーのIAMポリシーを確認してください。
2.  これらの操作を行う必要があるエンティティに対し、それぞれ適切なIAMパーミッション (`bigquery.datasets.getIamPolicy` または `bigquery.datasets.setIamPolicy`) が付与されていることを確認し、必要に応じて追加または修正してください。
3.  `INFORMATION_SCHEMA.OBJECT_PRIVILEGES` を利用している場合は、クエリを実行するアカウントに `bigquery.datasets.getIamPolicy` が付与されているか確認してください。
4.  可能であれば、変更による影響を早期にテストするために、早期適用オプションを検討してください。
用語説明:
*   **IAM (Identity and Access Management)**: Google Cloudのリソースに対するアクセス権を管理するサービスです。誰がどのリソースに対してどのような操作ができるかを定義します。
*   **`bigquery.datasets.getIamPolicy`**: BigQueryデータセットのIAMポリシー（アクセス制御設定）を取得するために必要なパーミッションです。
*   **`bigquery.datasets.setIamPolicy`**: BigQueryデータセットのIAMポリシー（アクセス制御設定）を設定・更新するために必要なパーミッションです。
*   **`INFORMATION_SCHEMA.OBJECT_PRIVILEGES`**: BigQueryのINFORMATION_SCHEMAビューの一つで、データセットやテーブルなどのオブジェクトに対するアクセス権限情報を表示します。

---

# Google Kubernetes Engine

## Fixed
原文: The May 13, 2025 issue in which GKE Autopilot clusters failed to update the `cgroup_mode` field is fixed in all GKE versions.
説明: 2025年5月13日に報告された、GKE Autopilotクラスタにおいて`cgroup_mode`フィールドの更新が失敗する問題が、全てのGKEバージョンで修正されました。
影響有無: **直接的な影響なし**。このリリースは既存の問題に対する修正であり、新たな設定や挙動の変更を導入するものではありません。現在GKE 1.31を使用されており、もしAutopilotクラスタを使用しておりこの問題に遭遇していた場合、クラスタの安定性が向上する恩恵を受けられます。Standardクラスタをご利用の場合は、この修正は直接関連しません。
対処方法: 特に対処は不要です。GKE Autopilotクラスタを使用しており、過去に`cgroup_mode`の更新に起因する問題に遭遇していた場合は、問題が解消されているか確認してください。
用語説明:
*   **GKE Autopilot**: Google Kubernetes Engineの運用モードの一つで、ノードのプロビジョニング、スケーリング、パッチ適用などをGoogleが自動的に管理するため、ユーザーのインフラ管理負担を大幅に削減できます。
*   **`cgroup_mode`**: Linuxカーネルのcgroup（control group）機能に関連する設定です。cgroupは、プロセスやプロセスグループが利用できるリソース（CPU、メモリなど）を制限・監視するために使用されます。Kubernetesでは、コンテナのリソース管理にcgroupが利用されます。
# Title: May 21, 2025 
Link: https://cloud.google.com/release-notes#May_21_2025<br>
# BigQuery
## Changed
原文: You can now perform supervised tuning on a BigQuery ML remote model based on a Vertex AI `gemini-2.0-flash-001` or `gemini-2.0-flash-lite-001` model.
[supervised tuning](https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-remote-model#supervised_tuning)
[remote model](https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-create-remote-model)
説明: BigQuery MLにおいて、Vertex AIの生成AIモデルである`gemini-2.0-flash-001`または`gemini-2.0-flash-lite-001`をベースにしたリモートモデルに対して、教師ありチューニング（ファインチューニング）を実行できるようになりました。これにより、特定のタスクやデータセットに合わせてこれらのモデルをBigQuery ML内でさらに最適化することが可能になります。
影響有無: 新機能の追加であり、既存のBigQuery MLのワークロードには直接的な影響はありません。この機能を利用することで、より高精度な生成AIモデルをBigQuery MLから利用できるようになります。
対処方法: 特になし。この新機能を利用したい場合は、BigQuery MLのリモートモデル作成時に`SUPERVISED_TUNING`オプションを設定してください。
用語説明:
*   **BigQuery ML**: Google BigQueryの機能の一つで、SQLクエリを使用してBigQuery内で機械学習モデルを作成、トレーニング、評価、デプロイできる機能です。
*   **リモートモデル (Remote Model)**: BigQuery MLのモデルタイプの一つで、BigQueryの外部にあるAI/MLサービス（この場合はVertex AI）でホストされているモデルをBigQueryから呼び出して推論を行うための参照モデルです。これにより、BigQueryから外部サービスをシームレスに利用できます。
*   **教師ありチューニング (Supervised Tuning)**: 事前学習済みのモデルを、特定のタスクやユーザーのデータセットに合わせてさらに微調整（ファインチューニング）するプロセスです。教師ありデータ（入力と期待される出力のペア）を用いてモデルを学習させ、性能を向上させます。
*   **Vertex AI Gemini**: Google Cloudの生成AIモデルファミリー。`gemini-2.0-flash-001`と`gemini-2.0-flash-lite-001`は、高速性と効率性を重視したGeminiモデルのバリアントです。

# Cloud Service Mesh
## Announcement
原文: **1.25.2-asm.3 is now available for in-cluster Cloud Service Mesh.**
You can now download 1.25.2-asm.3 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.25.2 subject to the list of supported features. Cloud Service Mesh version 1.25.2-asm.3 uses envoy v1.33.1-dev..
[Istio 1.25.2](https://istio.io/latest/news/releases/1.25.x/announcing-1.25.2/)
[supported features](https://cloud.google.com/service-mesh/docs/supported-features-in-cluster)
For details on upgrading Cloud Service Mesh, see Upgrade Cloud Service Mesh.
[Upgrade Cloud Service Mesh](https://cloud.google.com/service-mesh/docs/upgrade/upgrade)
説明: 自己管理型（in-cluster）のCloud Service Meshのバージョン1.25.2-asm.3がリリースされました。このバージョンはIstio 1.25.2の機能を含み、Envoyプロキシのバージョンv1.33.1-devを使用しています。
影響有無: Cloud Service Meshを運用している場合、この新しいバージョンへのアップグレードを検討する機会となります。既存の構成への直接的な影響はありませんが、最新の機能、バグ修正、セキュリティパッチの恩恵を受けることができます。提供されたGKEバージョン1.31は新しいバージョンであり、このCloud Service Meshのバージョンと互換性がある可能性が高いです。
対処方法: 現在Cloud Service Meshを運用している場合、計画的なアップグレードを推奨します。特にセキュリティ修正が含まれる可能性があるため、Istio 1.25.2のリリースノートを確認し、アップグレードガイドに従って実施してください。

## Announcement
原文: **1.24.5-asm.3 is now available for in-cluster Cloud Service Mesh.**
You can now download 1.24.5-asm.3 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.24.5 subject to the list of supported features. Cloud Service Mesh version 1.24.5-asm.3 uses envoy v1.32.6-dev.
[Istio 1.24.5](https://istio.io/latest/news/releases/1.24.x/announcing-1.24.5/)
[supported features](https://cloud.google.com/service-mesh/v1.24/docs/supported-features-in-cluster)
For details on upgrading Cloud Service Mesh, see Upgrade Cloud Service Mesh.
[Upgrade Cloud Service Mesh](https://cloud.google.com/service-mesh/v1.24/docs/upgrade/upgrade)
説明: 自己管理型（in-cluster）のCloud Service Meshのバージョン1.24.5-asm.3がリリースされました。このバージョンはIstio 1.24.5の機能を含み、Envoyプロキシのバージョンv1.32.6-devを使用しています。
影響有無: 上記の1.25.2-asm.3と同様に、Cloud Service Meshを運用している場合、このバージョンへのアップグレードを検討する機会となります。既存の構成への直接的な影響はありませんが、最新の機能、バグ修正、セキュリティパッチの恩恵を受けることができます。
対処方法: 現在Cloud Service Meshを運用しており、1.24.x系を利用している場合は、計画的なアップグレードを推奨します。Istio 1.24.5のリリースノートを確認し、アップグレードガイドに従って実施してください。

## Announcement
原文: **1.23.6-asm.3 is now available for in-cluster Cloud Service Mesh.**
You can now download 1.23.6-asm.3 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.23.6 subject to the list of supported features. Cloud Service Mesh version 1.23.6-asm.3 uses envoy v1.31.6.
[Istio 1.23.6](https://istio.io/latest/news/releases/1.23.x/announcing-1.23.6/)
[supported features](https://cloud.google.com/service-mesh/v1.23/docs/supported-features-in-cluster)
For details on upgrading Cloud Service Mesh, see Upgrade Cloud Service Mesh.
[Upgrade Cloud Service Mesh](https://cloud.google.com/service-mesh/v1.23/docs/upgrade/upgrade)
説明: 自己管理型（in-cluster）のCloud Service Meshのバージョン1.23.6-asm.3がリリースされました。このバージョンはIstio 1.23.6の機能を含み、Envoyプロキシのバージョンv1.31.6を使用しています。
影響有無: 上記の各バージョンと同様に、Cloud Service Meshを運用している場合、このバージョンへのアップグレードを検討する機会となります。既存の構成への直接的な影響はありませんが、最新の機能、バグ修正、セキュリティパッチの恩恵を受けることができます。
対処方法: 現在Cloud Service Meshを運用しており、1.23.x系を利用している場合は、計画的なアップグレードを推奨します。Istio 1.23.6のリリースノートを確認し、アップグレードガイドに従って実施してください。

## Announcement
原文: In-cluster Cloud Service Mesh 1.22 is no longer supported. For more information and to view the earliest end-of-life dates for other versions, see Supported versions.
[Supported versions](https://cloud.google.com/service-mesh/docs/supported-features-in-cluster#supported_versions)
説明: 自己管理型（in-cluster）のCloud Service Meshのバージョン1.22が、サポート対象外となりました。
影響有無: **重大な影響があります。** 現在Cloud Service Meshバージョン1.22を使用している場合、Google Cloudからの技術サポート、バグ修正、セキュリティパッチの提供が停止されます。これにより、運用中の環境がセキュリティリスクに晒されたり、問題が発生した場合の解決が困難になったりする可能性があります。
対処方法: **直ちに、サポート対象の新しいバージョン（1.23.x、1.24.x、または1.25.xなど）へのアップグレードを計画し、実行する必要があります。** リンク先の「Supported versions」ドキュメントを参照し、サポート終了日と推奨されるアップグレードパスを確認してください。
用語説明:
*   **サポート終了 (End of Support / EOL)**: ソフトウェアやサービスの特定のバージョンに対して、ベンダーがバグ修正、セキュリティパッチ、技術サポートの提供を停止すること。EOLに達したバージョンを使い続けることは、セキュリティリスクや運用上の問題を引き起こす可能性が高いため、サポートされているバージョンへの移行が強く推奨されます。
*   **Cloud Service Mesh (in-cluster)**: Google Kubernetes Engine (GKE) クラスタ内にIstioコントロールプレーンをデプロイし、GKEのワークロードのトラフィック管理、セキュリティ、可観測性を提供するサービスメッシュソリューションです。
# Title: May 19, 2025 
Link: https://cloud.google.com/release-notes#May_19_2025<br>
はい、Google Cloudのインフラエンジニアとして、BigQueryクライアントライブラリのリリースノートについて影響調査を行います。

---

# BigQuery Go Client Library (v1.68.0)

## Changed / Added Features / Performance Improvement

原文:
- **bigquery/analyticshub:** Support new feature Sharing Cloud Pubsub Streams via AH (GA) and Subscriber Email logging feature (#11908) (a21d596)
- **bigquery/storage:** Increased the number of partitions can be written in a single request (43bc515)
- **bigquery:** Add performance insights (#12101) (aef68ab)
- **bigquery:** Add some missing fields to BigQuery stats (#12212) (77b08e8)
- **bigquery:** Add WriteTruncateData write disposition (#12013) (b1124a3)
- **bigquery:** New client(s) (#12228) (f229bd9)
- **bigquery:** Support managed iceberg tables (#11931) (35e0774)
- **bigquery:** Support per-job reservation assignment (#12078) (c9cebcc)
- **bigquery:** Cache total rows count (#12230) (202dce0), refs #11874 #11873
- **bigquery:** Parse timestamps with timezone info (#11950) (530d522)
- **bigquery:** Update google.golang.org/api to 0.229.0 (3319672)
- **bigquery:** Upgrade gRPC service registration func (7c01015)
- **bigquery/storage:** Updated the number of partitions (from 100 to 900) can be inserted, updated and deleted in a single request (43bc515)

説明：
BigQuery Goクライアントライブラリのバージョン1.68.0における更新です。主な変更点として、BigQuery Analytics HubにおけるPub/Subストリーム共有とサブスクライバーメールロギングのGAサポート、BigQuery Storage APIでの単一リクエストにおけるパーティション書き込み・挿入・更新・削除数の大幅な増加（100から900へ）、パフォーマンスインサイトの追加、`WriteTruncateData`書き込みディスポジションの追加、マネージドIcebergテーブルのサポート、ジョブごとの予約割り当てサポート、合計行数カウントのキャッシュ、タイムゾーン情報を含むタイムスタンプの解析改善が含まれます。また、依存ライブラリの更新（`google.golang.org/api`）とgRPCサービス登録関数のアップグレードが行われています。

影響有無：
*   **なし**
    *   ほとんどの変更は、既存機能の拡張、新機能の追加、または内部的なパフォーマンス改善です。
    *   `WriteTruncateData`は新しい書き込みディスポジションであり、明示的に利用しない限り既存の動作には影響しません。
    *   BigQuery Storage APIのパーティション数増加はパフォーマンス向上に寄与し、既存のワークロードにプラスの影響を与える可能性があります。
*   **軽微な影響の可能性**
    *   `Parse timestamps with timezone info`の変更は、タイムゾーン情報を含むタイムスタンプの処理ロジックが改善されたことを示します。これにより、厳密なタイムゾーン処理を必要とする既存のアプリケーションで、より正確な動作が期待できますが、既存の動作で意図しない解釈が行われていた場合は、修正された動作が期待値と異なる可能性があります。しかし、通常はより堅牢な処理となるため、問題となるケースは稀でしょう。

対処方法：
*   **不要**
    *   既存のシステムへの直接的なBreaking Changeはありません。
*   **推奨**
    *   GKE上で稼働するアプリケーションでBigQuery Goクライアントライブラリを利用している場合、これらの新機能やパフォーマンス改善の恩恵を受けるためには、アプリケーションの依存ライブラリをバージョンアップすることを推奨します。バージョンアップの際には、影響がないことを確認するためにテストを実施してください。
    *   `Parse timestamps with timezone info`の変更に関しては、念のためタイムゾーンを含むタイムスタンプデータを処理するロジックについて回帰テストを実施することを検討してください。

用語説明：
*   **BigQuery Analytics Hub:** データ共有と交換を目的としたサービスで、組織内外のデータプロバイダーとデータコンシューマーが安全かつ効率的にデータをやり取りできるプラットフォームです。
*   **BigQuery Storage API:** BigQueryテーブルからデータを読み書きするための高性能なAPIで、大量のデータを高速に転送するのに最適化されています。
*   **WriteTruncateData:** BigQueryのデータロードジョブやDML文における`WRITE_TRUNCATE`ディスポジションと同様に、ターゲットテーブルの既存データを上書き（truncate）して新しいデータを書き込むモードを示す可能性のある新しい書き込みディスポジションです。
*   **Managed Iceberg Tables:** Icebergはオープンソースのテーブルフォーマットであり、BigQueryがそのテーブルの管理をサポートすることで、より柔軟なデータ管理と分析が可能になります。

---

# BigQuery Python Client Library (v3.32.0)

## Changed / Added Features / Performance Improvement / Announcment

原文:
- Add dataset access policy version attribute (#2169) (b7656b9)
- Adds preview support for incremental results (#2145) (22b80bb)
- Add WRITE_TRUNCATE_DATA enum (#2166) (4692747)
- Adds condition class and assoc. unit tests (#2159) (a69d6b7)
- Support BigLakeConfiguration (managed Iceberg tables) (#2162) (a1c8e9a)
- Update the AccessEntry class with a new condition attribute and unit tests (#2163) (7301667)
- `query()` now warns when `job_id` is set and the default `job_retry` is ignored (#2167) (ca1798a)
- Empty record dtypes (#2147) (77d7173)
- Table iterator should not use bqstorage when page_size is not None (#2154) (e89a707)

説明：
BigQuery Pythonクライアントライブラリのバージョン3.32.0における更新です。主な変更点として、データセットのアクセスポリシーにバージョン属性が追加され、増分結果のプレビューサポート、`WRITE_TRUNCATE_DATA`列挙型の追加、マネージドIcebergテーブル（BigLakeConfiguration経由）のサポート、`AccessEntry`クラスの更新による新しい条件属性の追加が含まれます。また、`query()`メソッドにおいて、`job_id`が設定され、かつデフォルトの`job_retry`が無視される場合に警告を発するようになりました。その他、内部的な最適化（テーブルイテレータの改善）とバグ修正（空のレコードデータ型）が含まれます。

影響有無：
*   **なし**
    *   ほとんどの変更は、新機能の追加、既存機能の拡張、または内部的な改善です。
    *   増分結果、`WRITE_TRUNCATE_DATA`、Icebergテーブルのサポートなどは、明示的に利用しない限り既存の動作には影響しません。
*   **軽微な影響の可能性**
    *   `query()`メソッドにおける警告の追加: Google Cloud Composer2でBigQueryと連携するDAGが、`query()`メソッドで`job_id`を明示的に設定し、かつデフォルトのリトライ動作を意図せず無視している場合に、ログに警告が出力される可能性があります。これは動作そのものの変更ではなく、ユーザーへの注意喚起です。

対処方法：
*   **Google Cloud Composer2の場合:**
    *   Composer環境の基盤イメージにインストールされる`google-cloud-bigquery`ライブラリのバージョンが自動的に更新される可能性があります。
    *   DAGのログに`query()`メソッドに関する新しい警告が出力されるようになった場合、警告の内容を確認し、`job_id`と`job_retry`の利用方法を見直すことを検討してください。通常、警告は無視しても機能に影響はありませんが、潜在的な設定不備を示唆している可能性があります。
*   **Google Kubernetes Engineの場合:**
    *   GKE上で稼働するアプリケーションでBigQuery Pythonクライアントライブラリを利用している場合、これらの新機能やパフォーマンス改善の恩恵を受けるためには、アプリケーションの依存ライブラリをバージョンアップすることを推奨します。
    *   バージョンアップの際には、特に`query()`メソッドの警告が出力されないか、既存の処理が正常に動作するかを十分にテストしてください。

用語説明：
*   **Incremental Results (増分結果):** クエリが実行中に部分的な結果を返す機能で、大規模なクエリにおいてユーザーがより早く結果の一部を確認できるようになることで、対話性を向上させます。現状はプレビュー機能です。
*   **BigLakeConfiguration:** BigQueryが外部データソース（Cloud Storageなど）に保存されたデータをテーブルとして扱う際に利用する構成で、マネージドIcebergテーブルのサポートはこのBigLake機能の一部として提供されます。
*   **WriteTruncateData:** Goクライアントライブラリと同様に、BigQueryのロードジョブやDMLにおける`WRITE_TRUNCATE`ディスポジションと同様に、ターゲットテーブルを上書きする書き込みモードを示す新しい列挙型です。
*   **job_id:** BigQueryジョブを一意に識別するためのIDです。通常、ジョブが送信される際に自動的に生成されますが、ユーザーが明示的に指定することも可能です。
*   **job_retry:** クエリジョブが一時的なエラーで失敗した場合に、自動的に再試行するメカニズムです。

# Title: May 16, 2025 
Link: https://cloud.google.com/release-notes#May_16_2025<br>
## Cloud Load Balancing 
### Security
**原文:** 
A security vulnerability was detected in the classic Application Load Balancer service prior to April 26, 2025.

 CVE-2025-4600 allowed attackers to smuggle requests to classic Application Load Balancers due to incorrect parsing of oversized chunk bodies. This vulnerability was addressed within the classic Application Load Balancer service on April 26, 2025 through improved input validation and parsing logic.

[CVE-2025-4600](https://www.cve.org/CVERecord?id=CVE-2025-4600)
 No action is needed. For more information, see the GCP-2025-027 security bulletin.

[GCP-2025-027 security bulletin](https://cloud.google.com/load-balancing/docs/security-bulletins#gcp-2025-027)

**説明:** 2025年4月26日以前に、Classic Application Load Balancer サービスにおいて、 oversized chunk body の解析処理不備に起因するリクエストの密輸を攻撃者に許してしまう脆弱性 (CVE-2025-4600) が確認されました。この脆弱性は、入力値検証と解析ロジックの改善により、2025年4月26日にClassic Application Load Balancer サービス内で修正されました。

**製品への影響有無:** 無

**対処方法:** 対応不要です。

## Google Kubernetes Engine
### Changed
**原文:**
GKE cluster versions have been updated.

 **New versions available for upgrades and new clusters.**

 The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

**説明:** GKE クラスタバージョンが更新されました。新しいバージョンが、アップグレードと新規クラスタ作成で利用可能になりました。記載されている Kubernetes バージョンが、新規クラスタ、既存クラスタのオプトインによるコントロールプレーンとノードのアップグレードで利用可能になりました。

**製品への影響有無:**  有

**対処方法:** 利用可能なバージョンは記載されたドキュメントを参照してください。

### Changed
**原文:**
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.4-gke.1106000 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.30.12-gke.1086000
- 1.31.8-gke.1113000
- 1.32.4-gke.1236000
- 1.33.0-gke.1868000

- The following versions are no longer available in the Rapid channel:

- 1.30.11-gke.1157000
- 1.30.11-gke.1217000
- 1.31.7-gke.1265000
- 1.32.3-gke.1785003
- 1.33.0-gke.1582000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.12-gke.1033000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.7-gke.1390000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.3-gke.1927002 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.12-gke.1033000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.7-gke.1390000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.3-gke.1927002 with this release.


**説明:** Rapid チャネルにおける GKE クラスタのバージョン変更情報です。

- クラスタ作成時のデフォルトバージョンが 1.32.4-gke.1106000 に変更されました。
- 1.30.12-gke.1086000 から 1.33.0-gke.1868000 までのバージョンが利用可能になりました。
- 1.30.11-gke.1157000 から 1.33.0-gke.1582000 までのバージョンは利用できなくなりました。

自動アップグレードが有効になっているクラスタの場合、以下のアップグレードが行われます。

- 1.29 から 1.30.12-gke.1033000
- 1.30 から 1.31.7-gke.1390000
- 1.31 から 1.32.3-gke.1927002

また、メンテナンスの除外などによりマイナーバージョンアップグレードができないクラスタ向けに、パッチのみのバージョンアップグレードが提供されます。

- 1.30 から 1.30.12-gke.1033000
- 1.31 から 1.31.7-gke.1390000
- 1.32 から 1.32.3-gke.1927002

**製品への影響有無:** 有

**対処方法:**  Rapid チャネルを使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

### Changed
**原文:**
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.3-gke.1785003 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.30.11-gke.1217000
- 1.31.7-gke.1390000
- 1.32.3-gke.1927002

- The following versions are no longer available in the Regular channel:

- 1.30.11-gke.1131000
- 1.31.7-gke.1212000
- 1.32.2-gke.1297002

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.11-gke.1157000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.31.7-gke.1265000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.32.3-gke.1785003 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.11-gke.1157000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.7-gke.1265000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.32 to version 1.32.3-gke.1785003 with this release.

**説明:** Regular チャネルにおける GKE クラスタのバージョン変更情報です。

- クラスタ作成時のデフォルトバージョンが 1.32.3-gke.1785003 に変更されました。
- 1.30.11-gke.1217000 から 1.32.3-gke.1927002 までのバージョンが利用可能になりました。
- 1.30.11-gke.1131000 から 1.32.2-gke.1297002 までのバージョンは利用できなくなりました。

自動アップグレードが有効になっているクラスタの場合、以下のアップグレードが行われます。

- 1.29 から 1.30.11-gke.1157000
- 1.30 から 1.31.7-gke.1265000
- 1.31 から 1.32.3-gke.1785003

また、メンテナンスの除外などによりマイナーバージョンアップグレードができないクラスタ向けに、パッチのみのバージョンアップグレードが提供されます。

- 1.30 から 1.30.11-gke.1157000
- 1.31 から 1.31.7-gke.1265000
- 1.32 から 1.32.3-gke.1785003

**製品への影響有無:** 有

**対処方法:**  Regular チャネルを使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

### Changed
**原文:**
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Stable channel:

- 1.30.11-gke.1131000
- 1.31.7-gke.1212000
- 1.32.2-gke.1297002

- 1.30.11-gke.1131000
- 1.31.7-gke.1212000
- 1.32.2-gke.1297002

**説明:** Stable チャネルで利用可能な GKE クラスタバージョンが更新されました。1.30.11-gke.1131000, 1.31.7-gke.1212000, 1.32.2-gke.1297002 が利用可能になりました。

**製品への影響有無:** 有

**対処方法:** Stable チャネルを使用している場合は、必要に応じてこれらのバージョンへのアップグレードを検討してください。

### Changed
**原文:**
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.3-gke.1785003 is now the default version for cluster creation in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.16-gke.2703000
- 1.27.16-gke.2771000
- 1.28.15-gke.2169000
- 1.28.15-gke.2239000
- 1.29.15-gke.1240000
- 1.29.15-gke.1325000
- 1.30.11-gke.1217000
- 1.31.7-gke.1390000
- 1.32.3-gke.1927002

- The following versions are no longer available in the Extended channel:

- 1.27.16-gke.2664000
- 1.27.16-gke.2732000
- 1.28.15-gke.2121000
- 1.28.15-gke.2192000
- 1.29.14-gke.1067000
- 1.29.15-gke.1274000
- 1.30.11-gke.1131000
- 1.31.7-gke.1212000
- 1.32.2-gke.1297002

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.28.15-gke.2142000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2682000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.2142000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.15-gke.1193000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.11-gke.1157000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.7-gke.1265000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.32 to version 1.32.3-gke.1785003 with this release.

**説明:** Extended チャネルにおける GKE クラスタのバージョン変更情報です。

- クラスタ作成時のデフォルトバージョンが 1.32.3-gke.1785003 に変更されました。
- 1.27.16-gke.2703000 から 1.32.3-gke.1927002 までのバージョンが利用可能になりました。
- 1.27.16-gke.2664000 から 1.32.2-gke.1297002 までのバージョンは利用できなくなりました。

自動アップグレードが有効になっているクラスタの場合、以下のアップグレードが行われます。

- 1.27 から 1.28.15-gke.2142000

また、メンテナンスの除外などによりマイナーバージョンアップグレードができないクラスタ向けに、パッチのみのバージョンアップグレードが提供されます。

- 1.27 から 1.27.16-gke.2682000
- 1.28 から 1.28.15-gke.2142000
- 1.29 から 1.29.15-gke.1193000
- 1.30 から 1.30.11-gke.1157000
- 1.31 から 1.31.7-gke.1265000
- 1.32 から 1.32.3-gke.1785003

**製品への影響有無:**  有

**対処方法:**  Extended チャネルを使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。

### Changed
**原文:**
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.3-gke.1785003 is now the default version for cluster creation.
- The following versions are now available:

- 1.30.12-gke.1086000
- 1.31.8-gke.1113000
- 1.32.4-gke.1236000

- The following node versions are now available:

- 1.27.16-gke.2771000
- 1.28.15-gke.2239000
- 1.29.15-gke.1325000
- 1.30.12-gke.1086000
- 1.31.8-gke.1113000
- 1.32.4-gke.1236000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.11-gke.1157000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.11-gke.1157000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.32 to version 1.32.3-gke.1785003 with this release.

**説明:**  GKE クラスタのバージョン変更情報です。

- クラスタ作成時のデフォルトバージョンが 1.32.3-gke.1785003 に変更されました。
- 1.30.12-gke.1086000 から 1.32.4-gke.1236000 までのバージョンが利用可能になりました。
- ノードバージョンとして、 1.27.16-gke.2771000 から 1.32.4-gke.1236000 が利用可能になりました。

自動アップグレードが有効になっているクラスタの場合、以下のアップグレードが行われます。

- 1.29 から 1.30.11-gke.1157000

また、メンテナンスの除外などによりマイナーバージョンアップグレードができないクラスタ向けに、パッチのみのバージョンアップグレードが提供されます。

- 1.30 から 1.30.11-gke.1157000
- 1.32 から 1.32.3-gke.1785003

**製品への影響有無:**  有

**対処方法:**  利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレード計画を調整してください。
# Title: May 15, 2025 
Link: https://cloud.google.com/release-notes#May_15_2025<br>
## Cloud Run 

### Changed

**原文:** The region selector when creating a service or a job from the Google Cloud console now defaults to `europe-west1`.

**説明:** Google Cloud コンソールから Cloud Run のサービスやジョブを作成する際、リージョンセレクターのデフォルト値が `europe-west1` に変更されました。 

**影響有無:**  有

**対処方法:** Cloud Run のサービスやジョブをこれまで通り東京リージョンで作成したい場合、リージョンセレクターで明示的に `asia-northeast1` を選択してください。


## Identity and Access Management

### Changed

**原文:**  The predefined role reference and the permissions reference have been reorganized to improve performance and searchability. To see the new experience, visit the IAM roles and permissions index.

[IAM roles and permissions index](https://cloud.google.com/iam/docs/roles-permissions)

**説明:** IAM の定義済みロールと権限のリファレンスが、パフォーマンスと検索性を向上させるために再編成されました。

**影響有無:** 無

**対処方法:**  IAM の定義済みロールと権限を参照する際は、提供されている新しい IAM ロールと権限のインデックスページをご利用ください。 

# Title: May 14, 2025 
Link: https://cloud.google.com/release-notes#May_14_2025<br>
## AlloyDB for PostgreSQL

### Changed

**原文:** The default major version of PostgreSQL compatibility for new AlloyDB clusters is now PostgreSQL 16.

**説明:** 新規AlloyDBクラスタでデフォルトでサポートされるPostgreSQLのメジャーバージョンがPostgreSQL 16になりました。

**影響有無:** 有

**対処方法:** 
* 新規にAlloyDBクラスタを作成する場合、PostgreSQL 16がデフォルトでサポートされます。
* PostgreSQLの旧バージョンを利用したい場合は、クラスタ作成時に明示的にバージョンを指定してください。
* 既存のAlloyDBクラスタは、この変更の影響を受けません。


## Apigee X

### Announcement

**原文:** On May 14, 2025, we released an updated version of Apigee (1-15-0-apigee-4).

> **Note:** Rollouts of this release began today and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** 2025年5月14日に、Apigeeのアップデートバージョン(1-15-0-apigee-4)がリリースされました。
このリリースの展開は本日開始されましたが、Google Cloudのすべてのゾーンで完了するまでに4営業日以上かかる場合があります。インスタンスによっては、展開が完了するまで新機能や修正が利用できない場合があります。

**影響有無:** 無

**対処方法:** 特になし。


### Fixed

**原文:** 
| Bug ID | Description |
| --- | --- |
| **391140293** | **Resolved scaling issue resulting in `503` errors** Added `drainDuration` and updated the values for `terminationDrainDuration` and `terminationGracePeriodSeconds`. |
| **391862684** | **Resolved issue with requests stuck at Message Processor causing timeouts.** |
| **N/A** | **Updates to security infrastructure and libraries.** |
 Added `drainDuration` and updated the values for `terminationDrainDuration` and `terminationGracePeriodSeconds`.

**説明:** 以下のバグが修正されました。

* バグID 391140293: `503`エラーが発生するスケーリングの問題が解決されました。 `drainDuration` が追加され、`terminationDrainDuration` と `terminationGracePeriodSeconds` の値が更新されました。
* バグID 391862684: Message Processor でリクエストがスタックしてタイムアウトが発生する問題が解決されました。
* セキュリティのインフラストラクチャとライブラリが更新されました。

**影響有無:** 無

**対処方法:** 特になし。


## Cloud Composer

### Announcement

**原文:** A new Cloud Composer release has started on **May 14, 2025**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.

**説明:** 2025年5月14日に、Cloud Composerの新しいリリースが開始されました。
このリリースは現在進行中で、すべてのリージョンに展開されています。記載されている変更点や機能は、一部のリージョンではまだ利用できない場合があります。

**影響有無:** 無

**対処方法:** 特になし。


### Changed

**原文:** The default value of the `[scheduler]max_tis_per_query` Airflow configuration option is set to `128`. This change fixes the issue with DAGs remaining in the scheduled state in some cases.

**説明:** Airflow設定オプション `[scheduler]max_tis_per_query` のデフォルト値が `128` に設定されました。この変更により、DAGがスケジュールされた状態のままになる問題が修正されました。

**影響有無:** 有

**対処方法:** 
* 以前のデフォルト値を使用していた場合は、この変更の影響を受ける可能性があります。
* Airflow設定ファイルを確認し、必要に応じて `[scheduler]max_tis_per_query` の値を調整してください。


### Changed

**原文:** Cloud Composer 3 and Cloud Composer 2 no longer support files with gzip encoding (`content-type=gzip`).

 Before this change, .py files that had gzip encoding were processed inconsistently by the DAG processor. After this change, the DAG processor skips all files with gzip encoding. This change doesn't apply to regular .zip archives, Airflow still decompresses and processes DAG files contained in them.

 This change is gradually rolled out to all regions supported by Cloud Composer, except us-central1, us-east4 and europe-west1. It will be rolled out to the remaining regions in one of the future releases.

**説明:** Cloud Composer 3とCloud Composer 2は、gzipエンコーディングされたファイル(`content-type=gzip`)をサポートしなくなりました。

この変更前は、gzipエンコーディングされた.pyファイルは、DAGプロセッサによって処理が inconsistent でした。
この変更後は、DAGプロセッサはgzipエンコーディングされたファイルをすべてスキップします。
この変更は、通常の.zipアーカイブには適用されず、Airflowは引き続き圧縮を解除して、含まれているDAGファイルを処理します。

この変更は、us-central1、us-east4、europe-west1を除く、Cloud Composerがサポートするすべてのリージョンに徐々に展開されています。
残りのリージョンには、今後のリリースのいずれかで展開される予定です。

**影響有無:** 有

**対処方法:** 
* gzipエンコーディングされたファイルを使用している場合は、エンコーディングされていないファイルに変換する必要があります。
* そうでない場合、DAGは正しく処理されません。


### Fixed

**原文:** *(Cloud Composer 3)* Fixed an issue where the Airflow scheduler failed to initialize and work properly if a custom email backend was enabled. The Airflow scheduler now supports the following email backends:

[custom email backend](https://cloud.google.com/composer/docs/composer-3/configure-email#third-party)
- airflow.providers.sendgrid.utils.emailer.send_email
- airflow.utils.email.send_email_smtp

 This issue affected only the Airflow scheduler. Airflow workers already support these and other backends. If you use an email backend that isn't supported by the scheduler, you can still send email from Airflow workers.

**説明:** (Cloud Composer 3) カスタムメールバックエンドが有効になっている場合に、Airflowスケジューラが初期化に失敗して正常に動作しない問題が修正されました。
Airflowスケジューラは、以下のメールバックエンドをサポートするようになりました。

* airflow.providers.sendgrid.utils.emailer.send_email
* airflow.utils.email.send_email_smtp

この問題はAirflowスケジューラのみに影響していました。Airflowワーカーは、これらのバックエンドとその他のバックエンドをすでにサポートしています。
スケジューラでサポートされていないメールバックエンドを使用している場合でも、Airflowワーカーからメールを送信できます。

**影響有無:** 有

**対処方法:** 
* 以前、カスタムメールバックエンドが原因でAirflowスケジューラに問題が発生していた場合は、この修正により問題が解決するはずです。


### Changed

**原文:** *(Cloud Composer 3)* Improved the computation of metrics related to snapshots. This change reduces the number of calls made by Cloud Composer to the Cloud Storage API.

**説明:** (Cloud Composer 3) スナップショット関連のメトリクスの計算が改善されました。
この変更により、Cloud ComposerからCloud Storage APIへの呼び出し回数が削減されます。

**影響有無:** 無

**対処方法:** 特になし。


### Changed

**原文:** *(Cloud Composer 2)* In Cloud Composer versions 2.11.5 and later, log processing is switching to using OpenTelemetry instead of Fluentd.

 This change is gradually rolled out to the asia-south1 and africa-south1 regions. It will be rolled out to more regions in future releases. New and upgraded Cloud Composer 2 environments in the listed regions will get this change.

**説明:** (Cloud Composer 2) Cloud Composerバージョン2.11.5以降では、ログ処理がFluentdの代わりにOpenTelemetryを使用するように切り替わります。

この変更は、asia-south1およびafrica-south1リージョンに徐々に展開されています。
今後のリリースでは、さらに多くのリージョンに展開される予定です。
リストされたリージョン内の新規およびアップグレードされたCloud Composer 2環境には、この変更が適用されます。

**影響有無:** 有

**対処方法:** 
* Fluentdを使用してログを処理している場合は、OpenTelemetryを使用するようにログ処理システムを更新する必要があります。


### Changed

**原文:** *(Airflow 2.9.3)* The `apache-airflow-providers-google` package was upgraded to version 15.1.0 in Cloud Composer 2 images and Cloud Composer 3 builds.

 For more information about changes, see the apache-airflow-providers-google changelog from version 14.0.0 to version 15.1.0.

[apache-airflow-providers-google changelog](https://airflow.apache.org/docs/apache-airflow-providers-google/stable/changelog.html)

**説明:** (Airflow 2.9.3) `apache-airflow-providers-google` パッケージが、Cloud Composer 2イメージとCloud Composer 3ビルドでバージョン15.1.0にアップグレードされました。

変更点の詳細については、バージョン14.0.0からバージョン15.1.0までの apache-airflow-providers-google の変更ログを参照してください。

**影響有無:** 有

**対処方法:** 
* `apache-airflow-providers-google` パッケージの変更点を確認し、必要に応じてDAGとコードを更新してください。


### Changed

**原文:** *(Airflow 2.9.3)* Changes in preinstalled packages:

- `apache-airflow-providers-standard` was upgraded to 1.0.0 from 0.4.0.
- `aiosqlite` was removed from preinstalled packages.
- `json-merge-patch` was removed from preinstalled packages.
- `time-machine` was removed from preinstalled packages.
- `pyjwt` was downgraded to 2.9.0 from 2.10.1.

**説明:** (Airflow 2.9.3) インストール済みパッケージの変更点:

* `apache-airflow-providers-standard` が0.4.0から1.0.0にアップグレードされました。
* `aiosqlite` がインストール済みパッケージから削除されました。
* `json-merge-patch` がインストール済みパッケージから削除されました。
* `time-machine` がインストール済みパッケージから削除されました。
* `pyjwt` が2.10.1から2.9.0にダウングレードされました。

**影響有無:** 有

**対処方法:** 
* これらのパッケージのいずれかを使用している場合は、変更点を確認し、必要に応じてコードを更新してください。


### Changed

**原文:** New Airflow builds are available in Cloud Composer 3:

[Airflow builds](https://cloud.google.com/composer/docs/composer-versions#images-composer-3)
- composer-3-airflow-2.10.5-build.3 (default)
- composer-3-airflow-2.9.3-build.23

**説明:** Cloud Composer 3で新しいAirflowビルドが利用可能になりました。

* composer-3-airflow-2.10.5-build.3 (デフォルト)
* composer-3-airflow-2.9.3-build.23

**影響有無:** 無

**対処方法:** 特になし。


### Changed

**原文:** New images are available in Cloud Composer 2:

[images](https://cloud.google.com/composer/docs/composer-versions#images-composer-2)
- composer-2.13.1-airflow-2.10.5 (default)
- composer-2.13.1-airflow-2.10.2

**説明:** Cloud Composer 2で新しいイメージが利用可能になりました。

* composer-2.13.1-airflow-2.10.5 (デフォルト)
* composer-2.13.1-airflow-2.10.2

**影響有無:** 無

**対処方法:** 特になし。


### Deprecated

**原文:** Cloud Composer version 2.8.0 has reached its end of support period.

[end of support period](https://cloud.google.com/composer/docs/composer-versioning-overview#version-deprecation-and-support)

**説明:** Cloud Composerバージョン2.8.0はサポート期間が終了しました。

**影響有無:** 有

**対処方法:** 
* Cloud Composerバージョン2.8.0を使用している場合は、サポートされているバージョンにアップグレードしてください。

# Title: May 13, 2025 
Link: https://cloud.google.com/release-notes#May_13_2025<br>
## Compute Engine

### Security

**原文:** Google has applied fixes for a vulnerability (CVE-2024-45332) affecting the following Intel processors: CascadeLake, Ice Lake XeonSP, Ice Lake XeonD, Sapphire Rapids and Emerald Rapids. For more information, see the GCP-2025-025 security bulletin.

[GCP-2025-025 security bulletin](https://cloud.google.com/compute/docs/security-bulletins#gcp-2025-025)

**説明:** Intel製の特定CPU (CascadeLake, Ice Lake XeonSP, Ice Lake XeonD, Sapphire Rapids, Emerald Rapids) において脆弱性 (CVE-2024-45332) が発見されました。Googleはこの脆弱性に対する修正を適用済みです。詳細については、GCP-2025-025 セキュリティ бюллетень を参照してください。

**影響有無:**  有

**対処方法:**  セキュリティ бюллетеньの内容を確認し、必要な対応を実施してください。


## Google Kubernetes Engine

### Issue

**原文:** GKE Autopilot clusters fail to update the `cgroup_mode` field and display the following error:

 This issue occurs in all GKE versions. A fix for this issue is in progress. For more information, see Migrate nodes to Linux cgroupv2.

[Migrate nodes to Linux cgroupv2](https://cloud.google.com/kubernetes-engine/docs/how-to/migrate-cgroupv2)

**説明:**  GKE Autopilot クラスタにおいて、`cgroup_mode` フィールドの更新に失敗し、エラーが発生する問題が確認されています。この問題は全てのGKEバージョンで発生します。現在修正作業中で、修正版のリリースが待たれます。詳細については、「Migrate nodes to Linux cgroupv2」を参照してください。

**影響有無:** 有

**対処方法:**  修正版のリリースを待つ必要があります。修正版がリリースされたら、アップデートを実施してください。 

# Title: May 12, 2025 
Link: https://cloud.google.com/release-notes#May_12_2025<br>
## BigQuery

### Libraries > Java > google-cloud-bigquery

原文: 
```
- Add WRITE_TRUNCATE_DATA as an enum value for write disposition (#3752) (acea61c)
- **bigquery:** Add support for reservation field in jobs. (#3768) (3e97f7c)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.63.0 (#3770) (934389e)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20250404-2.0.0 (#3754) (1381c8f)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20250427-2.0.0 (#3773) (c0795fe)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.46.3 (#3772) (ab166b6)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.47.0 (#3779) (b27434b)
```

説明：

- 書き込み処理の列挙値として`WRITE_TRUNCATE_DATA`が追加されました。
- ジョブの予約フィールドのサポートが追加されました。
- いくつかの依存関係が更新されました。

影響有無：有

対処方法：

- `WRITE_TRUNCATE_DATA`列挙値を使用する場合、アプリケーションの更新が必要になる可能性があります。
- ジョブの予約フィールドを使用する場合、アプリケーションの更新が必要になる可能性があります。
- 依存関係の更新が必要な場合があります。


## Cloud Logging

### Libraries > Java > google-cloud-logging

原文:
```
- **deps:** Update the Java code generator (gapic-generator-java) to 2.56.3 (844f4fa)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.46.3 (#1801) (d7aa7bc)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.47.0 (#1803) (5967ffe)
- Update googleapis/sdk-platform-java action to v2.57.0 (#1804) (e9a27ec)
```

説明：

- Javaコードジェネレーター(gapic-generator-java)がバージョン2.56.3に更新されました。
- いくつかの依存関係が更新されました。

影響有無：有

対処方法：

- 依存関係の更新が必要な場合があります。


## Compute Engine

### Security

原文:
```
A vulnerability (CVE-2024-28956) affecting Intel Cascade Lake processors and Intel Ice Lake processors was discovered and is being addressed. For more information, see the GCP-2025-024 security bulletin.
```

説明：

Intel Cascade LakeプロセッサとIntel Ice Lakeプロセッサに影響を与える脆弱性（CVE-2024-28956）が発見され、現在対応中です。詳細については、GCP-2025-024セキュリティ速報を参照してください。

影響有無：有

対処方法：

- GCP-2025-024セキュリティ速報を参照し、必要な対応を行ってください。


## Pub/Sub

### Libraries > Java > google-cloud-pubsub

原文：
```
- Update dependency com.google.cloud:sdk-platform-java-config to v3.47.0 (#2414) (d78823f)
- Update googleapis/sdk-platform-java action to v2.57.0 (#2415) (1ddf9b8)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.56.3 (2b928a8)
- Update dependency com.google.cloud:google-cloud-bigquery to v2.49.2 (#2399) (ff48708)
- Update dependency com.google.cloud:google-cloud-core to v2.54.3 (#2393) (0ffa26a)
- Update dependency com.google.cloud:google-cloud-storage to v2.52.1 (#2396) (283a6e1)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.46.3 (#2406) (8963ed0)
```

説明：

- Javaコードジェネレーター(gapic-generator-java)がバージョン2.56.3に更新されました。
- いくつかの依存関係が更新されました。

影響有無：有

対処方法：

- 依存関係の更新が必要な場合があります。 

# Title: May 10, 2025 
Link: https://cloud.google.com/release-notes#May_10_2025<br>
## AlloyDB for PostgreSQL

### Changed

**原文:** Due to a change to report `replay_lsn` more accurately during parallel replay, metrics might show a slightly higher replication lag.

[replication lag](https://cloud.google.com/alloydb/docs/reference/system-insights-metrics#read-pool-replication-lag)

**説明:** 並列レプリケーション中の `replay_lsn` のレポート精度向のため、レプリケーションラグがメトリクス上で若干高く表示される場合があります。

**影響有無:**  無

**対処方法:**  
今回の変更はレプリケーションラグのレポート精度向上のためのものです。レプリケーションラグの値が一時的に高く表示される場合がありますが、実際のパフォーマンスへの影響はありません。特別な対応は不要です。 

# Title: May 09, 2025 
Link: https://cloud.google.com/release-notes#May_09_2025<br>
## Google Kubernetes Engine

### Changed

#### 元文
GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

#### 説明
GKEクラスタバージョンが更新されました。新しいバージョンが、アップグレードと新規クラスタ作成に利用できるようになりました。

#### 製品への影響有無
有

#### 対処方法
詳細については、GKEのバージョニングとサポート、およびアップグレードのドキュメントを参照してください。

### Announcement

#### 元文
Kubernetes 1.33 is now available in the Rapid channel. For more information about the content of Kubernetes 1.33, read the Kubernetes 1.33 Release Notes.

[Kubernetes 1.33 Release Notes](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.33.md#changelog-since-v1320)

#### 説明
Kubernetes 1.33がRapidチャンネルで利用できるようになりました。Kubernetes 1.33の内容の詳細については、Kubernetes 1.33リリースノートを参照してください。

#### 製品への影響有無
有

#### 対処方法
必要に応じて、Kubernetes 1.33 リリースノートを参照してください。

### Deprecated

#### 元文 
The gitRepo volume driver is deprecated and disabled for security reasons. For more information, see KEP-5040.

[KEP-5040](https://github.com/kubernetes/enhancements/issues/5040)

#### 説明
セキュリティ上の理由から、gitRepoボリュームドライバは非推奨となり、無効化されました。詳細については、KEP-5040を参照してください。

#### 製品への影響有無
有

#### 対処方法
gitRepoボリュームドライバを使用している場合は、KEP-5040を参照して、別のボリュームドライバへの移行を検討してください。

### Deprecated

#### 元文
The `status.nodeInfo.kubeProxyVersion` field in the Node API object is no longer populated in 1.33 and later. This field actually reported the kubelet version, not the `kube-proxy` version. You can use `status.nodeInfo.kubeletVersion` to get the kubelet version. For more information, see KEP-4004.

[KEP-4004](https://github.com/kubernetes/enhancements/tree/master/keps/sig-network/4004-deprecate-kube-proxy-version)

#### 説明
Node APIオブジェクトの`status.nodeInfo.kubeProxyVersion`フィールドは、1.33以降では設定されなくなりました。このフィールドは、実際には`kube-proxy`バージョンではなく、kubeletバージョンを報告していました。 kubeletバージョンを取得するには、`status.nodeInfo.kubeletVersion`を使用できます。詳細については、KEP-4004を参照してください。

#### 製品への影響有無
有

#### 対処方法
 `status.nodeInfo.kubeProxyVersion`  フィールドを使用している場合は、 `status.nodeInfo.kubeletVersion`  フィールドを使用するように変更してください。

### Changed

#### 元文
containerd 2.0 is supported. For more information, see Migrate nodes to containerd 2.

[containerd 2.0](https://github.com/containerd/containerd/blob/main/docs/containerd-2.0.md)
[Migrate nodes to containerd 2](https://cloud.google.com/kubernetes-engine/docs/deprecations/migrate-containerd-2)

#### 説明
containerd 2.0がサポートされました。詳細については、containerd 2へのノードの移行を参照してください。

#### 製品への影響有無
有

#### 対処方法
必要に応じて、containerd 2へのノードの移行について参照してください。

### Changed

#### 元文
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.3-gke.1927002 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.30.12-gke.1033000
- 1.31.8-gke.1045000
- 1.32.3-gke.1785003
- 1.32.3-gke.1927002
- 1.32.4-gke.1106000
- 1.33.0-gke.1552000
- 1.33.0-gke.1582000
- 1.33.0-gke.1712000

- The following versions are no longer available in the Rapid channel:

- 1.30.11-gke.1131000
- 1.31.7-gke.1212000
- 1.32.2-gke.1297002
- 1.32.3-gke.1785000
- 1.32.3-gke.1927000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.11-gke.1157000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.7-gke.1265000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.3-gke.1785003 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.11-gke.1157000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.7-gke.1265000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.3-gke.1785003 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.33 to version 1.33.0-gke.1552000 with this release.

#### 説明
Rapidチャンネルにおけるクラスタ作成のデフォルトバージョンが 1.32.3-gke.1927002 に変更されました。また、Rapidチャンネルで利用可能なバージョンと、利用できなくなったバージョンが更新されました。

自動アップグレードの対象バージョンも更新され、1.29, 1.30, 1.31 の各バージョンから、それぞれ 1.30.11-gke.1157000, 1.31.7-gke.1265000, 1.32.3-gke.1785003 へのアップグレードが自動で行われます。

メンテナンスの除外など、マイナーバージョンアップグレードを妨げる要因があるクラスタのために、パッチのみのバージョン自動アップグレードターゲットも更新されました。

#### 製品への影響有無
有

#### 対処方法
Rapidチャンネルを使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じて対応してください。

### Changed

#### 元文
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.2-gke.1297002 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.30.11-gke.1157000
- 1.31.7-gke.1265000
- 1.32.3-gke.1785003

- The following versions are no longer available in the Regular channel:

- 1.30.10-gke.1070000
- 1.31.6-gke.1064001
- 1.32.2-gke.1182003

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.11-gke.1131000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.31.7-gke.1212000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.11-gke.1131000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.7-gke.1212000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.32 to version 1.32.2-gke.1297002 with this release.

#### 説明
Regularチャンネルにおけるクラスタ作成のデフォルトバージョンが 1.32.2-gke.1297002 に変更されました。また、Regularチャンネルで利用可能なバージョンと、利用できなくなったバージョンが更新されました。

自動アップグレードの対象バージョンも更新され、1.29, 1.30 の各バージョンから、それぞれ 1.30.11-gke.1131000, 1.31.7-gke.1212000 へのアップグレードが自動で行われます。

メンテナンスの除外など、マイナーバージョンアップグレードを妨げる要因があるクラスタのために、パッチのみのバージョン自動アップグレードターゲットも更新されました。

#### 製品への影響有無
有

#### 対処方法
Regularチャンネルを使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じて対応してください。


### Changed

#### 元文
There are no new releases in the Stable channel.

#### 説明
Stableチャンネルには新しいリリースはありません。

#### 製品への影響有無
無

#### 対処方法
特になし。


### Changed

#### 元文
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.2-gke.1297002 is now the default version for cluster creation in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.16-gke.2682000
- 1.27.16-gke.2732000
- 1.28.15-gke.2142000
- 1.28.15-gke.2192000
- 1.29.15-gke.1274000
- 1.30.11-gke.1157000
- 1.31.7-gke.1265000
- 1.32.3-gke.1785003

- The following versions are no longer available in the Extended channel:

- 1.27.16-gke.2650000
- 1.27.16-gke.2703000
- 1.28.15-gke.2097000
- 1.28.15-gke.2169000
- 1.29.15-gke.1240000
- 1.30.10-gke.1070000
- 1.31.6-gke.1064001
- 1.32.2-gke.1182003

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.28.15-gke.2121000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2664000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.2121000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.11-gke.1131000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.7-gke.1212000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.32 to version 1.32.2-gke.1297002 with this release.

#### 説明

Extendedチャンネルにおけるクラスタ作成のデフォルトバージョンが 1.32.2-gke.1297002 に変更されました。また、Extendedチャンネルで利用可能なバージョンと、利用できなくなったバージョンが更新されました。

自動アップグレードの対象バージョンも更新され、 1.27 から 1.28.15-gke.2121000 へのアップグレードが自動で行われます。

メンテナンスの除外など、マイナーバージョンアップグレードを妨げる要因があるクラスタのために、パッチのみのバージョン自動アップグレードターゲットも更新されました。

#### 製品への影響有無
有

#### 対処方法
Extendedチャンネルを使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じて対応してください。

### Changed

#### 元文
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.2-gke.1297002 is now the default version for cluster creation.
- The following versions are now available:

- 1.30.12-gke.1033000
- 1.31.8-gke.1045000
- 1.32.3-gke.1785003
- 1.32.3-gke.1927002
- 1.32.4-gke.1106000

- The following node versions are now available:

- 1.27.16-gke.2732000
- 1.28.15-gke.2192000
- 1.29.15-gke.1274000
- 1.30.12-gke.1033000
- 1.31.8-gke.1045000
- 1.32.3-gke.1785003
- 1.32.3-gke.1927002
- 1.32.4-gke.1106000

- The following versions are no longer available:

- 1.31.6-gke.1020000
- 1.32.3-gke.1785000
- 1.32.3-gke.1927000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.11-gke.1131000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.11-gke.1131000 with this release.

#### 説明

クラスタ作成のデフォルトバージョンが 1.32.2-gke.1297002 に変更されました。また、利用可能なバージョンと、利用できなくなったバージョンが更新されました。

自動アップグレードの対象バージョンも更新され、 1.29 から 1.30.11-gke.1131000 へのアップグレードが自動で行われます。

メンテナンスの除外など、マイナーバージョンアップグレードを妨げる要因があるクラスタのために、パッチのみのバージョン自動アップグレードターゲットも更新されました。

#### 製品への影響有無
有

#### 対処方法
利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じて対応してください。

# Title: May 08, 2025 
Link: https://cloud.google.com/release-notes#May_08_2025<br>
## Cloud SQL for PostgreSQL

### Server Certificate Authority Mode Changed for New Instances

**Original Release Note:**

If you create an instance using the Google Cloud Console, then the per-instance CA (`GOOGLE_MANAGED_INTERNAL_CA`) option is now the default server certificate authority (CA) mode for your Cloud SQL instance. For users of the Cloud SQL Auth Proxy: 

- If the Cloud SQL instance to which you're connecting is using shared certificate authority (CA) for its `serverCaMode` setting, then on the client side, you must use Cloud SQL Auth Proxy version 2.13.0 or later.
- If the Cloud SQL instance to which you're connecting is using customer-managed CA for its `serverCaMode` setting, then on the client side, you must use Cloud SQL Auth Proxy version 2.14.3 or later.

**説明:**

Google Cloud Console から Cloud SQL for PostgreSQL インスタンスを作成する場合、デフォルトのサーバー証明書認証局(CA)モードがインスタンス単位の CA (`GOOGLE_MANAGED_INTERNAL_CA`) に変更されました。

Cloud SQL Auth Proxy を使用する場合は、接続先の Cloud SQL インスタンスの `serverCaMode` 設定に応じて、以下のバージョン以降の Cloud SQL Auth Proxy を使用してください。

- `serverCaMode` が共有 CA の場合: Cloud SQL Auth Proxy バージョン 2.13.0 以降
- `serverCaMode` が顧客管理の CA の場合: Cloud SQL Auth Proxy バージョン 2.14.3 以降

**製品への影響有無:** 有

**対処方法:**

- Google Cloud Console から新規に Cloud SQL for PostgreSQL インスタンスを作成する場合、デフォルトでインスタンス単位の CA が有効になります。
- 既存のインスタンスや、異なる方法でインスタンスを作成する場合は、今回の変更による影響はありません。
- Cloud SQL Auth Proxy を使用している場合は、接続先の Cloud SQL インスタンスの `serverCaMode` 設定に応じて、必要なバージョンにアップグレードしてください。 

# Title: May 07, 2025 
Link: https://cloud.google.com/release-notes#May_07_2025<br>
## Cloud Composer

### Announcement

#### 元文
A new Cloud Composer release has started on **May 07, 2025**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.

#### 説明
2025年5月7日から、新しい Cloud Composer のリリースが開始されました。段階的に展開されるため、すべてのリージョンで利用可能になるまで時間がかかります。記載されている変更点や新機能の一部は、まだ利用できない場合があります。

#### 製品への影響有無
 無（今後影響が出る可能性はあり） 

#### 対処方法
特になし。今後の変更に注意してください。


### Changed

#### 元文
For newly created Cloud Composer 3 environments, the minimum amount of memory is changed to 2 GB. 

#### 説明
新規作成される Cloud Composer 3 環境のメモリ最小容量が 2GB に変更されました。

#### 製品への影響有無
有（新規にCloud Composer 3環境を作成する場合）

#### 対処方法
Cloud Composer 3 環境を新規作成する際は、2 GB 以上のメモリ容量を確保してください。


### Changed

#### 元文
 For newly created environments, database retention policy is now enabled by default in Google Cloud CLI, API, and Terraform. Before this change, it was enabled by default only in Google Cloud Console.
 
 [database retention policy](https://cloud.google.com/composer/docs/composer-3/configure-db-retention)

#### 説明
新規作成される Cloud Composer 環境において、データベース保持ポリシーが、Google Cloud CLI、API、Terraform でデフォルトで有効化されるようになりました。以前は Google Cloud Console でのみデフォルトで有効化されていました。

#### 製品への影響有無
有（新規にCloud Composer環境を作成する場合）

#### 対処方法
データベース保持ポリシーの設定を確認し、必要があれば変更してください。


### Changed

#### 元文
 Improved the environment liveness monitoring. This change addresses some cases of transient failures that caused "Liveness probe failed" warnings in the environment's logs.

#### 説明
環境の稼働状況監視が改善されました。この変更により、環境のログに「Liveness probe failed」という警告が発生する一時的な障害の発生を防ぎます。

#### 製品への影響有無
無

#### 対処方法
特になし。


### Changed

#### 元文
*(Airflow 2.10.5)* The `apache-airflow-providers-google` package was upgraded to version 15.1.0 in Cloud Composer 2 images and Cloud Composer 3 builds.

For more information about changes, see the apache-airflow-providers-google changelog from version 14.0.0 to version 15.1.0.

[apache-airflow-providers-google changelog](https://airflow.apache.org/docs/apache-airflow-providers-google/stable/changelog.html)

#### 説明
Cloud Composer 2 イメージと Cloud Composer 3 ビルドにおいて、`apache-airflow-providers-google` パッケージがバージョン 15.1.0 にアップグレードされました。変更点の詳細は、バージョン 14.0.0 から 15.1.0 までの apache-airflow-providers-google の変更履歴を参照してください。

#### 製品への影響有無
有（ Airflow 2.10.5 を利用している場合）

#### 対処方法
`apache-airflow-providers-google` パッケージの変更内容を確認し、必要があれば対応してください。


### Changed

#### 元文
*(Airflow 2.10.5)* Changes in preinstalled packages:

- `apache-airflow-providers-standard` was upgraded to 1.0.0 from 0.4.0.
- `aiosqlite` was removed from preinstalled packages.
- `json-merge-patch` was removed from preinstalled packages.
- `time-machine` was removed from preinstalled packages.

#### 説明
Airflow 2.10.5 のプリインストールパッケージの変更:

- `apache-airflow-providers-standard` がバージョン 0.4.0 から 1.0.0 にアップグレードされました。
- `aiosqlite` がプリインストールパッケージから削除されました。
- `json-merge-patch` がプリインストールパッケージから削除されました。
- `time-machine` がプリインストールパッケージから削除されました。

#### 製品への影響有無
有（ Airflow 2.10.5 を利用している場合）

#### 対処方法
削除されたパッケージを利用している場合は、別途インストールする必要があります。


### Changed

#### 元文
 The default version of Airflow is changed to 2.10.5.

#### 説明
Airflow のデフォルトバージョンが 2.10.5 に変更されました。

#### 製品への影響有無
有（ Airflow の旧バージョンを利用している場合）

#### 対処方法
Airflow 2.10.5 の変更点を確認し、必要があれば対応してください。


### Changed

#### 元文
 Airflow 2.10.2 is no longer included in Cloud Composer images and builds.

#### 説明
Airflow 2.10.2 は、Cloud Composer のイメージやビルドに含まれなくなりました。

#### 製品への影響有無
有（ Airflow 2.10.2 を利用している場合）

#### 対処方法
Airflow 2.10.2 を利用している場合は、サポートされているバージョンへのアップグレードが必要です。


### Changed

#### 元文
New Airflow builds are available in Cloud Composer 3:

[Airflow builds](https://cloud.google.com/composer/docs/composer-versions#images-composer-3)
- composer-3-airflow-2.10.5-build.2 (default)
- composer-3-airflow-2.9.3-build.22

#### 説明
Cloud Composer 3 で、以下の新しい Airflow ビルドが利用可能になりました。

- composer-3-airflow-2.10.5-build.2 (デフォルト)
- composer-3-airflow-2.9.3-build.22

#### 製品への影響有無
無

#### 対処方法
特になし。


### Changed

#### 元文
New images are available in Cloud Composer 2:

[images](https://cloud.google.com/composer/docs/composer-versions#images-composer-2)
- composer-2.13.0-airflow-2.10.5 (default)
- composer-2.13.0-airflow-2.10.2

#### 説明
Cloud Composer 2 で、以下の新しいイメージが利用可能になりました。

- composer-2.13.0-airflow-2.10.5 (デフォルト)
- composer-2.13.0-airflow-2.10.2

#### 製品への影響有無
無

#### 対処方法
特になし。


### Deprecated

#### 元文
 Cloud Composer versions 2.7.0 and 2.7.1 have reached their end of support period.

[end of support period](https://cloud.google.com/composer/docs/composer-versioning-overview#version-deprecation-and-support)

#### 説明
Cloud Composer バージョン 2.7.0 および 2.7.1 はサポート終了になりました。

#### 製品への影響有無
有（ Cloud Composer バージョン 2.7.0, 2.7.1 を利用している場合）

#### 対処方法
サポートされているバージョンにアップグレードしてください。


## Cloud Monitoring

### Issue

#### 元文
Version 2.56.0 of the Ops Agent using the Prometheus receiver can fail to send metrics and report negative start times. To resolve this issue, downgrade to version 2.55.0. For more information, see Known issue: Ops Agent version 2.56.0 fails to send metrics.

[Known issue: Ops Agent version 2.56.0 fails to send metrics](https://cloud.google.com/stackdriver/docs/solutions/agents/ops-agent/troubleshoot-run-ingest#known-2.56.0-issue)

#### 説明
Prometheus receiver を使用した Ops Agent のバージョン 2.56.0 では、メトリクスの送信に失敗し、負の開始時刻が報告されることがあります。この問題を解決するには、バージョン 2.55.0 にダウングレードしてください。詳細については、「既知の問題：Ops Agent バージョン 2.56.0 でメトリクスが送信されない」を参照してください。

#### 製品への影響有無
有（ Ops Agent バージョン 2.56.0 を利用している場合）

#### 対処方法
Ops Agent をバージョン 2.55.0 にダウングレードしてください。 

# Title: May 06, 2025 
Link: https://cloud.google.com/release-notes#May_06_2025<br>
## Apigee X

### Announcement

**原文:** On May 6, 2025, we released a new Apigee REST resource for debug sessions.

**説明:** 2025年5月6日、デバッグセッション用の新しい Apigee REST リソースがリリースされました。

**製品への影響有無:** 無

**対処方法:** 特になし


## BigQuery

### Changed

**原文:** In the Google Cloud console, Analytics Hub has been renamed BigQuery sharing (Analytics Hub). [BigQuery sharing (Analytics Hub)](https://cloud.google.com/bigquery/docs/analytics-hub-introduction)

**説明:** Google Cloud コンソールで、Analytics Hub が BigQuery sharing (Analytics Hub) に名称変更されました。

**製品への影響有無:** 無

**対処方法:** 特になし。ただし、Analytics Hubを利用している場合は、名称変更に留意してください。


## Cloud Composer

### Changed

**原文:** The Deployment Manager API is no longer automatically enabled when you enable Cloud Composer API because this API isn't used by the Cloud Composer service. Environments with Cloud Composer versions 2.0.* still rely on the Deployment Manager API for updates, upgrades, and environment deletion. It won't be possible to perform these operations if this API is disabled. We recommend to upgrade your 2.0.* environments to a later version to remove this dependency.

**説明:** Cloud Composer APIを有効にしても、Deployment Manager APIは自動的に有効にならなくなりました。これは、Cloud ComposerサービスでこのAPIが使用されなくなったためです。ただし、Cloud Composerバージョン2.0.*の環境は、更新、アップグレード、環境削除にDeployment Manager APIを引き続き使用します。このAPIが無効になっていると、これらの操作を実行できません。この依存関係を削除するには、2.0.*環境を新しいバージョンにアップグレードすることをお勧めします。

**製品への影響有無:** 有

**対処方法:** Cloud Composerバージョン2.0.*を利用している場合は、Deployment Manager APIが有効になっていることを確認してください。Deployment Manager APIが無効になっていると、環境の更新、アップグレード、削除ができなくなります。新しいバージョンへのアップグレードを検討してください。


## Cloud Service Mesh

### Announcement

**原文:** The following images are now rolling out for managed Cloud Service Mesh: - 1.21.5-asm.42 is rolling out to the rapid release channel. - 1.20.8-asm.33 is rolling out to the regular release channel. - 1.19.10-asm.33 is rolling out to the stable release channel.

**説明:** マネージドCloud Service Meshについて、以下のイメージがロールアウトされます。 - 1.21.5-asm.42 が Rapid リリースチャネルにロールアウトされます。 - 1.20.8-asm.33 が Regular リリースチャネルにロールアウトされます。 - 1.19.10-asm.33 が Stable リリースチャネルにロールアウトされます。

**製品への影響有無:** 無

**対処方法:** 特になし。各リリースチャネルの更新内容については、リリースノートの詳細をご確認ください。

### Announcement

**原文:** A behavioral change regarding user-provided credentials (private key and certificate) for TLS termination at ingress is now rolling out to the Rapid release channel. Subsequent announcements will appear for additional release channels. 
[user-provided credentials (private key and certificate) for TLS termination](https://cloud.google.com/service-mesh/docs/operate-and-maintain/gateway-tls-termination)
The Kubernetes Secrets denoted by `Gateway.servers.port.tls.credentialName` will be read by each ingress gateway pod directly instead of the Control Plane. This change enhances security because the user-provided secret is read directly by the workloads instead of passing any managed component. This change is compatible with previous behavior aside from the propagation speed of the updated secrets. Previously, updated secrets would propagate immediately. Now, updated secrets will propagate within 60 minutes. If you need immediate secret rotation, restart the gateway pods. Each gateway pod reads Kubernetes secrets, so the number of the gateway pods becomes a scalability factor. We recommend the following maximum number of gateway pods:
- If the GKE cluster is regional, 1500 or fewer pods
- If the GKE cluster is zonal or using autopilot, 500 or fewer pods
If this change in behavior doesn't work for you, consider using the deployment with mounted credentials. 
[deployment with mounted credentials](https://cloud.google.com/service-mesh/docs/operate-and-maintain/gateway-tls-termination#deployment_without_mounted_credentials)
This change only affects clusters using Traffic Director and version 1.21.5-asm.42 or later. 

**説明:** Ingress での TLS 終端に使用されるユーザー指定の認証情報 (秘密鍵と証明書) に関する動作の変更が、Rapid リリースチャネルにロールアウトされます。 後日、他のリリースチャネルについてもアナウンスがあります。
`Gateway.servers.port.tls.credentialName` で指定された Kubernetes Secrets は、コントロールプレーンではなく、各イングレスゲートウェイポッドによって直接読み取られるようになります。 この変更により、ユーザーが指定したシークレットは、管理対象コンポーネントを経由せずにワークロードによって直接読み取られるため、セキュリティが強化されます。 この変更は、更新されたシークレットの伝播速度を除いて、以前の動作と互換性があります。 以前は、更新されたシークレットはすぐに伝播されました。 今後、更新されたシークレットは 60 分以内に伝播されます。 シークレットのローテーションをすぐに反映する必要がある場合は、ゲートウェイポッドを再起動してください。 各ゲートウェイポッドは Kubernetes Secrets を読み取るため、ゲートウェイポッドの数はスケーラビリティの要因になります。 ゲートウェイポッドの最大数は、以下を推奨します。
- GKE クラスタがリージョン単位の場合: 1500 ポッド以下
- GKE クラスタがゾーン単位または Autopilot を使用している場合: 500 ポッド以下
この動作変更が適さない場合は、マウントされた認証情報を使用したデプロイメントを検討してください。
この変更は、Traffic Director とバージョン 1.21.5-asm.42 以降を使用するクラスタにのみ影響します。

**製品への影響有無:** 有

**対処方法:**  TLS終端にユーザー指定の認証情報を使用している場合、更新されたシークレットが反映されるまでに最大60分かかる可能性があります。 シークレットの即時ローテーションが必要な場合は、ゲートウェイポッドの再起動が必要になる場合があります。 また、ゲートウェイポッドの数はスケーラビリティに影響を与えるため、推奨される最大数以下にするようにしてください。 上記の変更が適さない場合は、マウントされた認証情報を使用したデプロイメントを検討してください。 

# Title: May 05, 2025 
Link: https://cloud.google.com/release-notes#May_05_2025<br>
# BigQuery
## Changed
原文:
> Node.js
> ## Changes for @google-cloud/bigquery
> [@google-cloud/bigquery](https://github.com/googleapis/nodejs-bigquery)
> [8.0.0](https://github.com/googleapis/nodejs-bigquery/compare/v7.9.4...v8.0.0)
> - migrate to node 18 (#1458)
> 
> [#1458](https://github.com/googleapis/nodejs-bigquery/issues/1458)
> - Migrate to node 18 (#1458) (6cd706b)
> 
> [#1458](https://github.com/googleapis/nodejs-bigquery/issues/1458)
> [6cd706b](https://github.com/googleapis/nodejs-bigquery/commit/6cd706b6e96ac54a9289211e7e3d2cc1f4e934e2)

説明：BigQueryのNode.jsクライアントライブラリがバージョン8.0.0にアップデートされました。主な変更点は、Node.js 18への移行です。

影響有無：有

対処方法：Node.js 18を利用するようにアプリケーションをアップデートする必要があります。もし、Node.jsの以前のバージョンを利用している場合は、Node.js 18へアップグレードしてください。もし、BigQueryのNode.jsクライアントライブラリをバージョン7.x系を利用している場合は、バージョン8.0.0以降にアップデートしてください。 

# Title: May 02, 2025 
Link: https://cloud.google.com/release-notes#May_02_2025<br>
## Apigee X
### Announcement: Updated version of Apigee (May 2, 2025)

**原文:** On May 2, 2025, we released an updated version of Apigee (1-15-0-apigee-3).

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to complete across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** Apigeeのアップデートバージョン(1-15-0-apigee-3)がリリースされました。本番環境へのロールアウトは2営業日以内に開始され、Google Cloudのすべてのゾーンへの展開が完了するまでに4営業日以上かかる場合があります。

**製品への影響有無:**  有

**対処方法:**  本番環境へのロールアウトは自動で行われますが、新機能や修正が利用可能になるまで最大4営業日かかる場合があるので、注意が必要です。


## Apigee X
### Fixed: Resolved scaling issue resulting in `503` errors (Bug ID: 391140293)

**原文:** **Resolved scaling issue resulting in `503` errors** Added `drainDuration` and updated the values for `terminationDrainDuration` and `terminationGracePeriodSeconds`. 

**説明:** スケーリングの問題で発生していた `503` エラーが修正されました。`drainDuration` が追加され、`terminationDrainDuration` と `terminationGracePeriodSeconds` の値が更新されました。

**製品への影響有無:** 有

**対処方法:**  この修正により、`503` エラーが減少することが期待されます。


## Apigee X
### Fixed: Updates to security infrastructure and libraries 

**原文:** **Updates to security infrastructure and libraries.** 

**説明:** セキュリティインフラストラクチャとライブラリに対する更新が行われました。

**製品への影響有無:**  有

**対処方法:**  セキュリティ強化のための対応なので、重要なアップデートです。変更点の詳細を確認し、必要があれば対応してください。


## Cloud Monitoring
### Changed: Dashboard widget limit increased 

**原文:** The limit for the number of widgets on a custom dashboard has increased to 100, from 40. For information about dashboards, see the following:

- Create and manage custom dashboards
- Install a dashboard template
- Import Grafana dashboards

[Create and manage custom dashboards](https://cloud.google.com/monitoring/charts/dashboards)
[Install a dashboard template](https://cloud.google.com/monitoring/dashboards/dashboard-templates)
[Import Grafana dashboards](https://cloud.google.com/monitoring/dashboards/import-grafana-dashboards)

**説明:** カスタムダッシュボードに配置できるウィジェットの数が、40個から100個に増加しました。

**製品への影響有無:** 有

**対処方法:** ダッシュボードに、より多くのウィジェットを配置できるようになりました。必要であれば、ダッシュボードのレイアウトを見直してください。 

## Google Kubernetes Engine
### Changed: GKE cluster versions have been updated

**原文:** GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

**説明:** GKEクラスタバージョンが更新されました。新しいクラスタおよび既存クラスタのオプトインコントロールプレーンアップグレードとノードアップグレードで、以下のKubernetesバージョンが利用可能になりました。

**製品への影響有無:** 有

**対処方法:** 新しいバージョンが利用可能になりました。GKEのバージョン管理とサポート、アップグレードに関するドキュメントを参照して、アップグレードを検討してください。

## Google Kubernetes Engine
### Changed: New Kubernetes versions available in different release channels

**原文:** 

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.2-gke.1297002 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.30.11-gke.1131000
- 1.30.11-gke.1217000
- 1.31.7-gke.1212000
- 1.31.7-gke.1390000
- 1.32.3-gke.1927000

- The following versions are no longer available in the Rapid channel:

- 1.30.10-gke.1070000
- 1.30.10-gke.1102000
- 1.31.6-gke.1064001
- 1.31.6-gke.1099001
- 1.32.2-gke.1182003

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.11-gke.1131000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.7-gke.1212000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.2-gke.1297002 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.11-gke.1131000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.7-gke.1212000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.2-gke.1297002 with this release.

[1.32.2-gke.1297002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.30.11-gke.1131000
- 1.30.11-gke.1217000
- 1.31.7-gke.1212000
- 1.31.7-gke.1390000
- 1.32.3-gke.1927000

[1.30.11-gke.1131000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.30.11-gke.1217000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1212000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.31.7-gke.1390000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.3-gke.1927000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
- 1.30.10-gke.1070000
- 1.30.10-gke.1102000
- 1.31.6-gke.1064001
- 1.31.6-gke.1099001
- 1.32.2-gke.1182003

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.11-gke.1131000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.7-gke.1212000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.2-gke.1297002 with this release.

[1.30.11-gke.1131000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1212000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.2-gke.1297002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.11-gke.1131000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.7-gke.1212000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.2-gke.1297002 with this release.

[1.30.11-gke.1131000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1212000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.2-gke.1297002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)

**説明:**  Rapidリリースチャネルで利用可能なKubernetesバージョンが更新されました。

* 新しいクラスタ作成時のデフォルトバージョンが 1.32.2-gke.1297002 に変更されました。
* いくつかのバージョンがRapidチャネルで利用可能になりました。
* いくつかのバージョンはRapidチャネルで利用できなくなりました。
* 自動アップグレードの対象バージョンが更新されました。
* メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因があるクラスタ向けに、パッチのみのバージョン自動アップグレードターゲットが利用可能になりました。

**製品への影響有無:** 有

**対処方法:** 
* Rapidチャネルを使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認してください。
* 必要に応じて、クラスタのアップグレード計画を調整してください。


## Google Kubernetes Engine
### Changed: New Kubernetes versions in Regular channel

**原文:** 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Regular channel:

- 1.30.11-gke.1131000
- 1.31.7-gke.1212000
- 1.32.2-gke.1297002

- 1.30.11-gke.1131000
- 1.31.7-gke.1212000
- 1.32.2-gke.1297002

[1.30.11-gke.1131000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1212000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.2-gke.1297002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)

**説明:** Regularリリースチャネルで、以下のKubernetesバージョンが利用可能になりました。

* 1.30.11-gke.1131000
* 1.31.7-gke.1212000
* 1.32.2-gke.1297002

**製品への影響有無:** 有

**対処方法:** 
* Regularチャネルを使用している場合は、利用可能なバージョンを確認してください。
* 必要に応じて、クラスタのアップグレード計画を調整してください。

## Google Kubernetes Engine
### Changed: Updated versions and auto-upgrade targets in Stable channel

**原文:** 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.1-gke.1357001 is no longer available in the Stable channel.
- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.31.6-gke.1064001 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.32 to version 1.32.2-gke.1182003 with this release.

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.31.6-gke.1064001 with this release.

[1.31.6-gke.1064001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.32 to version 1.32.2-gke.1182003 with this release.

[1.32.2-gke.1182003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)

**説明:** Stableリリースチャネルでは、バージョン1.32.1-gke.1357001が利用できなくなりました。また、自動アップグレードの対象バージョンが更新されました。

**製品への影響有無:**  有

**対処方法:** 
* Stableチャネルを使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認してください。
* 必要に応じて、クラスタのアップグレード計画を調整してください。


## Google Kubernetes Engine
### Changed: Updated versions and auto-upgrade targets in Extended channel

**原文:** 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Extended channel:

- 1.27.16-gke.2664000
- 1.27.16-gke.2703000
- 1.28.15-gke.2121000
- 1.28.15-gke.2169000
- 1.29.15-gke.1240000
- 1.30.11-gke.1131000
- 1.31.7-gke.1212000
- 1.32.2-gke.1297002

- The following versions are no longer available in the Extended channel:

- 1.27.16-gke.2633000
- 1.27.16-gke.2682000
- 1.28.15-gke.2072000
- 1.28.15-gke.2142000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.28.15-gke.2097000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2650000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.2097000 with this release.

- 1.27.16-gke.2664000
- 1.27.16-gke.2703000
- 1.28.15-gke.2121000
- 1.28.15-gke.2169000
- 1.29.15-gke.1240000
- 1.30.11-gke.1131000
- 1.31.7-gke.1212000
- 1.32.2-gke.1297002

[1.27.16-gke.2664000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.27.16-gke.2703000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.2121000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.28.15-gke.2169000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.15-gke.1240000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.11-gke.1131000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1212000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.2-gke.1297002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.27.16-gke.2633000
- 1.27.16-gke.2682000
- 1.28.15-gke.2072000
- 1.28.15-gke.2142000

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.28.15-gke.2097000 with this release.

[1.28.15-gke.2097000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2650000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.2097000 with this release.

[1.27.16-gke.2650000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.2097000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)

**説明:** Extendedリリースチャネルで利用可能なKubernetesバージョンが更新されました。

* いくつかのバージョンがExtendedチャネルで利用可能になりました。
* いくつかのバージョンはExtendedチャネルで利用できなくなりました。
* 自動アップグレードの対象バージョンが更新されました。
* メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因があるクラスタ向けに、パッチのみのバージョン自動アップグレードターゲットが利用可能になりました。

**製品への影響有無:** 有

**対処方法:** 
* Extendedチャネルを使用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認してください。
* 必要に応じて、クラスタのアップグレード計画を調整してください。

## Google Kubernetes Engine
### Changed: Kubernetes versions availability and auto-upgrade targets

**原文:** 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available:

- 1.30.11-gke.1131000
- 1.30.11-gke.1217000
- 1.31.7-gke.1212000
- 1.31.7-gke.1390000
- 1.32.3-gke.1927000

- The following node versions are now available:

- 1.27.16-gke.2703000
- 1.28.15-gke.2169000
- 1.29.15-gke.1240000
- 1.30.11-gke.1217000
- 1.31.7-gke.1390000
- 1.32.3-gke.1927000

- The following versions are no longer available:

- 1.30.10-gke.1102000
- 1.31.6-gke.1099001
- 1.32.1-gke.1357001
- 1.32.2-gke.1182001

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.31.6-gke.1064001 with this release.

- 1.30.11-gke.1131000
- 1.30.11-gke.1217000
- 1.31.7-gke.1212000
- 1.31.7-gke.1390000
- 1.32.3-gke.1927000

[1.30.11-gke.1131000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.30.11-gke.1217000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1212000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.31.7-gke.1390000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.3-gke.1927000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
- 1.27.16-gke.2703000
- 1.28.15-gke.2169000
- 1.29.15-gke.1240000
- 1.30.11-gke.1217000
- 1.31.7-gke.1390000
- 1.32.3-gke.1927000

[1.27.16-gke.2703000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.2169000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.15-gke.1240000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.11-gke.1217000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1390000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.3-gke.1927000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
- 1.30.10-gke.1102000
- 1.31.6-gke.1099001
- 1.32.1-gke.1357001
- 1.32.2-gke.1182001

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.31.6-gke.1064001 with this release.

[1.31.6-gke.1064001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)

**説明:** GKE で利用可能な Kubernetes バージョン、ノードバージョン、および自動アップグレードの対象バージョンが更新されました。

* いくつかのバージョンが利用可能になりました。
* いくつかのノードバージョンが利用可能になりました。
* いくつかのバージョンは利用できなくなりました。
* 自動アップグレードが有効になっているコントロールプレーンとノードは、バージョン 1.30 からバージョン 1.31.6-gke.1064001 にアップグレードされます。

**製品への影響有無:**  有

**対処方法:** 
* 利用可能なバージョン、ノードバージョン、自動アップグレードの対象バージョンを確認してください。
* 必要に応じて、クラスタのアップグレード計画を調整してください。

# Title: April 30, 2025 
Link: https://cloud.google.com/release-notes#April_30_2025<br>
## Cloud Composer

### Announcement

**原文:** Starting from 5 May, 2025, new Cloud Composer 3 environments will use 1 CPU and 4 GB of memory for the Airflow web server by default. The minimum and maximum values for these parameters will not change.

**説明:** 2025年5月5日以降に作成される Cloud Composer 3 環境では、Airflow ウェブサーバーのデフォルトのリソース割り当てが 1 CPU、4 GB メモリに変更されます。ただし、設定可能な最小値・最大値に変更はありません。

**影響有無:** 無

**対処方法:** 特に対応は不要です。 


## Spanner

### Libraries

**原文:** A monthly digest of client library updates from across the Cloud SDK.
[Cloud SDK](https://cloud.google.com/sdk)

**説明:** Cloud SDK のクライアントライブラリの月次更新の概要です。

**影響有無:** 無

**対処方法:** 特に対応は不要です。 

### Go

#### Changes for spanner/admin/database/apiv1

**原文:**
[spanner/admin/database/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/spanner/admin/database/apiv1)
[1.79.0](https://github.com/googleapis/google-cloud-go/compare/spanner/v1.78.0...spanner/v1.79.0)
- **spanner:** Allow string values for Scan functions (#11898) (9989dd0)
- **spanner:** New client(s) (#11946) (c60f28d)
...

**説明:**  Spanner Goクライアントライブラリのバージョン1.79.0と1.80.0における変更点です。 Scan関数で文字列値を許容するなどの機能追加や、新規クライアントの追加、バグ修正などが含まれています。

**影響有無:**  利用しているバージョンによっては有

**対処方法:**  
- Go クライアントライブラリを使用している場合は、変更点を確認し、必要があればアプリケーションの修正やバージョンアップを検討してください。 
- 詳細は、各バージョンやIssueへのリンクを参照してください。


### Java

#### Changes for google-cloud-spanner

**原文:**
[google-cloud-spanner](https://github.com/googleapis/java-spanner)
[6.90.0](https://github.com/googleapis/java-spanner/compare/v6.89.0...v6.90.0)
- Add default_isolation_level connection property (#3702) (9472d23)
- Adds support for Interval datatype in Java client (#3416) (8be8f5e)
...

**説明:** Spanner Java クライアントライブラリのバージョン 6.90.0、6.91.0、6.91.1 における変更点です。 
デフォルトの分離レベル設定プロパティの追加、Intervalデータ型のサポート追加、OpenTelemetryによるメトリクス計測の組み込み、パフォーマンスの最適化、バグ修正などが含まれています。

**影響有無:** 利用しているバージョンによっては有

**対処方法:** 
- Java クライアントライブラリを使用している場合は、変更点を確認し、必要があればアプリケーションの修正やバージョンアップを検討してください。
- 詳細は、各バージョンやIssueへのリンクを参照してください。


### Node.js

#### Changes for @google-cloud/spanner

**原文:** 
[@google-cloud/spanner](https://github.com/googleapis/nodejs-spanner)
[7.20.0](https://github.com/googleapis/nodejs-spanner/compare/v7.19.1...v7.20.0)
- Add support for Interval (#2192) (8c886cb)
- **debugging:** Implement x-goog-spanner-request-id propagation per request (#2205) (e42caea)
...

**説明:** Spanner Node.js クライアントライブラリのバージョン 7.20.0 と 7.21.0 における変更点です。
Intervalデータ型のサポート追加、デバッグ用のリクエストID伝播の実装、スナップショット分離のサポート追加、Multiplexed Session Partitioned Ops のサポート、pre-split機能のサンプル追加、リクエストタグとトランザクションタグへのスパン属性の追加などが含まれています。 

**影響有無:** 利用しているバージョンによっては有

**対処方法:** 
- Node.js クライアントライブラリを使用している場合は、変更点を確認し、必要があればアプリケーションの修正やバージョンアップを検討してください。
- 詳細は、各バージョンやIssueへのリンクを参照してください。 

# Title: April 29, 2025 
Link: https://cloud.google.com/release-notes#April_29_2025<br>
# Apigee X 

## Announcement

**原文:** On April 29, 2025, we released an updated version of Apigee.

**説明:** 2025年4月29日に、Apigeeのアップデートバージョンがリリースされました。

**影響有無:**  情報不足のため不明

**対処方法:** Apigee Xをご利用の場合は、リリースノートの詳細を確認し、アップデート内容に基づいて必要な対応を検討してください。 

# Title: April 28, 2025 
Link: https://cloud.google.com/release-notes#April_28_2025<br>
## BigQuery

### Libraries > Java > Changes for google-cloud-bigquery > 2.49.1

#### 原文

- Add labels to converter for listTables method (#3735) (#3736) (8634822)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.46.0 (#3753) (a335927)
- Update netty.version to v4.2.0.final (#3745) (bb811c0)

#### 説明

- listTablesメソッドのコンバーターにラベルを追加しました。
- 依存関係の更新:
    - com.google.cloud:sdk-platform-java-config を v3.46.0 にアップデートしました。
    - netty.version を v4.2.0.final にアップデートしました。

#### 製品への影響有無

 無

#### 対処方法

- 特に対処は不要です。

### Libraries > Java > Changes for google-cloud-bigquery > 2.49.2

#### 原文

- Update dependency com.google.cloud:sdk-platform-java-config to v3.46.2 (#3756) (907e39f)

#### 説明

- 依存関係の更新:
    - com.google.cloud:sdk-platform-java-config を v3.46.2 にアップデートしました。

#### 製品への影響有無

 無

#### 対処方法

- 特に対処は不要です。

## Cloud Storage

### Libraries > Go > Changes for storage/internal/apiv2 > 1.52.0

#### 原文

- **storage/control:** Add Anywhere cache control APIs (#11807) (12bfa98)
- **storage:** Add CurrentState function to determine state of stream in MRD (#11688) (14e8e13)
- **storage:** Add OwnerEntity to bucketAttrs (#11857) (4cd4a0c)
- **storage:** Takeover appendable object (#11977) (513b937)
- **storage:** Unfinalized appendable objects. (#11647) (52c0218)
- **storage:** Fix Attrs for append takeover (#11989) (6db35b1)
- **storage:** Fix panic when Flush called early (#11934) (7d0b8a7)
- **storage:** Fix unfinalized write size (#12016) (6217f8f)
- **storage:** Force first message on next sendBuffer when nothing sent on current (#11871) (a1a2292)
- **storage:** Populate Writer.Attrs after Flush() (#12021) (8e56f74)
- **storage:** Remove check for FinalizeOnClose (#11992) (2664b8c)
- **storage:** Wrap read response parsing errors (#11951) (d2e6583)

#### 説明

- storage/control: Anywhere キャッシュ制御 API を追加しました。
- storage: MRD でストリームの状態を確認するための CurrentState 関数を追加しました。
- storage: bucketAttrs に OwnerEntity を追加しました。
- storage: 追加可能なオブジェクトの引き継ぎを追加しました。
- storage: ファイナライズされていない追加可能なオブジェクトを追加しました。
- storage: 追加の引き継ぎに関する Attrs を修正しました。
- storage: Flush が早期に呼び出された場合のパニックを修正しました。
- storage: ファイナライズされていない書き込みサイズを修正しました。
- storage: 現在の sendBuffer に何も送信されていない場合、次の sendBuffer で最初のメッセージを強制的に送信するようにしました。
- storage: Flush() 後に Writer.Attrs に値を設定するようにしました。
- storage: FinalizeOnClose のチェックを削除しました。
- storage: 読み取り応答の解析エラーをラップするようにしました。

#### 製品への影響有無

 無

#### 対処方法

- 特に対処は不要です。

### Libraries > Java > Changes for google-cloud-storage > 2.51.0

#### 原文

- Add @BetaApi Storage#blobAppendableUpload for gRPC Transport (#3020) (62b6248)
- Add @BetaApi Storage#blobReadSession for gRPC Transport (#3020) (62b6248)
- Implement improved retry context information (#3020) (62b6248)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.56.0 (8f9f5ec)
- Ensure object generation is sent for Storage#update(BlobInfo) using HTTP Transport (#3006) (2a3e0e7), closes #2980 
- Update 416 handling for ReadChannel (#3018) (4a9c3e4)
- Update gRPC Bidi resumable upload to have more robust error message generation (#2998) (79b5d85)
- Update gRPC implementation for storage.buckets.get to translate NOT_FOUND to null (#3005) (704af65)
- Remove explicit version declarations for packages that are in shared-dependencies  (#3014) (61cdb30)
- Update dependency com.google.apis:google-api-services-storage to v1-rev20250312-2.0.0 (#3000) (78fc076)
- Update dependency com.google.cloud.opentelemetry:exporter-trace to v0.34.0 (#2938) (ff6f696)
- Update sdk-platform-java dependencies (#3046) (861f958)
- Update sdk-platform-java dependencies (#3053) (921d1ba)

#### 説明

- gRPCトランスポート用に `@BetaApi Storage#blobAppendableUpload` と `@BetaApi Storage#blobReadSession` を追加しました。
- リトライコンテキスト情報の改善を実装しました。
- 依存関係の更新:
    - Javaコードジェネレーター (gapic-generator-java) を 2.56.0 にアップデートしました。
    - com.google.apis:google-api-services-storage を v1-rev20250312-2.0.0 にアップデートしました。
    - com.google.cloud.opentelemetry:exporter-trace を v0.34.0 にアップデートしました。
    - sdk-platform-java の依存関係をアップデートしました。
- HTTPトランスポートを使用する `Storage#update(BlobInfo)` にオブジェクトの世代が送信されるようにしました。
- `ReadChannel` の 416 処理を更新しました。
- より堅牢なエラーメッセージ生成のために gRPC Bidi 再開可能なアップロードを更新しました。
- NOT_FOUND を null に変換するために `storage.buckets.get` の gRPC 実装を更新しました。
- 共有依存関係にあるパッケージの明示的なバージョン宣言を削除しました。

#### 製品への影響有無

 無

#### 対処方法

- 特に対処は不要です。

## Google Kubernetes Engine

### Changed

#### 原文

GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

#### 説明

GKEクラスタのバージョンが更新されました。

**アップグレードと新規クラスタで利用可能な新しいバージョン**

以下のKubernetesバージョンが、新規クラスタおよび既存クラスタのオプトインコントロールプレーンアップグレードとノードアップグレードで利用できるようになりました。バージョン管理とアップグレードの詳細については、GKEのバージョン管理とサポートとアップグレードをご覧ください。

#### 製品への影響有無

有

#### 対処方法

- 利用可能なバージョンを確認し、必要であればアップグレードを実施してください。

### Changed > Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

#### 原文

- The following versions are now available in the Rapid channel:
    - 1.30.11-gke.1157000
    - 1.31.7-gke.1265000
    - 1.32.3-gke.1785000
- The following versions are no longer available in the Rapid channel:
    - 1.29.14-gke.1067000
    - 1.29.14-gke.1086000
    - 1.29.15-gke.1170000
    - 1.30.11-gke.1131000
    - 1.31.7-gke.1013002
    - 1.31.7-gke.1212000
    - 1.32.3-gke.1717000

#### 説明

- Rapidチャンネルで以下のバージョンが利用可能になりました:
    - 1.30.11-gke.1157000
    - 1.31.7-gke.1265000
    - 1.32.3-gke.1785000
- Rapidチャンネルで以下のバージョンが利用不可になりました:
    - 1.29.14-gke.1067000
    - 1.29.14-gke.1086000
    - 1.29.15-gke.1170000
    - 1.30.11-gke.1131000
    - 1.31.7-gke.1013002
    - 1.31.7-gke.1212000
    - 1.32.3-gke.1717000

#### 製品への影響有無

- Rapidチャンネルを利用している場合は有

#### 対処方法

- 利用不可になったバージョンを利用している場合は、利用可能なバージョンへのアップグレードを検討してください。

### Changed > Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

#### 原文

- The following versions are no longer available in the Regular channel:
    - 1.29.14-gke.1018000
    - 1.29.14-gke.1067000

#### 説明

- Regularチャンネルで以下のバージョンが利用不可になりました:
    - 1.29.14-gke.1018000
    - 1.29.14-gke.1067000

#### 製品への影響有無

- Regularチャンネルを利用している場合は有

#### 対処方法

- 利用不可になったバージョンを利用している場合は、利用可能なバージョンへのアップグレードを検討してください。

### Changed > Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

#### 原文

- Version 1.32.2-gke.1182003 is now the default version for cluster creation in the Stable channel.
- The following versions are no longer available in the Stable channel:
    - 1.29.13-gke.1038000
    - 1.29.13-gke.1169000

#### 説明

- Stableチャンネルでクラスタ作成時のデフォルトバージョンが 1.32.2-gke.1182003 になりました。
- Stableチャンネルで以下のバージョンが利用不可になりました:
    - 1.29.13-gke.1038000
    - 1.29.13-gke.1169000

#### 製品への影響有無

- Stableチャンネルを利用している場合は有

#### 対処方法

- 利用不可になったバージョンを利用している場合は、利用可能なバージョンへのアップグレードを検討してください。
- デフォルトバージョンが変更されたため、Stableチャンネルで新規にクラスタを作成する場合は、作成されるクラスタのバージョンにご注意ください。

### Changed > Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

#### 原文

- The following versions are now available in the Extended channel:
    - 1.27.16-gke.2650000
    - 1.27.16-gke.2682000
    - 1.28.15-gke.2097000
    - 1.28.15-gke.2142000
    - 1.29.15-gke.1193000
- The following versions are no longer available in the Extended channel:
    - 1.27.16-gke.2595000
    - 1.27.16-gke.2664000
    - 1.28.15-gke.2027000
    - 1.28.15-gke.2121000
    - 1.29.14-gke.1018000
- Auto-upgrade targets are now available for the following minor versions:
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.28.15-gke.2072000 with this release.
- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2633000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.2072000 with this release.
    - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.14-gke.1067000 with this release.

#### 説明

- Extendedチャンネルで以下のバージョンが利用可能になりました:
    - 1.27.16-gke.2650000
    - 1.27.16-gke.2682000
    - 1.28.15-gke.2097000
    - 1.28.15-gke.2142000
    - 1.29.15-gke.1193000
- Extendedチャンネルで以下のバージョンが利用不可になりました:
    - 1.27.16-gke.2595000
    - 1.27.16-gke.2664000
    - 1.28.15-gke.2027000
    - 1.28.15-gke.2121000
    - 1.29.14-gke.1018000
- 自動アップグレードの対象が以下のマイナーバージョンで利用可能になりました:
    - Extendedチャンネルで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン1.28.15-gke.2072000にアップグレードされます。
- メンテナンスの除外またはマイナーバージョンのアップグレードを妨げるその他の要因があるクラスタでは、以下のパッチのみのバージョンの自動アップグレードターゲットが利用できるようになりました:
    - Extendedチャンネルで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン1.27.16-gke.2633000にアップグレードされます。
    - Extendedチャンネルで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン1.28.15-gke.2072000にアップグレードされます。
    - Extendedチャンネルで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.29からバージョン1.29.14-gke.1067000にアップグレードされます。

#### 製品への影響有無

- Extendedチャンネルを利用している場合は有

#### 対処方法

- 利用不可になったバージョンを利用している場合は、利用可能なバージョンへのアップグレードを検討してください。
- 自動アップグレードが有効になっている場合は、アップグレードされるバージョンと、メンテナンスの除外設定を確認してください。

### Changed > Note: Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

#### 原文

- The following versions are now available:
    - 1.30.11-gke.1157000
    - 1.31.7-gke.1265000
    - 1.32.3-gke.1785000
- The following node versions are now available:
    - 1.27.16-gke.2682000
    - 1.28.15-gke.2142000
    - 1.29.15-gke.1193000
    - 1.30.11-gke.1157000
    - 1.31.7-gke.1265000
    - 1.32.3-gke.1785000
- The following versions are no longer available:
    - 1.29.13-gke.1038000
    - 1.29.13-gke.1169000
    - 1.29.14-gke.1018000
    - 1.29.14-gke.1067000
    - 1.29.14-gke.1086000
    - 1.29.15-gke.1170000
    - 1.30.9-gke.1127000
    - 1.30.11-gke.1131000
    - 1.31.7-gke.1013002
    - 1.31.7-gke.1212000
    - 1.32.3-gke.1717000

#### 説明

- 以下のバージョンが利用可能になりました:
    - 1.30.11-gke.1157000
    - 1.31.7-gke.1265000
    - 1.32.3-gke.1785000
- 以下のノードバージョンが利用可能になりました:
    - 1.27.16-gke.2682000
    - 1.28.15-gke.2142000
    - 1.29.15-gke.1193000
    - 1.30.11-gke.1157000
    - 1.31.7-gke.1265000
    - 1.32.3-gke.1785000
- 以下のバージョンが利用不可になりました:
    - 1.29.13-gke.1038000
    - 1.29.13-gke.1169000
    - 1.29.14-gke.1018000
    - 1.29.14-gke.1067000
    - 1.29.14-gke.1086000
    - 1.29.15-gke.1170000
    - 1.30.9-gke.1127000
    - 1.30.11-gke.1131000
    - 1.31.7-gke.1013002
    - 1.31.7-gke.1212000
    - 1.32.3-gke.1717000

#### 製品への影響有無

有

#### 対処方法

- 利用不可になったバージョンを利用している場合は、利用可能なバージョンへのアップグレードを検討してください。

## Pub/Sub

### Libraries > Java > Changes for google-cloud-pubsub > 1.139.1

#### 原文

- Update dependency com.google.cloud:sdk-platform-java-config to v3.46.2 (#2394) (17f7fd7)

#### 説明

- 依存関係の更新:
    - com.google.cloud:sdk-platform-java-config を v3.46.2 にアップデートしました。

#### 製品への影響有無

 無

#### 対処方法

- 特に対処は不要です。

### Libraries > Java > Changes for google-cloud-pubsub > 1.139.0

#### 原文

- Generate renamed go pubsub admin clients (4472d7b)
- Add retries for ack and modack operations that don't return with a metadata map (#2385) (00070b7)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.56.2 (4472d7b)
- Update dependency com.google.cloud:google-cloud-bigquery to v2.49.0 (#2380) (405e485)
- Update dependency com.google.cloud:google-cloud-core to v2.53.1 (#2365) (748058f)
- Update dependency com.google.cloud:google-cloud-storage to v2.50.0 (#2372) (b81164a)
- Update dependency com.google.protobuf:protobuf-java-util to v4.30.1 (#2364) (05eb9c0)
- Update dependency com.google.protobuf:protobuf-java-util to v4.30.2 (#2383) (4119cc0)
- Update documentation for JavaScriptUDF to indicate that the `message_id` metadata field is optional instead of required (f904786)

#### 説明

- 名前変更された Go Pub/Sub 管理クライアントを生成しました。
- メタデータマップを返さない ack および modack 操作にリトライを追加しました。
- 依存関係の更新:
    - Javaコードジェネレーター (gapic-generator-java) を 2.56.2 にアップデートしました。
    - com.google.cloud:google-cloud-bigquery を v2.49.0 にアップデートしました。
    - com.google.cloud:google-cloud-core を v2.53.1 にアップデートしました。
    - com.google.cloud:google-cloud-storage を v2.50.0 にアップデートしました。
    - com.google.protobuf:protobuf-java-util を v4.30.2 にアップデートしました。
- JavaScriptUDF のドキュメントを更新し、`message_id` メタデータフィールドが必須ではなくオプションであることを示しました。

#### 製品への影響有無

 無

#### 対処方法

- 特に対処は不要です。 

# Title: April 25, 2025 
Link: https://cloud.google.com/release-notes#April_25_2025<br>
# Cloud Load Balancing
## Deprecated
**原文**
Starting April 28, 2025, the Global external Application Load Balancer and the Classic Application Load Balancer will no longer allow the use of custom request headers that reference connection-specific hop-by-hop headers.

This change applies only to HTTP/1.1 traffic. Connection-specific hop-by-hop headers are already disallowed by the HTTP/2 and HTTP/3 protocols.

This change is in accordance with RFC 2616 which states that these connection-specific hop-by-hop headers headers are meaningful only for a single transport-level connection and should not be forwarded by proxies.

[RFC 2616](https://datatracker.ietf.org/doc/html/rfc2616#section-13.5.1)
 The impacted hop-by-hop headers are: `Connection`, `Keep-Alive`, `TE`, `Trailer`, `Transfer-Encoding`, and `Upgrade`.

 Starting April 28, 2025, connection-specific hop-by-hop headers that were configured by using custom headers will no longer be applied. These headers will only be set by the load balancer during normal connection handling.

 Starting June 30, 2025, any configuration changes that reference the connection-specific hop-by-hop custom headers will no longer be accepted.

 **What you need to do**

 If you are an HTTP/1.1 user affected by this change, complete the following steps:

- Determine if your application depends on the values of any hop-by-hop headers configured as custom headers. If any dependencies are found, replace them with an allowed custom header and modify your application accordingly.
- Review your backend service and URL map `headerAction` configuration to remove any references to connection-specific hop-by-hop headers.

 Determine if your application depends on the values of any hop-by-hop headers configured as custom headers. If any dependencies are found, replace them with an allowed custom header and modify your application accordingly.

 Review your backend service and URL map `headerAction` configuration to remove any references to connection-specific hop-by-hop headers.

**説明**
2025年4月28日以降、グローバル外部アプリケーションロードバランサーとクラシックアプリケーションロードバランサーにおいて、接続固有のホップバイホップヘッダーを参照するカスタムリクエストヘッダーの使用は許可されなくなります。

この変更は、HTTP/1.1トラフィックのみに適用されます。HTTP/2およびHTTP/3プロトコルでは、接続固有のホップバイホップヘッダーは既に許可されていません。

この変更は、RFC 2616に準拠したものです。RFC 2616では、これらの接続固有のホップバイホップヘッダーは、単一のトランスポートレベル接続に対してのみ意味があり、プロキシによって転送されるべきではないと記載されています。

影響を受けるホップバイホップヘッダーは次のとおりです。`Connection`, `Keep-Alive`, `TE`, `Trailer`, `Transfer-Encoding`, and `Upgrade`.

2025年4月28日以降、カスタムヘッダーを使用して設定された接続固有のホップバイホップヘッダーは適用されなくなります。これらのヘッダーは、通常の接続処理中にロードバランサーによってのみ設定されます。

2025年6月30日以降、接続固有のホップバイホップカスタムヘッダーを参照する設定変更は受け入れられなくなります。

**製品への影響有無**
有 

**対処方法**
HTTP/1.1を使用しており、この変更の影響を受ける場合は、次の手順を実行してください。

- アプリケーションが、カスタムヘッダーとして設定されたホップバイホップヘッダーの値に依存しているかどうかを確認します。依存関係が見つかった場合は、許可されたカスタムヘッダーに置き換え、それに応じてアプリケーションを変更します。
- バックエンドサービスとURLマップの`headerAction`設定を確認し、接続固有のホップバイホップヘッダーへの参照をすべて削除します。
# Title: April 24, 2025 
Link: https://cloud.google.com/release-notes#April_24_2025<br>
## Cloud Composer

### 変更点

**原文:** Starting from June 2025, the default version for new Cloud Composer environments changes from Cloud Composer 2 to Cloud Composer 3. New environments will use the latest default Airflow build (`composer-3-airflow-2`). Currently, the default version is `composer-2-airflow-2`.

**説明:** 2025年6月以降に作成されるCloud Composer環境のデフォルトバージョンが、Cloud Composer 2 から Cloud Composer 3 に変更されます。新しい環境は、最新のデフォルトAirflowビルド(`composer-3-airflow-2`)を使用します。現在のデフォルトバージョンは `composer-2-airflow-2` です。

**製品への影響有無:** 有

**対処方法:** 2025年6月以降もCloud Composer 2 を使用したい場合は、明示的にバージョンを指定して環境を作成する必要があります。また、既存のCloud Composer 2 環境は引き続き動作しますが、将来的には Cloud Composer 3 への移行を検討する必要があります。

---

## Google Kubernetes Engine

### 非推奨

**原文:** Saxml on GKE is de-prioritized beginning April 24, 2025. This means the project won't get further updates. Existing Saxml deployments will continue to function as is without disruption. We *strongly suggest* that you migrate to JetStream, Google's up to date open source inference framework for high-performance LLM serving on TPUs and GPUs. JetStream offers continuous batching and quantization for better throughput and memory efficiency. For a migration example, see Serve Gemma using TPUs on GKE with JetStream.

**説明:**  2025年4月24日以降、Saxml on GKE は非推奨となり、今後のアップデートは提供されません。既存の Saxml デプロイメントは、中断なく引き続き機能します。ただし、TPU および GPU での高性能 LLM 配信のための Google の最新のオープンソース推論フレームワークである JetStream に移行することを強くお勧めします。JetStream は、スループットとメモリ効率を向上させるために、継続的なバッチ処理と量子化を提供します。移行の例については、JetStream を使用した GKE での TPU を使用した Gemma の提供を参照してください。

**製品への影響有無:** 有 (Saxml on GKEを利用している場合)

**対処方法:**  Googleは、TPUおよびGPUでの高性能LLMサービスのための最新のオープンソース推論フレームワークであるJetStreamへの移行を推奨しています。JetStreamは、スループットとメモリ効率を向上させるために、継続的なバッチ処理と量子化を提供します。移行例については、JetStreamを使用したGKEでのTPUを使用したGemmaの提供を参照してください。

# Title: April 21, 2025 
Link: https://cloud.google.com/release-notes#April_21_2025<br>
## BigQuery

### Libraries

#### Node.js

#### Changes for @google-cloud/bigquery

原文: 

* MergeSchemaWithRows can be called with empty schema if result set is empty (#1455) (e608601)

説明：

* 結果セットが空の場合、MergeSchemaWithRowsは空のスキーマで呼び出すことができるようになりました。

影響有無： 無

対処方法：

* 特に対応は不要です。


### Announcement

#### BigQuery now provides spend-based committed use discounts

原文:

* BigQuery now provides spend-based committed use discounts (CUDs). Spend-based committed use discounts provide a discount in exchange for your commitment to spend a minimum amount per hour on PAYG compute resources listed here. You can purchase CUDs with a one or three year commitment period.

説明：

* BigQueryは、新たに消費ベースのコミットメント使用割引(CUD)を提供するようになりました。この割引は、記載されているPAYGコンピューティングリソースに対して、1時間あたりの最低消費額をコミットメントすることで適用されます。CUDは、1年間または3年間のコミットメント期間で購入することができます。

影響有無： 有

対処方法：

* BigQueryの使用料金を削減するために、CUDの利用を検討してください。詳細については、提供されているリンク先を参照してください。


## Cloud Logging

### Libraries

#### Python

#### Changes for google-cloud-logging

原文：

* Add REST Interceptors which support reading metadata (681bcc5)
* Add support for opt-in debug logging (681bcc5)
* Added flushes/close functionality to logging handlers (#917) (d179304)
* Allow protobuf 6.x (#977) (6757890)
* **deps:** Require google-cloud-audit-log >= 0.3.1 (#979) (1cc00ec)
* Fix typing issue with gRPC metadata when key ends in -bin (681bcc5)
* Added documentation on log_level and excluded_loggers params in setup_logging (#971) (70d9d25)
* Update README to break infinite redirect loop (#972) (52cd907)

説明：

* メタデータの読み取りをサポートするRESTインターセプターが追加されました。
* オプトインによるデバッグログのサポートが追加されました。
* ロギングハンドラにフラッシュ/クローズ機能が追加されました。
* protobuf 6.xのサポートが追加されました。
* google-cloud-audit-logのバージョンが0.3.1以上に変更されました。
* キーが-binで終わる場合のgRPCメタデータの型付けの問題が修正されました。
* setup_loggingのlog_levelパラメータとexcluded_loggersパラメータに関するドキュメントが追加されました。
* 無限リダイレクトループを解消するためにREADMEが更新されました。

影響有無： 有

対処方法：

* google-cloud-loggingを使用している場合は、最新バージョン(3.12.0)にアップグレードしてください。
* google-cloud-audit-logを使用している場合は、バージョン0.3.1以降を使用していることを確認してください。
# Title: April 18, 2025 
Link: https://cloud.google.com/release-notes#April_18_2025<br>
## Google Kubernetes Engine

### Changed

原文: 
> GKE cluster versions have been updated.
> 
> **New versions available for upgrades and new clusters.**
> 
> The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades.
> 
> [GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
> [Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

説明: 
GKEクラスタバージョンが更新されました。新規クラスタおよび既存クラスタのオプトインコントロールプレーンアップグレードとノードアップグレードで利用可能な Kubernetes バージョンが提供開始されました。

影響有無: 無

対処方法:  特になし。 


### Changed
原文:
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
>
> - Version 1.32.2-gke.1182003 is now the default version for cluster creation in the Rapid channel.
> - The following versions are now available in the Rapid channel:
>   - 1.29.15-gke.1170000
>   - 1.30.11-gke.1131000
>   - 1.31.6-gke.1099001
>   - 1.31.7-gke.1212000
>   - 1.32.2-gke.1297002
>   - 1.32.3-gke.1717000
> - The following versions are no longer available in the Rapid channel:
>   -  (省略)
> - Auto-upgrade targets are now available for the following minor versions:
>   - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.6-gke.1064001 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.2-gke.1182003 with this release.
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
>   - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.6-gke.1064001 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.2-gke.1182003 with this release.
> 
> (リンク省略)


説明: 
Rapidチャネルで、クラスタ作成時のデフォルトバージョンが 1.32.2-gke.1182003 に更新されました。また、Rapidチャネルで利用可能なバージョンと、利用できなくなったバージョンが更新されました。自動アップグレードが有効になっているクラスタは、1.30 から 1.31.6-gke.1064001、1.31 から 1.32.2-gke.1182003 にアップグレードされます。メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタ向けに、パッチのみのバージョン自動アップグレードターゲットが利用可能です。

影響有無: 有

対処方法: 
- リリースノートに記載されている利用可能なバージョンと利用できなくなったバージョンを確認し、必要があれば対応してください。
- 自動アップグレードが有効になっているクラスタは、アップグレードが自動的に行われるため、影響範囲を確認してください。
- メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタについては、パッチのみのバージョン自動アップグレードターゲットを適用するかどうか検討してください。


### Changed
原文:
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
> 
> - Version 1.32.2-gke.1182003 is now the default version for cluster creation in the Regular channel.
> - The following versions are now available in the Regular channel:
>   - 1.31.6-gke.1064001
>   - 1.32.2-gke.1182003
> - The following versions are no longer available in the Regular channel:
>   - (省略)
> - Auto-upgrade targets are now available for the following minor versions:
>   - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.10-gke.1070000 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.31.6-gke.1064001 with this release.
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
>   - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.10-gke.1070000 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.6-gke.1064001 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.32 to version 1.32.2-gke.1182003 with this release.
> 
> (リンク省略)

説明: 
Regular チャネルで、クラスタ作成時のデフォルトバージョンが 1.32.2-gke.1182003 に更新されました。また、Regular チャネルで利用可能なバージョンと、利用できなくなったバージョンが更新されました。自動アップグレードが有効になっているクラスタは、1.29 から 1.30.10-gke.1070000、1.30 から 1.31.6-gke.1064001 にアップグレードされます。メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタ向けに、パッチのみのバージョン自動アップグレードターゲットが利用可能です。

影響有無: 有

対処方法: 
- リリースノートに記載されている利用可能なバージョンと利用できなくなったバージョンを確認し、必要があれば対応してください。
- 自動アップグレードが有効になっているクラスタは、アップグレードが自動的に行われるため、影響範囲を確認してください。
- メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタについては、パッチのみのバージョン自動アップグレードターゲットを適用するかどうか検討してください。


### Changed
原文:
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
> 
> - Version 1.31.6-gke.1064001 is now the default version for cluster creation in the Stable channel.
> - The following versions are now available in the Stable channel:
>   - 1.31.6-gke.1064001
>   - 1.32.2-gke.1182003
> - The following versions are no longer available in the Stable channel:
>   - (省略)
> - Auto-upgrade targets are now available for the following minor versions:
>   - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.10-gke.1070000 with this release.
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
>   - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.10-gke.1070000 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.31 to version 1.31.6-gke.1064001 with this release.
> 
> (リンク省略)

説明: 
Stableチャネルで、クラスタ作成時のデフォルトバージョンが 1.31.6-gke.1064001 に更新されました。また、Stableチャネルで利用可能なバージョンと、利用できなくなったバージョンが更新されました。自動アップグレードが有効になっているクラスタは、1.29 から 1.30.10-gke.1070000 にアップグレードされます。メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタ向けに、パッチのみのバージョン自動アップグレードターゲットが利用可能です。

影響有無: 有

対処方法: 
- リリースノートに記載されている利用可能なバージョンと利用できなくなったバージョンを確認し、必要があれば対応してください。
- 自動アップグレードが有効になっているクラスタは、アップグレードが自動的に行われるため、影響範囲を確認してください。
- メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタについては、パッチのみのバージョン自動アップグレードターゲットを適用するかどうか検討してください。


### Changed
原文:
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
> 
> - Version 1.32.2-gke.1182003 is now the default version for cluster creation in the Extended channel.
> - The following versions are now available in the Extended channel:
>   - 1.27.16-gke.2664000
>   - 1.28.15-gke.2121000
>   - 1.31.6-gke.1064001
>   - 1.32.2-gke.1182003
> - The following versions are no longer available in the Extended channel:
>   - (省略)
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
>   - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2595000 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.2027000 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.10-gke.1070000 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.6-gke.1064001 with this release.
>   - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.32 to version 1.32.2-gke.1182003 with this release.
> 
> (リンク省略)

説明: 
Extendedチャネルで、クラスタ作成時のデフォルトバージョンが 1.32.2-gke.1182003 に更新されました。また、Extendedチャネルで利用可能なバージョンと、利用できなくなったバージョンが更新されました。メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタ向けに、パッチのみのバージョン自動アップグレードターゲットが利用可能です。

影響有無: 有

対処方法: 
- リリースノートに記載されている利用可能なバージョンと利用できなくなったバージョンを確認し、必要があれば対応してください。
- 自動アップグレードが有効になっているクラスタは、アップグレードが自動的に行われるため、影響範囲を確認してください。
- メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタについては、パッチのみのバージョン自動アップグレードターゲットを適用するかどうか検討してください。

### Changed
原文:
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
> 
> - Version 1.32.2-gke.1182003 is now the default version for cluster creation.
> - The following versions are now available:
>   - (省略)
> - The following node versions are now available:
>   - (省略)
> - The following versions are no longer available:
>   - (省略)
> - Auto-upgrade targets are now available for the following minor versions:
>   - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.10-gke.1070000 with this release.
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
>   - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.10-gke.1070000 with this release.
>   - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.31 to version 1.31.6-gke.1064001 with this release.
>   - Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.32 to version 1.32.2-gke.1182003 with this release.
> 
> (リンク省略)

説明: 
GKE クラスタのバージョンが更新され、クラスタ作成時のデフォルトバージョンが 1.32.2-gke.1182003 に更新されました。利用可能なバージョンと、利用できなくなったバージョンが更新されました。自動アップグレードが有効になっているクラスタは、1.29 から 1.30.10-gke.1070000 にアップグレードされます。メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタ向けに、パッチのみのバージョン自動アップグレードターゲットが利用可能です。

影響有無: 有

対処方法: 
- リリースノートに記載されている利用可能なバージョンと利用できなくなったバージョンを確認し、必要があれば対応してください。
- 自動アップグレードが有効になっているクラスタは、アップグレードが自動的に行われるため、影響範囲を確認してください。
- メンテナンス除外などが原因でマイナーバージョンアップグレードができないクラスタについては、パッチのみのバージョン自動アップグレードターゲットを適用するかどうか検討してください。


## Google Cloud Composer2

### 該当なし
Google Cloud Composer2 (Compoer version 2.7.1、Airflow version 2.7.3)に関するリリースノートは、提供されたリリースノートに含まれていません。
# Title: April 16, 2025 
Link: https://cloud.google.com/release-notes#April_16_2025<br>
## Cloud Service Mesh 

### Announcement

#### 原文
In-cluster Cloud Service Mesh 1.21 is no longer supported. For more information and to view the earliest end-of-life dates for other versions, see Supported versions.

[Supported versions](https://cloud.google.com/service-mesh/docs/supported-features-in-cluster#supported_versions)

#### 説明
Cloud Service Mesh のバージョン 1.21 はサポートが終了しました。サポートされているバージョンを確認するには、記載された Supported versions のリンクを参照してください。

#### 影響有無
有

#### 対処方法
Cloud Service Mesh 1.21 を使用している場合は、サポートされているバージョンにアップグレードする必要があります。サポートされているバージョンについては、提供されたリンク先を参照してください。 

# Title: April 14, 2025 
Link: https://cloud.google.com/release-notes#April_14_2025<br>
## Apigee X

### Announcement

**原文:** On April 14, 2025 we released an updated version of Apigee. 

**説明:**  2025年4月14日に、Apigeeのアップデートバージョンがリリースされました。

**影響有無:**  情報が不足しているため、影響の有無は判断できません。 Apigeeのバージョンやアップデート内容の詳細が不明です。

**対処方法:**  

- リリースノートの詳細を確認し、利用中のApigeeバージョンへの影響を調査してください。
- アップデート内容によっては、設定変更や対応が必要となる場合があります。
# Title: April 10, 2025 
Link: https://cloud.google.com/release-notes#April_10_2025<br>
<h1>Apigee X</h1>
## Announcement
<b>原文:</b> On April 10, 2025, we released an updated version of Apigee.
<b>説明:</b> 2025年4月10日に、Apigeeのアップデートバージョンがリリースされました。 
<b>影響有無:</b> 情報が少なすぎて判断できません。Apigeeのバージョンやアップデート内容の詳細が不明です。
<b>対処方法:</b> リリースノートの詳細を確認し、アップデート内容と自身の環境への影響を評価してください。必要があれば、Apigeeのドキュメントを参照するか、Google Cloudのサポートに問い合わせてください。 

# Title: April 09, 2025 
Link: https://cloud.google.com/release-notes#April_09_2025<br>
## AlloyDB for PostgreSQL

### Announcement 1

**原文:**
The `alloydb_scann` extension is updated to include the following vector search improvements. These features are generally available (GA):

[GA](https://cloud.google.com/products#product-launch-stages)
- Inline filtering enables the execution of vector search and filter evaluation through the combined use of vector and secondary indexes.  For more information, see "Inline filtering" in the documentation for AlloyDB PostgreSQL and AlloyDB Omni 15.7.1 and 16.3.0. 
- You can let AlloyDB automatically create multiple parallel workers during index creation when the dataset grows, leading to faster build times. For more information, see "Build indexes in parallel" in the documentation for AlloyDB PostgreSQL and AlloyDB Omni 15.7.1 and 16.3.0.
- A distribution histogram is available in the `pg_stat_ann_indexes` view, which helps you understand the distribution of vectors between partitions of your ScaNN index. For more information, including recommendations about tuning the `distributionpercentile` metric, see "Tuning metrics"  in the documentation for AlloyDB PostgreSQL, and AlloyDB Omni 15.7.1 and 16.3.0.
- You can use a query recall evaluator to find the recall for a vector query for a given configuration, and to tune your parameters to achieve the desired vector query recall results for different vector indexes. For more information, see "Measure vector query recall"  in the documentation for AlloyDB PostgreSQL, and AlloyDB Omni 15.7.1 and 16.3.0.

**説明:**
AlloyDB for PostgreSQL の `alloydb_scann` 拡張機能がアップデートされ、ベクトル検索機能に以下の改善が加えられました。これらの機能は一般提供 (GA) されます。

- インラインフィルタリング: ベクトルインデックスとセカンダリインデックスを組み合わせて使用することで、ベクトル検索とフィルタ評価を同時実行できるようになりました。
- インデックスの並列作成: データセットの増加時に、AlloyDB がインデックス作成中に自動的に複数のパラレルワーカーを作成するようになり、ビルド時間が短縮されました。
- 分布ヒストグラム: `pg_stat_ann_indexes` ビューで分布ヒストグラムが利用可能になりました。これは、ScaNN インデックスのパーティション間におけるベクトルの分布を理解するのに役立ちます。
- クエリリコールエバリュエータ: 特定の構成におけるベクトルクエリの再現率を調べるために使用できるようになり、異なるベクトルインデックスに対して目的のベクトルクエリ再現率結果を達成するようにパラメータを調整できます。

**製品への影響有無:** 無

**対処方法:**
- 特に対処は不要です。GAされた機能なので、必要に応じて利用してください。


### Announcement 2
**原文:**
The `alloydb_scann` extension is updated to include the following vector search improvements in (Preview):

[Preview](https://cloud.google.com/products#product-launch-stages)
- You can enable auto-maintenance for your ScaNN index and let incrementally manage the index such that when your dataset grows, AlloyDB splits large outlier partitions, and tries to provide better QPS and search results. For more information, see "Maintain indexes automatically" in the documentation for AlloyDB PostgreSQL and AlloyDB Omni 15.7.1 and 16.3.0.
- Adaptive filtering for ScaNN significantly improves the speed of filtered vector searches. Adaptive filtering automatically selects the most efficient filtering method at runtime. For more information, see "Filtered vector search" and "Adaptive filtering" in the documentation for AlloyDB for PostgreSQL and AlloyDB Omni 15.7.1 and 16.3.0. 
- You can enable index auto maintenance and adaptive inline filtering together using the `scann.enable_preview_features` Grand Unified Configuration (GUC) parameters. For more information, see "AlloyDB flags" for AlloyDB for PostgreSQL and AlloyDB Omni 15.7.1 and 16.3.0.

**説明:**
AlloyDB for PostgreSQL の `alloydb_scann` 拡張機能がアップデートされ、ベクトル検索機能に以下の改善が加えられました。これらの機能はプレビュー段階です。

- ScaNN インデックスの自動メンテナンス: ScaNN インデックスの自動メンテナンスを有効化できるようになりました。データセットの増加に伴い、AlloyDB が大きな外れ値パーティションを分割し、より良い QPS と検索結果を提供しようとします。
- ScaNN の適応フィルタリング:  フィルタリングされたベクトル検索の速度が大幅に向上しました。適応フィルタリングは、実行時に最も効率的なフィルタリング方法を自動的に選択します。
- インデックスの自動メンテナンスと適応型インラインフィルタリングの同時有効化:  `scann.enable_preview_features` Grand Unified Configuration (GUC) パラメータを使用して、インデックスの自動メンテナンスと適応型インラインフィルタリングを同時に有効化できます。

**製品への影響有無:** 無

**対処方法:**
- プレビュー機能を試したい場合は、`scann.enable_preview_features` GUC パラメータを有効化してください。


## BigQuery

### Changed 1

**原文:**
Updated pricing, packaging, and setup guidance is now available for Gemini in BigQuery.

**説明:**
BigQuery での Gemini の料金、パッケージ、セットアップに関するガイダンスが更新されました。

**製品への影響有無:** 有

**対処方法:** 
- Gemini in BigQuery を利用している場合は、料金、パッケージ、セットアップの変更点を確認してください。
 [Gemini in BigQuery](https://cloud.google.com/gemini/docs/bigquery/set-up-gemini) 


### Changed 2

**原文:**
 *Analytics Hub* has been renamed *BigQuery sharing*. You'll see this new name in the documentation set and the marketing collateral. The product functionality and endpoints remain the same. For more information, see Introduction to data governance in BigQuery.

**説明:**
*Analytics Hub* は *BigQuery sharing* に名称変更されました。ドキュメントセットとマーケティング資料で、この新しい名称が表示されます。製品の機能とエンドポイントは変わりません。

**製品への影響有無:** 無

**対処方法:**
- 名称変更のみなので、特に対処は不要です。


### Announcement

**原文:**
 *Dataplex Catalog* has been renamed *BigQuery universal catalog*. You'll see this new name in the product page of the Google Cloud console, the documentation set, and the marketing collateral. Universal catalog brings together the data catalog capabilities of Dataplex Catalog and the runtime metastore capabilities of BigQuery metastore. For more information, see Introduction to data governance in BigQuery.

**説明:**
*Dataplex Catalog* は *BigQuery universal catalog* に名称変更されました。Google Cloud コンソールの製品ページ、ドキュメントセット、マーケティング資料で、この新しい名称が表示されます。Universal catalog は、Dataplex Catalog のデータカタログ機能と BigQuery metastore のランタイムメタストア機能を統合したものです。

**製品への影響有無:**  無

**対処方法:**
- 名称変更のみなので、特に対処は不要です。


## Cloud Composer

### Issue

**原文:**
The Airflow web server in Cloud Composer 3 requires at least 2 GB of memory when an environment is created or updated. This might lead to longer operation times or failures to perform these operations.

As a workaround, when you create a new Cloud Composer 3 environment or upgrade an existing environment, provide at least 2 GB of memory (default value) to the Airflow web server.

**説明:**
Cloud Composer 3 の Airflow Web サーバーは、環境の作成時または更新時に少なくとも 2 GB のメモリを必要とします。このため、これらの操作に時間がかかったり、操作が失敗したりする可能性があります。

**製品への影響有無:** 有

**対処方法:**
- 新しい Cloud Composer 3 環境を作成するか、既存の環境をアップグレードする場合は、Airflow Web サーバーに少なくとも 2 GB のメモリ (デフォルト値) を割り当ててください。

# Title: April 08, 2025 
Link: https://cloud.google.com/release-notes#April_08_2025<br>
# Google Kubernetes Engine
## Changed
### 原文
GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

 The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)
### 説明
GKEクラスタバージョンが更新されました。新しいバージョンが、アップグレードと新規クラスタ作成に利用できるようになりました。詳細については、GKEのバージョニングとサポート、アップグレードに関するドキュメントを参照してください。
### 影響有無
無し
### 対処方法
- 特に対処は不要です。 

## Changed
### 原文
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Rapid channel:

- 1.29.15-gke.1134000
- 1.30.11-gke.1093000
- 1.31.7-gke.1149000
- 1.32.2-gke.1182003
- 1.32.3-gke.1440000

- 1.29.15-gke.1134000
- 1.30.11-gke.1093000
- 1.31.7-gke.1149000
- 1.32.2-gke.1182003
- 1.32.3-gke.1440000

[1.29.15-gke.1134000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.11-gke.1093000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1149000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.2-gke.1182003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[1.32.3-gke.1440000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
### 説明
Rapidチャネルで以下のバージョンが利用可能になりました。リリースノート公開時、これらのバージョンはすべてのGoogle Cloudゾーンへの展開が進行中であり、完了までに数日かかる可能性があります。利用可能なバージョンは1.29.15-gke.1134000、1.30.11-gke.1093000、1.31.7-gke.1149000、1.32.2-gke.1182003、1.32.3-gke.1440000です。各バージョンへの変更点は、記載されたリンクを参照してください。
### 影響有無
無し
### 対処方法
- 特に対処は不要です。 


## Changed
### 原文
There are no new releases in the Regular channel.
### 説明
Regularチャネルの新しいリリースはありません。
### 影響有無
無し
### 対処方法
- 特に対処は不要です。 

## Changed
### 原文
There are no new releases in the Stable channel.
### 説明
Stableチャネルの新しいリリースはありません。
### 影響有無
無し
### 対処方法
- 特に対処は不要です。 

## Changed
### 原文
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Extended channel:

- 1.27.16-gke.2650000
- 1.28.15-gke.2097000

- 1.27.16-gke.2650000
- 1.28.15-gke.2097000

[1.27.16-gke.2650000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.2097000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
### 説明
Extendedチャネルで以下のバージョンが利用可能になりました。リリースノート公開時、これらのバージョンはすべてのGoogle Cloudゾーンへの展開が進行中であり、完了までに数日かかる可能性があります。利用可能なバージョンは1.27.16-gke.2650000、1.28.15-gke.2097000です。各バージョンへの変更点は、記載されたリンクを参照してください。
### 影響有無
無し
### 対処方法
- 特に対処は不要です。 

## Changed
### 原文
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available:

- 1.29.15-gke.1134000
- 1.30.11-gke.1093000
- 1.31.7-gke.1149000
- 1.32.2-gke.1182003
- 1.32.3-gke.1440000

- The following node versions are now available:

- 1.27.16-gke.2650000
- 1.28.15-gke.2097000
- 1.29.15-gke.1134000
- 1.30.11-gke.1093000
- 1.31.7-gke.1149000
- 1.32.2-gke.1182003
- 1.32.3-gke.1440000

- 1.29.15-gke.1134000
- 1.30.11-gke.1093000
- 1.31.7-gke.1149000
- 1.32.2-gke.1182003
- 1.32.3-gke.1440000

[1.29.15-gke.1134000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.11-gke.1093000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1149000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.2-gke.1182003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[1.32.3-gke.1440000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
- 1.27.16-gke.2650000
- 1.28.15-gke.2097000
- 1.29.15-gke.1134000
- 1.30.11-gke.1093000
- 1.31.7-gke.1149000
- 1.32.2-gke.1182003
- 1.32.3-gke.1440000

[1.27.16-gke.2650000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.2097000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.15-gke.1134000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.11-gke.1093000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011)
[1.31.7-gke.1149000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317)
[1.32.2-gke.1182003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[1.32.3-gke.1440000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
### 説明
リリースノート公開時、これらのバージョンはすべてのGoogle Cloudゾーンへの展開が進行中であり、完了までに数日かかる可能性があります。

以下のバージョンが利用可能になりました。
- 1.29.15-gke.1134000
- 1.30.11-gke.1093000
- 1.31.7-gke.1149000
- 1.32.2-gke.1182003
- 1.32.3-gke.1440000

以下のノードバージョンが利用可能になりました。
- 1.27.16-gke.2650000
- 1.28.15-gke.2097000
- 1.29.15-gke.1134000
- 1.30.11-gke.1093000
- 1.31.7-gke.1149000
- 1.32.2-gke.1182003
- 1.32.3-gke.1440000

各バージョンへの変更点は、記載されたリンクを参照してください。
### 影響有無
無し
### 対処方法
- 特に対処は不要です。 

# Title: April 07, 2025 
Link: https://cloud.google.com/release-notes#April_07_2025<br>
## BigQuery

###  JDBC driver for BigQuery のアップデート 
原文：An updated version of JDBC driver for BigQuery is now available.

説明：BigQuery 用の JDBC ドライバのアップデートバージョンが利用可能になりました。

影響有無：有

対処方法：JDBCドライバーを最新バージョンに更新することを推奨します。

### BigQuery ML の embedding generation での動的トークンベースのバッチ処理

原文：BigQuery ML now uses dynamic token-based batching for embedding generation requests. Dynamic token-based batching puts as many rows as possible into one request. This change boosts per-request utilization and improves scalability for any queries per minute (QPM) quota. Actual performance varies based on the embedding content length, with an average 10x improvement.

説明：BigQuery ML の embedding generation リクエストで、動的トークンベースのバッチ処理が使用されるようになりました。これにより、可能な限り多くの行が1つのリクエストにまとめられます。この変更により、リクエストごとの使用率が向上し、クエリ/分（QPM）のクォータのスケーラビリティが向上します。実際のパフォーマンスは埋め込みコンテンツの長さによって異なりますが、平均で10倍の改善が見られます。

影響有無：有

対処方法：特に対処は必要ありません。embedding generation のパフォーマンス向上が見込めます。


## Cloud Composer

### Cloud Composer 環境の GKE クラスタに対するメンテナンス除外期間について

原文：All Cloud Composer environment's GKE clusters are set up with **maintenance exclusions** from March 27, 2025 to April 12, 2025. 

説明：2025年3月27日から2025年4月12日にかけて、全てのCloud Composer環境のGKEクラスタに対してメンテナンス除外期間が設定されます。この期間中は、GKEクラスタに対する計画メンテナンスは実施されません。

影響有無：有

対処方法：メンテナンス除外期間中は、GKEクラスタのアップグレードやセキュリティパッチの適用などが行われません。そのため、この期間の前後にGKEクラスタのメンテナンスウィンドウを計画することを推奨します。


## Pub/Sub

### Cloud SDK のクライアントライブラリの週間更新サマリー

原文：A weekly digest of client library updates from across the Cloud SDK.

説明：これは Cloud SDK 全体のクライアントライブラリのアップデートに関する週間サマリーです。個別の変更点はリンク先を参照する必要があります。

影響有無：具体的な変更内容によるため不明

対処方法：利用しているライブラリがある場合は、変更内容を確認し、必要な対応を行う必要があります。 


### pubsub/apiv1 Go ライブラリの更新

原文：Changes for pubsub/apiv1 [pubsub/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/pubsub/apiv1) [1.48.1](https://github.com/googleapis/google-cloud-go/compare/pubsub/v1.48.0...pubsub/v1.48.1) - **pubsub/pstest:** Message ordering issue (#11603) (1d6ffc0) - **pubsub:** Update golang.org/x/net to 0.37.0 (1144978) [#11603](https://github.com/googleapis/google-cloud-go/issues/11603) [1d6ffc0](https://github.com/googleapis/google-cloud-go/commit/1d6ffc02cd211368eabbc8e4f02392952c603703) [1144978](https://github.com/googleapis/google-cloud-go/commit/11449782c7fb4896bf8b8b9cde8e7441c84fb2fd) - **pubsub:** Update documentation for JavaScriptUDF to indicate that the `message_id` metadata field is optional instead of required (f437f08) [f437f08](https://github.com/googleapis/google-cloud-go/commit/f437f0871a88abbeb918ce7364d0299a513cc311) 

説明：Go 用の Pub/Sub クライアントライブラリ (pubsub/apiv1) のバージョン 1.48.1 がリリースされました。

- メッセージ順序に関する問題の修正 (#11603)
- golang.org/x/net のバージョンが 0.37.0 にアップデート
- JavaScriptUDF のドキュメントが更新され、`message_id` メタデータフィールドが必須ではなくオプションであることが明記

影響有無：有

対処方法：Go 用の Pub/Sub クライアントライブラリを使用している場合は、バージョン 1.48.1 にアップデートすることを推奨します。特に、メッセージの順序に関する問題 (#11603) が修正されているため、該当する場合はアップデートが必須となります。 
# Title: April 04, 2025 
Link: https://cloud.google.com/release-notes#April_04_2025<br>
# Cloud Service Mesh
## Announcement:  Cloud Service Mesh in-cluster でバージョン 1.25.0-asm.8 が利用可能に
**原文**
1.25.0-asm.8 is now available for in-cluster Cloud Service Mesh.

You can now download 1.25.0-asm.8 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.25.0 subject to the list of supported features.

[Istio 1.25.0](https://istio.io/latest/news/releases/1.25.x/announcing-1.25/)
[supported features](https://cloud.google.com/service-mesh/docs/supported-features-in-cluster)

**説明** 
Cloud Service Mesh の in-cluster デプロイメントモデルにおいて、バージョン 1.25.0-asm.8 が利用可能になりました。このバージョンでは Istio 1.25.0 の機能が利用できますが、サポートされる機能一覧をご確認ください。

**製品への影響有無**:  有

**対処方法**: Cloud Service Mesh をバージョン 1.25.0-asm.8 にアップグレードする場合は、サポートされている機能、非サポートの環境変数とアノテーション、Envoy のバージョン (v1.33.1-dev) について、リリースノートとドキュメントをよく確認してください。

## Announcement: 一部の環境変数とアノテーションがサポートされない
**原文** 
The following environment variables are not supported:

- PILOT_MX_ADDITIONAL_LABELS
- PILOT_DNS_CARES_UDP_MAX_QUERIES
- PILOT_DNS_JITTER_DURATION
- PILOT_SEND_UNHEALTHY_ENDPOINTS

 The following annotations are not supported:

- networking.istio.io/traffic-distribution
- istio.io/reroute-virtual-interfaces

**説明**
Cloud Service Mesh 1.25.0-asm.8 では、以下の環境変数とアノテーションはサポートされていません。

- 環境変数:
    - PILOT_MX_ADDITIONAL_LABELS
    - PILOT_DNS_CARES_UDP_MAX_QUERIES
    - PILOT_DNS_JITTER_DURATION
    - PILOT_SEND_UNHEALTHY_ENDPOINTS
- アノテーション:
    - networking.istio.io/traffic-distribution
    - istio.io/reroute-virtual-interfaces

**製品への影響有無**: 有

**対処方法**: これらの環境変数やアノテーションを使用している場合は、代替手段を検討する必要があります。詳細については、Cloud Service Mesh のドキュメントを参照してください。

## Announcement: Cloud Service Mesh のアップグレード
**原文**
For details on upgrading Cloud Service Mesh, see Upgrade Cloud Service Mesh.  Cloud Service Mesh version 1.25.0-asm.8 uses Envoy v1.33.1-dev.

[Upgrade Cloud Service Mesh](https://cloud.google.com/service-mesh/docs/upgrade/upgrade)

**説明**
Cloud Service Mesh のアップグレード手順については、提供されているドキュメントを参照してください。Cloud Service Mesh バージョン 1.25.0-asm.8 では、Envoy v1.33.1-dev が使用されています。

**製品への影響有無**:  有

**対処方法**: Cloud Service Mesh をアップグレードする前に、アップグレード手順と、新しいバージョンで発生する可能性のある変更点について、ドキュメントをよく確認してください。


## Issue: 1.24.3 から 1.25.x へのアップグレード時の Gateway CR のダウンタイム
**原文**
There is a known issue where all gateway CRs will see a downtime for status updates when upgrading from 1.24.3 to 1.25.x .

[known issue](https://github.com/istio/istio/issues/55787)

**説明** 
バージョン 1.24.3 から 1.25.x にアップグレードする際、すべての Gateway カスタムリソース (CR) のステータス更新にダウンタイムが発生することが既知の問題として報告されています。

**製品への影響有無**:  有

**対処方法**:  この問題の影響を受ける場合は、提供されている GitHub の Issue を参照し、回避策があるかどうかを確認してください。 

# Title: April 03, 2025 
Link: https://cloud.google.com/release-notes#April_03_2025<br>
## Cloud Composer

### Announcement: Unification of Cloud Composer 3 billing with BigQuery paused (January 12, 2025)

**原文:** The unification of Cloud Composer 3 billing with BigQuery is paused until further notice. The change was previously scheduled for April 13, 2025.

**説明:** Cloud Composer 3 の課金と BigQuery の課金を統合する予定でしたが、無期限で延期されました。当初は2025年4月13日に実施される予定でした。

**影響有無:** 無

**対処方法:** 特に対処は不要です。 

---

### Issue: Increased CPU usage during Airflow web server initialization in Cloud Composer 3 (Affects composer-3-airflow-2.10.2-build.12 and composer-3-airflow-2.9.3-build.19)

**原文:** In recently released Airflow builds of Cloud Composer 3, the Airflow web server requires more CPU to finish its initialization when an environment is created or updated. This might lead to longer operation times or failures to perform these operations. 

As a workaround, when you create a new Cloud Composer 3 environment or upgrade an existing environment, provide at least 1 CPU to the Airflow web server.

This issue currently affects composer-3-airflow-2.10.2-build.12 and composer-3-airflow-2.9.3-build.19 Airflow builds.

**説明:**  Cloud Composer 3 の最新 Airflow ビルドでは、環境の作成時または更新時に Airflow Web サーバーの初期化に多くの CPU が必要となります。 そのため、これらの操作に時間がかかったり、失敗したりする可能性があります。

**影響有無:** 有 (composer-3-airflow-2.10.2-build.12 と composer-3-airflow-2.9.3-build.19 を利用している場合)

**対処方法:**  新しい Cloud Composer 3 環境を作成するか、既存の環境をアップグレードする際には、Airflow Web サーバーに少なくとも 1 CPU を割り当ててください。 

# Title: April 02, 2025 
Link: https://cloud.google.com/release-notes#April_02_2025<br>
## API Gateway

### Announcement

**原文:** On April 2, 2025, we released an updated version of API Gateway.

**説明:** 2025年4月2日に、API Gatewayのアップデートバージョンがリリースされました。

**影響有無:** 無

**対処方法:** 特に対処は不要です。


## AlloyDB for PostgreSQL

### Issue

**原文:** When the ScaNN index creation updates the `reltuples` statistics of a heap table, performance might be degraded for queries involving that table. For information to mitigate the issue, see "Analyze your indexed table" in the documentation for AlloyDB for PostgreSQL and AlloyDB Omni.

**説明:** ScaNNインデックスの作成がヒープテーブルの `reltuples` 統計情報を更新すると、そのテーブルを含むクエリの性能が低下する可能性があります。

**影響有無:** 有

**対処方法:** 問題を軽減する方法については、AlloyDB for PostgreSQLおよびAlloyDB Omniのドキュメントの「Analyze your indexed table」を参照してください。


## BigQuery

### Changed

**原文:** The Python code that you generate using Gemini in BigQuery Notebooks is now much more likely to leverage your data. With this change, BigQuery Notebooks can intelligently pull relevant table names directly from your BigQuery project, resulting in personalized, executable Python code.

**説明:**  BigQuery NotebooksでGeminiを使用して生成するPythonコードが、データの活用にさらに役立つようになりました。この変更により、BigQuery NotebooksはBigQueryプロジェクトから関連するテーブル名をインテリジェントに直接取得できるようになり、パーソナライズされた実行可能なPythonコードが生成されます。

**影響有無:** 有

**対処方法:**  BigQuery NotebooksでGeminiを使用する場合は、生成されるPythonコードが以前と比べて改善されている可能性があります。変更点を確認してください。


## Google Kubernetes Engine

### Changed

**原文:** GKE cluster versions have been updated. 
  **New versions available for upgrades and new clusters.** 
  The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades.

**説明:** GKEクラスタバージョンが更新されました。
  新しいクラスタとアップグレードに新しいバージョンが利用可能です。
  以下のKubernetesバージョンが、新しいクラスタ、および既存クラスタのオプトインコントロールプレーンアップグレードとノードアップグレードで利用できるようになりました。バージョン管理とアップグレードの詳細については、GKEバージョン管理とサポート、およびアップグレードを参照してください。

**影響有無:** 無

**対処方法:**  GKEクラスタのバージョンアップを検討している場合は、利用可能なバージョンを確認してください。


### Changed

**原文:**  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
 - The following versions are now available in the Rapid channel:
 - 1.29.15-gke.1108000
 - 1.30.11-gke.1072000
 - 1.31.5-gke.1169001
 - 1.31.5-gke.1233001
 - 1.31.6-gke.1020001
 - 1.31.6-gke.1064001
 - 1.31.7-gke.1013002
 - 1.31.7-gke.1112000
 - 1.32.2-gke.1182002
 - 1.32.3-gke.1170000
 - 1.29.15-gke.1108000
 - 1.30.11-gke.1072000
 - 1.31.5-gke.1169001
 - 1.31.5-gke.1233001
 - 1.31.6-gke.1020001
 - 1.31.6-gke.1064001
 - 1.31.7-gke.1013002
 - 1.31.7-gke.1112000
 - 1.32.2-gke.1182002
 - 1.32.3-gke.1170000

**説明:** > 注: リリースノートの公開時点でロールアウトはすでに進行中であり、Google Cloudのすべてのゾーンで完了するまでに数日かかる場合があるため、クラスタでこれらのバージョンが利用できない場合があります。
 - Rapidチャネルで以下のバージョンが利用できるようになりました。
 - 1.29.15-gke.1108000
 - 1.30.11-gke.1072000
 - 1.31.5-gke.1169001
 - 1.31.5-gke.1233001
 - 1.31.6-gke.1020001
 - 1.31.6-gke.1064001
 - 1.31.7-gke.1013002
 - 1.31.7-gke.1112000
 - 1.32.2-gke.1182002
 - 1.32.3-gke.1170000

**影響有無:** 無

**対処方法:** 特に対処は不要です。


### Changed

**原文:** There are no new releases in the Regular channel.

**説明:** Regularチャネルの新しいリリースはありません。

**影響有無:** 無

**対処方法:** 特に対処は不要です。


### Changed

**原文:** There are no new releases in the Stable channel.

**説明:** Stableチャネルの新しいリリースはありません。

**影響有無:** 無

**対処方法:** 特に対処は不要です。


### Changed

**原文:** > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
- The following versions are now available in the Extended channel:
- 1.27.16-gke.2633000
- 1.28.15-gke.2072000
- 1.27.16-gke.2633000
- 1.28.15-gke.2072000

**説明:** > 注: リリースノートの公開時点でロールアウトはすでに進行中であり、Google Cloudのすべてのゾーンで完了するまでに数日かかる場合があるため、クラスタでこれらのバージョンが利用できない場合があります。
- 拡張チャネルで以下のバージョンが利用できるようになりました。
- 1.27.16-gke.2633000
- 1.28.15-gke.2072000

**影響有無:** 無

**対処方法:** 特に対処は不要です。

### Changed

**原文:** > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
- The following versions are now available:
- 1.29.15-gke.1108000
- 1.30.11-gke.1072000
- 1.31.5-gke.1169001
- 1.31.5-gke.1233001
- 1.31.6-gke.1020001
- 1.31.6-gke.1064001
- 1.31.7-gke.1013002
- 1.31.7-gke.1112000
- 1.32.2-gke.1182002
- 1.32.3-gke.1170000

- The following node versions are now available:
- 1.27.16-gke.2633000
- 1.28.15-gke.2072000
- 1.29.15-gke.1108000
- 1.30.11-gke.1072000
- 1.31.5-gke.1169001
- 1.31.5-gke.1233001
- 1.31.6-gke.1020001
- 1.31.6-gke.1064001
- 1.31.7-gke.1013002
- 1.31.7-gke.1112000
- 1.32.2-gke.1182002
- 1.32.3-gke.1170000

**説明:** > 注: リリースノートの公開時点でロールアウトはすでに進行中であり、Google Cloudのすべてのゾーンで完了するまでに数日かかる場合があるため、クラスタでこれらのバージョンが利用できない場合があります。
- 以下のバージョンが利用できるようになりました。
- 1.29.15-gke.1108000
- 1.30.11-gke.1072000
- 1.31.5-gke.1169001
- 1.31.5-gke.1233001
- 1.31.6-gke.1020001
- 1.31.6-gke.1064001
- 1.31.7-gke.1013002
- 1.31.7-gke.1112000
- 1.32.2-gke.1182002
- 1.32.3-gke.1170000

- 以下のノードバージョンが利用できるようになりました。
- 1.27.16-gke.2633000
- 1.28.15-gke.2072000
- 1.29.15-gke.1108000
- 1.30.11-gke.1072000
- 1.31.5-gke.1169001
- 1.31.5-gke.1233001
- 1.31.6-gke.1020001
- 1.31.6-gke.1064001
- 1.31.7-gke.1013002
- 1.31.7-gke.1112000
- 1.32.2-gke.1182002
- 1.32.3-gke.1170000

**影響有無:** 無

**対処方法:** 特に対処は不要です。

# Title: March 31, 2025 
Link: https://cloud.google.com/release-notes#March_31_2025<br>
## AlloyDB for PostgreSQL

### Changed

**原文:** 
If your cluster is encrypted with a customer-managed encryption key (CMEK), and no specific CMEK key is configured for continuous or automated backups, then backups will be created with the cluster CMEK. For more information, see About CMEK  and Configure backup plans.

**説明:** 
AlloyDB for PostgreSQLクラスタで顧客管理の暗号鍵（CMEK）を使用しており、継続的または自動バックアップ用に特定のCMEK鍵が構成されていない場合、バックアップはクラスタCMEKを使用して作成されるように変更されました。

**製品への影響有無:** 有

**対処方法:** 
自動バックアップで使用するCMEK鍵を明示的に指定したい場合は、バックアッププランを設定する必要があります。詳細については、提供されたリンクを参照してください。 

# Title: March 27, 2025 
Link: https://cloud.google.com/release-notes#March_27_2025<br>
## Apigee X

### Changed

**原文:** On March 26, 2025, we released an updated version of Apigee (1-14-0-apigee-5). This Apigee version applies *only*  to organizations using the **JavaCallout** policy in production environments.

**説明:** Apigeeのアップデートバージョン(1-14-0-apigee-5)がリリースされました。このバージョンは、本番環境でJavaCalloutポリシーを使用している組織のみに適用されます。

**影響有無:**  本番環境でJavaCalloutポリシーを使用している場合、有

**対処方法:**  リリースノートに記載はありませんが、JavaCalloutポリシーを使用している場合は、この変更による影響がないか確認することをお勧めします。必要に応じて、Apigeeのドキュメントを参照してください。

### Fixed

**原文:** | Bug ID | Description |
| --- | --- |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:** セキュリティ基盤とライブラリのアップデート。

**影響有無:**  無

**対処方法:**  特に対処は不要です。


## Cloud Service Mesh

### Announcement

**原文:** 1.24.3-asm.6 is now available for in-cluster Cloud Service Mesh.

You can now download 1.24.3-asm.6 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.24.3 subject to the list of supported features. Cloud Service Mesh version 1.24.3-asm.6 uses envoy v1.32.4-dev.

**説明:**  Cloud Service Meshのインクラスタ版でバージョン1.24.3-asm.6が利用可能になりました。このバージョンはIstio 1.24.3の機能を含んでおり、envoy v1.32.4-devを使用しています。

**影響有無:**  無

**対処方法:**  Cloud Service Meshをバージョン1.24.3-asm.6にアップグレードする場合は、提供されているアップグレード手順を参照してください。

### Announcement

**原文:**  1.23.5-asm.3 is now available for in-cluster Cloud Service Mesh.

You can now download 1.23.5-asm.3 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.23.5 subject to the list of supported features. Cloud Service Mesh version 1.23.5-asm.3 uses envoy v1.31.6-dev.

**説明:**  Cloud Service Meshのインクラスタ版でバージョン1.23.5-asm.3が利用可能になりました。このバージョンはIstio 1.23.5の機能を含んでおり、envoy v1.31.6-devを使用しています。

**影響有無:**  無

**対処方法:**  Cloud Service Meshをバージョン1.23.5-asm.3にアップグレードする場合は、提供されているアップグレード手順を参照してください。

### Announcement

**原文:** 1.22.8-asm.5 is now available for in-cluster Cloud Service Mesh.

You can now download 1.22.8-asm.5 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.22.8 subject to the list of supported features. Cloud Service Mesh version 1.22.8-asm.5 uses envoy v1.30.10-dev.

**説明:**  Cloud Service Meshのインクラスタ版でバージョン1.22.8-asm.5が利用可能になりました。このバージョンはIstio 1.22.8の機能を含んでおり、envoy v1.30.10-devを使用しています。

**影響有無:**  無

**対処方法:**  Cloud Service Meshをバージョン1.22.8-asm.5にアップグレードする場合は、提供されているアップグレード手順を参照してください。

### Announcement

**原文:** 1.21.5-asm.34 is now available for in-cluster Cloud Service Mesh.

You can now download 1.21.5-asm.34 for in-cluster Cloud Service Mesh. It includes the features of Istio 1.21.5 subject to the list of supported features. Cloud Service Mesh version 1.21.5-asm.34 uses envoy v1.29.12-dev.

**説明:** Cloud Service Meshのインクラスタ版でバージョン1.21.5-asm.34が利用可能になりました。このバージョンはIstio 1.21.5の機能を含んでおり、envoy v1.29.12-devを使用しています。

**影響有無:**  無

**対処方法:** Cloud Service Meshをバージョン1.21.5-asm.34にアップグレードする場合は、提供されているアップグレード手順を参照してください。 

# Title: March 26, 2025 
Link: https://cloud.google.com/release-notes#March_26_2025<br>
## API Gateway
### Announcement
**原文:** On March 26, 2025, we released an updated version of API Gateway.
**説明:** 2025年3月26日に、API Gatewayのアップデートバージョンがリリースされました。 
**製品への影響有無:** 無
**対処方法:** 特に対応は不要です。


## Cloud Composer
### Announcement
**原文:** A new Cloud Composer release has started on **March 26, 2025**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.
**説明:** 2025年3月26日に新しいCloud Composerのリリースが開始されました。今後、すべてのリージョンに展開される新しいリリースに伴い、変更と新機能が提供される予定です。現在リリースは進行中であり、記載されている変更点や機能の一部は、まだ一部のリージョンでは利用できない可能性があります。
**製品への影響有無:** 無
**対処方法:** 特に対応は不要ですが、新機能や変更点についてはリリースノートを確認してください。

### Announcement
**原文:** All Cloud Composer environment's GKE clusters are set up with **maintenance exclusions** from March 27, 2025 to April 04, 2025. For more information, see Maintenance exclusions.
**説明:** 2025年3月27日から4月4日にかけて、Cloud Composer環境のすべてのGKEクラスタにメンテナンス除外が設定されています。詳細については、メンテナンス除外のドキュメントを参照してください。
**製品への影響有無:**  無
**対処方法:** 特に対応は不要です。

### Fixed
**原文:** *(Available without upgrading)* Fixed an issue with updating maintenance windows when there is an upcoming Cloud Composer 3 infrastructure operation.
**説明:**  今後のCloud Composer 3のインフラストラクチャ運用がある場合に、メンテナンスウィンドウの更新で発生していた問題が修正されました。この修正はアップグレードせずに適用されます。
**製品への影響有無:** 無
**対処方法:** 特に対応は不要です。

### Breaking
**原文:** *(Airflow 2.10.2 and 2.9.3)* The `apache-airflow-providers-google` package was upgraded to version 14.0.0 in Cloud Composer 2 images and Cloud Composer 3 builds. This package is a new major version where **many previously deprecated Airflow operators are removed**. It is not possible to use these operators in your DAGs. Make sure that you update your DAGs to use up-to-date alternatives of the removed operators. For more information about removed and deprecated Airflow operators and their up-to-date alternatives, see Deprecated and removed Airflow operators. [Deprecated and removed Airflow operators](https://cloud.google.com/composer/docs/composer-2/write-dags#deprecated-operators) For more information about changes, see the apache-airflow-providers-google changelog from version 10.26.0 to version 14.0.0. [apache-airflow-providers-google changelog](https://airflow.apache.org/docs/apache-airflow-providers-google/stable/changelog.html)
**説明:** Cloud Composer 2イメージとCloud Composer 3ビルドにおいて、`apache-airflow-providers-google`パッケージがバージョン14.0.0にアップグレードされました。このパッケージはメジャーバージョンアップであり、以前非推奨とされていたAirflowオペレーターの多くが削除されています。そのため、削除されたオペレーターはDAG内で使用できません。削除されたオペレーターの最新版へのアップグレードが必要です。削除および非推奨となったAirflowオペレーターとそれらの最新版については、提供されているリンクを参照してください。
**製品への影響有無:**  有 (Airflow 2.10.2 および 2.9.3 を使用している場合)
**対処方法:** DAGで削除されたAirflowオペレーターを使用している場合は、提供されているドキュメントを参考に最新版のAirflowオペレーターに更新してください。

### Changed
**原文:** *(Airflow 2.10.2 and 2.9.3)* The `apache-airflow-providers-cncf-kubernetes` package was upgraded to version 10.3.0 in Cloud Composer 2 images and Cloud Composer 3 builds. For more information about changes, see the apache-airflow-providers-cncf-kubernetes changelog from version 10.1.0 to version 10.3.0. [apache-airflow-providers-cncf-kubernetes changelog](https://airflow.apache.org/docs/apache-airflow-providers-cncf-kubernetes/stable/changelog.html)
**説明:** Cloud Composer 2イメージとCloud Composer 3ビルドにおいて、`apache-airflow-providers-cncf-kubernetes`パッケージがバージョン10.3.0にアップグレードされました。変更点の詳細は、提供されているリンクからバージョン10.1.0からバージョン10.3.0までの変更履歴を参照してください。
**製品への影響有無:**  有 (Airflow 2.10.2 および 2.9.3 を使用している場合)
**対処方法:**  変更点の詳細は、提供されているリンクからバージョン10.1.0からバージョン10.3.0までの変更履歴を参照し、必要があれば対応してください。

### Changed
**原文:**  *(Airflow 2.10.2 and 2.9.3)* Changes in preinstalled packages: - `apache-airflow-providers-postgres` was upgraded to 6.1.0 from 5.14.0. - `apache-airflow-providers-smtp` was upgraded to 2.0.0 from 1.9.0. - `types-requests` was removed from preinstalled packages.
**説明:**  Airflow 2.10.2および2.9.3のプリインストールパッケージに変更がありました。 `apache-airflow-providers-postgres`はバージョン5.14.0から6.1.0に、 `apache-airflow-providers-smtp`はバージョン1.9.0から2.0.0にアップグレードされました。また、`types-requests`はプリインストールパッケージから削除されました。
**製品への影響有無:**  有 (Airflow 2.10.2 および 2.9.3 を使用している場合)
**対処方法:**  `types-requests`を利用している場合は、別途インストールする必要があります。

### Changed
**原文:** New Airflow builds are available in Cloud Composer 3: [Airflow builds](https://cloud.google.com/composer/docs/composer-versions#images-composer-3)- composer-3-airflow-2.10.2-build.12 (default) - composer-3-airflow-2.9.3-build.19
**説明:** Cloud Composer 3で新しいAirflowビルドが利用可能になりました。デフォルトはcomposer-3-airflow-2.10.2-build.12となり、composer-3-airflow-2.9.3-build.19も選択可能です。
**製品への影響有無:** 無
**対処方法:** 特に対応は不要です。

### Changed
**原文:** New images are available in Cloud Composer 2: [images](https://cloud.google.com/composer/docs/composer-versions#images-composer-2)- composer-2.12.0-airflow-2.10.2 (default) - composer-2.12.0-airflow-2.9.3
**説明:** Cloud Composer 2で新しいイメージが利用可能になりました。デフォルトはcomposer-2.12.0-airflow-2.10.2となり、composer-2.12.0-airflow-2.9.3も選択可能です。
**製品への影響有無:**  無
**対処方法:** 特に対応は不要です。

### Deprecated
**原文:** Cloud Composer versions 2.6.4, 2.6.5, and 2.6.6 have reached their end of support period. [end of support period](https://cloud.google.com/composer/docs/composer-versioning-overview#version-deprecation-and-support)
**説明:**  Cloud Composer バージョン 2.6.4、2.6.5、および 2.6.6 はサポート期間の終了に達しました。
**製品への影響有無:** 有 (Cloud Composer versions 2.6.4, 2.6.5, and 2.6.6 を使用している場合)
**対処方法:** サポートの継続が必要な場合は、サポートされているバージョンにアップグレードしてください。


## Cloud Run
### Changed
**原文:**  Cloud Run services configured with Direct VPC egress now use only 2 times (2X) as many IP addresses as the number of instances for the duration of the instance plus up to 20 minutes, reduced from 4X as many IP addresses. [2 times (2X) as many IP addresses as the number of instances](https://cloud.google.com/run/docs/configuring/vpc-direct-vpc?#ip-consumption-services)
**説明:**  ダイレクト VPC エグレスを使用するように構成された Cloud Run サービスで使用する IP アドレスの数が、インスタンスの継続時間 + 最大 20 分間、インスタンス数の 4 倍分から 2 倍分に削減されました。
**製品への影響有無:**  無
**対処方法:** 特に対応は不要です。


## Google Kubernetes Engine
### Changed
**原文:** GKE cluster versions have been updated. **New versions available for upgrades and new clusters.** The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades. [GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning) [Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)
**説明:** GKE クラスタバージョンが更新されました。新しいバージョンがアップグレードと新しいクラスタで利用可能です。既存のクラスタに対するオプトインによるコントロールプレーンとノードのアップグレードに加え、新しいクラスタに対しても以下の Kubernetes バージョンが利用できるようになりました。バージョン管理とアップグレードの詳細については、記載されているリンクを参照してください。
**製品への影響有無:** 無
**対処方法:** 特に対応は不要です。

### Changed
**原文:** > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones. - The following versions are now available in the Rapid channel: - 1.29.15-gke.1058000 - 1.30.10-gke.1227001 - 1.30.11-gke.1008001 - 1.31.6-gke.1221001 - 1.31.7-gke.1013001 - 1.32.2-gke.1652003 - 1.32.3-gke.1057001 - 1.29.15-gke.1058000 - 1.30.10-gke.1227001 - 1.30.11-gke.1008001 - 1.31.6-gke.1221001 - 1.31.7-gke.1013001 - 1.32.2-gke.1652003 - 1.32.3-gke.1057001 [1.29.15-gke.1058000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915) [1.30.10-gke.1227001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010) [1.30.11-gke.1008001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011) [1.31.6-gke.1221001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316) [1.31.7-gke.1013001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317) [1.32.2-gke.1652003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322) [1.32.3-gke.1057001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
**説明:** Rapidチャネルで以下のバージョンが利用可能になりました。リリースノート公開時にはロールアウトは既に進行中ですが、Google Cloudのすべてのゾーンに展開されるまでには数日かかる場合があります。記載されているバージョンはクラスタでまだ利用できない可能性があります。
**製品への影響有無:**  無
**対処方法:** 特に対応は不要です。

### Changed
**原文:**  There are no new releases in the Regular channel.
**説明:** Regularチャネルの新しいリリースはありません。
**製品への影響有無:**  無
**対処方法:** 特に対応は不要です。

### Changed
**原文:**  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones. - The following versions are now available in the Stable channel: - 1.30.10-gke.1070000 - 1.31.6-gke.1064000 - 1.32.2-gke.1182001 - 1.30.10-gke.1070000 - 1.31.6-gke.1064000 - 1.32.2-gke.1182001 [1.30.10-gke.1070000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010) [1.31.6-gke.1064000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316) [1.32.2-gke.1182001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
**説明:** Stableチャネルで以下のバージョンが利用可能になりました。リリースノート公開時にはロールアウトは既に進行中ですが、Google Cloudのすべてのゾーンに展開されるまでには数日かかる場合があります。記載されているバージョンはクラスタでまだ利用できない可能性があります。
**製品への影響有無:**  無
**対処方法:**  特に対応は不要です。

### Changed
**原文:** > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones. - The following versions are now available in the Extended channel: - 1.27.16-gke.2595000 - 1.28.15-gke.2027000 - 1.27.16-gke.2595000 - 1.28.15-gke.2027000 [1.27.16-gke.2595000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716) [1.28.15-gke.2027000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
**説明:** Extendedチャネルで以下のバージョンが利用可能になりました。リリースノート公開時にはロールアウトは既に進行中ですが、Google Cloudのすべてのゾーンに展開されるまでには数日かかる場合があります。記載されているバージョンはクラスタでまだ利用できない可能性があります。
**製品への影響有無:**  無
**対処方法:**  特に対応は不要です。

### Changed
**原文:**  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones. - The following versions are now available: - 1.29.15-gke.1058000 - 1.30.10-gke.1227001 - 1.30.11-gke.1008001 - 1.31.6-gke.1221001 - 1.31.7-gke.1013001 - 1.32.2-gke.1652003 - 1.32.3-gke.1057001 - The following node versions are now available: - 1.27.16-gke.2595000 - 1.28.15-gke.2027000 - 1.29.15-gke.1058000 - 1.30.10-gke.1227001 - 1.30.11-gke.1008001 - 1.31.6-gke.1221001 - 1.31.7-gke.1013001 - 1.32.2-gke.1652003 - 1.32.3-gke.1057001 - 1.29.15-gke.1058000 - 1.30.10-gke.1227001 - 1.30.11-gke.1008001 - 1.31.6-gke.1221001 - 1.31.7-gke.1013001 - 1.32.2-gke.1652003 - 1.32.3-gke.1057001 [1.29.15-gke.1058000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915) [1.30.10-gke.1227001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010) [1.30.11-gke.1008001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011) [1.31.6-gke.1221001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316) [1.31.7-gke.1013001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317) [1.32.2-gke.1652003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322) [1.32.3-gke.1057001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323) - 1.27.16-gke.2595000 - 1.28.15-gke.2027000 - 1.29.15-gke.1058000 - 1.30.10-gke.1227001 - 1.30.11-gke.1008001 - 1.31.6-gke.1221001 - 1.31.7-gke.1013001 - 1.32.2-gke.1652003 - 1.32.3-gke.1057001 [1.27.16-gke.2595000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716) [1.28.15-gke.2027000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815) [1.29.15-gke.1058000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915) [1.30.10-gke.1227001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010) [1.30.11-gke.1008001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13011) [1.31.6-gke.1221001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316) [1.31.7-gke.1013001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1317) [1.32.2-gke.1652003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322) [1.32.3-gke.1057001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1323)
**説明:** 以下のバージョンが利用可能になりました。リリースノート公開時にはロールアウトは既に進行中ですが、Google Cloudのすべてのゾーンに展開されるまでには数日かかる場合があります。記載されているバージョンはクラスタでまだ利用できない可能性があります。
**製品への影響有無:** 無
**対処方法:** 特に対応は不要です。
# Title: March 25, 2025 
Link: https://cloud.google.com/release-notes#March_25_2025<br>
## API Gateway
### Announcement
**原文:** On March 25, 2025, we released an updated version of API Gateway. 
**説明:** 2025年3月25日に、API Gatewayのアップデートバージョンがリリースされました。詳細な変更内容は記載されていません。 
**影響有無:**  記載がないため不明
**対処方法:**  - 

## Compute Engine
### Fixed
**原文:** **Resolved:** Fixed the issue that caused Persistent Disks attached to VMs with `n2d-standard-64` machine types to inconsistently reach the maximum performance limit of 100,000 IOPS. 
For more information, see Known issues.
[Known issues](https://cloud.google.com/compute/docs/troubleshooting/known-issues#resolved_disks_attached_to_vms_with_n2d-standard-64_machine_types_dont_consistently_reach_performance_limits)
**説明:** `n2d-standard-64` マシンタイプのVMに接続された永続ディスクが、最大パフォーマンス制限である100,000 IOPSに到達しない場合がある問題が修正されました。
**影響有無:**  `n2d-standard-64` マシンタイプを利用しており、永続ディスクのパフォーマンス問題が発生していた場合は影響あり。
**対処方法:**  修正済みのため、特別な対応は不要です。 

# Title: March 24, 2025 
Link: https://cloud.google.com/release-notes#March_24_2025<br>
## Apigee X

### Announcement
**原文:** On March 24, 2025, we released an updated version of Apigee.

**説明:** 2025年3月24日に、Apigeeのアップデートバージョンがリリースされました。

**製品への影響有無:**  情報不足のため不明

**対処方法:**  情報不足のため不明 

## BigQuery

### Libraries
**原文:** A weekly digest of client library updates from across the Cloud SDK.

**説明:** Cloud SDK全体のクライアントライブラリの週間更新の概要です。

**製品への影響有無:** 無

**対処方法:**  不要

### Node.js
#### Changes for @google-cloud/bigquery
**原文:** 
[@google-cloud/bigquery](https://github.com/googleapis/nodejs-bigquery)
[7.9.3](https://github.com/googleapis/nodejs-bigquery/compare/v7.9.2...v7.9.3)
- Make sure to pass selectedFields to tabledata.list method (#1449) (206aff9)

[#1449](https://github.com/googleapis/nodejs-bigquery/issues/1449)
[206aff9](https://github.com/googleapis/nodejs-bigquery/commit/206aff93d3d3520199388fc31314fa7ec221cee8)

**説明:** Node.js用BigQueryクライアントライブラリ(@google-cloud/bigquery)のバージョン7.9.3がリリースされました。tabledata.listメソッドにselectedFieldsが渡されるように修正されました。

**製品への影響有無:** 有

**対処方法:** BigQueryクライアントライブラリ(@google-cloud/bigquery)をバージョン7.9.3以上にアップデートしてください。

### Go
#### Changes for bigquery/storage/apiv1beta1
**原文:** 
[bigquery/storage/apiv1beta1](https://github.com/googleapis/google-cloud-go/tree/main/bigquery/storage/apiv1beta1)
[1.67.0](https://github.com/googleapis/google-cloud-go/compare/bigquery/v1.66.2...bigquery/v1.67.0)
- **bigquery/reservation:** Add a new field `enable_gemini_in_bigquery` to `.google.cloud.bigquery.reservation.v1.Assignment` that indicates if "Gemini in BigQuery" (601e742)
- **bigquery/reservation:** Add a new field `replication_status` to `.google.cloud.bigquery.reservation.v1.Reservation` to provide visibility into errors that could arise during Disaster Recovery(DR) replication (#11666) (601e742)
- **bigquery/reservation:** Add the CONTINUOUS Job type to `.google.cloud.bigquery.reservation.v1.Assignment.JobType` for continuous SQL jobs (601e742)
- **bigquery:** Support MetadataCacheMode for ExternalDataConfig (#11803) (af5174d), refs #11802

**説明:**  Go用BigQuery Storageクライアントライブラリ(bigquery/storage/apiv1beta1)のバージョン1.67.0がリリースされました。主な変更点は以下の通りです。

- BigQueryにおけるGeminiの使用可否を示す `enable_gemini_in_bigquery` フィールドが `.google.cloud.bigquery.reservation.v1.Assignment` に追加されました。
- 障害復旧(DR)レプリケーション中に発生する可能性のあるエラーの可視化を提供するため、`replication_status` フィールドが `.google.cloud.bigquery.reservation.v1.Reservation` に追加されました。
- 連続SQLジョブのために、CONTINUOUSジョブタイプが `.google.cloud.bigquery.reservation.v1.Assignment.JobType` に追加されました。
- ExternalDataConfig に対する MetadataCacheMode のサポートが追加されました。

**製品への影響有無:**  有

**対処方法:** Go用BigQuery Storageクライアントライブラリ(bigquery/storage/apiv1beta1)をバージョン1.67.0以上にアップデートしてください。

**原文:** 
[1.67.0](https://github.com/googleapis/google-cloud-go/compare/bigquery/v1.66.2...bigquery/v1.67.0)
- **bigquery:** Increase timeout for storage api test and remove usage of deprecated pkg (#11810) (f47e038), refs #11801 
- **bigquery:** Update golang.org/x/net to 0.37.0 (1144978)

**説明:**  Go用BigQuery Storageクライアントライブラリ(bigquery/storage/apiv1beta1)のバージョン1.67.0がリリースされました。主な変更点は以下の通りです。

- ストレージAPIテストのタイムアウト時間が延長され、非推奨パッケージの使用が削除されました。
- golang.org/x/net がバージョン 0.37.0 にアップデートされました。

**製品への影響有無:**  有

**対処方法:** Go用BigQuery Storageクライアントライブラリ(bigquery/storage/apiv1beta1)をバージョン1.67.0以上にアップデートしてください。

**原文:**
[1.67.0](https://github.com/googleapis/google-cloud-go/compare/bigquery/v1.66.2...bigquery/v1.67.0)
- **bigquery/reservation:** Remove the section about `EDITION_UNSPECIFIED` in the comment for `slot_capacity` in `.google.cloud.bigquery.reservation.v1.Reservation` to clarify that (601e742)
- **bigquery/reservation:** Update the `google.api.field_behavior` for the `.google.cloud.bigquery.reservation.v1.Reservation.primary_location` and `.google.cloud.bigquery.reservation.v1.Reservation.original_primary_location` fields to clarify that they are `OUTPUT_ONLY` (601e742)

**説明:**  Go用BigQuery Storageクライアントライブラリ(bigquery/storage/apiv1beta1)のバージョン1.67.0がリリースされました。主な変更点は以下の通りです。

- `.google.cloud.bigquery.reservation.v1.Reservation` 内の `slot_capacity` に関するコメントから、`EDITION_UNSPECIFIED` に関するセクションが削除され、記述が明確化されました。
- `.google.cloud.bigquery.reservation.v1.Reservation.primary_location` フィールドと `.google.cloud.bigquery.reservation.v1.Reservation.original_primary_location` フィールドの `google.api.field_behavior` が `OUTPUT_ONLY` であることを明確にするために更新されました。

**製品への影響有無:**  有

**対処方法:** Go用BigQuery Storageクライアントライブラリ(bigquery/storage/apiv1beta1)をバージョン1.67.0以上にアップデートしてください。


### Java
#### Changes for google-cloud-bigquery
**原文:** 
[google-cloud-bigquery](https://github.com/googleapis/java-bigquery)
[2.49.0](https://github.com/googleapis/java-bigquery/compare/v2.48.1...v2.49.0)
- **bigquery:** Implement getArray in BigQueryResultImpl (#3693) (e2a3f2c)
- Next release from main branch is 2.49.0 (#3706) (b46a6cc)

**説明:** Java用BigQueryクライアントライブラリ(google-cloud-bigquery)のバージョン2.49.0がリリースされました。BigQueryResultImplにgetArrayが実装されました。

**製品への影響有無:** 有

**対処方法:** Java用BigQueryクライアントライブラリ(google-cloud-bigquery)をバージョン2.49.0以上にアップデートしてください。


## Cloud Logging
### Libraries
**原文:** A weekly digest of client library updates from across the Cloud SDK.

**説明:** Cloud SDK全体のクライアントライブラリの週間更新の概要です。

**製品への影響有無:** 無

**対処方法:**  不要


### Java
#### Changes for google-cloud-logging
**原文:** 
[google-cloud-logging](https://github.com/googleapis/java-logging)
[3.22.0](https://github.com/googleapis/java-logging/compare/v3.21.4...v3.22.0)
- Next release from main branch is 3.22.0 (#1776) (7736073)

**説明:**  Java用Cloud Loggingクライアントライブラリ(google-cloud-logging)のバージョン3.22.0がリリースされました。

**製品への影響有無:**  有

**対処方法:** Java用Cloud Loggingクライアントライブラリ(google-cloud-logging)をバージョン3.22.0以上にアップデートしてください。


## Pub/Sub
### Libraries
**原文:** A weekly digest of client library updates from across the Cloud SDK.

**説明:** Cloud SDK全体のクライアントライブラリの週間更新の概要です。

**製品への影響有無:** 無

**対処方法:**  不要

### Python
#### Changes for google-cloud-pubsub
**原文:** 
[google-cloud-pubsub](https://github.com/googleapis/python-pubsub)
[2.29.0](https://github.com/googleapis/python-pubsub/compare/v2.28.0...v2.29.0)
- Add REST Interceptors which support reading metadata (4363179)
- Add support for opt-in debug logging (4363179)
- Deprecate `enabled` field for message transforms and add `disabled` field (4363179)

**説明:** Python用Pub/Subクライアントライブラリ(google-cloud-pubsub)のバージョン2.29.0がリリースされました。主な変更点は以下の通りです。

- メタデータの読み取りをサポートするRESTインターセプターが追加されました。
- オプトインのデバッグログがサポートされました。
- メッセージ変換の `enabled` フィールドが非推奨となり、`disabled` フィールドが追加されました。

**製品への影響有無:**  有

**対処方法:**  Python用Pub/Subクライアントライブラリ(google-cloud-pubsub)をバージョン2.29.0以上にアップデートしてください。メッセージ変換の `enabled` フィールドを使用している場合は、`disabled` フィールドに置き換えてください。
# Title: March 21, 2025 
Link: https://cloud.google.com/release-notes#March_21_2025<br>
## Cloud Monitoring

### Announcement

**原文:**
The Google-Built OpenTelemetry Collector is now available. This Collector is an open-source, production-ready build of the upstream OpenTelemetry Collector that is built with upstream OpenTelemetry Collector components. The Google-built Collector lets you send correlated OTLP traces, metrics, and logs to Cloud Observability and other backends from applications instrumented by using OpenTelemetry SDKs. The Collector also captures metadata for Google Cloud resources, so you can correlate application performance data with infrastructure telemetry data.

For information about using this Collector, see Overview of the Google-Built OpenTelemetry Collector.

[Overview of the Google-Built OpenTelemetry Collector](https://cloud.google.com/stackdriver/docs/instrumentation/google-built-otel)

**説明:** 
Google Cloudが提供する、OpenTelemetry Collectorが利用可能になりました。これは、OpenTelemetry Collectorのアップストリームコンポーネントを用いて構築された、本番環境に対応したオープンソースのCollectorです。Googleが構築したこのCollectorを使用すると、OpenTelemetry SDKを使用して計測されたアプリケーションから、関連付けられたOTLPトレース、メトリクス、ログをCloud Observabilityや他のバックエンドに送信できます。また、このCollectorはGoogle Cloudリソースのメタデータも取得するため、アプリケーションのパフォーマンスデータとインフラストラクチャのテレメトリデータを関連付けることができます。

**製品への影響有無:** 無

**対処方法:** 
Googleが構築したOpenTelemetry Collectorを使用することで、アプリケーションのパフォーマンス監視をより詳細に行うことが可能になります。詳細については、提供されたリンクを参照してください。 

# Title: March 20, 2025 
Link: https://cloud.google.com/release-notes#March_20_2025<br>
## BigQuery 

### Announcement

**原文:** BigQuery workflows have been renamed to BigQuery pipelines in the Google Cloud console. For more information, see Introduction to BigQuery pipelines.

[Introduction to BigQuery pipelines](https://cloud.google.com/bigquery/docs/workflows-introduction)

**説明:** Google Cloud Console 上で、BigQuery workflows の名称が BigQuery pipelines に変更されました。詳細については、BigQuery パイプラインの紹介をご覧ください。

**影響有無:** 無

**対処方法:** 名称変更のみなので、対応は不要です。 

## Cloud Service Mesh

### Announcement

**原文:** If you use the managed Cloud Service Mesh with the `ISTIOD` control plane implementation, important changes have been made to how and when you'll receive notifications of upcoming modernization. For details, see Managed control plane modernization.

[Managed control plane modernization](https://cloud.google.com/service-mesh/docs/modernization#notifications-and-scheduling)

**説明:** `ISTIOD` コントロールプレーン実装でマネージド Cloud Service Mesh を使用している場合、今後のモダナイゼーションに関する通知の受信方法とタイミングに変更がありました。 詳細については、マネージドコントロールプレーンのモダナイゼーションをご覧ください。

**影響有無:** 有 (ISTIOD コントロールプレーン実装でマネージド Cloud Service Mesh を使用している場合)

**対処方法:** マネージドコントロールプレーンのモダナイゼーションに関する情報を参照し、必要に応じて対応してください。 

# Title: March 19, 2025 
Link: https://cloud.google.com/release-notes#March_19_2025<br>
## Google Kubernetes Engine (GKE)

### 変更内容 (Changed)

#### 原文

GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

#### 説明

GKEクラスタのバージョンが更新されました。新しいバージョンが、アップグレードと新規クラスタ作成の両方で利用可能になりました。

#### 製品への影響有無

有

#### 対処方法

利用可能なバージョンを確認し、必要に応じてクラスタのアップグレードを実施してください。

---

### 変更内容 (Changed)

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- Version 1.32.2-gke.1182001 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:
  - 1.29.15-gke.1017000
  - 1.30.10-gke.1227000
  - 1.31.6-gke.1221000
  - 1.32.2-gke.1182001
  - 1.32.2-gke.1400003
  - 1.32.2-gke.1652000
- The following versions are no longer available in the Rapid channel:
  - 1.32.2-gke.1182000
  - 1.32.2-gke.1400001
- Auto-upgrade targets are now available for the following minor versions:
  - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.2-gke.1182001 with this release.
- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
  - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.2-gke.1182001 with this release.

[1.32.2-gke.1182001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.29.15-gke.1017000
- 1.30.10-gke.1227000
- 1.31.6-gke.1221000
- 1.32.2-gke.1182001
- 1.32.2-gke.1400003
- 1.32.2-gke.1652000

[1.29.15-gke.1017000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.10-gke.1227000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010)
[1.31.6-gke.1221000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)
[1.32.2-gke.1182001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[1.32.2-gke.1400003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[1.32.2-gke.1652000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.32.2-gke.1182000
- 1.32.2-gke.1400001

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.2-gke.1182001 with this release.

[1.32.2-gke.1182001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.2-gke.1182001 with this release.

[1.32.2-gke.1182001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)

#### 説明

Rapidチャネルのクラスタで利用可能なバージョンが更新されました。

- デフォルトバージョンが 1.32.2-gke.1182001 に変更されました。
- いくつかのバージョンが利用可能になりました。
- いくつかのバージョンが利用不可になりました。
- 自動アップグレードが有効になっているクラスタは、バージョン 1.31 から 1.32.2-gke.1182001、またはバージョン 1.32 から 1.32.2-gke.1182001 にアップグレードされます。

#### 製品への影響有無

有

#### 対処方法

- Rapidチャネルを利用している場合は、デフォルトバージョンが変更されたことに注意してください。
- 自動アップグレードが有効になっている場合は、クラスタが自動的にアップグレードされます。
- メンテナンスの除外などが設定されている場合は、自動アップグレードは行われません。

---

### 変更内容 (Changed)

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- Version 1.32.2-gke.1182001 is now available in the Regular channel.
- Version 1.32.2-gke.1182000 is no longer available in the Regular channel.

[1.32.2-gke.1182001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)

#### 説明

Regularチャネルで、バージョン 1.32.2-gke.1182001 が利用可能になり、バージョン 1.32.2-gke.1182000 が利用不可になりました。

#### 製品への影響有無

有

#### 対処方法

Regularチャネルを利用していて、バージョン 1.32.2-gke.1182000 を使用している場合は、新しいバージョンへのアップグレードを検討してください。

---

### 変更内容 (Changed)

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- The following versions are now available in the Stable channel:
  - 1.30.10-gke.1022000
  - 1.31.6-gke.1020000

- 1.30.10-gke.1022000
- 1.31.6-gke.1020000

[1.30.10-gke.1022000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010)
[1.31.6-gke.1020000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)

#### 説明

Stableチャネルで、バージョン 1.30.10-gke.1022000 と 1.31.6-gke.1020000 が利用可能になりました。

#### 製品への影響有無

有

#### 対処方法

Stableチャネルを利用している場合は、必要に応じて新しいバージョンへのアップグレードを検討してください。

---

### 変更内容 (Changed)

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- The following versions are now available in the Extended channel:
  - 1.27.16-gke.2573000
  - 1.28.15-gke.2003000
  - 1.32.2-gke.1182001
- Version 1.32.2-gke.1182000 is no longer available in the Extended channel.

- 1.27.16-gke.2573000
- 1.28.15-gke.2003000
- 1.32.2-gke.1182001

[1.27.16-gke.2573000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.2003000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.32.2-gke.1182001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)

#### 説明

Extendedチャネルで、いくつかのバージョンが利用可能になり、バージョン 1.32.2-gke.1182000 が利用不可になりました。

#### 製品への影響有無

有

#### 対処方法

Extendedチャネルを利用していて、バージョン 1.32.2-gke.1182000 を使用している場合は、新しいバージョンへのアップグレードを検討してください。

---


### 変更内容 (Changed)

#### 原文
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- The following versions are now available:
  - 1.29.15-gke.1017000
  - 1.30.10-gke.1227000
  - 1.31.6-gke.1221000
  - 1.32.2-gke.1182001
  - 1.32.2-gke.1400003
  - 1.32.2-gke.1652000

- The following node versions are now available:
  - 1.27.16-gke.2573000
  - 1.28.15-gke.2003000
  - 1.29.15-gke.1017000
  - 1.30.10-gke.1227000
  - 1.31.6-gke.1221000
  - 1.32.2-gke.1182001
  - 1.32.2-gke.1400003
  - 1.32.2-gke.1652000

- The following versions are no longer available:
  - 1.32.2-gke.1182000
  - 1.32.2-gke.1400001

- 1.29.15-gke.1017000
- 1.30.10-gke.1227000
- 1.31.6-gke.1221000
- 1.32.2-gke.1182001
- 1.32.2-gke.1400003
- 1.32.2-gke.1652000

[1.29.15-gke.1017000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.10-gke.1227000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010)
[1.31.6-gke.1221000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)
[1.32.2-gke.1182001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[1.32.2-gke.1400003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[1.32.2-gke.1652000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.27.16-gke.2573000
- 1.28.15-gke.2003000
- 1.29.15-gke.1017000
- 1.30.10-gke.1227000
- 1.31.6-gke.1221000
- 1.32.2-gke.1182001
- 1.32.2-gke.1400003
- 1.32.2-gke.1652000

[1.27.16-gke.2573000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.2003000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.15-gke.1017000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12915)
[1.30.10-gke.1227000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010)
[1.31.6-gke.1221000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)
[1.32.2-gke.1182001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[1.32.2-gke.1400003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
[1.32.2-gke.1652000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.32.2-gke.1182000
- 1.32.2-gke.1400001

#### 説明

GKEクラスタで利用可能なバージョンが更新されました。

- いくつかのバージョンが利用可能になりました。
- いくつかのノードバージョンが利用可能になりました。
- いくつかのバージョンが利用不可になりました。

#### 製品への影響有無

有

#### 対処方法

利用可能なバージョンを確認し、必要に応じてクラスタのアップグレードを実施してください。
# Title: March 18, 2025 
Link: https://cloud.google.com/release-notes#March_18_2025<br>
## Cloud Composer

### アナウンス(Announcement)

**原文:** After April 15, 2025, the database retention policy feature will be enabled by default in newly created Cloud Composer 3 environments.

**説明:** 2025年4月15日以降に新規作成される Cloud Composer 3 環境では、データベース保持ポリシー機能がデフォルトで有効になります。この機能は、Airflow データベースのサイズを管理するのに役立ちます。

**製品への影響有無:** 有

**対処方法:** 新規環境ではデフォルトで有効化されるため、特に対応は不要です。既存の環境に対しては、データベース保持ポリシーを有効または無効にしたり、保持期間を調整したりすることができます。詳細は、提供されているリンクを参照してください。


### 問題(Issue)

**原文:** The issue with Cloud Composer 2 upgrade operations is now resolved. The upgrade operations are unblocked in all regions.

**説明:** Cloud Composer 2 のアップグレード操作に関する問題は解決されました。すべてのリージョンでアップグレード操作がブロックされなくなりました。

**製品への影響有無:** 無

**対処方法:** 問題は解決済みのため、特に対応は不要です。3月14日のリリースノートに記載されていたアップグレードの問題は解消されています。


## Google Kubernetes Engine

### 修正(Fixed)

**原文:** On GKE clusters running versions 1.32.2-gke.1182000 to 1.32.2-gke.1297000, Pods using Cloud Storage FUSE CSI driver volumes (persistent or CSI ephemeral) fail to schedule when both of the following are true:

- The Pods run on the host network (`hostNetwork: true`)
- You use a custom sidecar image built with a Cloud Storage FUSE CSI driver version earlier than v1.12.2.

The fix is available on GKE cluster version 1.32.2-gke.1297001 or later.


**説明:**  GKE クラスタバージョン 1.32.2-gke.1182000 から 1.32.2-gke.1297000 を実行している場合、Pod がホストネットワーク上で動作し (`hostNetwork: true`)、かつ v1.12.2 より前の Cloud Storage FUSE CSI ドライババージョンで構築されたカスタムサイドカーイメージを使用している場合、Cloud Storage FUSE CSI ドライバボリューム (永続または CSI エフェメラル) を使用する Pod のスケジューリングに失敗します。

**製品への影響有無:** 有

**対処方法:** GKE クラスタをバージョン 1.32.2-gke.1297001 以降にアップグレードしてください。 または、v1.12.2 以降の Cloud Storage FUSE CSI ドライバを使用してカスタムサイドカーイメージを再構築してください。 

# Title: March 17, 2025 
Link: https://cloud.google.com/release-notes#March_17_2025<br>
## Apigee X

### Announcement
**原文:** On March 17, 2025, Apigee announced the GA support for DNS peering for Apigee organizations that have VPC peering disabled.

**説明:**  2025年3月17日、Apigeeは、VPCピアリングが無効になっているApigee組織に対して、DNSピアリングのGAサポートを発表しました。

**影響有無:** 無

**対処方法:**  特になし。 

## Cloud Load Balancing

### Announcement
**原文:** Google Cloud periodically renews Google-managed certificates by requesting them from certificate authorities (CAs). Certificate authorities verify domain control by checking DNS settings of the domain and in case of load balancer authorization attempting to contact the server behind the domain's IP address. The CAs that Google Cloud works with have introduced a verification method called **Multi-Perspective Issuance Corroboration**, that is becoming mandatory for all public CAs and that consists in performing the verification from multiple locations in the world. As a result, if DNS settings do not correctly and consistently resolve from all locations, the validation fails and Google-managed certificates will fail to renew.

**説明:**  Google Cloudは、証明機関（CA）に要求することで、Googleが管理する証明書を定期的に更新します。証明機関は、ドメインのDNS設定を確認し、ロードバランサ認証の場合はドメインのIPアドレスの背後にあるサーバーへの接続を試みることで、ドメインの制御を検証します。 Google Cloudが連携しているCAは、すべてのパブリックCAで必須になりつつある**Multi-Perspective Issuance Corroboration**と呼ばれる検証方法を導入しました。これは、世界の複数の場所から検証を実行するというものです。そのため、DNS設定ですべての場所から正しく一貫して解決されない場合、検証は失敗し、Googleが管理する証明書の更新は失敗します。

**影響有無:** 有

**対処方法:**  DNS設定が、すべて の場所から正しく一貫して解決されることを確認してください。 詳細については、[Multi-perspective domain validation](https://cloud.google.com/load-balancing/docs/ssl-certificates/troubleshooting#multi-perspective-domain-validation) を参照してください。

## Cloud Monitoring

### Changed
**原文:** You can now enable and disable uptime-checks by using the `disabled` field  in the Cloud Monitoring API. 

**説明:** Cloud Monitoring APIの `disabled` フィールドを使用して、稼働時間チェックを有効または無効にできるようになりました。

**影響有無:** 無

**対処方法:**  特になし。 `disabled`フィールドの詳細については、[こちら](https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.uptimeCheckConfigs#uptimeCheckConfig.FIELDS.disabled) を参照してください。


## Cloud Storage

### Libraries

**原文:** A weekly digest of client library updates from across the Cloud SDK.

**説明:** Cloud SDK全体のクライアントライブラリの更新に関する週刊ダイジェストです。

**影響有無:** 無

**対処方法:**  特になし。 

### Go

#### Changes for storage/internal/apiv2
**原文:** 
[storage/internal/apiv2](https://github.com/googleapis/google-cloud-go/tree/main/storage/internal/apiv2)
[1.51.0](https://github.com/googleapis/google-cloud-go/compare/storage/v1.50.0...storage/v1.51.0)
- **storage/append:** Support appends in w1r3. (#11483) (48bb391)
- **storage:** Benchmark with experimental MRD. (#11501) (7b49152)
- **storage:** Implement RetryChunkDeadline for grpc writes (#11476) (03575d7)
- **storage:** Specify benchmark integrity check. (#11465) (da18845)
- **storage:** Use ReadHandle for faster re-connect (#11510) (cac52f7)
- **storage:** Wrap NotFound errors for buckets and objects (#11519) (0dd7d3d)
...

**説明:** Google Cloud Storage Goクライアントライブラリの `storage/internal/apiv2` パッケージのバージョン1.51.0がリリースされました。このリリースには、w1r3での追加のサポート、実験的なMRDを使用したベンチマーク、grpc書き込み用のRetryChunkDeadlineの実装、ベンチマーク整合性チェックの指定、高速な再接続のためのReadHandleの使用、バケットとオブジェクトのNotFoundエラーのラップなど、多くの変更と修正が含まれています。

**影響有無:** 無

**対処方法:**  特になし。 


### Java

#### Changes for google-cloud-storage
**原文:** 
[google-cloud-storage](https://github.com/googleapis/java-storage)
[2.50.0](https://github.com/googleapis/java-storage/compare/v2.49.0...v2.50.0)
- Next release from main branch is 2.50.0 (#2968) (4a69fcc)
...

**説明:** Google Cloud Storage Javaクライアントライブラリのバージョン 2.50.0 がリリースされました。このリリースには、Javaコードジェネレーター（gapic-generator-java）の2.55.1へのアップデート、json再開可能なアップロードの503処理の改善、String.formatの使用法のアップデートによるLocale.USの明示的な受け渡し、パフォーマンス向上のためのメッセージパブリッシュおよび受信時の過剰な文字列解析の防止などが含まれています。

**影響有無:** 無

**対処方法:**  特になし。 

## Pub/Sub

### Libraries

**原文:** A weekly digest of client library updates from across the Cloud SDK.

**説明:** Cloud SDK全体のクライアントライブラリの更新に関する週刊ダイジェストです。

**影響有無:** 無

**対処方法:** 特になし。 

### Go

#### Changes for pubsub/apiv1
**原文:**
[pubsub/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/pubsub/apiv1)
[1.48.0](https://github.com/googleapis/google-cloud-go/compare/pubsub/v1.47.0...pubsub/v1.48.0)
- **pubsub/pstest:** Support listening on custom address (#11606) (63865a2)
- **pubsub:** Add support for message transforms to Topic and Subscription (59fe58a)
- **pubsub:** Deprecate `enabled` field for message transforms and add `disabled` field (dd0d1d7)
...
**説明:** Google Cloud Pub/Sub Goクライアントライブラリの `pubsub/apiv1` パッケージのバージョン1.48.0がリリースされました。このリリースには、カスタムアドレスでのリスニングのサポート、トピックとサブスクリプションへのメッセージ変換のサポートの追加、メッセージ変換の `enabled` フィールドの非推奨化と `disabled` フィールドの追加など、多くの変更と修正が含まれています。

**影響有無:**  有

**対処方法:**  メッセージ変換で`enabled`フィールドを使用している場合は、`disabled`フィールドに置き換える必要があります。

### Java

#### Changes for google-cloud-pubsub
**原文:**
[google-cloud-pubsub](https://github.com/googleapis/java-pubsub)
[1.138.0](https://github.com/googleapis/java-pubsub/compare/v1.137.1...v1.138.0)
- Deprecate `enabled` field for message transforms and add `disabled` field (76b2a3d)
- Next release from main branch is 1.138.0 (#2361) (b6ba56c)
...
**説明:** Google Cloud Pub/Sub Javaクライアントライブラリのバージョン 1.138.0 がリリースされました。このリリースには、メッセージ変換の `enabled` フィールドが非推奨化され、 `disabled` フィールドが追加されたことが含まれています。

**影響有無:** 有

**対処方法:** メッセージ変換で `enabled` フィールドを使用している場合は、 `disabled` フィールドに置き換える必要があります。 

# Title: March 14, 2025 
Link: https://cloud.google.com/release-notes#March_14_2025<br>
## Cloud Composer 

### Issue 

**原文:** March 18, 2025 update: The issue is resolved. [is resolved](https://cloud.google.com/composer/docs/release-notes#March_18_2025)
Some upgrade operations for Cloud Composer 2 might lead to unhealthy environments. That is why upgrades for Cloud Composer 2 versions will be blocked until the issue is fully resolved.

**説明:** 2025年3月18日 更新： Cloud Composer 2 のアップグレード処理において、環境が不安定になる問題が解決されました。この問題は解決済みのため、Cloud Composer 2 のアップグレードはブロックされなくなりました。

**影響有無:** 無

**対処方法:**  特に対処は不要です。Cloud Composer 2 は通常通りアップグレード可能です。 

# Title: March 13, 2025 
Link: https://cloud.google.com/release-notes#March_13_2025<br>
## Cloud Billing

### Improved consistency in resource-based committed use discount (CUD) string names across experiences.

**原文:** We have improved consistency by standardizing CUD string names across the various experiences. This update helps provide a seamless experience in resource-based CUD purchase flows, recommendations, analysis, and the FinOps hub.

**説明:** リソースベースのコミット済み使用割引（CUD）の文字列名が、さまざまな画面で標準化され、一貫性が向上しました。この変更により、リソースベースのCUDの購入フロー、推奨事項、分析、FinOpsハブ全体でシームレスなエクスペリエンスが提供されます。

**影響有無:** 無

**対処方法:** 特に対応は不要です。 

# Title: March 12, 2025 
Link: https://cloud.google.com/release-notes#March_12_2025<br>
## Apigee X

### Announcement

**原文:** On March 12, 2025, we released an updated version of Apigee (1-15-0-apigee-1).

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to complete across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** Apigeeのアップデートバージョン(1-15-0-apigee-1)がリリースされました。今後2営業日以内にプロダクションインスタンスへのロールアウトが開始され、Google Cloudのすべてのゾーンへの展開が完了するまでに4営業日以上かかる場合があります。

**製品への影響有無:** 無

**対処方法:**  特になし。製品の機能はロールアウトが完了するまで利用できない可能性があります。


### Security

**原文:**
| Bug ID | Description |
| --- | --- |
| **396944778** | **Security fix for Apigee infrastructure.**This addresses the following vulnerabilities: - CVE-2025-23184 - CVE-2024-47554- CVE-2025-24970 - CVE-2025-25193  |

[CVE-2025-23184](https://nvd.nist.gov/vuln/detail/CVE-2025-23184)
[CVE-2024-47554](https://nvd.nist.gov/vuln/detail/CVE-2024-47554)
[CVE-2025-24970](https://nvd.nist.gov/vuln/detail/CVE-2025-24970)
[CVE-2025-25193](https://nvd.nist.gov/vuln/detail/CVE-2025-25193)

**説明:** Apigee インフラストラクチャのセキュリティ修正が含まれています。CVE-2025-23184、CVE-2024-47554、CVE-2025-24970、CVE-2025-25193 の脆弱性に対処しています。

**製品への影響有無:** 有

**対処方法:** リリースノートに記載されたセキュリティ修正が適用されたバージョンへのアップグレードを検討してください。


### Issue

**原文:** **The Nimbus JOSE + JWT library may cause a java.lang.ClassCircularityError when using a JavaCallout policy.**
For more information, see Apigee known issues.

[Nimbus JOSE + JWT](https://connect2id.com/products/nimbus-jose-jwt)
 For more information, see Apigee known issues.

[Apigee known issues](https://cloud.google.com/apigee/docs/release/known-issues)
 > **Note:** If you have a Apigee hybrid-enabled organization with a JavaCallout policy that uses the Nimbus JOSE + JWT library, **do not upgrade to hybrid versions 1.12.4, 1.13.3,  1.14.1** or later.

**説明:** Nimbus JOSE + JWT ライブラリを使用する JavaCallout ポリシーを使用すると、java.lang.ClassCircularityError が発生する可能性があります。

**製品への影響有無:** 有

**対処方法:** Nimbus JOSE + JWT ライブラリを使用する JavaCallout ポリシーを持つ Apigee ハイブリッド対応組織の場合は、ハイブリッドバージョン 1.12.4、1.13.3、1.14.1 以降にアップグレードしないでください。


### Fixed

**原文:**
| Bug ID | Description |
| --- | --- |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:** セキュリティインフラストラクチャとライブラリに対するアップデートが含まれています。

**製品への影響有無:** 無

**対処方法:** 特になし。


## BigQuery

### Changed

**原文:** An updated version of ODBC driver for BigQuery is now available.

[ODBC driver for BigQuery](https://cloud.google.com/bigquery/docs/reference/odbc-jdbc-drivers#odbc_release_3121004)


**説明:** BigQuery 用 ODBC ドライバーのアップデートバージョンがリリースされました。

**製品への影響有無:** 無

**対処方法:**  必要に応じて、最新バージョンへのアップデートを検討してください。


## Cloud Service Mesh

### Announcement

**原文:** The rollout of managed Cloud Service Mesh version 1.20 to the rapid channel has completed.

**説明:** マネージド Cloud Service Mesh バージョン 1.20 の Rapid チャネルへのロールアウトが完了しました。

**製品への影響有無:** 無

**対処方法:**  特になし。


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

**説明:** GKE クラスタバージョンが更新されました。新しいクラスタと、既存クラスタのオプトインによるコントロールプレーンとノードのアップグレードに新しいバージョンが利用可能です。

**製品への影響有無:** 無

**対処方法:** 必要に応じて、最新バージョンへのアップグレードを検討してください。

### Changed - Rapid Channel

**原文:**
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.2-gke.1182000 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.29.14-gke.1132000
- 1.30.10-gke.1145000
- 1.31.6-gke.1140000
- 1.32.2-gke.1297001
- 1.32.2-gke.1400001

- The following versions are no longer available in the Rapid channel:

- 1.29.14-gke.1018000
- 1.30.10-gke.1022000
- 1.31.6-gke.1020000
- 1.32.1-gke.1357001
- 1.32.1-gke.1729000
- 1.32.2-gke.1297000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.14-gke.1067000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.10-gke.1070000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.6-gke.1064000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.32.2-gke.1182000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.14-gke.1067000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.10-gke.1070000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.6-gke.1064000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.2-gke.1182000 with this release.

**説明:** Rapid Channelのクラスタバージョンが更新されました。デフォルトバージョンが1.32.2-gke.1182000となり、いくつかのバージョンが利用可能になりました。また、いくつかのバージョンは廃止されました。自動アップグレードの対象バージョンも更新されています。

**製品への影響有無:** 有

**対処方法:** 
* Rapid Channelを利用している場合は、利用しているバージョンが廃止されていないか確認してください。
* 自動アップグレードが有効になっている場合は、アップグレード先のバージョンを確認してください。
* メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因がある場合は、パッチのみのバージョン自動アップグレードの対象バージョンを確認してください。


### Changed - Regular Channel

**原文:** 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.6-gke.1020000 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.29.14-gke.1067000
- 1.30.10-gke.1070000
- 1.31.6-gke.1064000
- 1.32.2-gke.1182000

- The following versions are no longer available in the Regular channel:

- 1.29.13-gke.1169000
- 1.30.9-gke.1201000
- 1.31.5-gke.1233000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.14-gke.1018000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.10-gke.1022000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.31.6-gke.1020000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.14-gke.1018000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.10-gke.1022000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.6-gke.1020000 with this release.

**説明:** Regular Channelのクラスタバージョンが更新されました。デフォルトバージョンが1.31.6-gke.1020000となり、いくつかのバージョンが利用可能になりました。また、いくつかのバージョンは廃止されました。自動アップグレードの対象バージョンも更新されています。

**製品への影響有無:** 有

**対処方法:** 
* Regular Channelを利用している場合は、利用しているバージョンが廃止されていないか確認してください。
* 自動アップグレードが有効になっている場合は、アップグレード先のバージョンを確認してください。
* メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因がある場合は、パッチのみのバージョン自動アップグレードの対象バージョンを確認してください。


### Changed - Stable Channel

**原文:**
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.30.9-gke.1127000 is now the default version for cluster creation in the Stable channel.
- The following versions are now available in the Stable channel:

- 1.29.13-gke.1109000
- 1.29.13-gke.1169000
- 1.30.9-gke.1201000
- 1.31.5-gke.1233000

- The following versions are no longer available in the Stable channel:

- 1.30.9-gke.1046000
- 1.31.5-gke.1068000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.9-gke.1127000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.9-gke.1127000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.31 to version 1.31.5-gke.1169000 with this release.

**説明:** Stable Channelのクラスタバージョンが更新されました。デフォルトバージョンが1.30.9-gke.1127000となり、いくつかのバージョンが利用可能になりました。また、いくつかのバージョンは廃止されました。自動アップグレードの対象バージョンも更新されています。

**製品への影響有無:** 有

**対処方法:** 
* Stable Channelを利用している場合は、利用しているバージョンが廃止されていないか確認してください。
* 自動アップグレードが有効になっている場合は、アップグレード先のバージョンを確認してください。
* メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因がある場合は、パッチのみのバージョン自動アップグレードの対象バージョンを確認してください。


### Changed - Extended Channel

**原文:** 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.6-gke.1020000 is now the default version for cluster creation in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.16-gke.2477000
- 1.27.16-gke.2528000
- 1.28.15-gke.1881000
- 1.28.15-gke.1940000
- 1.29.14-gke.1067000
- 1.30.10-gke.1070000
- 1.31.6-gke.1064000
- 1.32.2-gke.1182000

- The following versions are no longer available in the Extended channel:

- 1.27.16-gke.2270000
- 1.27.16-gke.2489000
- 1.28.15-gke.1781000
- 1.28.15-gke.1897000
- 1.29.13-gke.1169000
- 1.30.9-gke.1201000
- 1.31.5-gke.1233000

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2451000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.1844000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.14-gke.1018000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.10-gke.1022000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.6-gke.1020000 with this release.

**説明:** Extended Channelのクラスタバージョンが更新されました。デフォルトバージョンが1.31.6-gke.1020000となり、いくつかのバージョンが利用可能になりました。また、いくつかのバージョンは廃止されました。自動アップグレードの対象バージョンも更新されています。

**製品への影響有無:** 有

**対処方法:** 
* Extended Channelを利用している場合は、利用しているバージョンが廃止されていないか確認してください。
* 自動アップグレードが有効になっている場合は、アップグレード先のバージョンを確認してください。
* メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因がある場合は、パッチのみのバージョン自動アップグレードの対象バージョンを確認してください。


### Changed - All Channel

**原文:** 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.6-gke.1020000 is now the default version for cluster creation.
- The following versions are now available:

- 1.29.13-gke.1109000
- 1.29.14-gke.1132000
- 1.30.10-gke.1145000
- 1.31.6-gke.1140000
- 1.32.2-gke.1297001
- 1.32.2-gke.1400001

- The following node versions are now available:

- 1.27.16-gke.2528000
- 1.28.15-gke.1940000
- 1.29.14-gke.1132000
- 1.30.10-gke.1145000
- 1.31.6-gke.1140000
- 1.32.2-gke.1297001
- 1.32.2-gke.1400001

- The following versions are no longer available:

- 1.30.9-gke.1009000
- 1.31.5-gke.1068000
- 1.32.1-gke.1489001
- 1.32.2-gke.1297000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.29.14-gke.1018000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.9-gke.1127000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.14-gke.1018000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.9-gke.1127000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.31 to version 1.31.6-gke.1020000 with this release.

**説明:** 全てのChannelのクラスタバージョンが更新されました。デフォルトバージョンが1.31.6-gke.1020000となり、いくつかのバージョンが利用可能になりました。また、いくつかのバージョンは廃止されました。自動アップグレードの対象バージョンも更新されています。

**製品への影響有無:** 有

**対処方法:** 
* 利用しているバージョンが廃止されていないか確認してください。
* 自動アップグレードが有効になっている場合は、アップグレード先のバージョンを確認してください。
* メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因がある場合は、パッチのみのバージョン自動アップグレードの対象バージョンを確認してください。

**補足:** Google Kubernetes Engineのバージョン1.30を利用している場合、今回のリリースノートに記載されているバージョンへのアップグレードは必須ではありません。ただし、最新バージョンには新機能やバグ修正が含まれているため、アップグレードを検討することが推奨されます。


# Title: March 11, 2025 
Link: https://cloud.google.com/release-notes#March_11_2025<br>
## Cloud Logging 

### Changed

**原文:** The API to create and manage Log Scopes is now Generally Available (GA). You can create and manage log scopes by using the Cloud Console, the Google Cloud CLI, and Terraform. For more information, see Create and manage log scopes.

[Create and manage log scopes](https://cloud.google.com/logging/docs/log-scope/create-and-manage)

**説明:**  ログスコープを作成、管理するためのAPIが一般公開 (GA) されました。Cloud Console、Google Cloud CLI、Terraform を使用して、ログスコープを作成および管理できるようになりました。

**製品への影響有無:**  有

**対処方法:** 

* ログスコープ機能を利用する場合は、GAとなったAPIを利用するようにしてください。
* 従来の方法からAPIに移行する場合は、公式ドキュメントを参照し、必要な変更を加えてください。 

# Title: March 10, 2025 
Link: https://cloud.google.com/release-notes#March_10_2025<br>
# BigQuery

## Announcement

**原文:** Analytics Hub egress controls and data clean room subscriptions are now available in all BigQuery editions and on-demand pricing. 

**説明:**  BigQueryのAnalytics Hubにおいて、データの外部への送信を制御するegress controlsと、データクリーンルームのサブスクリプションが、BigQueryのすべてのエディションとオンデマンド料金で利用できるようになりました。

**影響有無:** 有

**対処方法:** 
* これまでBigQueryの特定のエディションや料金体系では利用できなかったAnalytics Hubの機能が、すべてのユーザーで利用できるようになりました。
* データの外部送信を制限したい場合や、安全な環境でデータコラボレーションを行いたい場合は、egress controlsとデータクリーンルームの利用を検討してください。
* 詳細については、提供されたリンクを参照してください。 
    * [egress controls](https://cloud.google.com/bigquery/docs/analytics-hub-introduction#data_egress)
    * [data clean room](https://cloud.google.com/bigquery/docs/data-clean-rooms#subscriber_workflows)
    * [editions](https://cloud.google.com/bigquery/docs/editions-intro#analysis_features) 

# Title: March 05, 2025 
Link: https://cloud.google.com/release-notes#March_05_2025<br>
## Google Kubernetes Engine

### Changed

原文: GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

説明： GKEクラスタバージョンが更新され、新しいクラスタと既存クラスタのオプトインコントロールプレーンアップグレードおよびノードアップグレードに使用できるようになりました。

影響有無： 有

対処方法： 使用可能なバージョンを確認し、必要に応じてアップグレードを実施してください。


### Security

原文: The Envoy project recently announced several new security vulnerabilities (CVE-2024-53269, CVE-2024-53270, and CVE-2024-53271) that could allow an attacker to crash Envoy.

For more details, see the GCP-2025-009 security bulletin.

[GCP-2025-009 security bulletin](https://cloud.google.com/kubernetes-engine/security-bulletins#gcp-2025-009)

説明： Envoyプロジェクトで、攻撃者がEnvoyをクラッシュさせる可能性のある新しいセキュリティ脆弱性（CVE-2024-53269、CVE-2024-53270、CVE-2024-53271）が発表されました。

影響有無： 有

対処方法： 詳細は、GCP-2025-009セキュリティ速報を参照し、必要な対策を講じてください。


### Changed

原文:  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- The following versions are now available in the Rapid channel:

- 1.29.14-gke.1086000
- 1.30.10-gke.1102000
- 1.31.6-gke.1099000
- 1.32.2-gke.1297000

- The following versions are no longer available in the Rapid channel:

- 1.29.14-gke.1020000
- 1.30.10-gke.1042000
- 1.31.6-gke.1027000

- 1.29.14-gke.1086000
- 1.30.10-gke.1102000
- 1.31.6-gke.1099000
- 1.32.2-gke.1297000

[1.29.14-gke.1086000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12914)
[1.30.10-gke.1102000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010)
[1.31.6-gke.1099000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)
[1.32.2-gke.1297000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.29.14-gke.1020000
- 1.30.10-gke.1042000
- 1.31.6-gke.1027000

説明： Rapidチャンネルで利用可能なバージョンが更新されました。1.29.14-gke.1086000、1.30.10-gke.1102000、1.31.6-gke.1099000、1.32.2-gke.1297000が利用可能になり、1.29.14-gke.1020000、1.30.10-gke.1042000、1.31.6-gke.1027000は利用できなくなりました。

影響有無： 有

対処方法：  Rapidチャンネルを利用している場合は、利用可能なバージョンを確認し、必要に応じてクラスタのアップグレードを検討してください。


### Changed

原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- Version 1.31.5-gke.1233000 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.29.14-gke.1018000
- 1.30.10-gke.1022000
- 1.31.6-gke.1020000

- The following versions are no longer available in the Regular channel:

- 1.29.13-gke.1109000
- 1.30.9-gke.1127000
- 1.31.5-gke.1169000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.9-gke.1201000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.9-gke.1201000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.5-gke.1233000 with this release.

[1.31.5-gke.1233000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
- 1.29.14-gke.1018000
- 1.30.10-gke.1022000
- 1.31.6-gke.1020000

[1.29.14-gke.1018000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12914)
[1.30.10-gke.1022000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010)
[1.31.6-gke.1020000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)
- 1.29.13-gke.1109000
- 1.30.9-gke.1127000
- 1.31.5-gke.1169000

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.9-gke.1201000 with this release.

[1.29.13-gke.1169000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
[1.30.9-gke.1201000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.9-gke.1201000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.5-gke.1233000 with this release.

[1.29.13-gke.1169000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
[1.30.9-gke.1201000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
[1.31.5-gke.1233000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)

説明： Regularチャンネルのデフォルトバージョンが1.31.5-gke.1233000になりました。また、利用可能なバージョン、削除されたバージョン、自動アップグレードの対象バージョンが更新されました。

影響有無： 有

対処方法：  Regularチャンネルを利用している場合は、利用可能なバージョンを確認し、必要に応じてクラスタのアップグレードを検討してください。自動アップグレードが有効になっている場合は、アップグレードの対象バージョンとスケジュールを確認してください。


### Changed

原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.30.9-gke.1046000 is now the default version for cluster creation in the Stable channel.
- The following versions are now available in the Stable channel:

- 1.30.9-gke.1127000
- 1.31.5-gke.1169000
- 1.32.1-gke.1357001

- The following versions are no longer available in the Stable channel:

- 1.29.13-gke.1006000
- 1.30.9-gke.1009000
- 1.31.5-gke.1023000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.29.13-gke.1038000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.9-gke.1046000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.13-gke.1038000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.9-gke.1046000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.31 to version 1.31.5-gke.1068000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.32 to version 1.32.1-gke.1357001 with this release.

[1.30.9-gke.1046000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
- 1.30.9-gke.1127000
- 1.31.5-gke.1169000
- 1.32.1-gke.1357001

[1.30.9-gke.1127000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
[1.31.5-gke.1169000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
[1.32.1-gke.1357001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1321)
- 1.29.13-gke.1006000
- 1.30.9-gke.1009000
- 1.31.5-gke.1023000

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.29.13-gke.1038000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.9-gke.1046000 with this release.

[1.29.13-gke.1038000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
[1.30.9-gke.1046000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.13-gke.1038000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.9-gke.1046000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.31 to version 1.31.5-gke.1068000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.32 to version 1.32.1-gke.1357001 with this release.

[1.29.13-gke.1038000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
[1.30.9-gke.1046000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
[1.31.5-gke.1068000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
[1.32.1-gke.1357001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1321)

説明： Stableチャンネルのデフォルトバージョンが1.30.9-gke.1046000になりました。また、利用可能なバージョン、削除されたバージョン、自動アップグレードの対象バージョンが更新されました。

影響有無： 有

対処方法： Stableチャンネルを利用している場合は、利用可能なバージョンを確認し、必要に応じてクラスタのアップグレードを検討してください。自動アップグレードが有効になっている場合は、アップグレードの対象バージョンとスケジュールを確認してください。


### Changed

原文:  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.5-gke.1233000 is now the default version for cluster creation in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.16-gke.2489000
- 1.28.15-gke.1844000
- 1.28.15-gke.1897000
- 1.29.14-gke.1018000
- 1.30.10-gke.1022000
- 1.31.6-gke.1020000

- The following versions are no longer available in the Extended channel:

- 1.27.16-gke.2477000
- 1.28.15-gke.1641000
- 1.28.15-gke.1881000
- 1.29.13-gke.1109000
- 1.30.9-gke.1127000
- 1.31.5-gke.1169000

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.1781000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.9-gke.1201000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.5-gke.1233000 with this release.

[1.31.5-gke.1233000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
- 1.27.16-gke.2489000
- 1.28.15-gke.1844000
- 1.28.15-gke.1897000
- 1.29.14-gke.1018000
- 1.30.10-gke.1022000
- 1.31.6-gke.1020000

[1.27.16-gke.2489000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.1844000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.28.15-gke.1897000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.14-gke.1018000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12914)
[1.30.10-gke.1022000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010)
[1.31.6-gke.1020000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)
- 1.27.16-gke.2477000
- 1.28.15-gke.1641000
- 1.28.15-gke.1881000
- 1.29.13-gke.1109000
- 1.30.9-gke.1127000
- 1.31.5-gke.1169000

[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.1781000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.9-gke.1201000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.5-gke.1233000 with this release.

[1.28.15-gke.1781000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.13-gke.1169000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
[1.30.9-gke.1201000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
[1.31.5-gke.1233000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)

説明： Extendedチャンネルのデフォルトバージョンが1.31.5-gke.1233000になりました。また、利用可能なバージョン、削除されたバージョン、自動アップグレードの対象バージョンが更新されました。

影響有無： 有

対処方法： Extendedチャンネルを利用している場合は、利用可能なバージョンを確認し、必要に応じてクラスタのアップグレードを検討してください。自動アップグレードが有効になっている場合は、アップグレードの対象バージョンとスケジュールを確認してください。


### Changed

原文: > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.5-gke.1233000 is now the default version for cluster creation.
- The following versions are now available:

- 1.29.14-gke.1086000
- 1.30.10-gke.1102000
- 1.31.6-gke.1099000
- 1.32.2-gke.1297000

- The following node versions are now available:

- 1.27.16-gke.2489000
- 1.28.15-gke.1897000
- 1.29.14-gke.1086000
- 1.30.10-gke.1102000
- 1.31.6-gke.1099000
- 1.32.2-gke.1297000

- The following versions are no longer available:

- 1.29.13-gke.1006000
- 1.29.13-gke.1109000
- 1.29.14-gke.1020000
- 1.30.8-gke.1261000
- 1.30.10-gke.1042000
- 1.31.5-gke.1023000
- 1.31.6-gke.1027000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.9-gke.1046000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.9-gke.1046000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.31 to version 1.31.5-gke.1233000 with this release.

[1.31.5-gke.1233000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
- 1.29.14-gke.1086000
- 1.30.10-gke.1102000
- 1.31.6-gke.1099000
- 1.32.2-gke.1297000

[1.29.14-gke.1086000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12914)
[1.30.10-gke.1102000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010)
[1.31.6-gke.1099000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)
[1.32.2-gke.1297000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.27.16-gke.2489000
- 1.28.15-gke.1897000
- 1.29.14-gke.1086000
- 1.30.10-gke.1102000
- 1.31.6-gke.1099000
- 1.32.2-gke.1297000

[1.27.16-gke.2489000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.15-gke.1897000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.14-gke.1086000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12914)
[1.30.10-gke.1102000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v13010)
[1.31.6-gke.1099000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1316)
[1.32.2-gke.1297000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1322)
- 1.29.13-gke.1006000
- 1.29.13-gke.1109000
- 1.29.14-gke.1020000
- 1.30.8-gke.1261000
- 1.30.10-gke.1042000
- 1.31.5-gke.1023000
- 1.31.6-gke.1027000

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.9-gke.1046000 with this release.

[1.29.13-gke.1169000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
[1.30.9-gke.1046000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.13-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.9-gke.1046000 with this release.
- Control planes and nodes with auto-
# Title: March 04, 2025 
Link: https://cloud.google.com/release-notes#March_04_2025<br>
# BigQuery
## Changed
原文: BigQuery is now available in the Stockholm (europe-north2) region. ([Stockholm (europe-north2) region](https://cloud.google.com/bigquery/docs/locations#regions))
説明：BigQueryのサービスがスウェーデンのストックホルム(europe-north2 リージョン)で利用可能になりました。
影響有無：無
対処方法：特になし。ヨーロッパの北部にデータセンターが必要な場合に検討できます。 

# Title: March 03, 2025 
Link: https://cloud.google.com/release-notes#March_03_2025<br>
## BigQuery

### Changes for google-cloud-bigquery (Java) - v2.48.1

**原文:**

- Update actions/upload-artifact action to v4.6.1 (#3691) (9c0edea)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.60.0 (#3680) (6d9a40d)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20250216-2.0.0 (#3688) (e3beb6f)
- Update dependency com.google.cloud:google-cloud-datacatalog-bom to v1.64.0 (#3681) (9e4e261)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.44.0 (#3694) (f69fbd3)
- Update dependency com.google.oauth-client:google-oauth-client-java6 to v1.38.0 (#3685) (53bd7af)
- Update dependency com.google.oauth-client:google-oauth-client-jetty to v1.38.0 (#3686) (d71b2a3)
- Update ossf/scorecard-action action to v2.4.1 (#3690) (cdb61fe)

**説明:**

BigQuery Javaライブラリの依存関係の更新が含まれています。内容は、GitHub Actionsのアップデート、BigQuery Connection v1、BigQuery API、Data Catalog、Google Cloud SDK、OAuthクライアントなどのバージョンアップです。

**製品への影響有無:** 無

**対処方法:** 特に対応は不要です。


### Changes for google-cloud-bigquery (Python) - v3.30.0

**原文:**

- Add roundingmode enum, wiring, and tests (#2121) (3a48948)
- Adds foreign_type_info attribute to table class and adds unit tests. (#2126) (2c19681)
- Support resource_tags for table (#2093) (d4070ca)
- Avoid blocking in download thread when using BQ Storage API (#2034) (54c8d07)
- Retry 404 errors in `Client.query(...)` (#2135) (c6d5f8a)
- Updates required checks list in github (#2136) (fea49ff)
- Use pandas-gbq to determine schema in `load_table_from_dataframe` (#2095) (7603bd7)
- Update magics.rst (#2125) (b5bcfb3)

**説明:**

BigQuery Pythonライブラリの機能追加と改善が含まれています。
- 丸めモードの列挙型の追加
- テーブルクラスに `foreign_type_info` 属性の追加
- テーブルのリソースタグのサポート
- BQ Storage API使用時のダウンロードスレッドのブロック回避
- `Client.query(...)` での 404 エラーのリトライ処理追加
- GitHub での必須チェックリストの更新
- `load_table_from_dataframe` で pandas-gbq を使用したスキーマ決定
- ドキュメントの更新

**製品への影響有無:** 無

**対処方法:** 

- リソースタグを利用する場合は、関連ドキュメントを参照してください。
- その他の変更は、製品に対して大きな影響はなく、特段の対応は不要です。


## Cloud Logging

### Changes for google-cloud-logging (Java) - v3.21.4

**原文:**

- **deps:** Update the Java code generator (gapic-generator-java) to 2.54.0 (67fa9fb)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.44.0 (#1768) (a69e699)
- Update googleapis/sdk-platform-java action to v2.54.0 (#1762) (d50a8d2)

**説明:** 

Cloud Logging Javaライブラリの依存関係の更新が含まれています。内容は、Javaコードジェネレーター、Google Cloud SDKのバージョンアップです。

**製品への影響有無:** 無

**対処方法:** 特に対応は不要です。

## Cloud Storage

### Changes for google-cloud-storage (Java) - v2.49.0

**原文:**

- Add new Options to allow per method header values (#2941) (297802d)
- **transfer-manager:** Add ParallelUploadConfig.Builder#setUploadBlobInfoFactory (#2936) (86e9ae8), closes #2638
- Categorize a WatchdogTimeoutException as retriable for grpc ReadObject (#2954) (b53bd53)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.53.0 (9946d6b)
- Update grpc based Storage to defer project id validation (#2930) (cc03784)
- Update kms key handling when opening a resumable upload to clear the value in the json to be null rather than empty string (#2939) (43553de)
- Update sdk-platform-java dependencies (#2957) (40cfda6)
- Add note about HNS support to moveBlob (#2929) (c461546)

**説明:**

Cloud Storage Javaライブラリの機能追加、バグ修正、依存関係の更新が含まれています。内容は、メソッドごとのヘッダー値設定オプション追加、ParallelUploadConfig.BuilderへのsetUploadBlobInfoFactory追加、WatchdogTimeoutExceptionの再試行可能分類、Javaコードジェネレーターのバージョンアップ、gRPCベースのストレージにおけるプロジェクトID検証の遅延化、再開可能なアップロード時のKMSキー処理更新、sdk-platform-javaの依存関係更新、moveBlobへのHNSサポートに関する注釈追加です。

**製品への影響有無:** 無

**対処方法:**

- メソッドごとにヘッダー値を設定する場合は、関連ドキュメントを参照してください。
- その他の変更は、製品に対して大きな影響はなく、特段の対応は不要です。

### Changes for google-cloud-storage (Python) - v3.1.0

**原文:**

- Add api_key argument to Client constructor (#1441) (c869e15)
- Add Bucket.move_blob() for HNS-enabled buckets (#1431) (24c000f)

**説明:**

Cloud Storage Pythonライブラリの機能追加が含まれています。内容は、Clientコンストラクタへのapi_key引数の追加、HNS対応バケットへのBucket.move_blob()メソッドの追加です。

**製品への影響有無:** 無

**対処方法:**

- APIキーを使用して認証する場合は、関連ドキュメントを参照してください。
- HNS対応バケットでBlobを移動する場合は、 `Bucket.move_blob()` メソッドを使用してください。


## Pub/Sub

### Changes for google-cloud-pubsub (Java) - v1.137.1

**原文:**

- **deps:** Update the Java code generator (gapic-generator-java) to 2.54.0 (ccf670f)
- Update dependency com.google.cloud:google-cloud-bigquery to v2.48.0 (#2343) (3bbd7e1)
- Update dependency com.google.cloud:google-cloud-core to v2.52.0 (#2348) (f0977b4)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.44.0 (#2349) (90ed10b)
- Update googleapis/sdk-platform-java action to v2.54.0 (#2347) (ac8db2d)

**説明:**

Pub/Sub Javaライブラリの依存関係の更新が含まれています。内容は、Javaコードジェネレーター、BigQuery、Google Cloud Core、Google Cloud SDKのバージョンアップです。

**製品への影響有無:** 無

**対処方法:** 特に対応は不要です。

# Title: February 28, 2025 
Link: https://cloud.google.com/release-notes#February_28_2025<br>
## Apigee X

### Announcement

**原文:** 

On February 28, 2025, we released an updated version of Apigee (1-14-0-apigee-8).

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to complete across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** 

Apigeeのアップデートバージョン(1-14-0-apigee-8)が2025年2月28日にリリースされました。
本番環境へのロールアウトは2営業日以内に開始され、Google Cloudのすべてのゾーンへの展開が完了するまでに4営業日以上かかる場合があります。 
このリリースに含まれる機能や修正は、ロールアウトが完了するまで利用できない場合があります。

**製品への影響有無:** 有

**対処方法:** 

特に対処は不要ですが、新バージョンが完全に展開されるまで、一部の新機能や修正が利用できない可能性があります。


### Security

**原文:**

| Bug ID | Description |
| --- | --- |
| **382883585** | **Fixed a vulnerability in the JavaCallout policy.** |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:**

セキュリティに関するアップデートが2件含まれています。

* Bug ID 382883585: JavaCalloutポリシーの脆弱性を修正しました。
* セキュリティインフラストラクチャとライブラリに対するアップデート

**製品への影響有無:** 有

**対処方法:** 

JavaCalloutポリシーを使用している場合は、このリリースに含まれるセキュリティ修正によって影響を受ける可能性があります。 
Apigee Xインスタンスを最新バージョンにアップグレードすることを推奨します。

## Spanner

### Libraries

**原文:** 

A monthly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
## Go

## Changes for spanner/admin/database/apiv1

[spanner/admin/database/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/spanner/admin/database/apiv1)

(以下省略)

**説明:** 

Cloud SDK全体のクライアントライブラリの月次更新の概要です。 
Spannerに関わる部分では、Go、Java、Node.js、Pythonの各言語のクライアントライブラリに、バグ修正、新機能の追加、パフォーマンスの改善などが含まれています。 

**製品への影響有無:** 

各言語のクライアントライブラリを利用している場合、変更内容に影響を受ける可能性があります。

**対処方法:** 

各言語のリリースノートの詳細を確認し、必要な場合はアプリケーションのコードを更新してください。 
今回のリリースノートは、コードの変更点やバグ修正などが中心で、Spannerサービス自体への影響は記載されていません。

# Title: February 26, 2025 
Link: https://cloud.google.com/release-notes#February_26_2025<br>
## Cloud Monitoring

### Uptime check logging

**原文:** 

You can now enable and disable the logging of uptime-check failures by using the `log_check_failures` field  in the Cloud Monitoring API.

[`log_check_failures` field](https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.uptimeCheckConfigs#uptimeCheckConfig.FIELDS.log_check_failures)

**説明:**

Cloud Monitoring API の `log_check_failures` フィールドを使用して、アップタイムチェックの失敗をログに記録するかしないかを制御できるようになりました。

**影響有無:** 無

**対処方法:** 
- アップタイムチェックの失敗ログを制御したい場合は、`log_check_failures`フィールドを設定してください。


## Google Kubernetes Engine

### GKE cluster versions updated

**原文:** 

GKE cluster versions have been updated.

 **New versions available for upgrades and new clusters.**

 The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

**説明:**

GKEクラスタバージョンが更新されました。新しいクラスタの作成や、既存クラスタの制御プレーンおよびノードのオプトインアップグレードに、新しいKubernetesバージョンが利用可能になりました。

**影響有無:**  有

**対処方法:** 
- 新しいクラスタバージョンを利用する場合は、リリースノートで提供されている情報を確認し、必要に応じてアップグレードを実施してください。

---
### Rapid channel updates
**原文:**

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.32.1-gke.1729000 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.29.14-gke.1020000
- 1.29.14-gke.1067000
- 1.30.10-gke.1042000
- 1.30.10-gke.1070000
- 1.31.6-gke.1027000
- 1.31.6-gke.1064000
- 1.32.2-gke.1182000

- The following versions are no longer available in the Rapid channel:

- 1.29.13-gke.1109000
- 1.29.13-gke.1169000
- 1.30.9-gke.1201000
- 1.30.9-gke.1231000
- 1.31.5-gke.1169000
- 1.31.5-gke.1233000
- 1.32.1-gke.1489001

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.14-gke.1018000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.10-gke.1022000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.6-gke.1020000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.14-gke.1018000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.10-gke.1022000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.6-gke.1020000 with this release.

**説明:**

GKE Rapidチャンネルのクラスタバージョンが更新されました。デフォルトバージョンが1.32.1-gke.1729000になり、複数のバージョンが利用可能になりました。また、いくつかのバージョンは利用不可になりました。自動アップグレードの対象バージョンも更新されています。

**影響有無:** 有

**対処方法:**
- Rapidチャンネルを利用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレードを実施してください。

---
### Regular channel updates
**原文:**

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.5-gke.1169000 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.29.13-gke.1169000
- 1.30.9-gke.1201000
- 1.31.5-gke.1233000

- The following versions are no longer available in the Regular channel:

- 1.29.13-gke.1038000
- 1.30.9-gke.1046000
- 1.31.5-gke.1068000
- 1.32.1-gke.1200003

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.13-gke.1109000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.9-gke.1127000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.13-gke.1109000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.9-gke.1127000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.5-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.32 to version 1.32.1-gke.1357001 with this release.

**説明:**

GKE Regularチャンネルのクラスタバージョンが更新されました。デフォルトバージョンが1.31.5-gke.1169000になり、複数のバージョンが利用可能になりました。また、いくつかのバージョンは利用不可になりました。自動アップグレードの対象バージョンも更新されています。

**影響有無:** 有

**対処方法:**
- Regularチャンネルを利用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレードを実施してください。

---
### Stable channel updates
**原文:**

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.30.9-gke.1009000 is now the default version for cluster creation in the Stable channel.
- The following versions are now available in the Stable channel:

- 1.29.13-gke.1038000
- 1.30.9-gke.1046000
- 1.31.5-gke.1068000

- The following versions are no longer available in the Stable channel:

- 1.29.12-gke.1270000
- 1.30.8-gke.1261000
- 1.31.4-gke.1372000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.29.13-gke.1006000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.9-gke.1009000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.13-gke.1006000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.9-gke.1009000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.31 to version 1.31.5-gke.1023000 with this release.

**説明:**

GKE Stableチャンネルのクラスタバージョンが更新されました。デフォルトバージョンが1.30.9-gke.1009000になり、複数のバージョンが利用可能になりました。また、いくつかのバージョンは利用不可になりました。自動アップグレードの対象バージョンも更新されています。

**影響有無:** 有

**対処方法:**
- Stableチャンネルを利用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレードを実施してください。

---
### Extended channel updates
**原文:**

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.5-gke.1169000 is now the default version for cluster creation in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.16-gke.2477000
- 1.28.15-gke.1781000
- 1.28.15-gke.1881000
- 1.29.13-gke.1169000
- 1.30.9-gke.1201000
- 1.31.5-gke.1233000

- The following versions are no longer available in the Extended channel:

- 1.27.16-gke.2440000
- 1.28.15-gke.1612000
- 1.28.15-gke.1844000
- 1.29.13-gke.1038000
- 1.30.9-gke.1046000
- 1.31.5-gke.1068000
- 1.32.1-gke.1200003

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.1641000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.13-gke.1109000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.9-gke.1127000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.5-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.32 to version 1.32.1-gke.1357001 with this release.

**説明:**

GKE Extendedチャンネルのクラスタバージョンが更新されました。デフォルトバージョンが1.31.5-gke.1169000になり、複数のバージョンが利用可能になりました。また、いくつかのバージョンは利用不可になりました。自動アップグレードの対象バージョンも更新されています。

**影響有無:** 有

**対処方法:**
- Extendedチャンネルを利用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認し、必要に応じてクラスタのアップグレードを実施してください。

---

### GKE cluster versions and node versions updates

**原文:**
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.5-gke.1169000 is now the default version for cluster creation.
- The following versions are now available:

- 1.29.14-gke.1020000
- 1.29.14-gke.1067000
- 1.30.10-gke.1042000
- 1.30.10-gke.1070000
- 1.31.6-gke.1027000
- 1.31.6-gke.1064000
- 1.32.2-gke.1182000

- The following node versions are now available:

- 1.27.16-gke.2477000
- 1.28.15-gke.1881000
- 1.29.14-gke.1020000
- 1.29.14-gke.1067000
- 1.30.10-gke.1042000
- 1.30.10-gke.1070000
- 1.31.6-gke.1027000
- 1.31.6-gke.1064000
- 1.32.2-gke.1182000

- The following versions are no longer available:

- 1.29.12-gke.1270000
- 1.30.8-gke.1162001
- 1.30.9-gke.1231000
- 1.31.4-gke.1372000
- 1.32.1-gke.1200003

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.29.13-gke.1109000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.9-gke.1009000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.13-gke.1109000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.9-gke.1009000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.31 to version 1.31.5-gke.1169000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.32 to version 1.32.1-gke.1357001 with this release.

**説明:**

GKEのクラスタバージョンとノードバージョンが更新されました。デフォルトのクラスタ作成バージョンが1.31.5-gke.1169000になり、複数のバージョンが利用可能になりました。また、いくつかのバージョンは利用不可になりました。自動アップグレードの対象バージョンも更新されています。

**影響有無:** 有

**対処方法:**

- GKEを利用している場合は、利用可能なクラスタバージョンとノードバージョン、そして自動アップグレードの対象バージョンを確認し、必要に応じてクラスタとノードのアップグレードを実施してください。
# Title: February 25, 2025 
Link: https://cloud.google.com/release-notes#February_25_2025<br>
## BigQuery

### Announcement

**原文:** You can now see a list of BigQuery API and service dependencies. You can also review the effects of disabling an API or service. 

[list of BigQuery API and service dependencies](https://cloud.google.com/bigquery/docs/service-dependencies)

**説明:** BigQuery APIとサービスの依存関係がリストで確認できるようになりました。また、APIまたはサービスを無効にした場合の影響についても確認できます。提供されたリンクから詳細を確認できます。

**影響有無:** 無

**対処方法:** 特に対応は不要です。BigQueryのAPIやサービスの依存関係、及び無効化の影響について確認したい場合は、上記リンクを参照してください。 

# Title: February 24, 2025 
Link: https://cloud.google.com/release-notes#February_24_2025<br>
## Cloud Storage (Node.js)

### Changes for @google-cloud/storage

**原文:**
- Export SaveData type from index.ts (#2580) (dbf510c)

**説明:** 
Node.js 用 Cloud Storage クライアントライブラリ(@google-cloud/storage) のバージョン 7.15.2 がリリースされました。このアップデートでは、 `SaveData` タイプが `index.ts` からエクスポートされるようになり、開発者がより柔軟にこのタイプを利用できるようになりました。 

**製品への影響有無:** 無

**対処方法:** 
- この変更は、`SaveData` タイプを直接利用する開発者以外には影響ありません。
- `SaveData` タイプを利用する場合は、バージョン 7.15.2 以上にアップデートすることを推奨します。 

# Title: February 21, 2025 
Link: https://cloud.google.com/release-notes#February_21_2025<br>
## Cloud Composer
### Deployment Manager API automatic enabling disabled

**原文:** Starting April 14, 2025, **the Deployment Manager API won't be automatically enabled** when you enable Cloud Composer API because this API isn't used by the Cloud Composer service.

**説明:** 2025年4月14日以降、Cloud Composer APIを有効にしても、Deployment Manager APIは自動的に有効化されなくなります。これは、Cloud ComposerサービスがDeployment Manager APIを使用しないためです。

**製品への影響有無:** 無

**対処方法:** 特に対応は不要です。Cloud Composerの利用に影響はありません。 Deployment Manager APIが必要な場合は、手動で有効化する必要があります。


## Google Kubernetes Engine
### Default value for `whenUnsatisfiable` field in GKE compute class specification changed

**原文:** In GKE version 1.33 and later, if you omit the `whenUnsatisfiable` field in a new GKE compute class specification, the default value is `DoNotScaleUp`. In GKE versions earlier than 1.33, the default value is `ScaleUpAnyway`. Ensure that your compute class specifications explicitly set a value in the `whenUnsatisfiable` field after you upgrade to version 1.33. This change only affects new `ComputeClass` objects that you create that omit the `whenUnsatisfiable` field. Any existing compute classes that omit the field continue to use `ScaleUpAnyway` as the default value even after you upgrade the cluster to version 1.33 or later. To learn more about the `whenUnsatisfiable` field, see Define scaling behavior when no priority rules apply. [Define scaling behavior when no priority rules apply](https://cloud.google.com/kubernetes-engine/docs/concepts/about-custom-compute-classes#define-scaling-no-rules)

**説明:** GKEバージョン1.33以降では、新しいGKE compute classの仕様で`whenUnsatisfiable`フィールドを省略した場合、デフォルト値は`DoNotScaleUp`になります。GKEバージョン1.33より前のバージョンでは、デフォルト値は`ScaleUpAnyway`でした。バージョン1.33以降にアップグレードした後は、compute classの仕様で`whenUnsatisfiable`フィールドの値を明示的に設定してください。この変更は、`whenUnsatisfiable`フィールドを省略して新しく作成した`ComputeClass`オブジェクトにのみ影響します。フィールドを省略した既存のcompute classは、クラスターをバージョン1.33以降にアップグレードした後も、デフォルト値として`ScaleUpAnyway`を使用し続けます。

**製品への影響有無:** 有

**対処方法:** 
* GKEバージョン1.33以降にアップグレードする場合は、新規にcompute classを作成する際に`whenUnsatisfiable`フィールドを明示的に設定することをお勧めします。
* 既存のcompute classについては、アップグレード後もデフォルト値は`ScaleUpAnyway`のままですが、必要に応じて`whenUnsatisfiable`フィールドを設定することを検討してください。
# Title: February 20, 2025 
Link: https://cloud.google.com/release-notes#February_20_2025<br>
# Google Kubernetes Engine

## Changed

**原文:**

New GKE 1.27 patch versions starting with version 1.27.16-gke.2440000 are built with COS 109, because COS 105 is near the end of support. GKE makes new 1.27 patch versions available using COS 109. However, GKE won't auto-upgrade nodes across the COS milestone boundary, from a patch version using COS 105 to a patch version using COS 109.

If you manually upgrade your nodes to 1.27.16-gke.2440000 or later, GKE continues node auto-upgrades as normal. Control plane upgrades are unaffected, and cluster auto-upgrades to the next minor version towards the end of extended support proceed as normal.

To learn more, see Container-Optimized OS updates during the extended support period.

**説明:**

GKEバージョン1.27.16-gke.2440000以降では、ベースとなるContainer-Optimized OS (COS)がバージョン105から109に更新されます。ただし、GKEはCOSのメジャーバージョン間(105から109)のノード自動アップグレードは行いません。 

手動でノードを1.27.16-gke.2440000以降にアップグレードした場合は、通常通りノードの自動アップグレードが継続されます。コントロールプレーンのアップグレードは影響を受けず、拡張サポートの終了に向けて次のマイナーバージョンへのクラスタの自動アップグレードも通常通り行われます。

**製品への影響有無:**

有

**対処方法:**

GKE 1.27クラスタでCOS 109を使用するには、ノードをバージョン1.27.16-gke.2440000以降に手動でアップグレードする必要があります。自動アップグレードはCOS 109が利用可能なバージョンになってから有効になります。詳細については、提供されたリンクを参照してください。 

# Title: February 19, 2025 
Link: https://cloud.google.com/release-notes#February_19_2025<br>
## Apigee X

### Announcement - Apigee Xバージョンアップ

**原文:** On February 19, 2025, we released an updated version of Apigee (1-14-0-apigee-7).

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to complete across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** Apigee X のバージョン 1-14-0-apigee-7 がリリースされました。本番環境へのロールアウトは2営業日以内に開始され、Google Cloudのすべてのゾーンへの展開が完了するまでに4営業日以上かかる場合があります。

**製品への影響有無:**  有

**対処方法:** 
* 本番環境への適用は、リリースノート公開後2営業日から開始され、完了まで最大4営業日かかる可能性があります。 
* 新機能や修正プログラムが利用可能になるには、ロールアウトが完了するまで待つ必要があります。


### Security - セキュリティアップデート

**原文:**  | Bug ID | Description |
| --- | --- |
| **391714121** | **Security fix for Apigee infrastructure.**This addresses the following vulnerability: - CVE-2024-45338  |
- CVE-2024-45338

[CVE-2024-45338](https://nvd.nist.gov/vuln/detail/CVE-2024-45338)

**説明:** Apigee インフラストラクチャのセキュリティ修正が含まれています。CVE-2024-45338 の脆弱性に対応しています。

**製品への影響有無:** 有

**対処方法:** 特に必要ありません。自動的に適用されます。


### Fixed - セキュリティ基盤とライブラリのアップデート

**原文:** | Bug ID | Description |
| --- | --- |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:** セキュリティ基盤とライブラリがアップデートされました。

**製品への影響有無:**  有

**対処方法:** 特に必要ありません。自動的に適用されます。


## Artifact Registry

### Issue - Workforce Identity Federation ユーザーのプッシュまたはプルで Artifact Registry が 400 エラーを返す可能性

**原文:** Artifact Registry might give a 400 error on pushes or pulls for Workforce Identity Federation users. This issue is caused by Workforce Identity Federation attribute mappings in the Artifact Registry URL causing problems on the backend.

[attribute mappings](https://cloud.google.com/iam/docs/workforce-identity-federation#attribute-mappings)
 To mitigate this issue, you can push or pull from Artifact Registry without attribute mappings, or reduce the length of your attribute mappings.

**説明:** Workforce Identity Federation ユーザーが Artifact Registry に対してプッシュまたはプルを実行する際に、400 エラーが発生する可能性があります。この問題は、Artifact Registry URL 内の Workforce Identity Federation 属性マッピングが原因で発生します。

**製品への影響有無:**  有

**対処方法:** 
* 属性マッピングを使用せずに Artifact Registry からプッシュまたはプルを行うか、属性マッピングの長さを短縮します。 
* 詳細については、属性マッピングのドキュメントを参照してください。 

# Title: February 18, 2025 
Link: https://cloud.google.com/release-notes#February_18_2025<br>
## Google Kubernetes Engine (1/5)

### Changed

原文:

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
>
> - Version 1.32.1-gke.1489001 is now the default version for cluster creation in the Rapid channel.
> - The following versions are now available in the Rapid channel:
> 
> - 1.29.14-gke.1018000
> - 1.30.9-gke.1231000
> - 1.30.10-gke.1022000
> - 1.31.6-gke.1020000
> - 1.32.1-gke.1729000
> 
> - The following versions are no longer available in the Rapid channel:
> 
> - 1.29.13-gke.1038000
> - 1.30.9-gke.1046000
> - 1.30.9-gke.1127000
> - 1.31.5-gke.1068000
> - 1.32.1-gke.1200003

説明:

Rapid リリースチャネルにおいて、Kubernetes クラスタのバージョン 1.32.1-gke.1489001 がデフォルトバージョンになりました。また、複数のバージョンが利用可能になり、いくつかは利用不可になりました。

影響有無:

有

対処方法:

Rapidチャネルでクラスタを新規作成する場合、デフォルトでバージョン1.32.1-gke.1489001が使用されます。以前のバージョンを使用している場合は、アップグレードを検討してください。利用不可になったバージョンを使用している場合は、サポート対象のバージョンへのアップグレードが必要です。

## Google Kubernetes Engine (2/5)

### Changed

原文:

> - Auto-upgrade targets are now available for the following minor versions:
> 
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.13-gke.1109000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.9-gke.1201000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.5-gke.1169000 with this release.
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.13-gke.1109000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.9-gke.1201000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.5-gke.1169000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.32 to version 1.32.1-gke.1357001 with this release.

説明:

Rapid リリースチャネルにおいて、自動アップグレードが有効になっているクラスタは、記載されているバージョンに自動的にアップグレードされます。 

影響有無:

有

対処方法:

自動アップグレードが有効になっていない場合は、記載されているバージョンへのアップグレードを検討してください。メンテナンスの除外設定をしている場合は、自動アップグレードの対象外となるため、手動でのアップグレードが必要になる場合があります。


## Google Kubernetes Engine (3/5)

### Changed

原文:

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
>
> - Version 1.31.5-gke.1068000 is now the default version for cluster creation in the Regular channel.
> - The following versions are now available in the Regular channel:
> 
> - 1.29.13-gke.1109000
> - 1.30.9-gke.1127000
> - 1.31.5-gke.1169000
> - 1.32.1-gke.1357001
> 
> - The following versions are no longer available in the Regular channel:
> 
> - 1.29.13-gke.1006000
> - 1.30.9-gke.1009000
> - 1.31.5-gke.1023000

説明:

Regular リリースチャネルにおいて、Kubernetes クラスタのバージョン 1.31.5-gke.1068000 がデフォルトバージョンになりました。また、複数のバージョンが利用可能になり、いくつかは利用不可になりました。

影響有無:

有

対処方法:

Regularチャネルでクラスタを新規作成する場合、デフォルトでバージョン 1.31.5-gke.1068000 が使用されます。以前のバージョンを使用している場合は、アップグレードを検討してください。利用不可になったバージョンを使用している場合は、サポート対象のバージョンへのアップグレードが必要です。

## Google Kubernetes Engine (4/5)

### Changed

原文:

> - Auto-upgrade targets are now available for the following minor versions:
> 
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.13-gke.1038000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.9-gke.1046000 with this release.
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.13-gke.1038000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.9-gke.1046000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.5-gke.1068000 with this release.

説明:

Regular リリースチャネルにおいて、自動アップグレードが有効になっているクラスタは、記載されているバージョンに自動的にアップグレードされます。

影響有無:

有

対処方法:

自動アップグレードが有効になっていない場合は、記載されているバージョンへのアップグレードを検討してください。メンテナンスの除外設定をしている場合は、自動アップグレードの対象外となるため、手動でのアップグレードが必要になる場合があります。

## Google Kubernetes Engine (5/5)

### Changed

原文:

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
> 
> - Version 1.30.8-gke.1261000 is now the default version for cluster creation in the Stable channel.
> - The following versions are now available in the Stable channel:
> 
> - 1.29.13-gke.1006000
> - 1.30.9-gke.1009000
> - 1.31.5-gke.1023000
> 
> - The following versions are no longer available in the Stable channel:
> 
> - 1.29.12-gke.1143001
> - 1.30.8-gke.1162001
> - 1.31.4-gke.1256000

説明:

Stable リリースチャネルにおいて、Kubernetes クラスタのバージョン 1.30.8-gke.1261000 がデフォルトバージョンになりました。また、複数のバージョンが利用可能になり、いくつかは利用不可になりました。

影響有無:

有

対処方法:

Stable チャネルでクラスタを新規作成する場合、デフォルトでバージョン 1.30.8-gke.1261000 が使用されます。以前のバージョンを使用している場合は、アップグレードを検討してください。利用不可になったバージョンを使用している場合は、サポート対象のバージョンへのアップグレードが必要です。

# Title: February 17, 2025 
Link: https://cloud.google.com/release-notes#February_17_2025<br>
## BigQuery - Node.js client library version 7.9.2

### Changed

**原文**

Avoid schema field mutation when passing selectedFields opt (#1437) (27044d5)

**説明**

`selectedFields` オプションを渡すときにスキーマフィールドが変更されるのを防ぐ変更です。 

**製品への影響有無**

影響の可能性は低いですが、`selectedFields` オプションを使用している場合は注意が必要です。

**対処方法**

`selectedFields` オプションを利用している場合は、バージョンアップ後に動作を確認することを推奨します。

## BigQuery - Java client library version 2.48.0

### Changed

**原文**

- Implement wasNull for BigQueryResultSet (#3650) (c7ef94b)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.59.0 (#3660) (3a6228b)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20250128-2.0.0 (#3667) (0b92af6)
- Update dependency com.google.cloud:google-cloud-datacatalog-bom to v1.63.0 (#3661) (9bc8c01)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.43.0 (#3669) (4d9e0ff)
- Update CONTRIBUTING.md for users without branch permissions (#3670) (009b9a2)

**説明**

- `BigQueryResultSet` に `wasNull` を実装しました。
- 依存関係の更新
    - `com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1` を v2.59.0 にアップデート
    - `com.google.apis:google-api-services-bigquery` を v2-rev20250128-2.0.0 にアップデート
    - `com.google.cloud:google-cloud-datacatalog-bom` を v1.63.0 にアップデート
    - `com.google.cloud:sdk-platform-java-config` を v3.43.0 にアップデート
- ブランチ権限のないユーザー向けに `CONTRIBUTING.md` を更新

**製品への影響有無**

軽微な影響がある可能性があります。

**対処方法**

バージョンアップ後に動作を確認することを推奨します。特に、依存関係の更新によって予期しない問題が発生する可能性があります。

 

# Title: February 14, 2025 
Link: https://cloud.google.com/release-notes#February_14_2025<br>
## Cloud Monitoring

### Changed

**原文:** The **Dashboards** page of the Cloud Console has been refreshed. For more information about dashboards, see the following documents:

- Dashboards overview.
- Install a dashboard by uploading a template from GitHub.  
- Create and manage custom dashboards.

**説明:** Cloud Console のダッシュボードページが刷新されました。ダッシュボードの詳細については、記載されているドキュメントを参照してください。

**影響有無:** 無

**対処方法:**  特になし。


## Compute Engine

### Changed

**原文:** Starting as soon as February 14, 2025, projects might start seeing a **Data protection** pane on the **Create an instance page** in the Google Cloud console. If you see the **Data protection** pane, it selects an option to automatically back up data by default, which is recommended to make sure you can recover your data if it's lost due to unforeseen events. The backup incurs additional costs according to either Backup and DR pricing or Compute Engine pricing for disk snapshots. 

If desired, you can select a different backup option (or disable backups) before you finish creating an instance. You can also change which backup option your project selects by default. For more information, see Configure the default backup setting for the console.

**説明:** 2025年2月14日以降、Google Cloud コンソールのインスタンス作成ページに「データ保護」ペインが表示されるようになります。このペインでは、デフォルトでデータの自動バックアップが選択され、予期せぬイベントでデータが失われた場合に備えて復元できるようにすることを推奨しています。バックアップは、Backup and DRの料金またはディスクスナップショットのCompute Engineの料金に従って追加費用が発生します。
インスタンスの作成を完了する前に、必要に応じて別のバックアップオプションを選択したり、バックアップを無効にしたりできます。また、プロジェクトでデフォルトで選択されるバックアップオプションを変更することもできます。 

**影響有無:** 有（デフォルトでバックアップが有効になるため、追加費用が発生する可能性があります）

**対処方法:** 
* インスタンス作成時にバックアップ設定を確認し、必要に応じて変更する。
* プロジェクトのデフォルトのバックアップ設定を確認し、必要に応じて変更する。

# Title: February 11, 2025 
Link: https://cloud.google.com/release-notes#February_11_2025<br>
### Google Kubernetes Engine

#### Changed

##### 原文
> GKE cluster versions have been updated.
> 
> **New versions available for upgrades and new clusters.**
>
> The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades.
>
> [GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
> [Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

##### 説明
GKEクラスタバージョンが更新されました。新しいバージョンが、アップグレードと新規クラスタで利用できるようになりました。

##### 影響有無
 無

##### 対処方法
 特になし


#### Changed

##### 原文
>  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
> 
> - Version 1.32.1-gke.1200003 is now the default version for cluster creation in the Rapid channel.
> - The following versions are now available in the Rapid channel:
> 
> - 1.29.13-gke.1169000
> - 1.30.9-gke.1201000
> - 1.31.5-gke.1233000
> - 1.32.1-gke.1489001
> 
> - The following versions are no longer available in the Rapid channel:
> 
> - 1.28.15-gke.1641000
> - 1.28.15-gke.1673000
> - 1.28.15-gke.1720000
> - 1.29.13-gke.1006000
> - 1.30.9-gke.1009000
> - 1.31.5-gke.1023000
> - 1.32.0-gke.1448000
> 
> - Auto-upgrade targets are now available for the following minor versions:
> 
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.13-gke.1038000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.9-gke.1046000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.5-gke.1068000 with this release.
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.13-gke.1038000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.9-gke.1046000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.5-gke.1068000 with this release.
> 
> [1.32.1-gke.1200003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1321)
> - 1.29.13-gke.1169000
> - 1.30.9-gke.1201000
> - 1.31.5-gke.1233000
> - 1.32.1-gke.1489001
> 
> [1.29.13-gke.1169000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
> [1.30.9-gke.1201000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
> [1.31.5-gke.1233000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
> [1.32.1-gke.1489001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1321)
> - 1.28.15-gke.1641000
> - 1.28.15-gke.1673000
> - 1.28.15-gke.1720000
> - 1.29.13-gke.1006000
> - 1.30.9-gke.1009000
> - 1.31.5-gke.1023000
> - 1.32.0-gke.1448000
> 
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.13-gke.1038000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.9-gke.1046000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.5-gke.1068000 with this release.
> 
> [1.29.13-gke.1038000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
> [1.30.9-gke.1046000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
> [1.31.5-gke.1068000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
> [maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.13-gke.1038000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.9-gke.1046000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.5-gke.1068000 with this release.
> 
> [1.29.13-gke.1038000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
> [1.30.9-gke.1046000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
> [1.31.5-gke.1068000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)

##### 説明
RapidチャネルにおけるGKEクラスタのバージョンが更新されました。

- クラスタ作成時のデフォルトバージョンが 1.32.1-gke.1200003 に変更されました。
- 1.29.13-gke.1169000、1.30.9-gke.1201000、1.31.5-gke.1233000、1.32.1-gke.1489001 が利用可能になりました。
- 1.28.15-gke.1641000、1.28.15-gke.1673000、1.28.15-gke.1720000、1.29.13-gke.1006000、1.30.9-gke.1009000、1.31.5-gke.1023000、1.32.0-gke.1448000 は利用できなくなりました。

自動アップグレードが有効になっているクラスタの場合、以下のバージョンに自動的にアップグレードされます。

- 1.28 から 1.29.13-gke.1038000
- 1.29 から 1.30.9-gke.1046000
- 1.30 から 1.31.5-gke.1068000

メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因があるクラスタでは、以下のパッチのみのバージョンに自動アップグレードされます。

- 1.29 から 1.29.13-gke.1038000
- 1.30 から 1.30.9-gke.1046000
- 1.31 から 1.31.5-gke.1068000

##### 影響有無
 有

##### 対処方法
 自動アップグレードが無効になっているクラスタは、利用可能なバージョンを確認し、必要に応じてアップグレードを実施してください。


#### Changed

##### 原文
>  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
> 
> - Version 1.31.5-gke.1023000 is now the default version for cluster creation in the Regular channel.
> - The following versions are now available in the Regular channel:
> 
> - 1.29.13-gke.1038000
> - 1.30.9-gke.1046000
> - 1.31.5-gke.1068000
> - 1.32.1-gke.1200003
> 
> - The following versions are no longer available in the Regular channel:
> 
> - 1.28.15-gke.1612000
> - 1.28.15-gke.1641000
> - 1.29.12-gke.1270000
> - 1.30.8-gke.1261000
> - 1.31.4-gke.1372000
> 
> - Auto-upgrade targets are now available for the following minor versions:
> 
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.13-gke.1006000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.9-gke.1009000 with this release.
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.13-gke.1006000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.9-gke.1009000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.5-gke.1023000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.32 to version 1.32.1-gke.1200003 with this release.
> 
> [1.31.5-gke.1023000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
> - 1.29.13-gke.1038000
> - 1.30.9-gke.1046000
> - 1.31.5-gke.1068000
> - 1.32.1-gke.1200003
> 
> [1.29.13-gke.1038000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
> [1.30.9-gke.1046000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
> [1.31.5-gke.1068000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
> [1.32.1-gke.1200003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1321)
> - 1.28.15-gke.1612000
> - 1.28.15-gke.1641000
> - 1.29.12-gke.1270000
> - 1.30.8-gke.1261000
> - 1.31.4-gke.1372000
> 
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.13-gke.1006000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.9-gke.1009000 with this release.
> 
> [1.29.13-gke.1006000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
> [1.30.9-gke.1009000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
> [maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.13-gke.1006000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.9-gke.1009000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.5-gke.1023000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.32 to version 1.32.1-gke.1200003 with this release.
> 
> [1.29.13-gke.1006000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
> [1.30.9-gke.1009000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
> [1.31.5-gke.1023000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
> [1.32.1-gke.1200003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1321)

##### 説明
RegularチャネルにおけるGKEクラスタのバージョンが更新されました。

- クラスタ作成時のデフォルトバージョンが1.31.5-gke.1023000に変更されました。
- 1.29.13-gke.1038000、1.30.9-gke.1046000、1.31.5-gke.1068000、1.32.1-gke.1200003が利用可能になりました。
- 1.28.15-gke.1612000、1.28.15-gke.1641000、1.29.12-gke.1270000、1.30.8-gke.1261000、1.31.4-gke.1372000は利用できなくなりました。

自動アップグレードが有効になっているクラスタの場合、以下のバージョンに自動的にアップグレードされます。

- 1.28 から 1.29.13-gke.1006000
- 1.29 から 1.30.9-gke.1009000

メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因があるクラスタでは、以下のパッチのみのバージョンに自動アップグレードされます。

- 1.29 から 1.29.13-gke.1006000
- 1.30 から 1.30.9-gke.1009000
- 1.31 から 1.31.5-gke.1023000
- 1.32 から 1.32.1-gke.1200003

##### 影響有無
 有

##### 対処方法
自動アップグレードが無効になっているクラスタは、利用可能なバージョンを確認し、必要に応じてアップグレードを実施してください。


#### Changed

##### 原文
>  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
> 
> - Version 1.30.8-gke.1162001 is now the default version for cluster creation in the Stable channel.
> - The following versions are now available in the Stable channel:
> 
> - 1.29.12-gke.1270000
> - 1.30.8-gke.1261000
> - 1.31.4-gke.1372000
> 
> - The following versions are no longer available in the Stable channel:
> 
> - 1.28.15-gke.1480000
> - 1.28.15-gke.1503000
> - 1.29.12-gke.1120001
> - 1.30.8-gke.1128001
> - 1.30.8-gke.1162000
> - 1.31.4-gke.1183000
> 
> - Auto-upgrade targets are now available for the following minor versions:
> 
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.29.12-gke.1143001 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.8-gke.1162001 with this release.
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.12-gke.1143001 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.8-gke.1162001 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.31 to version 1.31.4-gke.1256000 with this release.
> 
> [1.30.8-gke.1162001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1308)
> - 1.29.12-gke.1270000
> - 1.30.8-gke.1261000
> - 1.31.4-gke.1372000
> 
> [1.29.12-gke.1270000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12912)
> [1.30.8-gke.1261000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1308)
> [1.31.4-gke.1372000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1314)
> - 1.28.15-gke.1480000
> - 1.28.15-gke.1503000
> - 1.29.12-gke.1120001
> - 1.30.8-gke.1128001
> - 1.30.8-gke.1162000
> - 1.31.4-gke.1183000
> 
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.29.12-gke.1143001 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.8-gke.1162001 with this release.
> 
> [1.29.12-gke.1143001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12912)
> [1.30.8-gke.1162001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1308)
> [maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.12-gke.1143001 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.8-gke.1162001 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.31 to version 1.31.4-gke.1256000 with this release.
> 
> [1.29.12-gke.1143001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12912)
> [1.30.8-gke.1162001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1308)
> [1.31.4-gke.1256000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1314)

##### 説明
StableチャネルにおけるGKEクラスタのバージョンが更新されました。

- クラスタ作成時のデフォルトバージョンが1.30.8-gke.1162001に変更されました。
- 1.29.12-gke.1270000、1.30.8-gke.1261000、1.31.4-gke.1372000が利用可能になりました。
- 1.28.15-gke.1480000、1.28.15-gke.1503000、1.29.12-gke.1120001、1.30.8-gke.1128001、1.30.8-gke.1162000、1.31.4-gke.1183000は利用できなくなりました。

自動アップグレードが有効になっているクラスタの場合、以下のバージョンに自動的にアップグレードされます。

- 1.28 から 1.29.12-gke.1143001
- 1.29 から 1.30.8-gke.1162001

メンテナンスの除外など、マイナーバージョンのアップグレードを妨げる要因があるクラスタでは、以下のパッチのみのバージョンに自動アップグレードされます。

- 1.29 から 1.29.12-gke.1143001
- 1.30 から 1.30.8-gke.1162001
- 1.31 から 1.31.4-gke.1256000

##### 影響有無
 有

##### 対処方法
自動アップグレードが無効になっているクラスタは、利用可能なバージョンを確認し、必要に応じてアップグレードを実施してください。


#### Changed

##### 原文
>  > **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.
> 
> - Version 1.31.5-gke.1023000 is now the default version for cluster creation in the Extended channel.
> - The following versions are now available in the Extended channel:
> 
> - 1.27.16-gke.2296000
> - 1.27.16-gke.2387000
> - 1.28.15-gke.1781000
> - 1.29.13-gke.1038000
> - 1.30.9-gke.1046000
> - 1.31.5-gke.1068000
> - 1.32.1-gke.1200003
> 
> - The following versions are no longer available in the Extended channel:
> 
> - 1.27.16-gke.2246000
> - 1.27.16-gke.2342000
> - 1.29.12-gke.1270000
> - 1.30.8-gke.1261000
> - 1.31.4-gke.1372000
> 
> - The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
> 
> - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2270000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.13-gke.1006000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.9-gke.1009000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.5-gke.1023000 with this release.
> - Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.32 to version 1.32.1-gke.1200003 with this release.
> 
> [1.31.5-gke.1023000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
> - 1.27.16-gke.2296000
> - 1.27.16-gke.2387000
> - 1.28.15-gke.1781000
> - 1.29.13-gke.1038000
> - 1.30.9-gke.1046000
> - 1.31.5-gke.1068000
> - 1.32.1-gke.1200003
> 
> [1.27.16-gke.2296000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
> [1.27.16-gke.2387000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
> [1.28.15-gke.1781000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
> [1.29.13-gke.1038000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
> [1.30.9-gke.1046000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.

# Title: February 10, 2025 
Link: https://cloud.google.com/release-notes#February_10_2025<br>
## BigQuery

### Changes for bigquery/storage/apiv1beta1 (Changed)

**原文:**

- **bigquery:** Broken github.com/envoyproxy/go-control-plane/envoy dep (#11556) (e70d63b), refs #11542
- **bigquery:** Move MaxStaleness field to table level (#10066) (164492d)

**説明:**

- Go用BigQuery Storage API v1beta1クライアントライブラリのバージョン1.66.2と1.66.1がリリースされました。
    - v1.66.2では、依存関係の破損問題 (#11556) が修正されました。
    - v1.66.1では、MaxStalenessフィールドがテーブルレベルに移動しました (#10066)。

**影響有無:** 有

**対処方法:**

- Go用BigQuery Storage API v1beta1クライアントライブラリを使用している場合は、最新バージョン (1.66.2) にアップグレードしてください。 

# Title: February 07, 2025 
Link: https://cloud.google.com/release-notes#February_07_2025<br>
## Cloud Composer 

### Announcement

#### 原文

Starting March 2025, the **default version for new Cloud Composer environments** changes from Cloud Composer 2 to Cloud Composer 3.

New environments that are created without a specified version will use the default Airflow build of Cloud Composer 3, `composer-3-airflow-2`. Currently, the default version is `composer-2-airflow-2`.


#### 説明

2025年3月以降、Cloud Composer 環境の新規作成時のデフォルトバージョンが、Cloud Composer 2 から Cloud Composer 3 に変更されます。

バージョンを指定せずに新しい環境を作成すると、Cloud Composer 3 のデフォルト Airflow ビルドである `composer-3-airflow-2` が使用されます。現在のデフォルトバージョンは `composer-2-airflow-2` です。


#### 製品への影響有無

有

#### 対処方法

2025年3月以降もCloud Composer 2を使い続けたい場合は、環境作成時にバージョンを明示的に指定する必要があります。 
また、Cloud Composer 3へのアップグレードを検討してください。 
アップグレードにより、新機能の利用やパフォーマンスの向上が見込めます。

# Title: February 06, 2025 
Link: https://cloud.google.com/release-notes#February_06_2025<br>
## Apigee X

### Announcement
**原文:** On February 6, 2025, we released an updated version of Apigee (1-14-0-apigee-6).

**説明:** Apigeeのアップデートバージョン(1-14-0-apigee-6)が2025年2月6日にリリースされました。
このリリースは今後数営業日中に本番環境へのロールアウトが開始され、Google Cloudのすべてのゾーンで完了するまでに4営業日以上かかる場合があります。
お客様のインスタンスでは、ロールアウトが完了するまで、新機能と修正プログラムが利用できない場合があります。
**影響有無:** 無
**対処方法:** 特になし

## Apigee X

### Fixed
**原文:** 
| Bug ID | Description |
| --- | --- |
| **381553288** | **Fixed class initialization issue in JavaCallout policy.** |
| **390559772** | **Fixed issue with ResponseCache policy not appearing in debug sessions when added using Apigee APIM Operator for Kubernetes.** |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:** 以下のバグが修正されました。
* JavaCalloutポリシーのクラス初期化問題
* Kubernetes 用 Apigee APIM Operator を使用して追加した際に、デバッグセッションに ResponseCache ポリシーが表示されない問題
* セキュリティ基盤とライブラリのアップデート
**影響有無:** 無
**対処方法:** 特になし

## Cloud Composer

### Changed
**原文:** Cloud Composer 2 is **no longer available in Mexico (northamerica-south1)**. It is not possible to select this region when creating a new Cloud Composer 2 environment. Existing Cloud Composer 2 environments and both new and existing Cloud Composer 3 environments are not affected by this change.

**説明:** Cloud Composer 2はメキシコ(northamerica-south1)リージョンでは利用できなくなりました。そのため、Cloud Composer 2環境を新規作成する際に、メキシコ(northamerica-south1)リージョンを選択することはできません。既存のCloud Composer 2環境、および新規/既存のCloud Composer 3環境は、この変更による影響を受けません。

**影響有無:** 有 (Cloud Composer 2をメキシコ(northamerica-south1)で利用している場合)

**対処方法:** 
* メキシコ(northamerica-south1)リージョンでCloud Composer 2環境を引き続き利用する必要がある場合は、Cloud Composer 3への移行を検討してください。


## Google Kubernetes Engine

### Changed

**原文:**

GKE cluster versions have been updated. ...(中略)...
[1.31.5-gke.1068000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
- 1.28.15-gke.1720000
- 1.29.13-gke.1109000
- 1.30.9-gke.1127000
- 1.31.5-gke.1169000
- 1.32.1-gke.1200003
- 1.32.1-gke.1357001

...(中略)...
[1.28.15-gke.1720000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12815)
[1.29.13-gke.1109000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v12913)
[1.30.9-gke.1127000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1309)
[1.31.5-gke.1169000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1315)
[1.32.1-gke.1200003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1321)
[1.32.1-gke.1357001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md#v1321)
...(中略)...

**説明:** 
GKEクラスタのバージョンが更新されました。

**Rapidチャンネル**
* 新規クラスタ作成時のデフォルトバージョンが 1.31.5-gke.1068000 に変更されました。
* 1.28.15-gke.1720000 から 1.32.1-gke.1357001 までのバージョンが利用可能になりました。
* 一部の古いバージョンは利用できなくなりました。
* 自動アップグレードが有効になっているクラスタは、記載されたバージョンに自動的にアップグレードされます。
    * メンテナンスの除外などが原因でマイナーバージョンへのアップグレードができないクラスタのために、パッチのみのバージョンアップグレードターゲットも提供されます。

**影響有無:** 有 (GKEクラスタの自動アップグレードを有効にしている場合)

**対処方法:** 
* 自動アップグレードが有効になっているクラスタは、リリースノートに記載されたバージョンに自動的にアップグレードされます。
* アップグレード前に新バージョンでの変更点を確認し、必要があれば対応してください。

**以下、原文に記載されている各チャンネルとバージョンの組み合わせについて、同様の説明を省略します。**

**(Regularチャンネル、Stableチャンネル、Extendedチャンネル、および最後のChangedセクションも同様です)** 

# Title: February 05, 2025 
Link: https://cloud.google.com/release-notes#February_05_2025<br>
## Cloud Storage

### Announcement

**原文:** Announced billing changes for accessing Cloud Storage through BigQuery take effect Feb 21, 2025. These changes were originally set to take effect on February 01, 2025.

[Announced billing changes](https://cloud.google.com/resources/storage/billing-fix-bigquery)

**説明:** BigQuery から Cloud Storage へのアクセスに関する請求の変更が、当初予定されていた 2025 年 2 月 1 日から **2025 年 2 月 21 日** に延期されました。

**影響有無:** 有（BigQuery から Cloud Storage へアクセスするユーザー）

**対処方法:** 請求変更の内容については、記載されているリンク先をご確認ください。請求が発生する可能性があるため、変更内容を理解しておく必要があります。 

# Title: February 04, 2025 
Link: https://cloud.google.com/release-notes#February_04_2025<br>
## Cloud Composer

### Announcement

####  原文
All Cloud Composer environment's GKE clusters are set up with maintenance exclusions from January 21, 2025 to February 10, 2025. For more information, see Maintenance exclusions.

[Maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)

#### 説明
2025年1月21日から2月10日までの期間、Cloud Composer環境のGKEクラスタに対してメンテナンスによる自動更新が行われないように設定されています。メンテナンスに関する情報は、メンテナンス除外設定のドキュメントをご確認ください。

#### 影響有無
無

#### 対処方法
特に対処は不要です。


## Google Kubernetes Engine

### Fixed

#### 原文
 A bug in the image streaming feature caused authentication-related failures in specific scenarios when the workload tried to access container image data. This bug has been fixed in the following GKE versions:

[image streaming](https://cloud.google.com/kubernetes-engine/docs/how-to/image-streaming)
- 1.32.0-gke.1448000 and above.
- 1.31.4-gke.1183000 and above.
- 1.30.8-gke.1261000 and above.


#### 説明
特定のシナリオにおいて、ワークロードがコンテナイメージデータにアクセスしようとした際に、イメージストリーミング機能のバグが原因で認証関連のエラーが発生していました。
この問題は、以下のGKEバージョンで修正されています。

- 1.32.0-gke.1448000 以上
- 1.31.4-gke.1183000 以上
- 1.30.8-gke.1261000 以上

#### 影響有無
有 (1.30.8-gke.1261000 より前のバージョンを利用している場合)

#### 対処方法
1.30.8-gke.1261000 以上のバージョンにアップグレードしてください。


### Security

#### 原文
 A security vulnerability was discovered in the Google Secret Manager Provider for Secret Store CSI Driver. This vulnerability could allow an attacker to gain access to the Kubernetes service account token of the CSI driver.

 For more details, see GCP-2025-006 security bulletin.

[GCP-2025-006 security bulletin](https://cloud.google.com/kubernetes-engine/security-bulletins#gcp-2025-006)

#### 説明
Secret Store CSI Driver の Google Secret Manager プロバイダにおいて、セキュリティの脆弱性が発見されました。攻撃者がこの脆弱性を悪用した場合、CSI ドライバの Kubernetes サービスアカウントトークンへのアクセスが可能になる可能性があります。詳細については、GCP-2025-006 セキュリティ бюллетень を参照してください。

#### 影響有無
有 (Google Secret Manager Provider for Secret Store CSI Driver を利用している場合)

#### 対処方法
GCP-2025-006 セキュリティ бюллетень に記載されている対策方法に従ってください。
# Title: February 03, 2025 
Link: https://cloud.google.com/release-notes#February_03_2025<br>
## BigQuery

### Changed

**原文:**

The BigQuery ML `ML.BUCKETIZE` and `ML.QUANTILE_BUCKETIZE` functions now support formatting of the function output. You can use the `output_format` argument to format the function output as one of the following:

[`ML.BUCKETIZE`](https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-bucketize)
[`ML.QUANTILE_BUCKETIZE`](https://cloud.google.com/bigquery/docs/reference/standard-sql/bigqueryml-syntax-quantile-bucketize)
- A string in the format `bin_<bucket_index>`
- A string in interval notation
- A JSON-formatted string

[interval notation](https://en.wikipedia.org/wiki/Interval_(mathematics))

**説明:**

BigQuery MLの関数 `ML.BUCKETIZE` と `ML.QUANTILE_BUCKETIZE` において、出力フォーマットが指定可能になりました。`output_format` 引数を使用することで、以下のような形式で出力フォーマットを指定できます。

- `bin_<bucket_index>` のフォーマットの文字列
- 区間表記の文字列
- JSON形式の文字列

**製品への影響有無:** 無

**対処方法:** 特に対応は不要です。 `ML.BUCKETIZE` と `ML.QUANTILE_BUCKETIZE` を使用する際に、必要であれば `output_format` 引数を使用して出力フォーマットを指定してください。


## Cloud Billing

### Changed

**原文:**

 **Google Cloud Marketplace now uses the agency model for marketplace services for UK, FR, and DE customers.**

 As part of this change, customers will receive separate invoices for Google Cloud and third-party vendor transactions in the Cloud Marketplace.

 For more information, see Split invoicing for agency model transactions and Marketplace Agency Account Migration FAQ.

[Split invoicing for agency model transactions](https://cloud.google.com/billing/docs/how-to/split-invoice)
[Marketplace Agency Account Migration FAQ](https://support.google.com/cloud/answer/13855075)

**説明:**

Google Cloud Marketplaceは、イギリス、フランス、ドイツのお客様向けに、マーケットプレイスサービスの代理店モデルの利用を開始しました。

この変更の一環として、お客様には、Google CloudとサードパーティベンダーのCloud Marketplaceでの取引に対して、請求書が別々に発行されるようになります。

詳細については、「代理店モデルの取引に対する請求書の分割」と「マーケットプレイス代理店アカウントの移行に関するFAQ」をご覧ください。

**製品への影響有無:** 有

**対処方法:** イギリス、フランス、ドイツのお客様は、Cloud Marketplaceの取引において、Google Cloudとサードパーティベンダーからそれぞれ請求書が発行されるようになるため注意が必要です。


## Cloud Logging

### Libraries

#### Java

##### Changes for google-cloud-logging

バージョン: 3.21.2

変更内容:

- 依存関係の更新:
    - `com.google.cloud:sdk-platform-java-config` を v3.42.0 に更新
    - `io.opentelemetry:opentelemetry-bom` を v1.46.0 に更新
- `googleapis/sdk-platform-java` アクションを v2.52.0 に更新

#### Python

##### Changes for google-cloud-logging

バージョン: 3.11.4

変更内容:

- `write_entries` 関数が `ParseError` 発生時に `ValueError` を raise するように変更
- Python 3.13 で `proto-plus >= 1.25` が必須に


## Cloud Storage

### Libraries

#### Java

##### Changes for google-cloud-storage

バージョン: 2.48.0

変更内容:

- オブジェクト名をアトミックにリネームする `Storage#moveBlob` メソッドを追加
- 署名付きURLのデフォルトスキームを、ストレージオプションのホストから解決するように更新
- `ApiException` の `StorageException` 変換を更新し、エラーの詳細を含めるように改善
- 依存関係の更新:
    - Java コードジェネレーター (`gapic-generator-java`) を 2.51.1 に更新
    - `com.google.cloud.opentelemetry:exporter-trace` を v0.33.0 に更新
- `gcr.io/cloud-devrel-public-resources/storage-testbench` Docker タグを v0.52.0 に更新

#### Python

##### Changes for google-cloud-storage

バージョン: 3.0.0

変更内容:

- アップロードのデフォルトチェックサム戦略が `None` から `"auto"` に変更
- ダウンロードのデフォルトチェックサム戦略が `"md5"` から `"auto"` に変更
- 非推奨の引数 `num_retries` と `text_mode` を削除
- `Blob.download_to_filename()` が 404 エラー時に空の宛先ファイルを削除するように変更
- メディア操作で、非メディア操作と同じ再試行バックオフ、タイムアウト、カスタム述語システムを使用するように変更 (デフォルトの再試行動作にわずかな影響)
- アップロード、BLOB 削除、BLOB メタデータ更新でデフォルトで再試行が有効化
- 新しいチェックサムオプション `"auto"` を追加し、デフォルトに設定
- `Blob.from_string()` と `Bucket.from_string()` メソッドの名前を `from_uri()` に変更
- 範囲読み取りの再試行の開始オフセットの計算を修正
- `BlobReader` で `download_kwargs` をフィルタリング
- `exceptions.py` ドキュメントの問題を修正

## Google Kubernetes Engine

### Changed

**原文:**

 Starting on February 3, 2025, GKE will create a new service agent named `service-{PROJECT_
NUMBER}@gcp-sa-gkenode.iam.gserviceaccount.com` that the GKE system workloads that run on your worker nodes can use. This service agent will only have the minimum permissions that GKE needs to operate these nodes by default, and will help to isolate the requirements of GKE-managed workloads from the requirements of your workloads. GKE-managed system workloads will begin using this service agent in an upcoming GKE version, which we'll announce in a separate release note.

**説明:**

2025年2月3日から、GKEはワーカーノードで動作するGKEシステムワークロードが使用できる、 `service-{PROJECT_NUMBER}@gcp-sa-gkenode.iam.gserviceaccount.com` という名前の新しいサービスアカウントを作成します。このサービスアカウントは、デフォルトではGKEがこれらのノードを運用するために必要な最小限の権限のみを持ち、GKE管理ワークロードの要件とユーザーワークロードの要件を分離するのに役立ちます。 GKE管理システムワークロードは、今後のGKEバージョンでこのサービスアカウントの使用を開始します。これについては、別のリリースノートでお知らせします。

**製品への影響有無:** 有

**対処方法:** 

- 2025年2月3日以降にGKEクラスタを作成する場合、GKEシステムワークロードは自動的に新しいサービスアカウントを使用します。
- 既存のGKEクラスタについては、GKE管理システムワークロードがこの新しいサービスアカウントを使用するように移行する必要があります。移行手順については、今後のリリースノートで発表されます。


## Secret Manager

### Libraries

#### Go

##### Changes for secretmanager/apiv1

バージョン: 1.14.4

変更内容:

- Markdown コメント内のリンクを修正
- メッセージ `.google.cloud.secretmanager.v1.Secret` と `.google.cloud.secretmanager.v1.SecretVersion` 内の `customer_managed_encryption` のコメントを更新
- メッセージ `.google.cloud.secretmanager.v1.Topic` 内の `name` のコメントを更新
- `Replication` のコメントを更新
- メッセージ `.google.cloud.secretmanager.v1.SecretVersion` 内の `scheduled_destroy_time` のコメントを更新

# Title: January 31, 2025 
Link: https://cloud.google.com/release-notes#January_31_2025<br>
## Cloud Composer
### Issue
原文：The issue with upgrading Airflow builds **is now resolved**. You can now upgrade Airflow builds for Cloud Composer 3 in the asia-south1, asia-northeast2, europe-west1, europe-west3, and europe-north1 regions. 
説明：asia-south1, asia-northeast2, europe-west1, europe-west3, and europe-north1 リージョンにおいて、Cloud Composer 3 の Airflow  ビルドのアップグレードに関する問題は解決されました。
影響有無：有（過去に問題があった場合）
対処方法：過去に Airflow ビルドのアップグレードで問題が発生した場合は、再度アップグレードを試してみてください。

## Spanner
### Libraries
原文： A monthly digest of client library updates from across the Cloud SDK.
説明：これは Cloud SDK 全体のクライアントライブラリの月次更新の概要です。
影響有無：無し
対処方法：特になし

### Java
#### Changes for google-cloud-spanner
原文：
* Add gcp client attributes in OpenTelemetry traces (#3595) (7893f24)
* Add LockHint feature (#3588) (326442b)
* **spanner:** MTLS setup for spanner external host clients (#3574) (f8dd152)
* ... (以下略) ... 

説明：
* OpenTelemetry トレースに GCP クライアント属性が追加されました。
* LockHint 機能が追加されました。
* Spanner 外部ホストクライアント向けに MTLS がセットアップされました。
* ... (以下ライブラリのバージョンアップに伴う変更) ...

影響有無：有（google-cloud-spannerを利用している場合）
対処方法：google-cloud-spanner の最新バージョン(6.85.0)を利用するようにしてください。

### Node.js
#### Changes for @google-cloud/spanner
原文：
* This release inadvertently introduced an issue where OpenTelemetry Trace context Global Propagators are default set to W3CTraceContextPropagator. For more details, refer to issue #2208
* A fix for this issue has been included in version 7.17.1
* ... (以下略) ... 

説明：
* このリリースでは、OpenTelemetry Trace コンテキストグローバルプロパゲーターがデフォルトで W3CTraceContextPropagator に設定されるという問題がうっかり導入されました。詳細は、問題 #2208 を参照してください。
* この問題の修正は、バージョン 7.17.1 に含まれています。
* ... (以下ライブラリのバージョンアップに伴う変更) ... 

影響有無：有（@google-cloud/spannerを利用している場合）
対処方法：@google-cloud/spanner を最新バージョン(7.17.1)にアップデートしてください。バージョン 7.17.0 を使用している場合は、7.17.1 にアップグレードして、OpenTelemetry Trace コンテキストグローバルプロパゲーターの意図しない設定を修正してください。 

# Title: January 30, 2025 
Link: https://cloud.google.com/release-notes#January_30_2025<br>
## Cloud Composer 

### Announcement: Deletion of Inactive and Non-recoverable Cloud Composer Environments

#### 原文 

At the beginning of February 2025, we will **delete inactive environments that are non-recoverable** in Cloud Composer 1, Cloud Composer 2, and Cloud Composer 3. After this change, non-recoverable environments that have listed problems will be deleted automatically.

 **Cloud Composer 1 and Cloud Composer 2** environments that have both of the following problems present at the same time will be deleted:

- The environment's underlying GKE cluster is deleted.
- The environment is in the ERROR state for at least 60 days because of a disabled billing account or because the Cloud Composer API service was deactivated in its project.

 **Cloud Composer 3** environments that have the following problem will be deleted:

- The environment is in the ERROR state for at least 60 days because of a disabled billing account or because the Cloud Composer API service was deactivated in its project.

 This change doesn't affect buckets of these environments. You can still recover your DAGs and other data from the environment's bucket and then delete the bucket manually. See Delete environments for information about data that is not deleted automatically together with the environment.

[Delete environments](https://cloud.google.com/composer/docs/composer-3/delete-environments#about-not-deleted)

#### 説明

2025年2月上旬より、Cloud Composer 1、2、3において、復旧不可能な状態の非アクティブな環境が自動的に削除されるようになります。

- Cloud Composer 1 および 2 では、GKEクラスタが削除済みで、かつ課金アカウントの無効化やCloud Composer APIサービスの無効化によって60日間以上 ERROR 状態の環境が削除対象となります。

- Cloud Composer 3 では、課金アカウントの無効化やCloud Composer APIサービスの無効化によって60日間以上 ERROR 状態の環境が削除対象となります。

なお、環境のバケットは削除対象に含まれません。必要なDAGやデータは事前にバックアップを取った上で、手動でバケットを削除してください。

#### 影響有無

有

#### 対処方法

Cloud Composer 1, 2, 3 のいずれかの環境を利用中で、以下の条件に当てはまる場合は、環境が削除されないように対処が必要です。

- 環境が ERROR 状態となっている
- 環境のGKEクラスタが削除されている（Cloud Composer 1, 2の場合）
- 課金アカウントが無効化されている
- Cloud Composer API サービスが無効化されている

上記に該当する場合は、課金アカウントやCloud Composer APIサービスを有効化する、または環境を復旧させるなどの対応を行い、ERROR状態を解消してください。


## Google Kubernetes Engine

### Deprecated: GKE Posture Management Features

#### 原文

 Starting on January 28, 2025, the following Preview features are deprecated:

- GKE threat detection
- Supply chain concerns - Binary Authorization
- GKE Compliance dashboard

 For deprecation and removal dates, and for information about alternatives, see Posture management deprecations.

[Posture management deprecations](https://cloud.google.com/kubernetes-engine/docs/deprecations/posture-management-deprecation)

#### 説明

2025年1月28日より、以下のGKEのプレビュー機能が非推奨になります。

- GKE threat detection
- Supply chain concerns - Binary Authorization
- GKE Compliance dashboard

具体的な廃止日や代替機能については、Posture management deprecations を参照してください。

#### 影響有無

有 (該当機能を利用している場合)

#### 対処方法

非推奨となった機能を利用している場合は、代替機能への移行を検討してください。具体的な代替機能や移行手順については、提供されるドキュメントを参照してください。
# Title: January 29, 2025 
Link: https://cloud.google.com/release-notes#January_29_2025<br>
## Google Kubernetes Engine(見出し1)
### Changed(見出し2)
原文: GKE cluster versions have been updated.

 **New versions available for upgrades and new clusters.**

 The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)
説明： GKEクラスタのバージョンが更新されました。新しいバージョンがアップグレードと新規クラスタ作成に利用可能になりました。記載されているKubernetesバージョンが、新規クラスタと、既存クラスタのオプトインコントロールプレーンアップグレードとノードアップグレードで利用可能になりました。
影響有無：有
対処方法： GKEのバージョンサポートポリシーに従って、クラスタをアップグレードしてください。特に、古いバージョンを使っている場合は、セキュリティと安定性のために最新バージョンへのアップグレードを検討してください。
# Title: January 28, 2025 
Link: https://cloud.google.com/release-notes#January_28_2025<br>
## Cloud Composer

### Fixed

####  原文
Fixed a problem where synchronization between the environment's bucket and Airflow components failed because incorrect objects in the bucket were not ignored.

#### 説明
環境のバケットと Airflow コンポーネント間の同期が、バケット内の不正なオブジェクトが無視されなかったために失敗する問題が修正されました。

#### 製品への影響有無
有

#### 対処方法
過去にこの問題が発生していた場合は、修正により解決されるため、Composer環境のアップグレードを検討してください。


### Fixed

####  原文
*(Cloud Composer 3)* Fixed an issue with KubernetesPodOperator failing to run properly when `do_xcom_push` was set to `True`.

#### 説明
Cloud Composer 3 環境において、`do_xcom_push` が `True` に設定されている場合に KubernetesPodOperator が適切に実行されない問題が修正されました。

#### 製品への影響有無
Cloud Composer 3 を利用している場合、有

#### 対処方法
過去にこの問題が発生していた場合は、修正により解決されるため、Composer環境のアップグレードを検討してください。

### Changed

####  原文
*(Available without upgrading)* Starting from Cloud Composer version 2.11.0 with Airflow 2.10.2 and 2.9.3, the `enable_task_context_logger` Airflow configuration option is no longer blocked.

#### 説明
Cloud Composer バージョン 2.11.0 以降、Airflow 2.10.2 および 2.9.3 を使用する場合、`enable_task_context_logger` Airflow 設定オプションはブロックされなくなりました。アップグレードなしで利用できます。

#### 製品への影響有無
無

#### 対処方法
特になし。

### Fixed

####  原文
Terminating Airflow workers now generate log messages with information about still running tasks.

#### 説明
Airflow ワーカーの終了時に、実行中のタスクに関する情報を含むログメッセージが生成されるようになりました。

#### 製品への影響有無
有

#### 対処方法
Airflow ワーカーの終了時のログ出力内容が変更されます。ログ監視設定などを利用している場合は、必要に応じて調整してください。

### Fixed

####  原文
Fixed an issue where log messages were incorrectly formatted for non-string content, such as dictionaries and numbers.

#### 説明
辞書や数値などの文字列以外のコンテンツに対して、ログメッセージのフォーマットが正しく行われない問題が修正されました。

#### 製品への影響有無
有

#### 対処方法
過去にこの問題が発生していた場合は、修正により解決されるため、ログを確認し問題が解決されているか確認してください。

### Changed

####  原文
*(Available without upgrading)* In Cloud Composer 2 and Cloud Composer 1, a more meaningful error message is produced when the Composer Service Agent account doesn't have necessary permissions to access the network during the environment creation.

#### 説明
Cloud Composer 2 および Cloud Composer 1 において、環境の作成中に Composer サービス エージェント アカウントに必要なネットワークアクセス許可がない場合に、より分かりやすいエラーメッセージが表示されるようになりました。アップグレードなしで利用できます。

#### 製品への影響有無
無

#### 対処方法
特になし。

### Fixed

####  原文
*(Available without upgrading)* In Cloud Composer 3, fixed an issue where  deleting an environment with an attached VPC network failed if the project accept list of the network attachment was cleared manually.

#### 説明
Cloud Composer 3 において、ネットワークアタッチメントのプロジェクト承認リストが手動でクリアされた場合に、VPC ネットワークが接続された環境の削除が失敗する問題が修正されました。アップグレードなしで利用できます。

#### 製品への影響有無
Cloud Composer 3 を利用している場合、有

#### 対処方法
過去にこの問題が発生していた場合は、修正により解決されます。

### Changed

####  原文
*(Cloud Composer 3)* The zone in the `Environment.config.node_config.location` field is no longer populated in the Cloud Composer API.

[`Environment.config.node_config.location`](https://cloud.google.com/composer/docs/reference/rest/v1/projects.locations.environments#nodeconfig)

#### 説明
Cloud Composer 3 において、Cloud Composer API の `Environment.config.node_config.location` フィールドにゾーン情報が設定されなくなりました。

#### 製品への影響有無
Cloud Composer 3 を利用し、`Environment.config.node_config.location` フィールドを利用している場合、有

#### 対処方法
`Environment.config.node_config.location` フィールドの値に依存した処理を行っている場合は、修正が必要です。

### Changed

####  原文
*(Airflow 2.10.2 and 2.9.3)* The `apache-airflow-providers-cncf-kubernetes` package was upgraded to version 10.1.0 in Cloud Composer 2 images and Cloud Composer 3 builds. For more information about changes, see the apache-airflow-providers-cncf-kubernetes changelog from version 10.0.1 to version 10.1.0.

[apache-airflow-providers-cncf-kubernetes changelog](https://airflow.apache.org/docs/apache-airflow-providers-cncf-kubernetes/stable/changelog.html)

#### 説明
Airflow 2.10.2 および 2.9.3 において、Cloud Composer 2 イメージと Cloud Composer 3 ビルドで、`apache-airflow-providers-cncf-kubernetes` パッケージがバージョン 10.1.0 にアップグレードされました。変更点については、バージョン 10.0.1 からバージョン 10.1.0 までの apache-airflow-providers-cncf-kubernetes の変更履歴を参照してください。

#### 製品への影響有無
Airflow 2.10.2 および 2.9.3 を利用している場合、有

#### 対処方法
`apache-airflow-providers-cncf-kubernetes` パッケージの変更点を確認し、必要に応じて対応してください。

### Changed

####  原文
*(Airflow 2.10.2 and 2.9.3)* The following preinstalled provider packages were upgraded to new major versions:

- `apache-airflow-providers-apache-beam` upgraded from 5.9.1 to 6.0.0
- `apache-airflow-providers-dbt-cloud` upgraded from 3.11.2 to 4.0.0
- `apache-airflow-providers-hashicorp` upgraded from 3.8.0 to 4.0.0
- `apache-airflow-providers-http` upgraded from 4.13.3 to 5.0.0
- `apache-airflow-providers-mysql` upgraded from 5.7.4 to 6.0.0
- `apache-airflow-providers-sendgrid` upgraded from 3.6.0 to 4.0.0
- `apache-airflow-providers-sqlite` upgraded from 3.9.1 to 4.0.0
- `apache-airflow-providers-ssh` upgraded from 3.14.0 to 4.0.0

#### 説明
Airflow 2.10.2 および 2.9.3 において、以下のプリインストールされたプロバイダーパッケージが新しいメジャーバージョンにアップグレードされました。

- `apache-airflow-providers-apache-beam` が 5.9.1 から 6.0.0 にアップグレード
- `apache-airflow-providers-dbt-cloud` が 3.11.2 から 4.0.0 にアップグレード
- `apache-airflow-providers-hashicorp` が 3.8.0 から 4.0.0 にアップグレード
- `apache-airflow-providers-http` が 4.13.3 から 5.0.0 にアップグレード
- `apache-airflow-providers-mysql` が 5.7.4 から 6.0.0 にアップグレード
- `apache-airflow-providers-sendgrid` が 3.6.0 から 4.0.0 にアップグレード
- `apache-airflow-providers-sqlite` が 3.9.1 から 4.0.0 にアップグレード
- `apache-airflow-providers-ssh` が 3.14.0 から 4.0.0 にアップグレード

#### 製品への影響有無
Airflow 2.10.2 および 2.9.3 を利用している場合、有

#### 対処方法
アップグレードされた各プロバイダーパッケージの変更点を確認し、必要に応じて対応してください。

### Changed

####  原文
*(Airflow 2.10.2 and 2.9.3)* The following preinstalled packages were downgraded:

- `certifi` downgraded from 2024.12.14 to 2024.8.30.
- `charset-normalizer` downgraded from 3.4.1 to 3.4.0.
- `cryptography` downgraded from 44.0.0 to 43.0.3.
- `filelock` downgraded from 3.16.1 to 3.15.4.
- `google-auth` downgraded from 2.37.0 to 2.35.0.
- `keyring` downgraded from 25.6.0 to 25.5.0.
- `urllib3` downgraded from 2.3.0 to 2.2.3.
- `zipp` downgraded from 3.21.0 to 3.20.2.

#### 説明
Airflow 2.10.2 および 2.9.3 において、以下のプリインストールされたパッケージがダウングレードされました。

- `certifi` が 2024.12.14 から 2024.8.30 にダウングレード
- `charset-normalizer` が 3.4.1 から 3.4.0 にダウングレード
- `cryptography` が 44.0.0 から 43.0.3 にダウングレード
- `filelock` が 3.16.1 から 3.15.4 にダウングレード
- `google-auth` が 2.37.0 から 2.35.0 にダウングレード
- `keyring` が 25.6.0 から 25.5.0 にダウングレード
- `urllib3` が 2.3.0 から 2.2.3 にダウングレード
- `zipp` が 3.21.0 から 3.20.2 にダウングレード

#### 製品への影響有無
Airflow 2.10.2 および 2.9.3 を利用している場合、有

#### 対処方法
ダウングレードされた各パッケージの変更点を確認し、必要に応じて対応してください。

### Changed

####  原文
New Airflow builds are available in Cloud Composer 3:

[Airflow builds](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-3)
- composer-3-airflow-2.10.2-build.7 (default)
- composer-3-airflow-2.9.3-build.14

#### 説明
Cloud Composer 3 で、新しい Airflow ビルドが利用可能になりました。

- composer-3-airflow-2.10.2-build.7 (デフォルト)
- composer-3-airflow-2.9.3-build.14

#### 製品への影響有無
無

#### 対処方法
新しい Airflow ビルドを利用する場合は、Cloud Composer 環境の作成時または更新時に選択してください。

### Changed

####  原文
New images are available in Cloud Composer 2:

[images](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-2)
- composer-2.11.1-airflow-2.10.2 (default)
- composer-2.11.1-airflow-2.9.3

#### 説明
Cloud Composer 2 で、新しいイメージが利用可能になりました。

- composer-2.11.1-airflow-2.10.2 (デフォルト)
- composer-2.11.1-airflow-2.9.3

#### 製品への影響有無
無

#### 対処方法
新しいイメージを利用する場合は、Cloud Composer 環境の作成時または更新時に選択してください。

### Deprecated

####  原文
Cloud Composer version 2.5.5 has reached its end of support period.

[end of support period](https://cloud.google.com/composer/docs/concepts/versioning/composer-versioning-overview#version-deprecation-and-support)

#### 説明
Cloud Composer バージョン 2.5.5 はサポート終了期間に達しました。

#### 製品への影響有無
Cloud Composer 2.5.5 を利用している場合、有

#### 対処方法
サポート終了に伴い、セキュリティリスクやバグ修正が行われなくなります。速やかにサポートされているバージョンにアップグレードしてください。
# Title: January 27, 2025 
Link: https://cloud.google.com/release-notes#January_27_2025<br>
## BigQuery

### Libraries

#### Go

##### Changes for bigquery/storage/apiv1beta1

原文: 
- **bigquery/storage/managedwriter:** Graceful connection drains (#11463) (b29912f)
- **bigquery:** Update golang.org/x/net to v0.33.0 (e9b0b69)

説明：
- BigQuery Storage managed writer に graceful connection drain 機能が追加されました。
- 使用している golang.org/x/net が v0.33.0 にアップデートされました。

影響有無： 無

対処方法： 特に対応は不要です。

#### Python

##### Changes for google-cloud-bigquery

原文: 
- Add ExternalCatalogTableOptions class and tests (#2116) (cdc1a6e)
- Add default value in SchemaField.from_api_repr() (#2115) (7de6822)

説明：
- 外部カタログテーブルのオプションを設定するための ExternalCatalogTableOptions クラスが追加されました。
- SchemaField.from_api_repr() にデフォルト値が追加されました。

影響有無： 無

対処方法： 特に対応は不要です。

### Announcement

原文: 
We previously communicated that after January 27, 2025, a purchase would be required to use Gemini in BigQuery features. We are temporarily delaying enforcement of these procurement methods, and no purchase is required at this time. For more information, see Gemini for Google Cloud pricing.

説明： 
当初、2025年1月27日以降、BigQuery の Gemini 機能を使用するには購入が必要になると伝えられていましたが、これらの調達方法の実施は一時的に延期され、現時点では購入は不要です。

影響有無： 無

対処方法： 特に対応は不要です。


## Cloud Composer

### Issue

原文: 
**(Cloud Composer 3 only)* We are currently experiencing an issue with upgrading Airflow builds for Cloud Composer 3 in asia-south1, asia-northeast2, europe-west1, europe-west3, europe-north1 regions.

The upgrades are temporarily disabled as we continue our work to restore the listed functionalities. We will release an additional announcement after the issue is resolved.

**January 31, 2025 update**: The issue is resolved.

説明：
Cloud Composer 3 の asia-south1、asia-northeast2、europe-west1、europe-west3、europe-north1 リージョンで、Airflow ビルドのアップグレードに関する問題が発生していました。影響を受けた機能を復旧するためにアップグレードは一時的に無効化されていましたが、2025年1月31日現在、問題は解決しています。

影響有無： 無(問題は解決済み)

対処方法： 特に対応は不要です。


## Pub/Sub

### Libraries

#### Node.js

##### Changes for @google-cloud/pubsub

原文: 
- Add Kafka-based sources to IngestionDataSourceSettings proto and IngestionFailureEvent proto (#2007) (08d00a1)
- **deps:** Update dependency @opentelemetry/semantic-conventions to ~1.28.0 (#2001) (c8e5811)

説明：
- IngestionDataSourceSettings proto と IngestionFailureEvent proto に Kafka ベースのソースが追加されました。
- 依存関係の @opentelemetry/semantic-conventions が ~1.28.0 にアップデートされました。

影響有無： 無

対処方法： 特に対応は不要です。

#### Python

##### Changes for google-cloud-pubsub

原文: 
- Stop using api_core default timeouts in publish since they are broken (#1326) (ba2c2ee)

説明：
- api_core のデフォルトタイムアウトが機能しないため、publish での使用が停止されました。

影響有無： 有

対処方法： パブリッシュ時にタイムアウトを明示的に設定する必要があるかもしれません。 

# Title: January 24, 2025 
Link: https://cloud.google.com/release-notes#January_24_2025<br>
## Apigee X

### Announcement: Updated version of Apigee (1-14-0-apigee-4) released

**原文:** On January 24, 2025, we released an updated version of Apigee (1-14-0-apigee-4).

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** Apigeeのアップデートバージョン(1-14-0-apigee-4)がリリースされました。
本番環境へのロールアウトは2営業日以内に開始され、Google Cloudのすべてのゾーンへの展開が完了するまで4営業日以上かかる場合があります。 
すべての機能と修正が利用可能になるまでには、ロールアウトが完了するまで待つ必要があります。

**影響有無:** 無

**対処方法:** 特になし。


### Fixed: Issues related to flow variable and security updates

**原文:**

| Bug ID | Description |
| --- | --- |
| **372248577** | **Fixed issue causing `system.pod.name` flow variable  to return `null`.** |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:** 以下の2つの問題が修正されました。

*  `system.pod.name` flow 変数がnullを返す問題の修正。
*  セキュリティインフラストラクチャとライブラリの更新。

**影響有無:** 無

**対処方法:** 特になし。


## Cloud Composer

### Deprecated: Rolled back Airflow builds and Composer versions

**原文:** The following recently released Cloud Composer 3 Airflow builds and Cloud Composer 2 versions are **rolled back and aren't available** for creating and upgrading existing environments. We will roll out new builds in the next release.

- composer-2.11.0-airflow-2.10.2
- composer-2.11.0-airflow-2.9.3
- composer-3-airflow-2.10.2-build.6
- composer-3-airflow-2.9.3-build.13

**説明:** 以下のCloud Composer 3 AirflowビルドとCloud Composer 2バージョンはロールバックされ、新規環境の作成や既存環境のアップグレードには利用できません。

* composer-2.11.0-airflow-2.10.2
* composer-2.11.0-airflow-2.9.3
* composer-3-airflow-2.10.2-build.6
* composer-3-airflow-2.9.3-build.13

新しいビルドは次回のリリースで提供される予定です。

**影響有無:** 有 (上記バージョンを利用している場合)

**対処方法:** 上記バージョンを利用している場合は、新しいバージョンがリリースされるまで待つ必要があります。


## Cloud Load Balancing

### Announcement: Changes to RSA certificate requirements

**原文:** **Changes to RSA certificate requirements coming April 28, 2025**

We're changing how Application Load Balancers establish TLS connections to backends. This change fixes a problem where the keyUsage extension of RSA certificates is not being validated consistently and might allow a certificate that should have been rejected based on the keyUsage configuration. 

**What you need to do**

*Starting April 28, 2025*, RSA certificates that don't meet the keyUsage configuration requirements will no longer be considered valid for establishing TLS connections. We recommend that you check whether your backends' RSA certificates are invalid, and replace them with valid certificates if needed. 

A valid RSA certificate is one that has the X509v3 Key Usage extension and includes both the Digital Signature and Key Encipherment parameters.

To identify an invalid RSA certificate, perform the following steps:

- First confirm that the certificate type is RSA by running the following command. 
`openssl x509 -text -in cert.crt | grep "Public Key Algorithm"`. 
For RSA certificates, this should output `rsaEncryption`. If it is a non-RSA certificate (for example, EC), you don't need to take any more action at this time.
- If it is an RSA certificate, examine the Key Usage configuration by running the following command:
`openssl x509 -text -in cert.crt | grep -A1 "X509v3 Key Usage"`
For a valid RSA certificate, the correct value is `Digital Signature, Key Encipherment`. If either of these values is not present, the RSA certificate is invalid.

First confirm that the certificate type is RSA by running the following command.

`openssl x509 -text -in cert.crt | grep "Public Key Algorithm"`.

For RSA certificates, this should output `rsaEncryption`. If it is a non-RSA certificate (for example, EC), you don't need to take any more action at this time.

If it is an RSA certificate, examine the Key Usage configuration by running the following command:

`openssl x509 -text -in cert.crt | grep -A1 "X509v3 Key Usage"`

For a valid RSA certificate, the correct value is `Digital Signature, Key Encipherment`. If either of these values is not present, the RSA certificate is invalid.

For more information about the X.509 certificate format, see RFC 5280 Key Usage.

[RFC 5280 Key Usage](https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.1.3)


**説明:** 2025年4月28日から、Application Load BalancerがバックエンドへのTLS接続を確立する方法が変わります。
これは、RSA証明書のkeyUsage拡張が正しく検証されず、keyUsage設定に基づいて拒否されるべき証明書が許可される可能性がある問題を修正するためです。

**影響有無:** 有 (無効なRSA証明書を使用している場合)

**対処方法:** 
2025年4月28日以降、keyUsage設定の要件を満たさないRSA証明書は、TLS接続の確立に有効とみなされなくなります。
バックエンドのRSA証明書が無効かどうかを確認し、必要であれば有効な証明書に置き換えることをお勧めします。

無効な証明書を特定するには、以下の手順に従ってください。

1.  証明書タイプがRSAであることを確認します。
    * `openssl x509 -text -in cert.crt | grep "Public Key Algorithm"` を実行します。
    * RSA証明書の場合、出力は `rsaEncryption` となります。非RSA証明書(ECなど)の場合は、この時点でこれ以上の対応は必要ありません。
2.  RSA証明書の場合、Key Usage設定を確認します。
    * `openssl x509 -text -in cert.crt | grep -A1 "X509v3 Key Usage"` を実行します。
    * 有効なRSA証明書の場合、正しい値は `Digital Signature, Key Encipherment` です。これらの値のいずれかがない場合、RSA証明書は無効です。 
3.  無効な証明書は、有効な証明書に置き換えてください。

詳細については、[RFC 5280 Key Usage](https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.1.3) を参照してください。

# Title: January 23, 2025 
Link: https://cloud.google.com/release-notes#January_23_2025<br>
## Google Kubernetes Engine (GKE)

### 変更内容

#### 原文

GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

#### 説明

GKEクラスタバージョンが更新され、新しいクラスタおよび既存クラスタのオプトインコントロールプレーンアップグレードとノードアップグレードに新しいバージョンが利用できるようになりました。

#### 製品への影響有無

有

#### 対処方法

GKEバージョンサポートポリシーに従って、利用可能なバージョンを確認し、必要に応じてクラスタをアップグレードしてください。

---

### 変更内容

#### 原文

Starting with GKE version 1.32.1-gke.1002000, the default OS image for Ubuntu is updated from Ubuntu 22.04 to Ubuntu 24.04.

#### 説明

GKEバージョン1.32.1-gke.1002000以降、UbuntuのデフォルトOSイメージがUbuntu 22.04からUbuntu 24.04に更新されます。

#### 製品への影響有無

有

#### 対処方法

Ubuntu 24.04のサポート状況、アプリケーションとの互換性を確認し、必要に応じて対応してください。 Ubuntu 22.04を引き続き使用する場合、GKEバージョン1.32.1-gke.1002000へのアップグレードを控えることを検討してください。

---

### 変更内容

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- Version 1.31.4-gke.1372000 is now the default version for cluster creation in the Rapid channel.

（以下、原文の記載に倣い、変更点ごとに説明、製品への影響有無、対処方法を記述します。）

- The following versions are now available in the Rapid channel:

- 1.28.15-gke.1641000
- 1.29.13-gke.1006000
- 1.30.8-gke.1282000
- 1.30.9-gke.1009000
- 1.31.5-gke.1023000
- 1.32.1-gke.1002000

#### 説明

Rapidチャネルでクラスタを作成する場合のデフォルトバージョンが1.31.4-gke.1372000になりました。また、Rapidチャネルで以下のバージョンが利用可能になりました。

#### 製品への影響有無

有

#### 対処方法

Rapidチャネルでクラスタを新規作成する場合、デフォルトでバージョン1.31.4-gke.1372000が使用されます。以前のバージョンを使用する場合は、明示的に指定してください。

---

- The following versions are no longer available in the Rapid channel:

- 1.28.15-gke.1480000
- 1.29.12-gke.1120000
- 1.30.8-gke.1162000
- 1.30.8-gke.1224000
- 1.31.4-gke.1183000
- 1.32.0-gke.1709000

#### 説明

以下のバージョンは、Rapidチャネルで使用できなくなりました。

#### 製品への影響有無

有

#### 対処方法

記載のバージョンを使用しているクラスタは、サポート対象外となるため、アップグレードを実施してください。

---
- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.27 to version 1.28.15-gke.1503000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.12-gke.1143000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.8-gke.1261000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.4-gke.1256000 with this release.

#### 説明

Rapidチャネルで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースで以下のバージョンにアップグレードされます。

#### 製品への影響有無

有

#### 対処方法

自動アップグレードが有効になっているクラスタは、上記バージョンへのアップグレードが自動的に行われます。アップグレードによる影響を事前に確認し、問題があれば自動アップグレードを無効にするか、メンテナンスウィンドウを設定してください。

---
- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.28.15-gke.1503000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.12-gke.1143000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.8-gke.1261000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.4-gke.1256000 with this release.


#### 説明

メンテナンス除外またはマイナーバージョンアップグレードを妨げるその他の要因があるクラスタでは、以下のパッチのみのバージョン自動アップグレードターゲットが利用できるようになりました。

#### 製品への影響有無

有

#### 対処方法

メンテナンス除外設定などを利用しているクラスタは、上記バージョンへのパッチ適用によるアップグレードが自動的に行われます。 アップグレードによる影響を事前に確認し、問題があれば自動アップグレードを無効にするか、メンテナンスウィンドウを設定してください。

---

### 変更内容

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.4-gke.1183000 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.28.15-gke.1503000
- 1.29.12-gke.1143000
- 1.30.8-gke.1162000
- 1.31.4-gke.1256000

- The following versions are no longer available in the Regular channel:

- 1.28.15-gke.1435000
- 1.29.12-gke.1055000
- 1.30.8-gke.1051000
- 1.31.3-gke.1162000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.27 to version 1.28.15-gke.1480000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.12-gke.1120000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.8-gke.1128000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.28.15-gke.1480000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.12-gke.1120000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.8-gke.1128000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.31 to version 1.31.4-gke.1183000 with this release.


#### 説明

Regularチャネルにおける変更点です。Rapidチャネルと同様に、デフォルトバージョン、利用可能なバージョン、サポート対象外バージョン、自動アップグレード対象バージョンが更新されています。

#### 製品への影響有無

有

#### 対処方法

Regularチャネルを利用している場合は、Rapidチャネルと同様の対応が必要となります。

---

### 変更内容

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Stable channel:

- 1.28.15-gke.1435000
- 1.29.12-gke.1055000
- 1.30.8-gke.1051000

- Version 1.30.6-gke.1596000 is no longer available in the Stable channel.

#### 説明

Stableチャネルで利用可能なバージョンが更新され、バージョン 1.30.6-gke.1596000 は Stable チャネルで使用できなくなりました。

#### 製品への影響有無

有

#### 対処方法

Stableチャネルを利用していて、バージョン 1.30.6-gke.1596000 を使用している場合は、サポート対象外となるため、アップグレードを実施してください。

---

### 変更内容

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.4-gke.1183000 is now the default version for cluster creation in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.16-gke.2142000
- 1.27.16-gke.2270000
- 1.28.15-gke.1503000
- 1.29.12-gke.1143000
- 1.30.8-gke.1162000
- 1.31.4-gke.1256000

- The following versions are no longer available in the Extended channel:

- 1.27.16-gke.2081000
- 1.27.16-gke.2246000
- 1.28.15-gke.1435000
- 1.29.12-gke.1055000
- 1.30.8-gke.1051000
- 1.31.3-gke.1162000

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.16-gke.2122000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.15-gke.1480000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.12-gke.1120000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.8-gke.1128000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.31 to version 1.31.4-gke.1183000 with this release.

#### 説明

Extendedチャネルにおける変更点です。Rapid, Regularチャネルと同様に、デフォルトバージョン、利用可能なバージョン、サポート対象外バージョン、自動アップグレード対象バージョンが更新されています。

#### 製品への影響有無

有

#### 対処方法

Extendedチャネルを利用している場合は、Rapid, Regularチャネルと同様の対応が必要となります。

---

### 変更内容

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.4-gke.1183000 is now the default version for cluster creation.
- The following versions are now available:

- 1.28.15-gke.1641000
- 1.29.13-gke.1006000
- 1.30.8-gke.1282000
- 1.30.9-gke.1009000
- 1.31.5-gke.1023000

- The following node versions are now available:

- 1.27.16-gke.2270000
- 1.28.15-gke.1641000
- 1.29.13-gke.1006000
- 1.30.8-gke.1282000
- 1.30.9-gke.1009000
- 1.31.5-gke.1023000

- The following versions are no longer available:

- 1.30.6-gke.1596000
- 1.30.8-gke.1224000
- 1.31.3-gke.1006000
- 1.31.3-gke.1162000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.27 to version 1.28.15-gke.1480000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.29.12-gke.1120000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.28.15-gke.1480000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.12-gke.1120000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.31 to version 1.31.4-gke.1183000 with this release.

#### 説明

GKE全体における変更点です。チャネル指定がない場合のデフォルトバージョン、利用可能なバージョン、サポート対象外バージョン、自動アップグレード対象バージョンが更新されています。

#### 製品への影響有無

有

#### 対処方法

GKEを利用している場合は、上記バージョン情報を確認し、必要があれば自動アップグレードを無効にする、またはメンテナンスウィンドウを設定してください。サポート対象外バージョンを利用しているクラスタは、速やかにアップグレードを実施してください。

# Title: January 21, 2025 
Link: https://cloud.google.com/release-notes#January_21_2025<br>
# Cloud Logging
## Announcement
原文: On April 22, 2025, Cloud Logging will replace the single, global quota for the number of calls to write log entries with a set of volume-based regional quotas. For more information, see Logging API quotas and limits.
[Logging API quotas and limits](https://cloud.google.com/logging/quotas#api-limits)

説明：2025年4月22日から、Cloud Loggingのログエントリ書き込み呼び出し回数に対する単一のグローバルクォータが、ボリュームベースのリージョナルクォータのセットに置き換えられます。 
影響有無：有
対処方法： 詳細については、提供されているリンク先の"Logging API quotas and limits"をご確認ください。今後、ログエントリの書き込みに関して、これまで通りの方法でクォータが適用されなくなる可能性があります。変更後もサービスを適切に利用できるように、リージョナルクォータの詳細と、それがCloud Loggingの使用にどのように影響するかを理解しておく必要があります。

# Title: January 20, 2025 
Link: https://cloud.google.com/release-notes#January_20_2025<br>
## BigQuery

### Libraries Changes for google-cloud-bigquery - Java

####  原文

A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)

#### 説明
Cloud SDK全体におけるクライアントライブラリの更新に関する週次ダイジェストです。 

#### 製品への影響有無
無し

#### 対処方法
不要


### Libraries Changes for google-cloud-bigquery - Python

#### 原文

This turned out to be incompatible with pandas-gbq. For more details, see issue.

[pandas-gbq](https://github.com/googleapis/python-bigquery-pandas)
[issue](https://github.com/googleapis/python-bigquery-pandas/issues/854)

#### 説明

このリリースはpandas-gbqとの互換性がないことが判明しました。詳細は、issueを参照してください。

#### 製品への影響有無

有

#### 対処方法

pandas-gbqとの互換性の問題が解決するまで、このリリースの利用は控えてください。


## Cloud Logging

### Libraries Changes for google-cloud-logging - Java

#### 原文

A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)

#### 説明
Cloud SDK全体におけるクライアントライブラリの更新に関する週次ダイジェストです。 

#### 製品への影響有無
無し

#### 対処方法
不要 

# Title: January 16, 2025 
Link: https://cloud.google.com/release-notes#January_16_2025<br>
## Google Kubernetes Engine 

### Deprecated

**原文:** With minor version 1.33, GKE nodes use containerd 2.0, which removes support for Docker Schema 1 images and the CRI v1alpha2 API. GKE pauses automatic upgrades to 1.33 when it detects that a cluster uses the deprecated features. To prepare for this change, see Migrate nodes to containerd 2.

**説明:**  GKEバージョン1.33以降では、ノードのコンテナランタイムがcontainerd 2.0へ変更されます。それに伴い、Docker Schema 1イメージとCRI v1alpha2 APIのサポートが廃止されます。もし、クラスタでこれらの非推奨機能が使用されている場合は、バージョン1.33への自動アップグレードは一時停止します。 

**製品への影響有無:** 有

**対処方法:** 
バージョン1.33以降へのアップグレード前に、以下の対応が必要です。
* Docker Schema 1イメージを使用している場合は、Docker Schema 2イメージへ移行してください。
* CRI v1alpha2 APIを使用している場合は、CRI v1 APIへ移行してください。

詳細な移行手順については、以下のドキュメントを参照してください。
[Migrate nodes to containerd 2](https://cloud.google.com/kubernetes-engine/docs/deprecations/migrate-containerd-2) 

# Title: January 15, 2025 
Link: https://cloud.google.com/release-notes#January_15_2025<br>
## Cloud Composer

### サービスアカウントの必須化

#### 原文
Starting April 13, 2025, we are **removing the default environment's service account setting**. This change enhances security and provides greater control over your Cloud Composer environments.

- Previously, the default Compute Engine service account was used by default when a user didn't specify a service account during Cloud Composer creation.
- After the change, you'll need to explicitly specify a service account when you create a new Cloud Composer environment.
- Existing Cloud Composer environments will not be affected by this change.

 To address this change:

- We recommend to **create one or more user-managed service accounts** for Cloud Composer environments in your project and grant them the minimum of required permissions. For more information and instructions, see Grant roles to an environment's service account.
- If you use **Terraform, scripts or other automation and configuration management tools**, then make sure to update them, so that an environment's service account is specified when you create an environment.

#### 説明
2025年4月13日以降、Cloud Composer 環境作成時にデフォルトのサービスアカウント設定が廃止されます。

- 従来は、Cloud Composer 環境作成時にサービスアカウントを指定しない場合、デフォルトの Compute Engine サービスアカウントが使用されていました。
- 変更後は、Cloud Composer 環境を作成する際に、サービスアカウントを明示的に指定する必要があります。
- 既存のCloud Composer 環境は、この変更の影響を受けません。

#### 製品への影響有無
-  新規作成のCloud Composer 環境：有
-  既存のCloud Composer 環境：無

#### 対処方法
- Cloud Composer 環境用に、プロジェクト内に1つ以上のユーザー管理サービスアカウントを作成し、必要な権限のみを付与することをお勧めします。
- Terraform、スクリプト、またはその他の自動化および構成管理ツールを使用する場合は、環境を作成するときに環境のサービスアカウントが指定されるように、必ず更新してください。

### PyPIパッケージインストール時のサービスアカウント変更

#### 原文
 In April 2025, Cloud Composer 2 environments will always **use the environment's service account for performing PyPI packages installations**:

- The environment's service account will be used instead.
- Existing Cloud Composer 2 environments that previously used the default Cloud Build service account will change to using the environment's service account instead.
- Cloud Composer 2 environments created in versions 2.10.2 and later already have this change.
- Cloud Composer 3 environments already use the environment's service account, and are not impacted by this change.

#### 説明
2025年4月以降、Cloud Composer 2環境では、PyPIパッケージのインストールを実行するために、常に環境のサービスアカウントが使用されるようになります。

- 従来は、デフォルトの Cloud Build サービスアカウントが使用されていました。
- 変更後は、環境のサービスアカウントが使用されます。
- バージョン2.10.2以降で作成された Cloud Composer 2環境には、既にこの変更が適用されています。
- Cloud Composer 3 環境では、既に環境のサービスアカウントが使用されているため、この変更の影響はありません。

#### 製品への影響有無
- Cloud Composer 2環境 (バージョン 2.10.2 より前)：有
- Cloud Composer 2環境 (バージョン 2.10.2 以降)：無
- Cloud Composer 3 環境：無

#### 対処方法
- Cloud Composer 2環境 (バージョン 2.10.2 より前) をお使いの場合は、環境のサービスアカウントに、PyPIパッケージのインストールに必要な権限が付与されていることを確認してください。


## Compute Engine

### メタデータサーバーの既知の問題

#### 原文

 The metadata server might display old `physicalHost` metadata if a VM experiences a host error. For more information, see known issues.

#### 説明

VMでホストエラーが発生した場合、メタデータサーバーが古い `physicalHost` メタデータを表示する可能性があります。

#### 製品への影響有無

ホストエラーが発生した場合に、メタデータサーバーから古い情報が取得される可能性があります。

#### 対処方法

現時点では、明確な対処方法は提示されていません。回避策として、ホストエラー発生後、メタデータサーバーからの `physicalHost` 情報の取得に依存する処理を行う場合は、情報の整合性に注意が必要です。 

# Title: January 14, 2025 
Link: https://cloud.google.com/release-notes#January_14_2025<br>
## Google Kubernetes Engine

### 変更内容

#### 原文

GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for opt-in control plane upgrades and node upgrades for existing clusters. For more information on versioning and upgrades, see GKE versioning and support and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)

#### 説明

GKEクラスタバージョンが更新され、新しいクラスタとアップグレードで利用可能なバージョンが追加されました。詳細については、GKEのバージョン管理とサポート、アップグレードに関するドキュメントを参照してください。

#### 影響有無

有

#### 対処方法

利用可能なバージョンを確認し、必要があればアップグレードを実施してください。

***

### 変更内容

#### 原文

> **Note:** Your clusters might not have these versions available. Rollouts are already in progress when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- The following versions are now available in the Rapid channel:
    - 1.28.15-gke.1612000
    - 1.29.12-gke.1270000
    - 1.30.8-gke.1224000
    - 1.30.8-gke.1261000
    - 1.31.4-gke.1372000
    - 1.32.0-gke.1709000

- The following versions are no longer available in the Rapid channel:
    - 1.28.15-gke.1488000
    - 1.29.12-gke.1126000
    - 1.30.8-gke.1128000
    - 1.30.8-gke.1133000
    - 1.31.4-gke.1249000
    - 1.32.0-gke.1577000

- Auto-upgrade targets are now available for the following minor versions:
    - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.8-gke.1162000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:
    - Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.8-gke.1162000 with this release.
    - 1.28.15-gke.1612000
    - 1.29.12-gke.1270000
    - 1.30.8-gke.1224000
    - 1.30.8-gke.1261000
    - 1.31.4-gke.1372000
    - 1.32.0-gke.1709000

#### 説明

Rapid Channelで利用可能なバージョンが更新されました。
いくつかのバージョンが利用不可となり、新しいバージョンが追加されています。
また、自動アップグレードの対象バージョンも更新されています。

#### 影響有無

有

#### 対処方法
-  自動アップグレードが無効になっているクラスタについては、利用可能なバージョンを確認し、必要があれば手動でアップグレードを実施してください。
- 自動アップグレードが有効になっているクラスタについては、メンテナンスの除外設定などを確認し、アップグレードの影響範囲を確認してください。
  - アップグレードの影響範囲が許容できない場合は、自動アップグレードを無効にするか、メンテナンスの除外設定などを調整してください。

***

以下、同様の変更内容が続くため、最初の説明と影響有無、対処方法のみを記載します。

### 変更内容

#### 説明

Regular Channel、Stable Channel、Extended Channel、および全体で利用可能なバージョンが更新されました。
いくつかのバージョンが利用不可となり、新しいバージョンが追加されています。
また、自動アップグレードの対象バージョンも更新されています。

#### 影響有無

有

#### 対処方法
-  自動アップグレードが無効になっているクラスタについては、利用可能なバージョンを確認し、必要があれば手動でアップグレードを実施してください。
- 自動アップグレードが有効になっているクラスタについては、メンテナンスの除外設定などを確認し、アップグレードの影響範囲を確認してください。
  - アップグレードの影響範囲が許容できない場合は、自動アップグレードを無効にするか、メンテナンスの除外設定などを調整してください。

# Title: January 13, 2025 
Link: https://cloud.google.com/release-notes#January_13_2025<br>
## Cloud Run

### Breaking

**原文:** The principal (user or service account) creating a Cloud Run resource now needs explicit permission to access the container image(s). When using Artifact Registry, ensure the principal has the Artifact Registry Reader (`roles/artifactregistry.reader`) IAM role on the project or repository containing the container image(s) to deploy.

**説明:**  Cloud Run リソースを作成する主体 (ユーザーまたはサービスアカウント) に、コンテナイメージへのアクセスに必要な権限を明示的に付与する必要があるようになりました。Artifact Registry を使用する場合、デプロイするコンテナイメージを含むプロジェクトまたはリポジトリに対して、主体に Artifact Registry Reader (`roles/artifactregistry.reader`) IAM ロールが付与されていることを確認してください。

**影響有無:** 有

**対処方法:** Cloud Run リソースを作成する主体 (ユーザーまたはサービスアカウント) に、Artifact Registry  のコンテナイメージを含むプロジェクトまたはリポジトリに対して Artifact Registry Reader (`roles/artifactregistry.reader`) IAM ロールを付与してください。


## Pub/Sub

### Libraries

**原文:** A weekly digest of client library updates from across the Cloud SDK.

**説明:** これは、Cloud SDK 全体におけるクライアントライブラリのアップデートに関する週刊ダイジェストです。

**影響有無:** 無

**対処方法:**  特に対処は不要です。必要に応じて提供されるライブラリアップデートを確認してください。


### Java

### Changes for google-cloud-pubsub

**原文:** 
[google-cloud-pubsub](https://github.com/googleapis/java-pubsub)
[1.136.0](https://github.com/googleapis/java-pubsub/compare/v1.135.0...v1.136.0)
- Add Kafka-based sources to IngestionDataSourceSettings proto and IngestionFailureEvent proto (2947169)
- **deps:** Update the Java code generator (gapic-generator-java) to 2.51.1 (9c166f7)
- Update dependency com.google.cloud:google-cloud-bigquery to v2.45.0 (#2292) (79a8982)
- Update dependency com.google.cloud:google-cloud-storage to v2.46.0 (#2291) (7b60884)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.41.1 (#2301) (53c1a8a)
- Update dependency com.google.protobuf:protobuf-java-util to v4.29.2 (#2294) (48d4ac1)
- Update dependency org.assertj:assertj-core to v3.27.2 (#2296) (e5b68a5)
- Update googleapis/sdk-platform-java action to v2.51.1 (#2298) (16e0144)

**説明:** google-cloud-pubsub の Java ライブラリのバージョン 1.136.0 がリリースされました。主な変更点は以下の通りです。

* Kafkaベースのソースを IngestionDataSourceSettings proto と IngestionFailureEvent proto に追加しました。
* Java コードジェネレータ (gapic-generator-java) をバージョン 2.51.1 に更新しました。
* いくつかの依存関係を更新しました。

**影響有無:** 有

**対処方法:** google-cloud-pubsub の Java ライブラリをバージョン 1.136.0 に更新してください。


### Python

### Changes for google-cloud-pubsub

**原文:**
[google-cloud-pubsub](https://github.com/googleapis/python-pubsub)
[2.27.2](https://github.com/googleapis/python-pubsub/compare/v2.27.1...v2.27.2)
- Handle TransportError Exceptions thrown from gapic_publish (#1318) (0e058c7)

**説明:** google-cloud-pubsub の Python ライブラリのバージョン 2.27.2 がリリースされました。主な変更点は以下の通りです。

* gapic_publish からスローされた TransportError 例外を処理するようにしました。

**影響有無:** 有

**対処方法:** google-cloud-pubsub の Python ライブラリをバージョン 2.27.2 に更新してください。

# Title: January 12, 2025 
Link: https://cloud.google.com/release-notes#January_12_2025<br>
## Cloud Composer

### Announcement

#### 元のリリースノート

Starting after **April 13, 2025**, Cloud Composer 3 will **unify its billing with BigQuery**. The Cloud Composer 3 standard milli DCU-hours SKU will be replaced with the new BigQuery Engine for Apache Airflow SKU, which will be calculated based on the number of BigQuery slot hours that your Cloud Composer 3 environments consume. Other SKUs will be renamed and moved under the BigQuery hierarchy. The change will be rolled out gradually to all regions supported by Cloud Composer 3. For more information about the change, see Transition to BigQuery slot-hour-based pricing.

[Transition to BigQuery slot-hour-based pricing](https://cloud.google.com/composer/pricing#composer-3-bq-sku)

#### 説明

2025年4月13日以降、Cloud Composer 3 の料金請求が BigQuery に統合されます。Cloud Composer 3 の標準ミリ DCU 時間 SKU は、BigQuery Engine for Apache Airflow SKU に置き換えられ、Cloud Composer 3 環境で消費される BigQuery スロット時間数に基づいて計算されるようになります。その他の SKU も名前が変更され、BigQuery 階層に移動します。この変更は、Cloud Composer 3 でサポートされているすべてのリージョンに徐々に展開されます。

#### 製品への影響

有

#### 対処方法

- 2025年4月13日以降、Cloud Composer 3 の料金は BigQuery スロット時間数に基づいて計算されるようになります。
- 料金の詳細については、提供されたリンク先「Transition to BigQuery slot-hour-based pricing」を参照してください。
- この変更は、既存のワークロードのコストに影響を与える可能性があります。
- 変更前に、提供されるドキュメントと料金計算ツールを使用して、新しい料金体系でのコストを見積もることが推奨されます。

# Title: January 10, 2025 
Link: https://cloud.google.com/release-notes#January_10_2025<br>
# Cloud Composer
## Issue
**原文:** The issue with automatic environment upgrades and upgrading Airflow builds in Cloud Composer 3 **is resolved** and these operations are working. If you think that your environment is still impacted by this issue, please reach out to the Cloud Support team.

**説明:** Cloud Composer 3 の自動環境アップグレードと Airflow ビルドのアップグレードに関する問題は解決され、これらの操作は機能しています。 

**影響有無:** 影響があった可能性があります。

**対処方法:** この問題の影響を受けていると思われる場合は、Cloud Support チームにご連絡ください。 

# Title: January 09, 2025 
Link: https://cloud.google.com/release-notes#January_09_2025<br>
## Apigee X

### Announcement

**原文:** On January 9, 2025, we released an updated version of Apigee (1-14-0-apigee-3).

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** Apigee のアップデートバージョン (1-14-0-apigee-3) がリリースされました。本番環境へのロールアウトは2営業日以内に開始され、Google Cloud のすべてのゾーンへの適用完了までに4営業日以上かかる場合があります。

**製品への影響有無:** 有

**対処方法:**  本番環境への反映は数日かかる可能性があるため、新機能や修正がすぐに利用できない場合があります。リリースノートの内容を確認し、必要な場合は対応を検討してください。 


### Fixed

**原文:** 

| Bug ID | Description |
| --- | --- |
| **365406457** | **Implemented fix to optimize CPU usage and close sockets when needed.** |
| **382967738, 383113773** | **Fixed security vulnerability in PythonScript policy.** |
| **382883585** | **Fixed security vulnerability in JavaCallout policy.** |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:** 以下のバグ修正とセキュリティアップデートが行われました。

* CPU使用量を最適化し、必要に応じてソケットを閉じるように修正 (Bug ID: 365406457)
* PythonScriptポリシーのセキュリティ脆弱性を修正 (Bug ID: 382967738, 383113773)
* JavaCalloutポリシーのセキュリティ脆弱性を修正 (Bug ID: 382883585)
* セキュリティインフラストラクチャとライブラリの更新

**製品への影響有無:** 有 (セキュリティ脆弱性に関する修正が含まれているため)

**対処方法:** Apigee X の利用者は、最新バージョンへのアップグレードを検討してください。

## Cloud Composer

### Issue

**原文:** 

 **January 10, 2025 update**: The issue is resolved.

 *(Cloud Composer 3 only)* We are currently experiencing an issue with automatic environment upgrades and upgrading Airflow builds for Cloud Composer 3 in asia-south1, europe-west1, and asia-northeast2 regions.

 The upgrades are temporarily disabled as we continue our work to restore the listed functionalities. We will release an additional announcement after the issue is resolved.

**説明:** (解決済み) Cloud Composer 3 の asia-south1、europe-west1、asia-northeast2 リージョンにおいて、環境の自動アップグレードと Airflow ビルドのアップグレードに問題が発生していました。この問題は既に解決されています。

**製品への影響有無:**  (問題は解決済みのため) 無

**対処方法:**  特に対処は不要です。


### Announcement

**原文:** 

 In January 2025, we will **delete inactive Cloud Composer 1 environments that are non-recoverable**. Environments that have both of the following problems present at the same time will be deleted:

- The environment's underlying GKE cluster is deleted.
- The environment is in the ERROR state for at least 60 days because of a disabled billing account or because the Cloud Composer API service was deactivated in its project.

 This change doesn't affect buckets of these environments. You can still recover your DAGs and other data from the environment's bucket and then delete the bucket manually. See Delete environments for information about data that is not deleted automatically together with the environment.

[Delete environments](https://cloud.google.com/composer/docs/delete-environments#about-not-deleted)

**説明:** 2025年1月より、復旧不可能な非アクティブ状態の Cloud Composer 1 環境が削除されます。対象となるのは、以下の条件を両方満たす環境です。

* 環境の基盤となる GKE クラスタが削除されている
* 課金アカウントが無効になっているか、Cloud Composer API サービスがプロジェクトで無効になっているために、環境が少なくとも 60 日間 ERROR 状態である

環境のバケットは削除されません。環境のバケットから DAG やその他のデータを復旧し、手動でバケットを削除できます。

**製品への影響有無:** 有 (Cloud Composer 1 環境を利用している場合)

**対処方法:**  Cloud Composer 1 環境を利用している場合は、以下の点を確認してください。

* 環境が ERROR 状態になっていないか
* 環境の基盤となる GKE クラスタが削除されていないか

該当する環境がある場合は、データのバックアップと復旧手順を確認してください。

## Google Kubernetes Engine

### Security

**原文:** 

 A security issue impacted resources in VPCs with GKE Multi-Cluster Gateway (MCG) configured. MCG is an optional feature that is used by a small subset of GKE customers. We are individually notifying customers who had the feature enabled during that time period.

 For more details, see the GCP-2025-001 security bulletin.

[GCP-2025-001 security bulletin](https://cloud.google.com/kubernetes-engine/security-bulletins#gcp-2025-001)

**説明:** GKE Multi-Cluster Gateway (MCG) を構成した VPC 内のリソースに影響を与えるセキュリティ上の問題が発生しました。MCG は一部の GKE ユーザーが利用するオプションの機能です。影響を受けた可能性のあるユーザーには個別に通知が行われています。

**製品への影響有無:**  GKE Multi-Cluster Gateway (MCG) を利用している場合、有

**対処方法:** GKE Multi-Cluster Gateway (MCG) を利用している場合は、GCP-2025-001 セキュリティ情報を確認し、必要な対応を行ってください。 

# Title: January 07, 2025 
Link: https://cloud.google.com/release-notes#January_07_2025<br>
# Google Kubernetes Engine
## Changed
原文: 
GKE cluster versions have been updated.

**New versions available for upgrades and new clusters.**

The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)
説明： GKEクラスタバージョンがアップデートされ、新しいクラスタの作成と既存クラスタのアップグレードに利用できるようになりました。詳細については、GKEのバージョニングとサポート、アップグレードに関するドキュメントを参照してください。
影響有無： 有
対処方法： GKEクラスタのバージョンアップグレードは、自動アップグレードまたは手動アップグレードによって行えます。自動アップグレードを利用している場合は、特に対応は不要です。手動アップグレードを行う場合は、GKEのドキュメントを参照し、適切なバージョンにアップグレードしてください。

## Changed
原文: 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.31.4-gke.1183000 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.28.15-gke.1488000
- 1.28.15-gke.1503000
- ...(中略)...

説明： RapidチャネルのGKEクラスタで利用可能なバージョンが更新されました。バージョン1.31.4-gke.1183000がデフォルトのクラスタ作成バージョンとなり、多数のバージョンが利用可能になりました。また、いくつかのバージョンは利用できなくなっています。自動アップグレードの対象バージョンも更新され、バージョン1.27, 1.28, 1.29, 1.30のクラスタは、それぞれ指定されたバージョンに自動でアップグレードされます。メンテナンスの除外など、マイナーバージョンアップグレードを妨げる要因があるクラスタのために、パッチのみのバージョン自動アップグレードの対象も更新されました。
影響有無： 有
対処方法： RapidチャネルでGKEクラスタを利用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認してください。必要な場合は、クラスタを手動でアップグレードするか、自動アップグレードの対象バージョンに合わせてください。

## Changed
原文: 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.30.6-gke.1596000 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.28.15-gke.1362000
- 1.28.15-gke.1435000
- ...(中略)...

説明： RegularチャネルのGKEクラスタで利用可能なバージョンが更新されました。バージョン1.30.6-gke.1596000がデフォルトのクラスタ作成バージョンとなり、多数のバージョンが利用可能になりました。また、いくつかのバージョンは利用できなくなっています。自動アップグレードの対象バージョンも更新され、バージョン1.27, 1.28, 1.29のクラスタは、それぞれ指定されたバージョンに自動でアップグレードされます。メンテナンスの除外など、マイナーバージョンアップグレードを妨げる要因があるクラスタのために、パッチのみのバージョン自動アップグレードの対象も更新されました。
影響有無： 有
対処方法： RegularチャネルでGKEクラスタを利用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認してください。必要な場合は、クラスタを手動でアップグレードするか、自動アップグレードの対象バージョンに合わせてください。

## Changed
原文: 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- The following versions are now available in the Stable channel:

- 1.28.15-gke.1342000
- 1.29.10-gke.1155000
- 1.29.10-gke.1280000
- ...(中略)...

説明： StableチャネルのGKEクラスタで利用可能なバージョンが更新されました。多数のバージョンが利用可能になりました。
影響有無： 有
対処方法： StableチャネルでGKEクラスタを利用している場合は、利用可能なバージョンを確認してください。必要な場合は、クラスタを手動でアップグレードしてください。

## Changed
原文: 
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.30.6-gke.1596000 is now the default version for cluster creation in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.16-gke.2142000
- 1.28.15-gke.1362000
- ...(中略)...

説明： ExtendedチャネルのGKEクラスタで利用可能なバージョンが更新されました。バージョン1.30.6-gke.1596000がデフォルトのクラスタ作成バージョンとなり、多数のバージョンが利用可能になりました。また、いくつかのバージョンは利用できなくなっています。メンテナンスの除外など、マイナーバージョンアップグレードを妨げる要因があるクラスタのために、パッチのみのバージョン自動アップグレードの対象も更新されました。バージョン1.27, 1.28, 1.29, 1.30のクラスタは、それぞれ指定されたバージョンに自動でアップグレードされます。
影響有無： 有
対処方法： ExtendedチャネルでGKEクラスタを利用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認してください。必要な場合は、クラスタを手動でアップグレードするか、自動アップグレードの対象バージョンに合わせてください。

## Changed
原文:
> **Note:** Your clusters might not have these versions available. Rollouts are already in progress
  when we publish the release notes, and can take multiple days to complete across all Google Cloud
  zones.

- Version 1.30.6-gke.1596000 is now the default version for cluster creation.
- The following versions are now available:

- 1.28.15-gke.1488000
- 1.28.15-gke.1503000
- ...(中略)...
説明： GKEクラスタで利用可能なバージョンが更新されました。バージョン 1.30.6-gke.1596000 がデフォルトのクラスタ作成バージョンとなり、多数のバージョンが利用可能になりました。また、いくつかのバージョンは利用できなくなっています。自動アップグレードの対象バージョンも更新され、バージョン 1.27, 1.28 のクラスタは、それぞれ指定されたバージョンに自動でアップグレードされます。メンテナンスの除外など、マイナーバージョンアップグレードを妨げる要因があるクラスタのために、パッチのみのバージョン自動アップグレードの対象も更新されました。
影響有無： 有
対処方法： GKEクラスタを利用している場合は、利用可能なバージョンと自動アップグレードの対象バージョンを確認してください。必要な場合は、クラスタを手動でアップグレードするか、自動アップグレードの対象バージョンに合わせてください。

# Google Cloud Composer
## 情報なし
Google Cloud Composer2 (Compoer version 2.7.1、Airflow version 2.7.3)に関するリリースノートの情報は見つかりませんでした。

# Title: January 06, 2025 
Link: https://cloud.google.com/release-notes#January_06_2025<br>
## Cloud Logging - Go 用クライアントライブラリのアップデート (logging/apiv2)

### Changes

- grpc+rest への移行を含む、 Go 用 Cloud Logging クライアントライブラリ v1.13.0 のリリース ([logging/apiv2 v1.13.0](https://github.com/googleapis/google-cloud-go/compare/logging/v1.12.0...logging/v1.13.0))
- 依存関係のアップデート (golang.org/x/net v0.33.0, google.golang.org/api v0.203.0)
- 将来の Protobuf のアップデートに伴う、サービス登録関数のシグネチャ変更に関する警告 (2024年12月1日頃予定) ([#11020](https://togithub.com/googleapis/google-cloud-go/issues/11020))

### 説明

Cloud Logging の Go 用クライアントライブラリが v1.13.0 にアップデートされました。主な変更点は以下の通りです。

- 内部通信方式が gRPC+REST に変更されました。
- いくつかの依存ライブラリが更新されました。
- 2024年12月1日頃に予定されている Protobuf のアップデートにより、サービス登録関数のシグネチャが変更される予定です。この変更は、Go 用 Cloud Logging  クライアントライブラリのユーザーに影響を与える可能性があります。

### 影響有無

Go 用 Cloud Logging クライアントライブラリ (logging/apiv2) を使用している場合、影響があります。

### 対処方法

- Go 用 Cloud Logging クライアントライブラリを v1.13.0 にアップデートしてください。
- Protobuf のアップデートに関する警告 ([#11020](https://togithub.com/googleapis/google-cloud-go/issues/11020)) を確認し、必要があれば対応してください。


## Secret Manager - Go 用クライアントライブラリのアップデート (secretmanager/apiv1)

### Changes 

- 依存関係のアップデート (golang.org/x/net v0.33.0) を含む、Go 用 Secret Manager クライアントライブラリ v1.14.3 のリリース ([secretmanager/apiv1 v1.14.3](https://github.com/googleapis/google-cloud-go/compare/secretmanager/v1.14.2...secretmanager/v1.14.3))

### 説明

Secret Manager の Go 用クライアントライブラリが v1.14.3 にアップデートされました。主な変更点は、依存ライブラリ (golang.org/x/net) が v0.33.0 に更新されたことです。

### 影響有無

Go 用 Secret Manager クライアントライブラリ (secretmanager/apiv1) を使用している場合、影響があります。

### 対処方法

Go 用 Secret Manager クライアントライブラリを v1.14.3 にアップデートしてください。

# Title: December 20, 2024 
Link: https://cloud.google.com/release-notes#December_20_2024<br>
## Apigee X

### Announcement

> On December 20, 2024 we released an updated version of Apigee.
>
> > **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to complete across all Google Cloud zones. Your instances may not have the feature available until the rollout is complete.

説明： 2024年12月20日にApigeeのアップデートバージョンがリリースされました。本番環境へのロールアウトは2営業日以内に開始され、Google Cloudのすべてのゾーンで完了するまでに4営業日以上かかる場合があります。ロールアウトが完了するまで、インスタンスで新機能が使用できない場合があります。

影響有無： 有

対処方法： 本番環境へのロールアウトは自動で行われますが、新機能が使用可能になるまで最大4営業日かかる可能性があります。新しい機能に依存する場合は、ロールアウトが完了するまで待つ必要があります。


## Pub/Sub

### Announcement

> Documentation is now available to help you troubleshoot Pub/Sub issues by using audit logs. You can use audit logs to troubleshoot issues related to identifying who created, deleted, or modified Pub/Sub resources, tracking configuration changes to topics or subscriptions, and verifying the existence and status of topics and subscriptions. For more information, see Troubleshoot Pub/Sub issues with audit logs and General troubleshooting.
>
> [Troubleshoot Pub/Sub issues with audit logs](https://cloud.google.com/pubsub/docs/troubleshooting-audit-logs)
> [General troubleshooting](https://cloud.google.com/pubsub/docs/troubleshooting)

説明： Pub/Subの問題を監査ログを使用してトラブルシューティングするためのドキュメントが公開されました。監査ログを使用すると、Pub/Subリソースの作成、削除、または変更を行ったユーザーの特定、トピックまたはサブスクリプションへの構成変更の追跡、トピックとサブスクリプションの存在とステータスの確認に関連する問題をトラブルシューティングできます。

影響有無： 無

対処方法： 監査ログを使用したトラブルシューティングは任意です。詳細については、提供されたリンク先のドキュメントを参照してください。 

# Title: December 19, 2024 
Link: https://cloud.google.com/release-notes#December_19_2024<br>
## Apigee X

### Announcement

**原文:** On December 19, 2024, we released an updated version of Apigee (1-14-0-apigee-3) for trial organizations only.

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

**説明:** 2024年12月19日、トライアル版の組織向けにApigeeのアップデートバージョン(1-14-0-apigee-3)がリリースされました。 プロダクションインスタンスへのロールアウトは2営業日以内に開始され、Google Cloudのすべてのゾーンへの展開が完了するまで4営業日以上かかる場合があります。 ロールアウトが完了するまで、すべての機能や修正が利用できない場合があります。

**製品への影響有無:** 無 (トライアル版組織以外)

**対処方法:**  特になし。本番環境への適用は後日開始され、完了まで時間がかかることに注意してください。


### Fixed

**原文:** 

| Bug ID | Description |
| --- | --- |
| **N/A** | **Updates to security infrastructure and libraries.** |

**説明:** セキュリティ基盤とライブラリのアップデート

**製品への影響有無:**  有 (セキュリティアップデートが含まれるため)

**対処方法:** Apigee X の利用状況に応じて、セキュリティアップデートの内容を確認し、必要な対応を行うことを推奨します。


## Pub/Sub

### Announcement

**原文:** Documentation is now available to help you choose between Pub/Sub and Google Cloud Managed Service for Apache Kafka. The comparison is based on factors such as operational ease, portability, existing Kafka setup, and integration with other Google Cloud products. A detailed feature comparison table is also included. For more information, see Choose Pub/Sub or Cloud Managed Service for Apache Kafka.

[Choose Pub/Sub or Cloud Managed Service for Apache Kafka](https://cloud.google.com/pubsub/docs/choose-pubsub-kafka)

**説明:** Pub/SubとGoogle Cloud Managed Service for Apache Kafkaのどちらを選択するかを支援するドキュメントが公開されました。この比較は、運用性、移植性、既存のKafka設定、他のGoogle Cloud製品との統合などの要素に基づいています。詳細な機能比較表も含まれています。

**製品への影響有無:**  無 (ドキュメント公開のみ)

**対処方法:**  Pub/SubまたはCloud Managed Service for Apache Kafkaの利用を検討する場合は、このドキュメントを参照してください。

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
