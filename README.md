
Title: October 07, 2024
Link: https://cloud.google.com/release-notes#October_07_2024
## BigQuery - Libraries

### Go

#### 変更点の概要

BigQueryのGo用クライアントライブラリ(bigquery/storage/apiv1beta1)のバージョン1.63.1がリリースされました。主な変更点は以下の通りです。

- BigQuery Metastore Partition Service API v1alphaのメソッドタイムアウトが240秒に増加しました。
- ステートレスクエリで結果セットが空の場合にスキーマが欠落する問題が修正されました。
- ReadSession作成時にクライアントまたはジョブのProjectIDが使用されるようになりました。

#### 製品への影響

- Google Cloud Composer, Google Kubernetes Engineを利用している場合でも、BigQuery Go クライアントライブラリを利用していなければ影響はありません。

#### 対処方法

- BigQuery Go クライアントライブラリを利用している場合は、バージョン1.63.1へのアップデートを検討してください。


### Java

#### 変更点の概要

BigQueryのJava用クライアントライブラリ(google-cloud-bigquery)のバージョン2.43.0と2.42.4がリリースされました。主な変更点は以下の通りです。

- ExternalTableDefinitionにmax stalenessが追加されました。(バージョン 2.43.0)
- いくつかの依存関係のバージョンが更新されました。(バージョン 2.42.4)

#### 製品への影響

- Google Cloud Composer, Google Kubernetes Engineを利用している場合でも、BigQuery Java クライアントライブラリを利用していなければ影響はありません。

#### 対処方法

- BigQuery Java クライアントライブラリを利用している場合は、最新バージョン(2.43.0)へのアップデートを検討してください。 

Title: October 04, 2024
Link: https://cloud.google.com/release-notes#October_04_2024
## Google Kubernetes Engine

### セキュリティ

**原文:** CVE-2024-45016 was discovered in the Linux kernel, which can lead to a privilege escalation on Container-Optimized OS and Ubuntu nodes. For more details, see the GCP-2024-057 security bulletin. [GCP-2024-057 security bulletin](https://cloud.google.com/kubernetes-engine/security-bulletins#gcp-2024-057)

**説明:** 
Linuxカーネルに発見されたCVE-2024-45016の脆弱性により、Container-Optimized OSとUbuntuノードで権限昇格が発生する可能性があります。

**製品への影響:**
Google Kubernetes EngineクラスタでContainer-Optimized OSまたはUbuntuノードを利用している場合は、この脆弱性の影響を受ける可能性があります。

**対処方法:**
GCP-2024-057セキュリティ情報に記載されている対策を実施してください。具体的には、影響を受けるノードでカーネルのアップデートが必要となります。 

**CVE-2024-45016 詳細:**
Linuxカーネルの cgroup v1 で発見された脆弱性です。攻撃者がシステム上で有効なアカウントを持っている場合、この脆弱性を悪用してroot権限を取得する可能性があります。

**重要度:** 高

**影響を受けるバージョン:**

* Container-Optimized OS
* Ubuntu 

**対策:**  影響を受けるノードのカーネルをアップデートしてください。 

Title: October 03, 2024
Link: https://cloud.google.com/release-notes#October_03_2024
## Google Kubernetes Engine リリースノート 分析

### 更新内容

GKEクラスタのバージョンが更新されました。

#### 新規バージョン(アップグレードと新規クラスタ向け)

以下のKubernetesバージョンが、新規クラスタ、および既存クラスタのオプトインコントロールプレーンアップグレードとノードアップグレードで利用できるようになりました。バージョン管理とアップグレードの詳細については、[GKEのバージョン管理とサポート](https://cloud.google.com/kubernetes-engine/versioning)および[アップグレード](https://cloud.google.com/kubernetes-engine/upgrades)をご覧ください。


#### Rapid Channel

-  バージョン 1.31.1-gke.1000000 がRapid Channelのクラスタ作成時のデフォルトバージョンになりました。
- 以下のバージョンはRapid Channelで**使用できなくなりました**。
    - 1.27.16-gke.1342000
    - 1.28.13-gke.1119000
    - 1.28.14-gke.1004000
    - 1.29.8-gke.1211000
    - 1.30.4-gke.1348000
    - 1.31.0-gke.1577000
- 以下のマイナーバージョンで自動アップグレードターゲットが利用できるようになりました。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.26からバージョン 1.27.16-gke.1373000 にアップグレードされます。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン 1.28.14-gke.1099000 にアップグレードされます。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン 1.29.8-gke.1278000 にアップグレードされます。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.29からバージョン 1.30.5-gke.1014000 にアップグレードされます。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.30からバージョン 1.31.1-gke.1000000 にアップグレードされます。
- メンテナンスの除外またはマイナーバージョンアップグレードを妨げるその他の要因があるクラスタでは、以下のパッチのみのバージョン自動アップグレードターゲットが利用できるようになりました。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン 1.27.16-gke.1373000 にアップグレードされます。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン 1.28.14-gke.1099000 にアップグレードされます。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.29からバージョン 1.29.8-gke.1278000 にアップグレードされます。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.30からバージョン 1.30.5-gke.1014000 にアップグレードされます。
    - Rapid Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.31からバージョン 1.31.1-gke.1000000 にアップグレードされます。

**影響と対処方法:**

- **現在Rapid Channelでバージョン1.27、1.28、1.29、1.30、1.31を利用している場合:**
    - 自動アップグレードが有効になっている場合、上記の対応するバージョンに自動でアップグレードされます。
    - アップグレードを遅らせたい場合は、自動アップグレードを無効にするか、メンテナンスの除外を設定する必要があります。詳細については、[メンテナンスの除外](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)を参照してください。
- **現在Rapid Channelでバージョン 1.27.16-gke.1342000, 1.28.13-gke.1119000, 1.28.14-gke.1004000, 1.29.8-gke.1211000, 1.30.4-gke.1348000, 1.31.0-gke.1577000 を利用している場合:**
    - これらのバージョンは使用できなくなるため、サポートされているバージョンにアップグレードする必要があります。

#### Regular Channel

- バージョン 1.30.4-gke.1348000 がRegular Channelのクラスタ作成時のデフォルトバージョンになりました。
- 以下のバージョンはRegular Channelで**使用できるようになりました**。
    - 1.27.16-gke.1373000
    - 1.28.14-gke.1004000
    - 1.29.8-gke.1278000
    - 1.30.4-gke.1348001
    - 1.30.5-gke.1014001
- 以下のバージョンはRegular Channelで**使用できなくなりました**。
    - 1.27.16-gke.1287000
    - 1.28.13-gke.1049000
    - 1.29.8-gke.1096000
    - 1.30.3-gke.1969001
- 以下のマイナーバージョンで自動アップグレードターゲットが利用できるようになりました。
    - Regular Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.26からバージョン 1.27.16-gke.1342000 にアップグレードされます。
    - Regular Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン 1.28.13-gke.1119000 にアップグレードされます。
    - Regular Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン 1.29.8-gke.1211000 にアップグレードされます。
    - Regular Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.29からバージョン 1.30.4-gke.1348000 にアップグレードされます。
- メンテナンスの除外またはマイナーバージョンアップグレードを妨げるその他の要因があるクラスタでは、以下のパッチのみのバージョン自動アップグレードターゲットが利用できるようになりました。
    - Regular Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン 1.27.16-gke.1342000 にアップグレードされます。
    - Regular Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン 1.28.13-gke.1119000 にアップグレードされます。
    - Regular Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.29からバージョン 1.29.8-gke.1211000 にアップグレードされます。
    - Regular Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.30からバージョン 1.30.4-gke.1348000 にアップグレードされます。


**影響と対処方法:**

- **現在Regular Channelでバージョン1.27、1.28、1.29を利用している場合:**
    - 自動アップグレードが有効になっている場合、上記の対応するバージョンに自動でアップグレードされます。
    - アップグレードを遅らせたい場合は、自動アップグレードを無効にするか、メンテナンスの除外を設定する必要があります。詳細については、[メンテナンスの除外](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)を参照してください。
- **現在Regular Channelでバージョン 1.27.16-gke.1287000, 1.28.13-gke.1049000, 1.29.8-gke.1096000, 1.30.3-gke.1969001 を利用している場合:**
    - これらのバージョンは使用できなくなるため、サポートされているバージョンにアップグレードする必要があります。


#### Stable Channel

- 以下のバージョンはStable Channelで**使用できるようになりました**。
    - 1.27.16-gke.1287000
    - 1.28.13-gke.1049000
    - 1.29.8-gke.1096000
    - 1.30.3-gke.1969002
- 以下のバージョンはStable Channelで**使用できなくなりました**。
    - 1.28.13-gke.1006000
    - 1.29.8-gke.1031000
- 以下のマイナーバージョンで自動アップグレードターゲットが利用できるようになりました。
    - Stable Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン 1.28.13-gke.1024000 にアップグレードされます。
    - Stable Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン 1.29.8-gke.1057000 にアップグレードされます。
- メンテナンスの除外またはマイナーバージョンアップグレードを妨げるその他の要因があるクラスタでは、以下のパッチのみのバージョン自動アップグレードターゲットが利用できるようになりました。
    - Stable Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン 1.28.13-gke.1024000 にアップグレードされます。
    - Stable Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.29からバージョン 1.29.8-gke.1057000 にアップグレードされます。

**影響と対処方法:**

- **現在Stable Channelでバージョン1.27、1.28を利用している場合:**
    - 自動アップグレードが有効になっている場合、上記の対応するバージョンに自動でアップグレードされます。
    - アップグレードを遅らせたい場合は、自動アップグレードを無効にするか、メンテナンスの除外を設定する必要があります。詳細については、[メンテナンスの除外](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)を参照してください。
- **現在Stable Channelでバージョン 1.28.13-gke.1006000, 1.29.8-gke.1031000 を利用している場合:**
    - これらのバージョンは使用できなくなるため、サポートされているバージョンにアップグレードする必要があります。


#### Extended Channel

- バージョン 1.30.4-gke.1348000 がExtended Channelのクラスタ作成時のデフォルトバージョンになりました。
- 以下のバージョンはExtended Channelで**使用できるようになりました**。
    - 1.27.16-gke.1373000
    - 1.28.14-gke.1004000
    - 1.29.8-gke.1278000
    - 1.30.4-gke.1348001
    - 1.30.5-gke.1014001
- 以下のバージョンはExtended Channelで**使用できなくなりました**。
    - 1.27.16-gke.1287000
    - 1.28.13-gke.1049000
    - 1.29.8-gke.1096000
    - 1.30.3-gke.1969001
- 以下のマイナーバージョンで自動アップグレードターゲットが利用できるようになりました。
    - Extended Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン 1.27.16-gke.1342000 にアップグレードされます。
    - Extended Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン 1.28.13-gke.1119000 にアップグレードされます。
    - Extended Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.29からバージョン 1.29.8-gke.1211000 にアップグレードされます。
    - Extended Channelで自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.30からバージョン 1.30.4-gke.1348000 にアップグレードされます。

**影響と対処方法:**

- **現在Extended Channelでバージョン1.27、1.28、1.29を利用している場合:**
    - 自動アップグレードが有効になっている場合、上記の対応するバージョンに自動でアップグレードされます。
    - アップグレードを遅らせたい場合は、自動アップグレードを無効にするか、メンテナンスの除外を設定する必要があります。詳細については、[メンテナンスの除外](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)を参照してください。
- **現在Extended Channelでバージョン 1.27.16-gke.1287000, 1.28.13-gke.1049000, 1.29.8-gke.1096000, 1.30.3-gke.1969001 を利用している場合:**
    - これらのバージョンは使用できなくなるため、サポートされているバージョンにアップグレードする必要があります。

#### No Channel

- バージョン 1.30.4-gke.1348000 がNo Channelのクラスタ作成時のデフォルトバージョンになりました。
- 以下のバージョンが使用できるようになりました。
    - 1.30.3-gke.1969002
    - 1.30.4-gke.1348001
    - 1.30.5-gke.1014001
- 以下のノードバージョンが使用できるようになりました。
    - 1.30.3-gke.1969002
    - 1.30.4-gke.1348001
    - 1.30.5-gke.1014001
- 以下のバージョンは**使用できなくなりました**。
    - 1.28.13-gke.1006000
    - 1.29.8-gke.1031000
    - 1.30.3-gke.1639000
- 以下のマイナーバージョンで自動アップグレードターゲットが利用できるようになりました。
    - 自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.26からバージョン 1.27.16-gke.1342000 にアップグレードされます。
    - 自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン 1.28.13-gke.1119000 にアップグレードされます。
    - 自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン 1.29.8-gke.1211000 にアップグレードされます。
- メンテナンスの除外またはマイナーバージョンアップグレードを妨げるその他の要因があるクラスタでは、以下のパッチのみのバージョン自動アップグレードターゲットが利用できるようになりました。
    - 自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.27からバージョン 1.27.16-gke.1342000 にアップグレードされます。
    - 自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.28からバージョン 1.28.13-gke.1119000 にアップグレードされます。
    - 自動アップグレードが有効になっているコントロールプレーンとノードは、今回のリリースでバージョン1.29からバージョン 1.29.8-gke.1211000 にアップグレードされます。

**影響と対処方法:**

- **現在No Channelでバージョン1.27、1.28、1.29を利用している場合:**
    - 自動アップグレードが有効になっている場合、上記の対応するバージョンに自動でアップグレードされます。
    - アップグレードを遅らせたい場合は、自動アップグレードを無効にするか、メンテナンスの除外を設定する必要があります。詳細については、[メンテナンスの除外](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)を参照してください。
- **現在No Channelでバージョン 1.28.13-gke.1006000, 1.29.8-gke.1031000, 1.30.3-gke.1639000 を利用している場合:**
    - これらのバージョンは使用できなくなるため、サポートされているバージョンにアップグレードする必要があります。

### 質問への回答

- **現在利用している製品への影響と対処方法**

    - 質問で提示された製品バージョン(GKE 1.29, 1.30)は、いずれかのチャネルでサポート対象外バージョン、または自動アップグレード対象バージョンに該当します。
    - GKEクラスタのチャネル、自動アップグレード設定を確認し、必要に応じてアップグレード計画を立案してください。

- **CVEに関して**
    - CVEのURLが提示されていないため、詳細を説明できません。該当のCVEのURLを提示してください。 

Title: October 02, 2024
Link: https://cloud.google.com/release-notes#October_02_2024
## Apigee X のアップデート (2024年10月2日)

### 英語原文
On October 2, 2024, we released an updated version of Apigee.

Subscription Apigee organizations (without hybrid entitlements) upgraded in this release will see changes to the user experience in the Classic Apigee UI.  To support management of the upgraded functionality now available to these organizations, a number of feature administration pages are now only available in the Apigee UI in Cloud console.

[Classic Apigee UI](https://apigee.google.com/edge)
[Apigee UI in Cloud console](https://cloud.google.com/console/apigee)
 For more information, see Apigee UI in Cloud console navigation.

[Apigee UI in Cloud console navigation](https://cloud.google.com/apigee/docs/api-platform/fundamentals/ui-overview#console-compare)

### 日本語説明

2024年10月2日にApigeeのアップデートがリリースされました。

今回のアップデートにより、サブスクリプション型のApigee組織（ハイブリッド契約でないもの）では、Classic Apigee UIの一部の機能がCloud Console上のApigee UIでのみ利用可能になります。これは、アップデートによって利用可能になった新機能の管理画面がCloud ConsoleのApigee UIに集約されたためです。

**影響を受ける製品・バージョン**:

* サブスクリプション型のApigee組織（ハイブリッド契約でないもの）

**影響**:

* Classic Apigee UIの一部の機能が利用できなくなります。

**対処方法**:

* Cloud Console上のApigee UIを利用してください。

**参考情報**:
* [Classic Apigee UI](https://apigee.google.com/edge)
* [Cloud Console上のApigee UI](https://cloud.google.com/console/apigee)
* [Cloud Console上のApigee UIナビゲーション](https://cloud.google.com/apigee/docs/api-platform/fundamentals/ui-overview#console-compare)


### その他

今回のリリースノートでは、具体的な製品バージョンに関する情報は提供されていません。そのため、現在利用している製品バージョンへの影響については明記できません。
Title: October 01, 2024
Link: https://cloud.google.com/release-notes#October_01_2024
## Cloud Composer リリースノート (2024年10月1日)

### アナウンス

- **新しいCloud Composerリリースが2024年10月1日から開始されました。**
    - 全てのリージョンへのロールアウトが進むにつれて、今後の変更や新機能にご期待ください。
    - このリリースは現在進行中です。
    - リストされている変更点や機能は、一部のリージョンではまだ利用できない可能性があります。

    **説明**
    Cloud Composerの新しいリリースが開始されました。順次展開されるため、利用可能になるまでしばらくお待ちください。

    **製品への影響**
    今のところ影響はありません。

    **対処方法**
    特に対処は必要ありません。


### Fixed

- `[scheduler]allowed_run_id_pattern` Airflow設定オプションがカスタム値に設定されている場合に、Cloud Consoleから作成されたDAG実行が失敗する原因を修正しました。(アップグレードなしで利用可能)

    **説明**
    特定の設定を行なっている場合にCloud ConsoleからDAGを実行すると失敗する問題が修正されました。

    **製品への影響**
    上記の設定を行なっており、Cloud ConsoleからDAGを実行している場合は影響がありましたが、修正済みです。

    **対処方法**
    特に対処は必要ありません。


### Changed

- **(Airflow 2.9.3および2.9.1)** `apache-airflow-providers-google`パッケージが、Cloud Composer 2イメージとCloud Composer 3ビルドでバージョン10.23.0にアップグレードされました。変更点の詳細については、バージョン10.22.0からバージョン10.23.0までのapache-airflow-providers-googleの変更履歴をご覧ください。

    **説明**
    Airflow 2.9.3および2.9.1を利用している場合、`apache-airflow-providers-google`パッケージがバージョンアップされます。変更点については、提供されたリンクを参照してください。

    **製品への影響**
    Airflow 2.9.3および2.9.1を利用している場合、`apache-airflow-providers-google`パッケージのバージョンアップによる影響がある可能性があります。

    **対処方法**
    提供されたリンク先にある変更履歴を確認し、必要な対応を行ってください。

### Changed

- **(Airflow 2.9.3および2.9.1)** `apache-airflow-providers-cncf-kubernetes`パッケージが、Cloud Composer 2イメージとCloud Composer 3ビルドでバージョン8.4.2にアップグレードされました。変更点の詳細については、バージョン8.4.1からバージョン8.4.2までのapache-airflow-providers-cncf-kubernetesの変更履歴をご覧ください。

    **説明**
    Airflow 2.9.3および2.9.1を利用している場合、`apache-airflow-providers-cncf-kubernetes`パッケージがバージョンアップされます。変更点については、提供されたリンクを参照してください。

    **製品への影響**
    Airflow 2.9.3および2.9.1を利用しており、`apache-airflow-providers-cncf-kubernetes`パッケージを利用している場合は、バージョンアップによる影響がある可能性があります。

    **対処方法**
    提供されたリンク先にある変更履歴を確認し、必要な対応を行ってください。

### Changed

- Cloud Composer 3で新しいAirflowビルドが利用可能になりました。

    **説明**
    Cloud Composer 3で新しいAirflowビルドが利用可能になりました。

    **製品への影響**
    Cloud Composer 3を利用している場合、新しいAirflowビルドを利用できます。

    **対処方法**
    必要であれば、新しいAirflowビルドを利用するようにしてください。

### Changed

- Cloud Composer 2.9.5イメージが利用可能になりました。

    **説明**
    Cloud Composer 2.9.5イメージが利用可能になりました。

    **製品への影響**
    Cloud Composerを利用している場合、Cloud Composer 2.9.5イメージを利用できます。

    **対処方法**
    必要であれば、Cloud Composer 2.9.5イメージを利用するようにしてください。


### Deprecated

- Cloud Composerバージョン2.4.4はサポート終了期間に達しました。

    **説明**
    Cloud Composer バージョン 2.4.4 のサポートが終了しました。

    **製品への影響**
    Cloud Composer バージョン 2.4.4 を利用している場合は、セキュリティリスクやサポートの欠如などの影響があります。

    **対処方法**
    サポートされているバージョンにアップグレードしてください。


## CVE についての情報

質問にCVEのURLが含まれていないため、回答できません。
URLを提示していただければ、影響度が高いCVEの詳細を簡潔に説明します。 

Title: September 30, 2024
Link: https://cloud.google.com/release-notes#September_30_2024
## BigQuery

### Node.js
#### @google-cloud/bigquery
- [v7.9.1](https://github.com/googleapis/nodejs-bigquery/compare/v7.9.0...v7.9.1)
    - jobs.query を使用したときにタイムアウトエラーをスローするようになりました。
    - **影響**: jobs.query を使用している場合は、タイムアウトエラーを処理する必要があります。
    - **対処方法**: タイムアウトエラーをキャッチし、必要に応じて処理するようにコードを更新してください。

### Python
#### google-cloud-bigquery
- [v3.26.0](https://github.com/googleapis/python-bigquery/compare/v3.25.0...v3.26.0)
    - いくつかのバグ修正や機能追加が含まれています。
    - **影響**:  python-bigquery を使用している場合は、最新バージョンへのアップグレードを検討してください。
    - **対処方法**: `pip install --upgrade google-cloud-bigquery` を実行して最新バージョンにアップグレードします。


## Cloud Logging

### Changed
- ログエクスプローラページのレイアウトが変更されました。
    - **影響**: ログエクスプローラページのレイアウトが変わりました。
    - **対処方法**:  [ログエクスプローラーの使用によるログの表示](https://cloud.google.com/logging/docs/view/logs-explorer-interface) を参照してください。 

### Changed
- 販売されるネットワークログの料金が変更されました。
    - **影響**: ネットワークログの料金が変更されました。
    - **対処方法**:  [Cloud Logging 料金の概要](https://cloud.google.com/stackdriver/pricing#logging-pricing-summary)、[Cloud Logging 料金](https://cloud.google.com/stackdriver/pricing#logging-costs)、[ネットワークテレメトリログの料金](https://cloud.google.com/vpc/network-pricing#network-telemetry) を参照してください。 


## Pub/Sub

### Java
#### google-cloud-pubsub
- [v1.132.3](https://github.com/googleapis/java-pubsub/compare/v1.132.2...v1.132.3)
    - 依存関係の更新が含まれています。
    - **影響**:  java-pubsub を使用している場合は、最新バージョンへのアップグレードを検討してください。
    - **対処方法**:  依存関係管理ツールを使用して、最新バージョンにアップグレードします。

### Python
#### google-cloud-pubsub
- [v2.25.0](https://github.com/googleapis/python-pubsub/compare/v2.24.0...v2.25.0)
    - OpenTelemetry パブリッシュサンプルが追加されました。
    - **影響**:  OpenTelemetry を使用している場合は、このサンプルを参考にすることができます。
    - **対処方法**:  必要に応じて、サンプルコードを参考にしてください。
- [v2.24.0](https://github.com/googleapis/python-pubsub/compare/v2.23.1...v2.24.0)
    - サブスクライブ側とパブリッシュ側の両方で OpenTelemetry のサポートが追加されました。
    - **影響**:  OpenTelemetry を使用している場合は、この機能を利用することができます。
    - **対処方法**:   必要に応じて、OpenTelemetry の設定を行ってください。
- [v2.25.1](https://github.com/googleapis/python-pubsub/compare/v2.25.0...v2.25.1)
    - samples ディレクトリの requirements.txt が更新されました。
    - **影響**:  サンプルコードを使用している場合は、依存関係を更新する必要があります。
    - **対処方法**:  `pip install --upgrade -r samples/requirements.txt` を実行して依存関係を更新します。


## Spanner

### Go
#### spanner/admin/database/apiv1
- [v1.68.0](https://github.com/googleapis/google-cloud-go/compare/spanner/v1.67.0...spanner/v1.68.0)
    - Go 1.23 イテレータのサポートが追加されました。
    - その他のバグ修正と機能追加が含まれています。
    - **影響**:  Go で spanner を使用している場合は、最新バージョンへのアップグレードを検討してください。
    - **対処方法**:  依存関係管理ツールを使用して、最新バージョンにアップグレードします。

### Java
#### google-cloud-spanner
- [v6.74.0](https://github.com/googleapis/java-spanner/compare/v6.73.0...v6.74.0)
    - インスタンスプロトにエディションフィールドが追加されました。
    - その他の変更が含まれています。
    - **影響**:  Java で spanner を使用している場合は、最新バージョンへのアップグレードを検討してください。
    - **対処方法**: 依存関係管理ツールを使用して、最新バージョンにアップグレードします。
- [v6.74.1](https://github.com/googleapis/java-spanner/compare/v6.74.0...v6.74.1)
    - バグ修正が含まれています。
    - **影響**:  Java で spanner を使用している場合は、最新バージョンへのアップグレードを検討してください。
    - **対処方法**: 依存関係管理ツールを使用して、最新バージョンにアップグレードします。
- [v6.75.0](https://github.com/googleapis/java-spanner/compare/v6.74.1...v6.75.0)
    - 単一使用トランザクションでのブラインド書き込みに対して多重化セッションがサポートされました。
    - **影響**:  Java で spanner を使用している場合は、最新バージョンへのアップグレードを検討してください。
    - **対処方法**: 依存関係管理ツールを使用して、最新バージョンにアップグレードします。
- [v6.76.0](https://github.com/googleapis/java-spanner/compare/v6.75.0...v6.76.0)
    - Spanner のエンドツーエンドトレースのために、トレースコンテキストを伝播するためのオプトインフラグと ClientInterceptor が追加されました。
    - バックアップスケジュール機能 API のサンプルが追加されました。
    - **影響**:  Java で spanner を使用している場合は、最新バージョンへのアップグレードを検討してください。
    - **対処方法**: 依存関係管理ツールを使用して、最新バージョンにアップグレードします。

### Python
#### google-cloud-spanner
- [v3.49.0](https://github.com/googleapis/python-spanner/compare/v3.48.0...v3.49.0)
    - Python で Spanner Graph を使用するためのサンプルコードスニペットがいくつか作成されました。
    - その他の機能追加が含まれています。
    - **影響**:  Python で spanner を使用している場合は、最新バージョンへのアップグレードを検討してください。
    - **対処方法**:  `pip install --upgrade google-cloud-spanner` を実行して最新バージョンにアップグレードします。
- [v3.49.1](https://github.com/googleapis/python-spanner/compare/v3.49.0...v3.49.1)
    - バグ修正が含まれています。
    - **影響**:  Python で spanner を使用している場合は、最新バージョンへのアップグレードを検討してください。
    - **対処方法**:  `pip install --upgrade google-cloud-spanner` を実行して最新バージョンにアップグレードします。


## CVEについて

残念ながら、提供されたリリースノートにはCVEの記載がありません。そのため、影響度が高いCVEの詳細を説明することはできません。 

ご自身でCVEの情報を収集する場合は、以下のサイトなどを参照してください。

* [https://cve.mitre.org/](https://cve.mitre.org/)
* [https://nvd.nist.gov/](https://nvd.nist.gov/)
