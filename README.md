
Title: October 07, 2024
Link: https://cloud.google.com/release-notes#October_07_2024
## BigQuery - Libraries

### Go

#### 変更点の概要

BigQueryのGo用クライアントライブラリ(bigquery/storage/apiv1beta1)のバージョン1.63.1がリリースされました。主な変更点は以下の通りです。

- BigQuery Metastore Partition Service API v1alphaのメソッドタイムアウトが240秒に増加しました。
- ステートレスクエリで結果セットが空の場合にスキーマが欠落する問題が修正されました。
- read sessionの作成時に、クライアントまたはジョブのprojectIDが使用されるようになりました。

#### 製品への影響

- Google Cloud Composer, Google Kubernetes Engine 1.29, 1.30を利用している場合、**影響はありません**。これらの製品はBigQuery Goクライアントライブラリに依存していません。

#### 対処方法

- **対処は不要です。**

### Java

#### 変更点の概要
 
BigQueryのJava用クライアントライブラリ(google-cloud-bigquery)のバージョン2.43.0と2.42.4がリリースされました。主な変更点は以下の通りです。

- バージョン2.43.0
    - ExternalTableDefinitionにmax stalenessが追加されました。
- バージョン2.42.4
    - いくつかの依存関係のバージョンが更新されました。

#### 製品への影響

- Google Cloud Composer, Google Kubernetes Engine 1.29, 1.30を利用している場合、**影響はありません**。これらの製品はBigQuery Javaクライアントライブラリに依存していません。

#### 対処方法

- **対処は不要です。** 

Title: October 04, 2024
Link: https://cloud.google.com/release-notes#October_04_2024
## Google Kubernetes Engine - Security

### CVE-2024-45016 について

**原文:** CVE-2024-45016 was discovered in the Linux kernel, which can lead to a privilege escalation on Container-Optimized OS and Ubuntu nodes. 

**説明:**

Linuxカーネルに発見されたCVE-2024-45016の脆弱性により、Container-Optimized OSとUbuntuノードで権限昇格が発生する可能性があります。

**製品への影響:**

Google Kubernetes Engineを利用している場合、以下の条件を満たすと影響を受ける可能性があります。

* ノードイメージとしてContainer-Optimized OSまたはUbuntuを使用している
* 影響を受けるカーネルバージョンを使用している

**対処方法:**

* GCP-2024-057 security bulletinに記載されている、影響を受けるバージョンを確認してください。
* 影響を受けるバージョンを利用している場合は、セキュリティアップデートを適用してください。
    * 詳細な手順は[GCP-2024-057 security bulletin](https://cloud.google.com/kubernetes-engine/security-bulletins#gcp-2024-057)を参照してください。 

**補足:**

CVE-2024-45016 の詳細は、GCP-2024-057 security bulletin のリンク先を参照してください。リンク先には、脆弱性の深刻度や影響範囲、緩和策などの詳細情報が記載されています。 

Title: October 03, 2024
Link: https://cloud.google.com/release-notes#October_03_2024
## Google Kubernetes Engine リリースノート 분석 (2023년 10月 31일)

이번 GKE 릴리스 노트는 여러 Kubernetes 버전에 대한 업데이트를 포함하고 있으며, 각 채널별 변경 사항과 사용 중인 제품(GKE 1.29, 1.30)에 미치는 영향 및 대응 방안을 아래와 같이 분석했습니다.

**참고:** 롤아웃은 릴리스 노트 게시 시점에 이미 진행 중이며 모든 Google Cloud 영역에 완료되기까지 며칠이 걸릴 수 있습니다.

### Rapid Channel

#### 변경 사항

- **새로운 기본 버전:** 클러스터 생성 시 기본 버전이 1.31.1-gke.1000000으로 변경되었습니다.
- **지원 중단 버전:** 1.27.16-gke.1342000, 1.28.13-gke.1119000, 1.28.14-gke.1004000, 1.29.8-gke.1211000, 1.30.4-gke.1348000, 1.31.0-gke.1577000 버전은 더 이상 사용할 수 없습니다.
- **자동 업그레이드:** 
    - 1.26 버전에서 1.27.16-gke.1373000으로, 1.27 버전에서 1.28.14-gke.1099000으로, 1.28 버전에서 1.29.8-gke.1278000으로, 1.29 버전에서 1.30.5-gke.1014000으로, 1.30 버전에서 1.31.1-gke.1000000으로 자동 업그레이드가 수행됩니다.
- **패치 전용 버전 자동 업그레이드:**
    - 마이너 버전 업그레이드를 방해하는 유지 관리 제외 등의 요소가 있는 클러스터의 경우, 1.27 버전에서 1.27.16-gke.1373000으로, 1.28 버전에서 1.28.14-gke.1099000으로, 1.29 버전에서 1.29.8-gke.1278000으로, 1.30 버전에서 1.30.5-gke.1014000으로, 1.31 버전에서 1.31.1-gke.1000000으로 패치 전용 버전 자동 업그레이드가 제공됩니다. 

#### 제품 영향

- GKE 1.29, 1.30을 사용하는 경우, 자동 업그레이드를 통해 각각 1.30.5-gke.1014000, 1.31.1-gke.1000000 버전으로 업그레이드될 예정입니다.

#### 대응 방안

- 자동 업그레이드를 사용하는 경우, 특별한 조치 없이 자동으로 업그레이드가 진행됩니다.
- 업그레이드 전에 새로운 버전과의 호환성을 확인하고, 필요한 경우 애플리케이션을 업데이트해야 합니다.
- [유지 관리 제외](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)를 설정하여 업그레이드 시점을 조정할 수 있습니다.

### Regular Channel

#### 변경 사항

- **새로운 기본 버전:** 클러스터 생성 시 기본 버전이 1.30.4-gke.1348000으로 변경되었습니다.
- **새로운 지원 버전:** 1.27.16-gke.1373000, 1.28.14-gke.1004000, 1.29.8-gke.1278000, 1.30.4-gke.1348001, 1.30.5-gke.1014001 버전이 추가되었습니다.
- **지원 중단 버전:** 1.27.16-gke.1287000, 1.28.13-gke.1049000, 1.29.8-gke.1096000, 1.30.3-gke.1969001 버전은 더 이상 사용할 수 없습니다.
- **자동 업그레이드:**
    - 1.26 버전에서 1.27.16-gke.1342000으로, 1.27 버전에서 1.28.13-gke.1119000으로, 1.28 버전에서 1.29.8-gke.1211000으로, 1.29 버전에서 1.30.4-gke.1348000으로 자동 업그레이드가 수행됩니다.
- **패치 전용 버전 자동 업그레이드:** 
    - 마이너 버전 업그레이드를 방해하는 유지 관리 제외 등의 요소가 있는 클러스터의 경우, 1.27 버전에서 1.27.16-gke.1342000으로, 1.28 버전에서 1.28.13-gke.1119000으로, 1.29 버전에서 1.29.8-gke.1211000으로, 1.30 버전에서 1.30.4-gke.1348000으로 패치 전용 버전 자동 업그레이드가 제공됩니다. 

#### 제품 영향

- GKE 1.29를 사용하는 경우, 자동 업그레이드를 통해 1.30.4-gke.1348000 버전으로 업그레이드될 예정입니다.
- GKE 1.30을 사용하는 경우, 이번 릴리스의 영향을 받지 않습니다.

#### 대응 방안

- 자동 업그레이드를 사용하는 경우, 특별한 조치 없이 자동으로 업그레이드가 진행됩니다.
- 업그레이드 전에 새로운 버전과의 호환성을 확인하고, 필요한 경우 애플리케이션을 업데이트해야 합니다.
- 유지 관리 제외를 설정하여 업그레이드 시점을 조정할 수 있습니다.

### Stable Channel

#### 변경 사항

- **새로운 지원 버전:** 1.27.16-gke.1287000, 1.28.13-gke.1049000, 1.29.8-gke.1096000, 1.30.3-gke.1969002 버전이 추가되었습니다.
- **지원 중단 버전:** 1.28.13-gke.1006000, 1.29.8-gke.1031000 버전은 더 이상 사용할 수 없습니다.
- **자동 업그레이드:** 
    - 1.27 버전에서 1.28.13-gke.1024000으로, 1.28 버전에서 1.29.8-gke.1057000으로 자동 업그레이드가 수행됩니다.
- **패치 전용 버전 자동 업그레이드:** 
    - 마이너 버전 업그레이드를 방해하는 유지 관리 제외 등의 요소가 있는 클러스터의 경우, 1.28 버전에서 1.28.13-gke.1024000으로, 1.29 버전에서 1.29.8-gke.1057000으로 패치 전용 버전 자동 업그레이드가 제공됩니다. 

#### 제품 영향

- GKE 1.29를 사용하는 경우, 자동 업그레이드를 통해 1.29.8-gke.1057000 버전으로 업그레이드될 예정입니다.
- GKE 1.30을 사용하는 경우, 이번 릴리스의 영향을 받지 않습니다. 

#### 대응 방안

- 자동 업그레이드를 사용하는 경우, 특별한 조치 없이 자동으로 업그레이드가 진행됩니다.
- 업그레이드 전에 새로운 버전과의 호환성을 확인하고, 필요한 경우 애플리케이션을 업데이트해야 합니다.
- 유지 관리 제외를 설정하여 업그레이드 시점을 조정할 수 있습니다.

### Extended Channel

#### 변경 사항

- **새로운 기본 버전:** 클러스터 생성 시 기본 버전이 1.30.4-gke.1348000으로 변경되었습니다.
- **새로운 지원 버전:** 1.27.16-gke.1373000, 1.28.14-gke.1004000, 1.29.8-gke.1278000, 1.30.4-gke.1348001, 1.30.5-gke.1014001 버전이 추가되었습니다.
- **지원 중단 버전:** 1.27.16-gke.1287000, 1.28.13-gke.1049000, 1.29.8-gke.1096000, 1.30.3-gke.1969001 버전은 더 이상 사용할 수 없습니다.
- **자동 업그레이드:** 
    - 1.27 버전에서 1.27.16-gke.1342000으로, 1.28 버전에서 1.28.13-gke.1119000으로, 1.29 버전에서 1.29.8-gke.1211000으로, 1.30 버전에서 1.30.4-gke.1348000으로 자동 업그레이드가 수행됩니다.

#### 제품 영향

- GKE 1.29를 사용하는 경우, 자동 업그레이드를 통해 1.29.8-gke.1211000 버전으로 업그레이드될 예정입니다.
- GKE 1.30을 사용하는 경우, 이번 릴리스의 영향을 받지 않습니다. 

#### 대응 방안

- 자동 업그레이드를 사용하는 경우, 특별한 조치 없이 자동으로 업그레이드가 진행됩니다.
- 업그레이드 전에 새로운 버전과의 호환성을 확인하고, 필요한 경우 애플리케이션을 업데이트해야 합니다.
- 유지 관리 제외를 설정하여 업그레이드 시점을 조정할 수 있습니다.

### No Channel

#### 변경 사항

- **새로운 기본 버전:** 클러스터 생성 시 기본 버전이 1.30.4-gke.1348000으로 변경되었습니다.
- **새로운 지원 버전:** 1.30.3-gke.1969002, 1.30.4-gke.1348001, 1.30.5-gke.1014001 버전(컨트롤 플레인 및 노드)이 추가되었습니다.
- **지원 중단 버전:** 1.28.13-gke.1006000, 1.29.8-gke.1031000, 1.30.3-gke.1639000 버전은 더 이상 사용할 수 없습니다.
- **자동 업그레이드:** 
    - 1.26 버전에서 1.27.16-gke.1342000으로, 1.27 버전에서 1.28.13-gke.1119000으로, 1.28 버전에서 1.29.8-gke.1211000으로 자동 업그레이드가 수행됩니다.
- **패치 전용 버전 자동 업그레이드:** 
    - 마이너 버전 업그레이드를 방해하는 유지 관리 제외 등의 요소가 있는 클러스터의 경우, 1.27 버전에서 1.27.16-gke.1342000으로, 1.28 버전에서 1.28.13-gke.1119000으로, 1.29 버전에서 1.29.8-gke.1211000으로 패치 전용 버전 자동 업그레이드가 제공됩니다. 

#### 제품 영향

- GKE 1.29를 사용하는 경우, 자동 업그레이드를 통해 1.29.8-gke.1211000 버전으로 업그레이드될 예정입니다.
- GKE 1.30을 사용하는 경우, 이번 릴리스의 영향을 받지 않습니다.

#### 대응 방안

- 자동 업그레이드를 사용하는 경우, 특별한 조치 없이 자동으로 업그레이드가 진행됩니다.
- 업그레이드 전에 새로운 버전과의 호환성을 확인하고, 필요한 경우 애플리케이션을 업데이트해야 합니다.
- 유지 관리 제외를 설정하여 업그레이드 시점을 조정할 수 있습니다.

### CVE 정보

릴리스 노트에 CVE 관련 정보가 없으므로, 영향도가 높은 CVE에 대한 정보는 제공되지 않았습니다. 

Title: October 02, 2024
Link: https://cloud.google.com/release-notes#October_02_2024
## Apigee X リリースノート 2024年10月2日

### アナウンス内容

2024年10月2日に、Apigee のアップデートバージョンがリリースされました。

### 変更点

今回のリリースで、サブスクリプション型の Apigee 組織 (ハイブリッド権限なし) をアップグレードすると、従来の Apigee UI のユーザーエクスペリエンスに変更があります。具体的には、アップグレードによって利用可能になる機能を管理するため、いくつかの機能管理ページが Cloud Console の Apigee UI でのみ利用可能になります。

**従来の Apigee UI:** [https://apigee.google.com/edge](https://apigee.google.com/edge)
**Cloud Console の Apigee UI:** [https://cloud.google.com/console/apigee](https://cloud.google.com/console/apigee)

詳細については、「Cloud Console の Apigee UI ナビゲーション」を参照してください。

[Cloud Console の Apigee UI ナビゲーション](https://cloud.google.com/apigee/docs/api-platform/fundamentals/ui-overview#console-compare)

### 製品に精通していないエンジニア向けの解説

ApigeeはAPIを管理するためのサービスです。今回のアップデートで、従来の管理画面に加えて、Google Cloud ConsoleからもApigeeを管理できるようになりました。

### 製品への影響

* サブスクリプション型の Apigee 組織 (ハイブリッド権限なし) を利用している場合、一部の機能管理ページが Cloud Console の Apigee UI でのみ利用可能になります。

### 対処方法

* 従来の Apigee UI から Cloud Console の Apigee UI に移行する必要があります。
* Cloud Console の Apigee UI の使い方については、上記のリンク先を参照してください。 

Title: October 01, 2024
Link: https://cloud.google.com/release-notes#October_01_2024
## Cloud Composer リリースノート 분석 (2024년 10월 1일)

**対象**: Google Cloud Composer を利用しているエンジニア

**リリースノートの概要**: 今回のリリースでは、Cloud Composer の新バージョンが公開され、いくつかの変更、修正、非推奨事項が含まれています。

---

### アナウンスメント: 新しい Cloud Composer リリース

**原文**: A new Cloud Composer release has started on **October 01, 2024**. Get ready for upcoming changes and features as we roll out the new release to all regions. This release is in progress at the moment. Listed changes and features might not be available in some regions yet.

**説明**: 2024年10月1日から新しい Cloud Composer のリリースが開始されました。新機能や変更点が含まれているため、順次展開されるのを待ちましょう。

**影響**:  現時点では、記載されている変更や機能の一部は、一部のリージョンでは利用できない可能性があります。

**対応**:  新機能や変更点を利用したい場合は、利用可能になるまで待つ必要があります。 公式ドキュメントなどで、利用可能になった地域の情報を随時確認してください。

---

### 修正: Cloud Console からの DAG 実行の失敗を修正

**原文**: *(Available without upgrading)* Fixed the cause of DAG run failures for runs created from the Cloud Console when the `[scheduler]allowed_run_id_pattern` Airflow configuration option is set to a custom value.

**説明**:  `[scheduler]allowed_run_id_pattern` Airflow 設定オプションにカスタム値を設定している場合に、Cloud Console から DAG を実行しようとすると失敗する問題が修正されました。

**影響**: 上記問題を経験していた場合は、この修正により解決されます。

**対応**:  この修正はアップグレードなしで適用されます。

---

### 変更:  `apache-airflow-providers-google` パッケージのアップグレード

**原文**:  *(Airflow 2.9.3 and 2.9.1)* The `apache-airflow-providers-google` package was upgraded to version 10.23.0 in Cloud Composer 2 images and Cloud Composer 3 builds. For more information about changes, see the apache-airflow-providers-google changelog from version 10.22.0 to version 10.23.0.

**説明**: Cloud Composer 2 イメージと Cloud Composer 3 ビルドで、`apache-airflow-providers-google` パッケージがバージョン 10.23.0 にアップグレードされました。

**影響**: Airflow 2.9.3 と 2.9.1 を使用している場合、このアップグレードによる変更点の影響を受ける可能性があります。

**対応**:  変更点を確認し、必要があれば対応してください。 アップグレード内容の詳細については、提供された changelog を参照してください。

[apache-airflow-providers-google changelog](https://airflow.apache.org/docs/apache-airflow-providers-google/10.23.0/commits.html)

---

### 変更:  `apache-airflow-providers-cncf-kubernetes` パッケージのアップグレード

**原文**:  *(Airflow 2.9.3 and 2.9.1)* The `apache-airflow-providers-cncf-kubernetes` package was upgraded to version 8.4.2 in Cloud Composer 2 images and Cloud Composer 3 builds. For more information about changes, see the apache-airflow-providers-cncf-kubernetes changelog from version 8.4.1 to version 8.4.2.

**説明**: Cloud Composer 2 イメージと Cloud Composer 3 ビルドで、 `apache-airflow-providers-cncf-kubernetes` パッケージがバージョン 8.4.2 にアップグレードされました。

**影響**: Airflow 2.9.3 と 2.9.1 を使用している場合、このアップグレードによる変更点の影響を受ける可能性があります。

**対応**: 変更点を確認し、必要があれば対応してください。 アップグレード内容の詳細については、提供された changelog を参照してください。

[apache-airflow-providers-cncf-kubernetes changelog](https://airflow.apache.org/docs/apache-airflow-providers-cncf-kubernetes/stable/changelog.html)

---

### 変更:  新しい Airflow ビルド

**原文**: New Airflow builds are available in Cloud Composer 3:

[Airflow builds](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-3)
- composer-3-airflow-2.9.3-build.1
- composer-3-airflow-2.9.1-build.8 (default)
- composer-3-airflow-2.7.3-build.17

**説明**: Cloud Composer 3 で利用可能な新しい Airflow ビルドがリリースされました。

**影響**: Cloud Composer 3 を利用している場合は、新しいビルドを利用できます。

**対応**: 新しいビルドの利用を検討してください。

---

### 変更: Cloud Composer 2.9.5 イメージの提供開始

**原文**: Cloud Composer 2.9.5 images are available:

[images](https://cloud.google.com/composer/docs/concepts/versioning/composer-versions#images-composer-2)
- composer-2.9.5-airflow-2.9.3
- composer-2.9.5-airflow-2.9.1 (default)
- composer-2.9.5-airflow-2.7.3

**説明**:  Cloud Composer 2.9.5 イメージが利用可能になりました。

**影響**:  Cloud Composer 2 を利用している場合は、新しいイメージを利用できます。

**対応**:  新しいイメージの利用を検討してください。

---

### 非推奨: Cloud Composer バージョン 2.4.4 のサポート終了

**原文**: Cloud Composer version 2.4.4 has reached its end of support period.

[end of support period](https://cloud.google.com/composer/docs/concepts/versioning/composer-versioning-overview#version-deprecation-and-support)

**説明**:  Cloud Composer バージョン 2.4.4 のサポートが終了しました。

**影響**:  Cloud Composer バージョン 2.4.4 を使用している場合は、セキュリティリスクやサポートの欠如に直面する可能性があります。

**対応**:  できるだけ早くサポートされているバージョンにアップグレードしてください。

---

##  追加情報

今回のリリースノートに記載されている CVE 情報はありませんでした。
