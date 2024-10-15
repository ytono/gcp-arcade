
Title: October 14, 2024
Link: https://cloud.google.com/release-notes#October_14_2024
## BigQuery - Java ライブラリ アップデート

**原文 (英語):**
This release note describes updates to the Java client library for Google BigQuery. It includes changes related to dependency updates and GitHub action updates.  Here's a breakdown:

* **Dependency Updates:** The library updated its dependencies, including `com.google.apis:google-api-services-bigquery` to `v2-rev20240919-2.0.0` and `com.google.cloud:sdk-platform-java-config` to `v3.37.0`. These updates likely include bug fixes, performance improvements, and potentially new features from the underlying libraries.
* **GitHub Action Updates:**  Several GitHub actions used in the library's repository were updated. These include updates to `actions/checkout`, `actions/upload-artifact`, and `github/codeql-action`. These updates aim to leverage the latest features and improvements in these actions, likely improving the CI/CD process and code quality checks.

**説明 (日本語):**

BigQueryのJavaクライアントライブラリのアップデートです。内容は依存関係の更新とGitHubアクションの更新です。

* 依存関係の更新: `com.google.apis:google-api-services-bigquery` が `v2-rev20240919-2.0.0`、 `com.google.cloud:sdk-platform-java-config` が `v3.37.0` にアップデートされました。これらのアップデートには、バグ修正、パフォーマンスの向上、新しい機能などが含まれている可能性があります。
* GitHub アクションの更新:  `actions/checkout`、`actions/upload-artifact`、`github/codeql-action` などのGitHubアクションがアップデートされました。これらのアップデートにより、最新の機能や改善が取り込まれ、CI/CDプロセスやコード品質チェックが改善される可能性があります。

**製品への影響有無:** 

* Google Cloud Composer 2, Google Kubernetes Engine 1.29, 1.30への影響の可能性: **あり** 
    * これらのサービスでBigQueryのJavaクライアントライブラリ `google-cloud-bigquery` を使用している場合、今回のアップデートの影響を受ける可能性があります。

**対処方法:**

* BigQueryのJavaクライアントライブラリを最新バージョン(2.43.1)にアップデートしてください。
* アップデートによる問題が発生しないか、テストを実施することを推奨します。

## Cloud Logging - Java ライブラリ アップデート

**原文 (英語):**

This release note highlights an update to the Java client library for Google Cloud Logging (`google-cloud-logging`). The key change is an update to the Java code generator (`gapic-generator-java`) to version 2.47.0. This update likely includes:

* **Improved gRPC API generation:** The code generator is responsible for creating Java classes and methods that interact with Google Cloud APIs, typically using gRPC. This update might bring better support for new gRPC features, optimizations, or bug fixes related to API communication.
* **Enhanced code generation:** The update could result in more efficient, readable, or maintainable generated code for interacting with the Cloud Logging API.

Additionally,  the library updated its dependency on `com.google.cloud:sdk-platform-java-config` to `v3.37.0`, similar to the BigQuery library. This update likely includes bug fixes, performance improvements, and potentially new features.

**説明 (日本語):**

Google Cloud Logging のJavaクライアントライブラリ (`google-cloud-logging`) のアップデートです。主な変更点は、Javaコードジェネレータ (`gapic-generator-java`) のバージョン2.47.0へのアップデートです。このアップデートには、以下が含まれている可能性があります。

* **gRPC API生成の改善:** コードジェネレータは、通常はgRPCを使用してGoogle Cloud APIと対話するJavaクラスとメソッドの作成を担当します。このアップデートにより、新しいgRPC機能のサポートの強化、最適化、またはAPI通信関連のバグ修正が提供される可能性があります。
* **コード生成の強化:** このアップデートにより、Cloud Logging APIと対話するための、より効率的で可読性が高く、保守しやすい生成コードが得られる可能性があります。

さらに、BigQueryライブラリと同様に、`com.google.cloud:sdk-platform-java-config` への依存関係も `v3.37.0` にアップデートされました。このアップデートには、バグ修正、パフォーマンスの向上、新しい機能などが含まれている可能性があります。

**製品への影響有無:**

* Google Cloud Composer 2, Google Kubernetes Engine 1.29, 1.30への影響の可能性: **あり** 
    * これらのサービスでCloud LoggingのJavaクライアントライブラリ `google-cloud-logging` を使用している場合、今回のアップデートの影響を受ける可能性があります。

**対処方法:**

* Cloud LoggingのJavaクライアントライブラリを最新バージョン(3.20.4)にアップデートしてください。
* アップデートによる問題が発生しないか、テストを実施することを推奨します。 

Title: October 11, 2024
Link: https://cloud.google.com/release-notes#October_11_2024
## Google Kubernetes Engine Release Note Analysis

This release note details the updated Kubernetes versions available for Google Kubernetes Engine (GKE) across different release channels. Let's break down each channel:

### Rapid Channel

**Original:**

```
## Changed

 GKE cluster versions have been updated.

 **New versions available for upgrades and new clusters**

 The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)
## Rapid channel

 > **Note:** Your clusters might not have these versions available. Rollouts are
already in progress when we publish the release notes, and can take multiple
days to complete across all Google Cloud zones.

- Version 1.31.1-gke.1146000 is now the default version for cluster creation in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.28.14-gke.1175000
- 1.28.14-gke.1217000
- 1.29.9-gke.1341000
- 1.30.5-gke.1355000
- 1.31.1-gke.1621000
- 1.31.1-gke.1678000

- The following versions are no longer available in the Rapid channel:

- 1.27.16-gke.1373000
- 1.27.16-gke.1478000
- 1.29.8-gke.1278000
- 1.30.5-gke.1014000
- 1.31.1-gke.1000000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.9-gke.1177000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.5-gke.1145000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.1-gke.1146000 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.9-gke.1177000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.5-gke.1145000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.1-gke.1146000 with this release.

[1.31.1-gke.1146000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1311)
- 1.28.14-gke.1175000
- 1.28.14-gke.1217000
- 1.29.9-gke.1341000
- 1.30.5-gke.1355000
- 1.31.1-gke.1621000
- 1.31.1-gke.1678000

[1.28.14-gke.1175000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12814)
[1.28.14-gke.1217000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12814)
[1.29.9-gke.1341000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1299)
[1.30.5-gke.1355000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
[1.31.1-gke.1621000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1311)
[1.31.1-gke.1678000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1311)
- 1.27.16-gke.1373000
- 1.27.16-gke.1478000
- 1.29.8-gke.1278000
- 1.30.5-gke.1014000
- 1.31.1-gke.1000000

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.29.9-gke.1177000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.5-gke.1145000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.31.1-gke.1146000 with this release.

[1.29.9-gke.1177000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1299)
[1.30.5-gke.1145000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
[1.31.1-gke.1146000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1311)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.9-gke.1177000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.5-gke.1145000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.31 to version 1.31.1-gke.1146000 with this release.

[1.29.9-gke.1177000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1299)
[1.30.5-gke.1145000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
[1.31.1-gke.1146000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.31.md#v1311)
```

**説明:**

* GKEクラスタのバージョンがアップデートされました。Rapidチャネルでは、Kubernetesバージョン1.31.1-gke.1146000がデフォルトになり、いくつかのバージョンが利用可能になりました。また、1.27, 1.29, 1.30 の各マイナーバージョンに対して自動アップグレードが提供されます。メンテナンスの除外設定があるクラスタなど、マイナーバージョンのアップグレードができないクラスタ向けには、パッチのみのバージョンアップグレードも提供されます。

**製品への影響:**

* Rapidチャネルを利用している場合、自動アップグレードが有効になっていると、クラスタのKubernetesバージョンが自動でアップグレードされます。

**対処方法:**

* 自動アップグレードを希望しない場合は、無効化してください。
* アップグレード前に、利用しているアプリケーションへの影響を確認することを推奨します。

### Regular Channel

**Original:**

```
## Regular channel

 > **Note:** Your clusters might not have these versions available. Rollouts are
already in progress when we publish the release notes, and can take multiple
days to complete across all Google Cloud zones.

- Version 1.30.5-gke.1014001 is now the default version for cluster creation in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.28.14-gke.1099000
- 1.29.9-gke.1177000

- The following versions are no longer available in the Regular channel:

- 1.27.16-gke.1342000
- 1.27.16-gke.1373000
- 1.28.13-gke.1119000
- 1.29.8-gke.1211000
- 1.30.4-gke.1348000
- 1.30.4-gke.1348001

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.27 to version 1.28.14-gke.1004000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.8-gke.1278000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.5-gke.1014001 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.28.14-gke.1004000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.8-gke.1278000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.5-gke.1014001 with this release.

[1.30.5-gke.1014001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
- 1.28.14-gke.1099000
- 1.29.9-gke.1177000

[1.28.14-gke.1099000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12814)
[1.29.9-gke.1177000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1299)
- 1.27.16-gke.1342000
- 1.27.16-gke.1373000
- 1.28.13-gke.1119000
- 1.29.8-gke.1211000
- 1.30.4-gke.1348000
- 1.30.4-gke.1348001

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.27 to version 1.28.14-gke.1004000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.8-gke.1278000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.30.5-gke.1014001 with this release.

[1.28.14-gke.1004000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12814)
[1.29.8-gke.1278000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1298)
[1.30.5-gke.1014001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.28.14-gke.1004000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.8-gke.1278000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.5-gke.1014001 with this release.

[1.28.14-gke.1004000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12814)
[1.29.8-gke.1278000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1298)
[1.30.5-gke.1014001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
```

**説明:**

* Regularチャネルでは、Kubernetesバージョン 1.30.5-gke.1014001 がデフォルトになり、いくつかのバージョンが利用可能になりました。また、1.27, 1.28, 1.29 の各マイナーバージョンに対して自動アップグレードが提供されます。メンテナンスの除外設定があるクラスタなど、マイナーバージョンのアップグレードができないクラスタ向けには、パッチのみのバージョンアップグレードも提供されます。

**製品への影響:**

* Regularチャネルを利用している場合、自動アップグレードが有効になっていると、クラスタのKubernetesバージョンが自動でアップグレードされます。

**対処方法:**

* 自動アップグレードを希望しない場合は、無効化してください。
* アップグレード前に、利用しているアプリケーションへの影響を確認することを推奨します。

### Stable Channel

**Original:**

```
## Stable channel

 > **Note:** Your clusters might not have these versions available. Rollouts are
already in progress when we publish the release notes, and can take multiple
days to complete across all Google Cloud zones.

- Version 1.30.3-gke.1969002 is now the default version for cluster creation in the Stable channel.
- The following versions are now available in the Stable channel:

- 1.28.13-gke.1119000
- 1.29.8-gke.1211000
- 1.30.4-gke.1348001

- The following versions are no longer available in the Stable channel:

- 1.27.16-gke.1148001
- 1.27.16-gke.1258000
- 1.27.16-gke.1287000
- 1.28.13-gke.1024000
- 1.29.8-gke.1057000
- 1.30.3-gke.1969001

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.27 to version 1.28.13-gke.1049000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.29.8-gke.1096000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.3-gke.1969002 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.28.13-gke.1049000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.8-gke.1096000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.3-gke.1969002 with this release.

[1.30.3-gke.1969002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
- 1.28.13-gke.1119000
- 1.29.8-gke.1211000
- 1.30.4-gke.1348001

[1.28.13-gke.1119000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12813)
[1.29.8-gke.1211000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1298)
[1.30.4-gke.1348001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1304)
- 1.27.16-gke.1148001
- 1.27.16-gke.1258000
- 1.27.16-gke.1287000
- 1.28.13-gke.1024000
- 1.29.8-gke.1057000
- 1.30.3-gke.1969001

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.27 to version 1.28.13-gke.1049000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.29.8-gke.1096000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.30.3-gke.1969002 with this release.

[1.28.13-gke.1049000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12813)
[1.29.8-gke.1096000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1298)
[1.30.3-gke.1969002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
[maintenance exclusions](https://cloud.google.com/kubernetes-engine/docs/concepts/maintenance-windows-and-exclusions#exclusions)
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.28.13-gke.1049000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.8-gke.1096000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.30 to version 1.30.3-gke.1969002 with this release.

[1.28.13-gke.1049000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12813)
[1.29.8-gke.1096000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1298)
[1.30.3-gke.1969002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
```

**説明:**

* Stableチャネルでは、Kubernetesバージョン 1.30.3-gke.1969002 がデフォルトになり、いくつかのバージョンが利用可能になりました。また、1.27, 1.28, 1.29 の各マイナーバージョンに対して自動アップグレードが提供されます。メンテナンスの除外設定があるクラスタなど、マイナーバージョンのアップグレードができないクラスタ向けには、パッチのみのバージョンアップグレードも提供されます。

**製品への影響:**

* Stableチャネルを利用している場合、自動アップグレードが有効になっていると、クラスタのKubernetesバージョンが自動でアップグレードされます。

**対処方法:**

* 自動アップグレードを希望しない場合は、無効化してください。
* アップグレード前に、利用しているアプリケーションへの影響を確認することを推奨します。

### Extended Channel

**Original:**

```
## Extended channel

 > **Note:** Your clusters might not have these versions available. Rollouts are
already in progress when we publish the release notes, and can take multiple
days to complete across all Google Cloud zones.

- Version 1.30.5-gke.1014001 is now the default version for cluster creation in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.16-gke.1576000
- 1.28.14-gke.1099000
- 1.29.9-gke.1177000

- The following versions are no longer available in the Extended channel:

- 1.28.13-gke.1119000
- 1.29.8-gke.1211000
- 1.30.4-gke.1348000
- 1.30.4-gke.1348001

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.14-gke.1004000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.8-gke.1278000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.5-gke.1014001 with this release.

[1.30.5-gke.1014001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
- 1.27.16-gke.1576000
- 1.28.14-gke.1099000
- 1.29.9-gke.1177000

[1.27.16-gke.1576000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.14-gke.1099000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12814)
[1.29.9-gke.1177000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1299)
- 1.28.13-gke.1119000
- 1.29.8-gke.1211000
- 1.30.4-gke.1348000
- 1.30.4-gke.1348001

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.14-gke.1004000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.8-gke.1278000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.5-gke.1014001 with this release.

[1.28.14-gke.1004000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12814)
[1.29.8-gke.1278000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1298)
[1.30.5-gke.1014001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
```

**説明:**

* Extendedチャネルでは、Kubernetesバージョン 1.30.5-gke.1014001 がデフォルトになり、いくつかのバージョンが利用可能になりました。また、1.28, 1.29, 1.30 の各マイナーバージョンに対して自動アップグレードが提供されます。

**製品への影響:**

* Extendedチャネルを利用している場合、自動アップグレードが有効になっていると、クラスタのKubernetesバージョンが自動でアップグレードされます。

**対処方法:**

* 自動アップグレードを希望しない場合は、無効化してください。
* アップグレード前に、利用しているアプリケーションへの影響を確認することを推奨します。

### No Channel

**Original:**

```
## No channel

 > **Note:** Your clusters might not have these versions available. Rollouts are
already in progress when we publish the release notes, and can take multiple
days to complete across all Google Cloud zones.

- Version 1.30.5-gke.1014001 is now the default version for cluster creation.
- The following versions are now available:

- 1.28.14-gke.1175000
- 1.28.14-gke.1217000
- 1.29.9-gke.1341000
- 1.30.5-gke.1355000

- The following node versions are now available:

- 1.27.16-gke.1576000
- 1.28.14-gke.1175000
- 1.28.14-gke.1217000
- 1.29.9-gke.1341000
- 1.30.5-gke.1355000

- The following versions are no longer available:

- 1.27.16-gke.1148001
- 1.27.16-gke.1258000
- 1.27.16-gke.1287000
- 1.27.16-gke.1342000
- 1.27.16-gke.1373000
- 1.27.16-gke.1478000
- 1.28.13-gke.1024000
- 1.29.8-gke.1057000
- 1.30.2-gke.1587003
- 1.30.5-gke.1014000

- Auto-upgrade targets are now available for the following minor versions:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.27 to version 1.28.14-gke.1004000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.29.8-gke.1278000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.30.3-gke.1969002 with this release.

- The following patch-only version auto-upgrade targets are now available for clusters with maintenance exclusions or other factors preventing minor version upgrades:

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.28.14-gke.1004000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.8-gke.1278000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.3-gke.1969002 with this release.

[1.30.5-gke.1014001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1305)
- 1.28.14-gke.1175000
- 1.28.14-gke.1217000
- 1.29.9-gke.1341000
- 1.30.5-gke.13550
Title: October 10, 2024
Link: https://cloud.google.com/release-notes#October_10_2024
## Analysis of Apigee X Announcement

**Original Text:**

On October 10, 2024, we released an updated version of Apigee.

**Explanation:**

This announcement states that an updated version of Apigee was released on October 10, 2024.  However, it lacks critical information. 

**Impact on Products:**

**Unknown**. This announcement is too vague to determine the impact on any specific Apigee product or version.

**Action to Take:**

* **Seek Specifics:**  It is crucial to find more details about this Apigee update. Look for:
    * The specific Apigee product updated (Apigee X, Apigee hybrid, etc.)
    * The version number of the update.
    * Release notes or documentation outlining changes.
* **Evaluate Impact:** Once you have more information, assess if the update:
    * Introduces breaking changes that require action.
    * Offers new features or improvements you want to leverage. 
* **Plan Accordingly:** Determine if you need to adjust your Apigee usage based on the update's contents. This might involve updating your Apigee instances or adapting your API integrations. 

Title: October 09, 2024
Link: https://cloud.google.com/release-notes#October_09_2024
## Cloud Logging

**Original Release Note:**

### Changed

 Ops Agent release 2.51.0 adds support for Compute Engine Arm VMs that are running Rocky Linux 8.

**Explanation:**

This release of the Ops Agent (version 2.51.0) introduces support for Google Cloud's Operations suite agents on Compute Engine Arm Virtual Machines (VMs) running the Rocky Linux 8 operating system. 

**Impact on your products:**

* **Google Cloud Composer 2:** No direct impact. Cloud Composer uses its own pre-configured logging and monitoring setup.
* **Google Kubernetes Engine 1.29, 1.30:** Likely no impact. While you can install Ops Agent on GKE nodes for enhanced logging and monitoring, this update specifically targets Compute Engine VMs, not GKE.  If you are using Rocky Linux 8 on your nodes and manually manage Ops Agent, this update is relevant. 

**Actions to take:**

* If you are using Rocky Linux 8 on Compute Engine Arm VMs and utilize Ops Agent for logging, consider upgrading to version 2.51.0 to take advantage of the added support.



## Cloud Monitoring

**Original Release Note:**

### Changed

 Ops Agent release 2.51.0 adds support for Compute Engine Arm VMs that are running Rocky Linux 8.

**Explanation:**

This release of the Ops Agent (version 2.51.0) introduces support for Google Cloud's Operations suite agents on Compute Engine Arm Virtual Machines (VMs) running the Rocky Linux 8 operating system. 

**Impact on your products:**

* **Google Cloud Composer 2:** No direct impact. Cloud Composer manages its monitoring configuration. 
* **Google Kubernetes Engine 1.29, 1.30:**  Likely no impact. This update primarily affects Compute Engine VMs. If you are using Rocky Linux 8 on your nodes and utilize Ops Agent for monitoring, this update is relevant.

**Actions to take:**

* If you are using Rocky Linux 8 on Compute Engine Arm VMs and leverage Ops Agent for monitoring, consider upgrading to version 2.51.0 to leverage the added support. 

Title: October 08, 2024
Link: https://cloud.google.com/release-notes#October_08_2024
## Apigee X October 8, 2024 リリースノート 분석

### Announcement

**英語原文:** 
On October 8, 2024, we released an updated version of Apigee (1-13-0-apigee-6).

This release addresses the security concerns in GCP-2024-052 from Google Anthos Service Mesh.

**日本語説明:** 
2024年10月8日、Apigeeのアップデートバージョン(1-13-0-apigee-6)がリリースされました。このリリースは、Google Anthos Service Meshのセキュリティに関する問題(GCP-2024-052)に対処しています。

**製品への影響:** Apigee Xを利用している場合、影響があります。

**対処方法:**  リリースノートに記載されているように、このリリースは今後数日かけて本番環境にロールアウトされます。すべてのGoogle Cloudゾーンで完了するまでに4営業日以上かかる場合があります。ロールアウトが完了するまでは、すべての機能と修正が利用できない可能性があります。


### Fixed

#### Bug ID 361714906

**英語原文:**
**Fixed synchronization issue with Cloud KMS keys** Implemented recovery mechanism for the Apigee dataplane in the event of an extended disruption in the CloudKMS key service.

**日本語説明:**
**Cloud KMSキーとの同期問題を修正** CloudKMSキーサービスが長期間中断した場合に備え、Apigeeデータプレーンにリカバリメカニズムを実装しました。

**製品への影響:** Cloud KMSを利用している場合、影響があります。

**対処方法:**  特に対処は不要です。

#### Bug ID 361044374

**英語原文:**
**Resolved issue with incorrect payloads shown in debug trace** When using debug trace with the AssignMessage policy, the UI now displays the correct request and response payloads. 

**日本語説明:**
**デバッグトレースで不正なペイロードが表示される問題を解決** AssignMessageポリシーでデバッグトレースを使用すると、UIに正しいリクエストとレスポンスのペイロードが表示されるようになりました。

**製品への影響:**  AssignMessageポリシーを利用している場合、影響があります。

**対処方法:**  特に対処は不要です。


#### Bug ID N/A

**英語原文:**
**Updates to security infrastructure and libraries.**

**日本語説明:**
**セキュリティインフラストラクチャとライブラリの更新**

**製品への影響:**  Apigee Xを利用している場合、影響があります。

**対処方法:**  リリースノートに記載されているセキュリティに関する更新内容を確認し、必要があれば対応してください。


## その他

今回のリリースは、Google Anthos Service Meshのセキュリティに関する問題(GCP-2024-052)に対処した重要なアップデートです。Apigee Xを利用している場合は、速やかにアップデートすることをお勧めします。
Title: October 07, 2024
Link: https://cloud.google.com/release-notes#October_07_2024
## BigQuery

### Go

#### **bigquery/storage/apiv1beta1** 1.63.1

- **原文**
    - **bigquery/storage:** Increase method timeout to 240s for BigQuery Metastore Partition Service API version v1alpha (fdb4ea9)
    - **bigquery:** Create read session with client or job projectID (#10932) (f98396e)
    - **bigquery:** Missing schema for empty result set on stateless queries (#10935) (28a069a)
- **説明**
    - BigQuery Metastore Partition Service API v1alpha のメソッドタイムアウトを240秒に延長しました。
    - クライアントまたはジョブの projectID を使用して読み取りセッションを作成するように変更しました。
    - ステートレスクエリで結果セットが空の場合にスキーマが欠落していた問題を修正しました。
- **製品への影響有無**
    - あり
    - GoでBigQuery Metastore Partition Service API v1alpha、または読み取りセッションを使用している場合に影響があります。
- **対処方法**
    - 特に必要な対応はありません。

#### **google-cloud-bigquery** 2.43.0

- **原文**
    - Add max staleness to ExternalTableDefinition (#3499) (f1ebd5b)
- **説明**
    - ExternalTableDefinition に max staleness が追加されました。
- **製品への影響有無**
    - あり
    - JavaでBigQueryの外部テーブル定義を使用している場合に影響があります。
- **対処方法**
    - 必要に応じて、max staleness を設定してください。

#### **google-cloud-bigquery** 2.42.4

- **原文**
    - Update actions/checkout action to v4.2.0 (#3495) (b57fefb)
    - Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.51.0 (#3480) (986b036)
    - Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.53.0 (#3504) (57ce901)
    - Update dependency com.google.apis:google-api-services-bigquery to v2-rev20240905-2.0.0 (#3483) (a6508a2)
    - Update dependency com.google.cloud:google-cloud-datacatalog-bom to v1.55.0 (#3481) (8908cfd)
    - Update dependency com.google.cloud:google-cloud-datacatalog-bom to v1.57.0 (#3505) (6e78f56)
    - Update dependency com.google.cloud:sdk-platform-java-config to v3.36.0 (#3490) (a72c582)
    - Update dependency com.google.cloud:sdk-platform-java-config to v3.36.1 (#3496) (8f2e5c5)
    - Update dependency ubuntu to v24 (#3498) (4f87ade)
    - Update github/codeql-action action to v2.26.10 (#3506) (ca71294)
    - Update github/codeql-action action to v2.26.7 (#3482) (e2c94b6)
    - Update github/codeql-action action to v2.26.8 (#3488) (a6d75de)
    - Update github/codeql-action action to v2.26.9 (#3494) (8154043)
- **説明**
    - 依存関係の更新と、いくつかのバグ修正が行われました。
- **製品への影響有無**
    - あり
    - 軽微なバグ修正や依存関係の更新が含まれているため、影響がある可能性があります。
- **対処方法**
    - 最新バージョンへのアップデートを検討してください。

## Cloud Logging

### Java

#### **google-cloud-logging** 3.20.3

- **原文**
    - Update dependency com.google.cloud:sdk-platform-java-config to v3.36.1 (#1698) (9491512)
    - Update dependency org.apache.maven.plugins:maven-deploy-plugin to v3.1.3 (2b6ea70)
- **説明**
    - 依存関係の更新が行われました。
- **製品への影響有無**
    - あり
    - 依存関係の更新により、予期しない影響がある可能性があります。
- **対処方法**
    - 最新バージョンへのアップデートを検討してください。

## Cloud Monitoring

- **原文**
    - The user interface for configuring which events to show on a dashboard has been simplified.
    - For more information, see Show events on a dashboard.
- **説明**
    - ダッシュボードに表示するイベントを設定するためのユーザーインターフェースが簡素化されました。
- **製品への影響有無**
    - あり
    - Cloud Monitoringのダッシュボードでイベントを設定する際に、UIの変更があります。
- **対処方法**
    - 特に必要な対応はありません。変更点について[Show events on a dashboard](https://cloud.google.com/monitoring/dashboards/show-events)を確認してください。 
