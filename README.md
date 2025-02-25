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
