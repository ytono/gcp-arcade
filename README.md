
Title: September 23, 2024
Link: https://cloud.google.com/release-notes#September_23_2024
## BigQuery: Libraries リリースノート

### 内容

* BigQueryのGo用クライアントライブラリ `bigquery/storage/apiv1beta1` のアップデート
    *  バージョン1.63.0がリリース、多数の変更と修正が含まれています。
    *  主な変更点：
        * Go 1.23 iteratorsのサポート追加 (パフォーマンス向上)
        * 新しいクライアントの追加
        * いくつかのバグ修正と依存関係の更新

### 影響

* Go言語でBigQuery Storage API v1beta1を利用している場合、このアップデートによる影響を受ける可能性があります。

### 対処方法

* リリースノートに記載された変更点を確認し、必要に応じてコードの修正を行ってください。
* 最新バージョンへのアップグレードを検討してください。

## Cloud Monitoring: Changed リリースノート

### 内容

* インシデント詳細ページのレイアウトが更新されました。
* 関連するインシデントを表示できるようになりました。
* アラートポリシーが評価したすべての時系列を表示するか、条件を満たした時系列のみを表示するかを切り替えられるようになりました。

### 影響

* Cloud Monitoringを利用しているユーザーは、インシデント詳細ページのレイアウト変更に気付くでしょう。
* 新しい機能により、インシデント分析がより便利になります。

### 対処方法

* 特に対処は必要ありません。
* 更新されたインシデント詳細ページの使用方法を確認してください。

## Cloud Run: Changed リリースノート

### 内容

* 一部のPHPランタイムのランタイムサポートスケジュールが、PHPの公式サポートスケジュールに合わせて延長されました。

### 影響

* 対象のPHPランタイムを利用しているCloud Runユーザーは、より長い期間サポートを受けられるようになります。

### 対処方法

* 特に対処は必要ありません。
* サポート延長の詳細については、リリースノートのリンク先を確認してください。

## Cloud Storage: Changed リリースノート

### 内容

* Cloud Storageの使用ログとストレージログを保存するバケットを設定する場合、ログを保存するバケットは、ログ対象のバケットと同じ組織内に存在する必要があります。
* ログ対象のバケットが組織に関連付けられていない場合は、ログを保存するバケットは代わりに同じプロジェクト内に存在する必要があります。

### 影響

* Cloud Storageの使用ログとストレージログを異なる組織またはプロジェクトのバケットに保存している場合、この変更の影響を受けます。
* 今後、ログを保存するためには、同じ組織またはプロジェクト内のバケットを使用する必要があります。

### 対処方法

* ログを保存するバケットを、ログ対象のバケットと同じ組織またはプロジェクト内に移動してください。

## Google Kubernetes Engine: Security リリースノート

### 内容

* Windowsノードを持つKubernetesクラスタにおいて、`BUILTIN\Users` がコンテナログを読み取れる可能性、`AUTHORITY\Authenticated` ユーザーがコンテナログを変更できる可能性があるセキュリティ問題が発見されました。
* 詳細は、GCP-2024-054セキュリティ情報で確認できます。

### 影響

* Google Kubernetes EngineでWindowsノードを使用している場合、このセキュリティ問題の影響を受ける可能性があります。
* 悪意のあるユーザーがコンテナログに不正にアクセスする可能性があります。

### 対処方法

* セキュリティ情報の指示に従って、影響を受ける可能性のあるクラスタを修正してください。
* セキュリティ情報の詳細は、以下のリンク先を参照してください。
    * [GCP-2024-054 security bulletin](https://cloud.google.com/kubernetes-engine/security-bulletins#gcp-2024-054) 

Title: September 20, 2024
Link: https://cloud.google.com/release-notes#September_20_2024
## Apigee X リリースノート September 20, 2024 (1-13-0-apigee-5) の解説

### アナウンス概要

Apigee X の新バージョン (1-13-0-apigee-5) がリリースされました。今後2営業日以内に段階的に本番環境に適用され、全Google Cloudゾーンへの展開完了までには4営業日以上かかる可能性があります。

### 変更点

| Bug ID | 説明 | 製品への影響有無 | 対処方法 |
|---|---|---|---|
| 366039324 | **JWT/JWS ポリシーにおける PEM 解析エラーの修正**: 問題のある PEM 形式が原因で発生していた JWT/JWS ポリシー実行時の PEM 解析エラーを修正しました。 | Apigee X で JWT/JWS ポリシーを使用している場合、影響を受ける可能性があります。 | 特に対処は不要です。今回のアップデートにより自動的に修正されます。 |
| 353527851 | **WebSocket 接続の切断の解決**: OAuthV2 ポリシーと `VerifyJWTAccessToken` オペレーションまたは VerifyJWT を使用しているときに WebSocket 接続が切断される問題を修正しました。 | Apigee X で OAuthV2 ポリシーと `VerifyJWTAccessToken` オペレーションまたは VerifyJWT を使用して WebSocket を利用している場合、影響を受ける可能性があります。 | 特に対処は不要です。今回のアップデートにより自動的に修正されます。 |
| N/A | セキュリティインフラストラクチャとライブラリの更新 | セキュリティ強化のため、常に最新の状態を保つことが推奨されます。 | 特に対処は不要です。今回のアップデートにより自動的に適用されます。 |

### 製品への影響と対処方法

今回のリリースは、Apigee X のバグ修正とセキュリティ強化が主な内容です。上記「製品への影響有無」と「対処方法」を参考に、必要に応じて対応してください。 

**注記:** リリースノートに記載されている影響範囲はあくまで一般的なものであり、個々の環境や設定によって影響度が異なる場合があります。 ご自身の環境への影響については、リリースノートの内容をよく確認し、必要に応じてテストを実施することをお勧めします。 

Title: September 19, 2024
Link: https://cloud.google.com/release-notes#September_19_2024
## Google Kubernetes Engine のアップデート内容

###  GKE cluster versions have been updated.

#### 説明
GKEクラスタのバージョンがアップデートされました。 各チャネル(Rapid, Regular, Stable, Extended, No channel)で利用可能なバージョン、デフォルトバージョン、自動アップグレード対象バージョンが更新されています。

#### 製品への影響
*  利用中のGKEクラスタのチャネルとバージョンに依存します。
*  自動アップグレードが有効になっている場合は、リリースノートで指定されたバージョンに自動的にアップグレードされます。
    *  Rapidチャネルの場合、1.29系は1.30.3-gke.1969001、1.30系は1.31.0-gke.1506000に自動アップグレードされます。
    *  Regularチャネルの場合、1.29系は1.30.3-gke.1969001に自動アップグレードされます。
    *  Stableチャネルの場合、自動アップグレード対象バージョンはありません。
    *  Extendedチャネルの場合、1.30系は1.30.3-gke.1969001に自動アップグレードされます。
    *  No channelの場合、1.30系は1.30.3-gke.1969001、1.31系は1.31.0-gke.1506000に自動アップグレードされます。

#### 対処方法
* 自動アップグレードが有効になっている場合は、特に操作は必要ありません。 アップグレードが完了するまで数日かかる場合があります。
* 特定のバージョンへのアップグレードを希望する場合は、リリースノートで指定された利用可能なバージョンを確認し、手動でアップグレードを実施してください。

### その他
* 各バージョンに対応するCHANGELOGのリンクが記載されています。 アップグレード前に、各バージョンにおける変更点を確認することをお勧めします。 特に、Breaking ChangesやDeprecationに注意が必要です。

**注記:** 上記の情報は、提供されたリリースノートの一部に基づいています。 リリースノート全体を確認し、詳細な情報やその他の変更点については、Google Cloudの公式ドキュメントを参照してください。 

Title: September 18, 2024
Link: https://cloud.google.com/release-notes#September_18_2024
## Apigee X

### Announcement

**原文**

On September 18, 2024 we released an updated version of Apigee

> **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to complete across all Google Cloud zones. Your instances may not have the feature available until the rollout is complete.

**説明**

Apigee X のアップデートバージョンがリリースされました。今後2営業日以内に本番環境へのロールアウトが開始され、Google Cloudのすべてのゾーンで完了するまでに4営業日以上かかる可能性があります。

**製品への影響**

Apigee Xを利用している場合、このアップデートが適用されるまで、新機能が使用できない可能性があります。

**対処方法**

特に対処は必要ありません。ロールアウトが完了するまで待つようにしてください。


## Cloud Composer

### Announcement

**原文**

A new Cloud Composer release has started on **September 18, 2024**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.

**説明**

Cloud Composer の新しいリリースが開始されました。今後、すべてのリージョンに展開されます。リリースは進行中であり、記載されている変更点や機能は一部のリージョンではまだ利用できない可能性があります。

**製品への影響**

Cloud Composer を利用している場合、新機能が利用可能になるまで、時間差が発生する可能性があります。

**対処方法**

特に対処は必要ありません。リリースノートで提供される情報を確認し、新機能が利用可能になったら、必要に応じて適用してください。

### Fixed (Cloud Composer 2)

**原文**

*(Cloud Composer 2)* Fixed the issue where environment create and update operations could fail in rare cases because of the scheduler probe timeouts.

**説明**

Cloud Composer 2で、スケジューラプローブのタイムアウトが原因で、環境の作成および更新操作がまれに失敗する問題が修正されました。

**製品への影響**

Cloud Composer 2を利用していて、過去にこの問題が発生していた場合は、修正済みのため、今後は発生しなくなります。

**対処方法**

特に対処は必要ありません。

### Fixed (Cloud Composer 3)

**原文**

*(Cloud Composer 3)* Fixed the issue that caused KubernetesPodOperator tasks to fail if they ran for longer than 15 minutes.

**説明**

Cloud Composer 3で、KubernetesPodOperatorタスクが15分を超えて実行されると失敗する問題が修正されました。

**製品への影響**

Cloud Composer 3を利用していて、過去にこの問題が発生していた場合は、修正済みのため、今後は発生しなくなります。

**対処方法**

特に対処は必要ありません。

### Changed (New Airflow builds)

**原文**

New Airflow builds are available in Cloud Composer 3:

[Airflow builds](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-3)
- composer-3-airflow-2.9.3-build.0
- composer-3-airflow-2.9.1-build.7 (default)
- composer-3-airflow-2.7.3-build.16

**説明**

Cloud Composer 3で、新しい Airflow ビルドが利用可能になりました。

**製品への影響**

Cloud Composer 3を利用している場合、新しいAirflowビルドを利用することができます。

**対処方法**

必要に応じて、新しいAirflowビルドを利用するようにしてください。

### Changed (Cloud Composer 2.9.4 images)

**原文**

Cloud Composer 2.9.4 images are available:

[images](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-2)
- composer-2.9.4-airflow-2.9.3
- composer-2.9.4-airflow-2.9.1 (default)
- composer-2.9.4-airflow-2.7.3

**説明**

Cloud Composer 2.9.4 のイメージが利用可能になりました。

**製品への影響**

Cloud Composer 2.9.4 を利用する場合、新しいイメージを利用することができます。

**対処方法**

必要に応じて、新しいイメージを利用するようにしてください。

### Changed (Support dates for previous Cloud Composer 3 builds)

**原文**

Support dates for previous Cloud Composer 3 builds are available. All Cloud Composer 3 builds with Airflow 2.9.1 are supported until September 18, 2025.

**説明**

以前の Cloud Composer 3 ビルドのサポート日が公開されました。Airflow 2.9.1 を使用するすべての Cloud Composer 3 ビルドは、2025 年 9 月 18 日までサポートされます。

**製品への影響**

Cloud Composer 3 の古いバージョンを利用している場合は、サポート終了日に注意する必要があります。

**対処方法**

サポート終了日までに、サポートされているバージョンにアップグレードしてください。

### Deprecated (Cloud Composer versions 2.4.2 and 2.4.3)

**原文**

Cloud Composer versions 2.4.2 and 2.4.3 have reached their end of support period.

[end of support period](https://cloud.google.com/composer/docs/concepts/versioning/composer-versioning-overview#version-deprecation-and-support)

**説明**

Cloud Composer バージョン 2.4.2 および 2.4.3 は、サポート終了に達しました。

**製品への影響**

Cloud Composer  バージョン 2.4.2 および 2.4.3 を利用している場合は、サポートが提供されなくなります。

**対処方法**

サポートされているバージョンにアップグレードしてください。

## Compute Engine

### Changed (Determine the number of provisioned VMs)

**原文**

You can determine the number of running VMs and reservations that match the properties of a future reservation request. By subtracting this number from the total count specified in a future reservation request, you can determine the number of reserved VMs that an existing future reservation provisions at its start time. For more information, see Determine the number of provisioned VMs.

[Determine the number of provisioned VMs](https://cloud.google.com/compute/docs/instances/view-future-reservations#determine-provisioned-vms)

**説明**

将来のリソース予約リクエストのプロパティと一致する、実行中のVMと予約の数を決定できるようになりました。将来のリソース予約リクエストで指定された合計数からこの数を引くことで、既存の将来のリソース予約が開始時にプロビジョニングする予約済みVMの数を決定できます。

**製品への影響**

Compute Engineを利用している場合、将来のリソース予約の管理がより詳細にできるようになります。

**対処方法**

必要に応じて、この新機能を利用するようにしてください。

### Changed (Create a future reservation request by reusing the properties of an existing VM)

**原文**

You can create a future reservation request by reusing the properties of an existing VM. This lets you consume the auto-created reservations for the future reservation by creating VMs with properties that exactly match the reference VM's properties. For more information, see the following:

- Create future reservation requests for a single project
- Create shared future reservation requests

 Create future reservation requests for a single project

[Create future reservation requests for a single project](https://cloud.google.com/compute/docs/instances/create-single-project-future-reservations)
 Create shared future reservation requests

[Create shared future reservation requests](https://cloud.google.com/compute/docs/instances/create-shared-future-reservations)

**説明**

既存のVMのプロパティを再利用して、将来のリソース予約リクエストを作成できるようになりました。これにより、参照VMのプロパティと完全に一致するプロパティを持つVMを作成することで、将来のリソース予約用に自動作成された予約を利用できます。

**製品への影響**

Compute Engineを利用している場合、将来のリソース予約の作成がより簡単になります。

**対処方法**

必要に応じて、この新機能を利用するようにしてください。 
