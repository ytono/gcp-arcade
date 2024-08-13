Title: August 12, 2024
Link: https://cloud.google.com/release-notes#August_12_2024
### Apigee X August 12, 2024 リリースノート

**元の文章**

On August 12, 2024, we released a new version of Apigee.

**説明**

2024年8月12日にApigeeの新しいバージョンがリリースされました。

**製品への影響有無**

影響がある可能性があります。ApigeeXを利用しているため、このリリースに含まれる変更内容によっては、現在の設定や機能に影響が出る可能性があります。

**対処方法**

* リリースノートの詳細を確認し、変更内容が現在のApigeeX環境に影響を与えるかどうかを判断してください。
* 影響がある場合は、リリースノートに記載されている互換性に関する情報やアップグレード手順を参照し、適切な対応を実施してください。
* Apigeeの公式ドキュメントやサポート情報も参照して、最新情報を入手してください。 
Title: August 08, 2024
Link: https://cloud.google.com/release-notes#August_08_2024
## Compute Engine リリースノート 분석

### アナウンス 1: Apigee 環境あたりの推奨 API ベースパスの増加について

**元の文章:** 

On August 8, 2024, we announced an increase in the recommended number of API basepaths per Apigee environment or environment group. The recommended limit of API proxy basepaths per Apigee environment or environment group increased from 1,000 to 3,000. For more information, see the Environment and organization section of the Limits page.

**説明:**

2024年8月8日、Apigee 環境または環境グループあたりの推奨 API ベースパス数が増加しました。Apigee 環境または環境グループあたりの API プロキシベースパスの推奨制限は、1,000 から 3,000 に増加しました。

**製品への影響:**

* **ApigeeX:**  使用している環境で1,000以上のベースパスを使用している場合、今回の変更により、より多くのベースパスを使用できるようになります。

**対処方法:** 

* 特に対処は不要です。制限の増加は、より多くのAPIプロキシをデプロイできるようになったことを意味します。

### Fixed: 環境あたりのベースパス数の制限

**元の文章:** 

| Bug ID | Description |
| --- | --- |
| 329304975, 301845257 | Limit on number of basepaths per environment Fixed issue with the number of total basepaths per environment causing potential failures when deploying API proxy revisions. |
Fixed issue with the number of total basepaths per environment causing potential failures when deploying API proxy revisions.

**説明:**

環境あたりの合計ベースパス数の問題が修正されました。この問題は、API プロキシリビジョンのデプロイ時に潜在的なエラーを引き起こしていました。

**製品への影響:**

* **ApigeeX:**  この問題は修正されたため、ベースパス数に関する以前の制限は緩和され、デプロイメントエラーが発生する可能性は低くなりました。

**対処方法:**

* 特に対処は不要です。

### アナウンス 2: GKE クラスタの kubelet read-only ポートについて

**元の文章:** 

The kubelet read-only port in GKE clusters (TCP port 10255) is not used by Cloud Composer. You can define appropriate firewall rules to block external traffic over TCP 10255 in your customer project as described in Modify VPC firewall rules.

**説明:**

GKE クラスタの kubelet read-only ポート (TCP ポート 10255) は、Cloud Composer では使用されません。記載されている VPC ファイアウォール規則の変更方法に従って、顧客プロジェクトで TCP 10255 経由の外部トラフィックをブロックする適切なファイアウォール規則を定義できます。

**製品への影響:**

* **Google Cloud Composer 2:** 影響はありません。Cloud Composerはkubelet read-onlyポートを使用しません。
* **Google Kubernetes Engine 1.27, 1.28:** セキュリティ強化のために、kubelet read-only ポートへのアクセスを制限することができます。

**対処方法:**

* **Google Kubernetes Engine 1.27, 1.28:** 必要に応じて、ドキュメントに従ってファイアウォールルールを設定し、TCP ポート 10255 への外部トラフィックをブロックしてください。


##  追加情報

今回はCVEに関する情報は提供されていませんでした。 CVE情報がある場合は、それぞれのCVEの深刻度に応じて対応が必要になります。 提供されたリンク先の内容を精査し、必要があれば詳細な情報を提供してください。 
Title: August 07, 2024
Link: https://cloud.google.com/release-notes#August_07_2024
## Apigee X

### アナウンス

**元の文章:** On August 7, 2024, we published new documentation explaining how to integrate Apigee with a Security Information and Event Management (SIEM) solution. See Integrate Apigee with your SIEM solution for more information.

**説明:** 2024年8月7日に、Apigeeとセキュリティ情報およびイベント管理（SIEM）ソリューションの統合方法を説明した新しいドキュメントが公開されました。

**製品への影響有無:**  影響なし。ドキュメントの更新のみです。

**対処方法:**  必要に応じて、提供されたリンクのドキュメントを参照し、ApigeeとSIEMソリューションの統合をご検討ください。


## BigQuery

### 変更

**元の文章:** An updated version of JDBC driver for BigQuery is now available.

**説明:** BigQuery 用の JDBC ドライバの更新バージョンがリリースされました。

**製品への影響有無:** 影響あり。BigQuery を JDBC 経由で利用している場合、最新バージョンへのアップデートが必要になる可能性があります。

**対処方法:**  提供されたリンク先で最新バージョンを確認し、必要に応じて BigQuery JDBC ドライバをアップデートしてください。アップデートの際は、互換性に問題がないことを事前にご確認ください。


---------------------------------------------

# Apigee X

## Announcement

 On August 12, 2024, we released a new version of Apigee.



---------------------------------------------

# Compute Engine

## Announcement

 On August 8, 2024, we announced an increase in the recommended number of API basepaths per Apigee environment or environment group.

 The recommended  limit of API proxy basepaths per Apigee environment or environment group increased from 1,000 to 3,000.
For more information, see the Environment and organization section of the Limits page.

[Environment and organization section of the Limits page](https://cloud.google.com/apigee/docs/api-platform/reference/limits#environment-and-organization)
## Fixed

| Bug ID | Description |
| --- | --- |
| **329304975**, **301845257** | **Limit on number of basepaths per environment** Fixed issue with the number of total basepaths per environment causing potential failures when deploying API proxy revisions. |
 Fixed issue with the number of total basepaths per environment causing potential failures when deploying API proxy revisions.

## Announcement

 The kubelet read-only port in GKE clusters (TCP port 10255) is not used by Cloud Composer. You can define appropriate firewall rules to block external traffic over TCP 10255 in your customer project as described in Modify VPC firewall rules.

[kubelet read-only port in GKE clusters](https://cloud.google.com/kubernetes-engine/docs/how-to/disable-kubelet-readonly-port)
[Modify VPC firewall rules](https://cloud.google.com/kubernetes-engine/docs/how-to/disable-kubelet-readonly-port#modify-firewalls)


---------------------------------------------

# Apigee X

## Announcement

 On August 7, 2024, we published new documentation explaining how to integrate Apigee with a Security Information and Event Management (SIEM) solution. See Integrate Apigee with your SIEM solution for more information.

[Integrate Apigee with your SIEM solution](https://cloud.google.com/apigee/docs/api-platform/security/siem-integration)


---------------------------------------------

# BigQuery

## Changed

 An updated version of JDBC driver for BigQuery is now available.

[JDBC driver for BigQuery](https://cloud.google.com/bigquery/docs/reference/odbc-jdbc-drivers#current_jdbc_driver)


