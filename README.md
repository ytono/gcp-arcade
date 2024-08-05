---------------------------------------------

# Apigee X

## Announcement

 On August 1, 2024, we released an updated version of Apigee (1-13-0-apigee-1).

 > **Note:** Rollouts of this release to production instances will begin within two business days and may take four or more business days to be completed across all Google Cloud zones. Your instances may not have the features and fixes available until the rollout is complete.

## Security

| Bug ID | Description |
| --- | --- |
| **308583363, 332464869** | Security fix for `apigee-mart`. This addresses the following vulnerabilities:- CVE-2023-36478 - CVE-2023-36479- CVE-2023-34462- CVE-2023-40167- CVE-2023-26048- CVE-2023-26049- CVE-2023-51775- CVE-2024-28752- CVE-2024-25710- CVE-2024-26308 |
| **332465218** | Security fix for `apigee-runtime`.This addresses the following vulnerabilities:- CVE-2023-52428- CVE-2023-44483 |
| **341994213, 333971421** | Security fixes for `Cassandra emulator`.These address the following vulnerabilities:- CVE-2017-5929- CVE-2017-18640- CVE-2023-36478- CVE-2019-16869- CVE-2024-22201- CVE-2015-0886- CVE-2024-28752- CVE-2024-29025- CVE-2021-42550- CVE-2023-52428- CVE-2018-10237- CVE-2023-40167- CVE-2021-29425- CVE-2023-44487- CVE-2023-26048- CVE-2023-44483- CVE-2023-26049 |
| **329762216** | Security fix for `apigee-installer`.This addresses the following vulnerability: CVE-2024-24786 |
| **342630443, 342714341, 343202829** | Security fixes to address the following vulnerabilities:- CVE-2024-29857 - CVE-2024-30172 - CVE-2024-30171 - CVE-2024-34447 - CVE-2023-5072- CVE-2022-4568- CVE-2023-6378   - CVE-2021-42550 |
 This addresses the following vulnerabilities:- CVE-2023-36478 - CVE-2023-36479- CVE-2023-34462- CVE-2023-40167- CVE-2023-26048- CVE-2023-26049- CVE-2023-51775- CVE-2024-28752- CVE-2024-25710- CVE-2024-26308

- CVE-2023-36478 - CVE-2023-36479- CVE-2023-34462- CVE-2023-40167- CVE-2023-26048- CVE-2023-26049- CVE-2023-51775- CVE-2024-28752- CVE-2024-25710- CVE-2024-26308

[CVE-2023-36478](https://nvd.nist.gov/vuln/detail/CVE-2023-36478)
[CVE-2023-36479](https://nvd.nist.gov/vuln/detail/CVE-2023-36479)
[CVE-2023-34462](https://nvd.nist.gov/vuln/detail/CVE-2023-34462)
[CVE-2023-40167](https://nvd.nist.gov/vuln/detail/CVE-2023-40167)
[CVE-2023-26048](https://nvd.nist.gov/vuln/detail/CVE-2023-26048)
[CVE-2023-26049](https://nvd.nist.gov/vuln/detail/CVE-2023-26049)
[CVE-2023-51775](https://nvd.nist.gov/vuln/detail/CVE-2023-51775)
[CVE-2024-28752](https://nvd.nist.gov/vuln/detail/CVE-2024-28752)
[CVE-2024-25710](https://nvd.nist.gov/vuln/detail/CVE-2024-25710)
[CVE-2024-26308](https://nvd.nist.gov/vuln/detail/CVE-2024-26308)
 This addresses the following vulnerabilities:- CVE-2023-52428- CVE-2023-44483

- CVE-2023-52428- CVE-2023-44483

[CVE-2023-52428](https://nvd.nist.gov/vuln/detail/CVE-2023-52428)
[CVE-2023-44483](https://nvd.nist.gov/vuln/detail/CVE-2023-44483)
 These address the following vulnerabilities:- CVE-2017-5929- CVE-2017-18640- CVE-2023-36478- CVE-2019-16869- CVE-2024-22201- CVE-2015-0886- CVE-2024-28752- CVE-2024-29025- CVE-2021-42550- CVE-2023-52428- CVE-2018-10237- CVE-2023-40167- CVE-2021-29425- CVE-2023-44487- CVE-2023-26048- CVE-2023-44483- CVE-2023-26049

- CVE-2017-5929- CVE-2017-18640- CVE-2023-36478- CVE-2019-16869- CVE-2024-22201- CVE-2015-0886- CVE-2024-28752- CVE-2024-29025- CVE-2021-42550- CVE-2023-52428- CVE-2018-10237- CVE-2023-40167- CVE-2021-29425- CVE-2023-44487- CVE-2023-26048- CVE-2023-44483- CVE-2023-26049

[CVE-2017-5929](https://nvd.nist.gov/vuln/detail/CVE-2017-5929)
[CVE-2017-18640](https://nvd.nist.gov/vuln/detail/CVE-2017-18640)
[CVE-2023-36478](https://nvd.nist.gov/vuln/detail/CVE-2023-36478)
[CVE-2019-16869](https://nvd.nist.gov/vuln/detail/CVE-2019-16869)
[CVE-2024-22201](https://nvd.nist.gov/vuln/detail/CVE-2024-22201)
[CVE-2015-0886](https://nvd.nist.gov/vuln/detail/CVE-2015-0886)
[CVE-2024-28752](https://nvd.nist.gov/vuln/detail/CVE-2024-28752)
[CVE-2024-29025](https://nvd.nist.gov/vuln/detail/CVE-2024-29025)
[CVE-2021-42550](https://nvd.nist.gov/vuln/detail/CVE-2021-42550)
[CVE-2023-52428](https://nvd.nist.gov/vuln/detail/CVE-2023-52428)
[CVE-2018-10237](https://nvd.nist.gov/vuln/detail/CVE-2018-10237)
[CVE-2023-40167](https://nvd.nist.gov/vuln/detail/CVE-2023-41067)
[CVE-2021-29425](https://nvd.nist.gov/vuln/detail/CVE-2021-29425)
[CVE-2023-44487](https://nvd.nist.gov/vuln/detail/CVE-2023-44487)
[CVE-2023-26048](https://nvd.nist.gov/vuln/detail/CVE-2023-26048)
[CVE-2023-44483](https://nvd.nist.gov/vuln/detail/CVE-2023-44483)
[CVE-2023-26049](https://nvd.nist.gov/vuln/detail/CVE-2023-26049)
 Security fix for `apigee-installer`.This addresses the following vulnerability: CVE-2024-24786

 This addresses the following vulnerability: CVE-2024-24786

[CVE-2024-24786](https://nvd.nist.gov/vuln/detail/CVE-2024-24786)
 Security fixes to address the following vulnerabilities:- CVE-2024-29857 - CVE-2024-30172 - CVE-2024-30171 - CVE-2024-34447 - CVE-2023-5072- CVE-2022-4568- CVE-2023-6378   - CVE-2021-42550

- CVE-2024-29857 - CVE-2024-30172 - CVE-2024-30171 - CVE-2024-34447 - CVE-2023-5072- CVE-2022-4568- CVE-2023-6378   - CVE-2021-42550

[CVE-2024-29857 ](https://nvd.nist.gov/vuln/detail/CVE-2024-29857)
[CVE-2024-30172 ](https://nvd.nist.gov/vuln/detail/CVE-2024-30172)
[CVE-2024-30171](https://nvd.nist.gov/vuln/detail/CVE-2024-30171)
[CVE-2024-34447](https://nvd.nist.gov/vuln/detail/CVE-2024-34447)
[CVE-2023-5072](https://nvd.nist.gov/vuln/detail/CVE-2023-5072)
[CVE-2022-4568](https://nvd.nist.gov/vuln/detail/CVE-2022-4568)
[CVE-2023-6378](https://nvd.nist.gov/vuln/detail/CVE-2023-6378)
[CVE-2021-42550](https://nvd.nist.gov/vuln/detail/CVE-2021-42550)
## Fixed

| Bug ID | Description |
| --- | --- |
| **293150694** | **`<HTTPMonitor>` now supports the `<UseTargetServerSSLInfo>` element and can trust TLS certs from non-public CAs**. |
| **329874359** | **Decreased the default value of `<CacheLookupTimeoutInSeconds>` from 30 seconds to 12 seconds.** |
| **334442202** | **Added specific and informative error messaging for App query failures resulting from discrepancies between developers and apps.** |
| **333919279** | **Improved reliability for Developer, App and API products APIs.** |
| **339169651** | **Fixed potential `HTTP` request smuggling vulnerability when using the  `OPTIONS` method.** |
| **297539870** | **`<HTTPTargetConnection>` property `io.timeout.millis` is  honored when used with WebSockets.** |
| **N/A** | **Updated infrastructure and libraries.** |


---------------------------------------------

# Cloud Composer

## Announcement

 In July and August 2024, **new Cloud Composer 2 environments** keep switching to using GKE 1.29 and PSC as a connectivity channel to the GKE control plane. Creating new Cloud Composer 2 private IP environments will require using PSC `SERVICE_PRODUCER` endpoints, which might be blocked by the **Disable Private Service Connect for Consumers** organization policy constraint. Previously, this org policy limitation could be addressed by using VPC peerings instead of PSC, but starting from GKE 1.29, this workaround is no longer available.

## Announcement

 *(Cloud Composer 3 only)* The July 24th issue with Airflow upgrade operations for Cloud Composer 3 environments is now fixed. Airflow upgrade operations are now being re-enabled, and should reach all Cloud Composer 3 environments within the next couple of days.

[July 24th issue with Airflow upgrade operations for Cloud Composer 3 environments](https://cloud.google.com/composer/docs/release-notes#July_24_2024)


---------------------------------------------

# Compute Engine

## Announcement

 Beginning November 1, 2024, BigQuery users will start seeing charges for Cloud Storage usage as per pricing documentation, which was not metered before due to a billing bug.

[pricing documentation](https://cloud.google.com/storage/pricing)
- Retrieval fees for Nearline, Coldline, and Archive storage classes will be charged per existing pricing documentation and retrieval SKUs.
- Inter Region Network Data Transfer fees will be charged when a BigQuery job in one location reads data stored in a Cloud Storage bucket in a different location. These charges are covered by **GCP Storage Data Transfer** SKUs and **Network Data Transfer GCP Inter Region** SKUs. **Network Data Transfer GCP Multi-region** SKUs are not applicable to this change.
- Refer to the announcement for more information.

 Retrieval fees for Nearline, Coldline, and Archive storage classes will be charged per existing pricing documentation and retrieval SKUs.

[pricing documentation](https://cloud.google.com/storage/pricing#retrieval-pricing)
[retrieval SKUs](https://cloud.google.com/skus/?filter=95FF-2EF5-5EA1%20Retrieval&currency=USD)
 Inter Region Network Data Transfer fees will be charged when a BigQuery job in one location reads data stored in a Cloud Storage bucket in a different location. These charges are covered by **GCP Storage Data Transfer** SKUs and **Network Data Transfer GCP Inter Region** SKUs. **Network Data Transfer GCP Multi-region** SKUs are not applicable to this change.

[**GCP Storage Data Transfer** SKUs](https://cloud.google.com/skus/?filter=%22GCP%20Storage%20Data%20Transfer%20between%22)
[**Network Data Transfer GCP Inter Region** SKUs](https://cloud.google.com/skus/?filter=%22Network%20Data%20Transfer%20GCP%20Inter%20Region%22%2095ff-2ef5-5ea1)
 Refer to the announcement for more information.

[announcement](https://cloud.google.com/resources/storage/billing-fix-bigquery)


---------------------------------------------

# Google Kubernetes Engine

## Changed

## (2024-R27) Version updates

 GKE cluster versions have been updated.

 **New versions available for upgrades and new clusters.**

 The following Kubernetes versions are now available for new clusters and for
opt-in control plane upgrades and node upgrades for existing clusters. For more
information on versioning and upgrades, see GKE versioning and support
and Upgrades.

[GKE versioning and support](https://cloud.google.com/kubernetes-engine/versioning)
[Upgrades](https://cloud.google.com/kubernetes-engine/upgrades)
## Rapid channel

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.30.2-gke.1587003 is now the default version in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.3-gke.1225000

- The following versions are no longer available in the Rapid channel:

- 1.27.14-gke.1059002
- 1.27.15-gke.1125000
- 1.28.11-gke.1260000
- 1.28.11-gke.1289000
- 1.29.6-gke.1038001
- 1.29.6-gke.1137000
- 1.30.1-gke.1329003
- 1.30.2-gke.1394003

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.26 to version 1.27.15-gke.1252000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.27 to version 1.27.15-gke.1252000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.28.11-gke.1315000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.6-gke.1326000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.2-gke.1587003 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.3-gke.1225000

[1.27.16-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.12-gke.1052000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12812)
[1.29.7-gke.1104000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1297)
[1.30.3-gke.1225000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
- 1.27.14-gke.1059002
- 1.27.15-gke.1125000
- 1.28.11-gke.1260000
- 1.28.11-gke.1289000
- 1.29.6-gke.1038001
- 1.29.6-gke.1137000
- 1.30.1-gke.1329003
- 1.30.2-gke.1394003

[1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1315000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1326000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
## Regular channel

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.29.6-gke.1254000 is now the default version in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.27.15-gke.1252000
- 1.28.11-gke.1260000
- 1.29.6-gke.1326000
- 1.30.2-gke.1587003

- The following versions are no longer available in the Regular channel:

- 1.27.14-gke.1059002
- 1.28.11-gke.1019001
- 1.29.6-gke.1038001

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.26 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.27 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.28.11-gke.1172000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- 1.27.15-gke.1252000
- 1.28.11-gke.1260000
- 1.29.6-gke.1326000
- 1.30.2-gke.1587003

[1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1260000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1326000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- 1.27.14-gke.1059002
- 1.28.11-gke.1019001
- 1.29.6-gke.1038001

[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1172000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
## Stable channel

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.29.6-gke.1038001 is now the default version in the Stable channel.
- The following versions are no longer available in the Stable channel:

- 1.27.14-gke.1042001
- 1.28.10-gke.1075001
- 1.29.5-gke.1091002

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.26 to version 1.27.14-gke.1059002 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.27 to version 1.27.14-gke.1059002 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.27 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.6-gke.1038001 with this release.

[1.29.6-gke.1038001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- 1.27.14-gke.1042001
- 1.28.10-gke.1075001
- 1.29.5-gke.1091002

[1.27.14-gke.1059002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12714)
[1.27.14-gke.1059002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12714)
[1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1038001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
## Extended channel

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.29.6-gke.1254000 is now the default version in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.15-gke.1252000
- 1.28.11-gke.1260000
- 1.29.6-gke.1326000
- 1.30.2-gke.1587003

- The following versions are no longer available in the Extended channel:

- 1.27.14-gke.1059002
- 1.28.11-gke.1019001
- 1.29.6-gke.1038001

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.11-gke.1172000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- 1.27.15-gke.1252000
- 1.28.11-gke.1260000
- 1.29.6-gke.1326000
- 1.30.2-gke.1587003

[1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1260000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1326000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- 1.27.14-gke.1059002
- 1.28.11-gke.1019001
- 1.29.6-gke.1038001

[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1172000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
## No channel

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.29.6-gke.1254000 is now the default version.
- The following versions are now available:

- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.1-gke.1329003
- 1.30.2-gke.1587003
- 1.30.3-gke.1225000

- The following node versions are now available:

- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.1-gke.1329003
- 1.30.2-gke.1587003
- 1.30.3-gke.1225000

- The following versions are no longer available:

- 1.27.14-gke.1042001
- 1.27.15-gke.1125000
- 1.28.9-gke.1289002
- 1.28.10-gke.1075001
- 1.28.11-gke.1289000
- 1.29.6-gke.1137000

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.26 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.27 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.27 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.1-gke.1329003
- 1.30.2-gke.1587003
- 1.30.3-gke.1225000

[1.27.16-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.12-gke.1052000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12812)
[1.29.7-gke.1104000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1297)
[1.30.1-gke.1329003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1301)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
[1.30.3-gke.1225000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.1-gke.1329003
- 1.30.2-gke.1587003
- 1.30.3-gke.1225000

[1.27.16-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.12-gke.1052000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12812)
[1.29.7-gke.1104000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1297)
[1.30.1-gke.1329003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1301)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
[1.30.3-gke.1225000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
- 1.27.14-gke.1042001
- 1.27.15-gke.1125000
- 1.28.9-gke.1289002
- 1.28.10-gke.1075001
- 1.28.11-gke.1289000
- 1.29.6-gke.1137000

[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
## Fixed

 GKE Autopilot versions 1.28.6-gke.1317000 and later fixes a known issue for ephemeral storage requests.  If the combined ephemeral storage requests across all containers in your workload exceed 10 GiB, your workload will be rejected with an error message. This differs from earlier versions, which admitted the workload if it requested more than 10 GiB while only actually provisioning 10 GiB, which would result in workload eviction when the workload used more than 10 GiB.

 To ensure uninterrupted operation with GKE Autopilot versions 1.28.6-gke.1317000 and later, do the following:

- Verify that containers injected by webhooks don't cause Pods to exceed the maximum Autopilot resource limits.
- Adjust workload resource requests to account for any containers that may be injected by webhooks.
- If any Pods are rejected after updating, reduce their ephemeral storage requests to meet the limit for your workload configuration.

[maximum Autopilot resource limits](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-resource-requests#hardware-min-max)
 To learn more, see Automatic resource management in Autopilot.

[Automatic resource management in Autopilot](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-resource-requests#autopilot-resource-management)
## Changed

## (2024-R27) Version updates

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud zones.

- Version 1.30.2-gke.1587003 is now the default version in the Rapid channel.
- The following versions are now available in the Rapid channel:

- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.3-gke.1225000

- The following versions are no longer available in the Rapid channel:

- 1.27.14-gke.1059002
- 1.27.15-gke.1125000
- 1.28.11-gke.1260000
- 1.28.11-gke.1289000
- 1.29.6-gke.1038001
- 1.29.6-gke.1137000
- 1.30.1-gke.1329003
- 1.30.2-gke.1394003

- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.26 to version 1.27.15-gke.1252000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.27 to version 1.27.15-gke.1252000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.28 to version 1.28.11-gke.1315000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.29.6-gke.1326000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.29 to version 1.30.2-gke.1587003 with this release.
- Control planes and nodes with auto-upgrade enabled in the Rapid channel will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.3-gke.1225000

[1.27.16-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.12-gke.1052000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12812)
[1.29.7-gke.1104000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1297)
[1.30.3-gke.1225000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
- 1.27.14-gke.1059002
- 1.27.15-gke.1125000
- 1.28.11-gke.1260000
- 1.28.11-gke.1289000
- 1.29.6-gke.1038001
- 1.29.6-gke.1137000
- 1.30.1-gke.1329003
- 1.30.2-gke.1394003

[1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1315000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1326000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
## Changed

## (2024-R27) Version updates

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.29.6-gke.1254000 is now the default version in the Regular channel.
- The following versions are now available in the Regular channel:

- 1.27.15-gke.1252000
- 1.28.11-gke.1260000
- 1.29.6-gke.1326000
- 1.30.2-gke.1587003

- The following versions are no longer available in the Regular channel:

- 1.27.14-gke.1059002
- 1.28.11-gke.1019001
- 1.29.6-gke.1038001

- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.26 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.27 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.28.11-gke.1172000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.28 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.29 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Regular channel will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- 1.27.15-gke.1252000
- 1.28.11-gke.1260000
- 1.29.6-gke.1326000
- 1.30.2-gke.1587003

[1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1260000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1326000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- 1.27.14-gke.1059002
- 1.28.11-gke.1019001
- 1.29.6-gke.1038001

[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1172000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
## Changed

## (2024-R27) Version updates

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.29.6-gke.1038001 is now the default version in the Stable channel.
- The following versions are no longer available in the Stable channel:

- 1.27.14-gke.1042001
- 1.28.10-gke.1075001
- 1.29.5-gke.1091002

- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.26 to version 1.27.14-gke.1059002 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.27 to version 1.27.14-gke.1059002 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.27 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.28 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled in the Stable channel will be upgraded from version 1.29 to version 1.29.6-gke.1038001 with this release.

[1.29.6-gke.1038001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- 1.27.14-gke.1042001
- 1.28.10-gke.1075001
- 1.29.5-gke.1091002

[1.27.14-gke.1059002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12714)
[1.27.14-gke.1059002](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12714)
[1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1038001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
## Changed

## (2024-R27) Version updates

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.29.6-gke.1254000 is now the default version in the Extended channel.
- The following versions are now available in the Extended channel:

- 1.27.15-gke.1252000
- 1.28.11-gke.1260000
- 1.29.6-gke.1326000
- 1.30.2-gke.1587003

- The following versions are no longer available in the Extended channel:

- 1.27.14-gke.1059002
- 1.28.11-gke.1019001
- 1.29.6-gke.1038001

- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.27 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.28 to version 1.28.11-gke.1172000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.29 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled in the Extended channel will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- 1.27.15-gke.1252000
- 1.28.11-gke.1260000
- 1.29.6-gke.1326000
- 1.30.2-gke.1587003

[1.27.15-gke.1252000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1260000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1326000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
- 1.27.14-gke.1059002
- 1.28.11-gke.1019001
- 1.29.6-gke.1038001

[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1172000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
## Changed

## (2024-R27) Version updates

 > **Note:** Your clusters might not have these versions available. Rollouts are already in progress
when we publish the release notes, and can take multiple days to complete across all Google Cloud
zones.

- Version 1.29.6-gke.1254000 is now the default version.
- The following versions are now available:

- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.1-gke.1329003
- 1.30.2-gke.1587003
- 1.30.3-gke.1225000

- The following node versions are now available:

- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.1-gke.1329003
- 1.30.2-gke.1587003
- 1.30.3-gke.1225000

- The following versions are no longer available:

- 1.27.14-gke.1042001
- 1.27.15-gke.1125000
- 1.28.9-gke.1289002
- 1.28.10-gke.1075001
- 1.28.11-gke.1289000
- 1.29.6-gke.1137000

- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.26 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.27 to version 1.27.15-gke.1154000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.27 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.28 to version 1.28.11-gke.1019001 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.29 to version 1.29.6-gke.1254000 with this release.
- Control planes and nodes with auto-upgrade enabled will be upgraded from version 1.30 to version 1.30.2-gke.1587003 with this release.

[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.1-gke.1329003
- 1.30.2-gke.1587003
- 1.30.3-gke.1225000

[1.27.16-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.12-gke.1052000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12812)
[1.29.7-gke.1104000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1297)
[1.30.1-gke.1329003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1301)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
[1.30.3-gke.1225000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
- 1.27.16-gke.1051000
- 1.28.12-gke.1052000
- 1.29.7-gke.1104000
- 1.30.1-gke.1329003
- 1.30.2-gke.1587003
- 1.30.3-gke.1225000

[1.27.16-gke.1051000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12716)
[1.28.12-gke.1052000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12812)
[1.29.7-gke.1104000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1297)
[1.30.1-gke.1329003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1301)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)
[1.30.3-gke.1225000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1303)
- 1.27.14-gke.1042001
- 1.27.15-gke.1125000
- 1.28.9-gke.1289002
- 1.28.10-gke.1075001
- 1.28.11-gke.1289000
- 1.29.6-gke.1137000

[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.27.15-gke.1154000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v12715)
[1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.28.11-gke.1019001](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.28.md#v12811)
[1.29.6-gke.1254000](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.29.md#v1296)
[1.30.2-gke.1587003](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.30.md#v1302)


---------------------------------------------

# Apigee X

## Announcement

 On July 30, 2024, we released an updated version of Apigee.



---------------------------------------------

# BigQuery

## Libraries

 A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
## Go

## Changes for bigquery/storage/apiv1beta1

[bigquery/storage/apiv1beta1](https://github.com/googleapis/google-cloud-go/tree/main/bigquery/storage/apiv1beta1)
[1.62.0](https://github.com/googleapis/google-cloud-go/compare/bigquery/v1.61.0...bigquery/v1.62.0)
- **bigquery/analyticshub:** Support Direct Table Access Toggle (Egress GA) (b660d68)
- **bigquery/analyticshub:** Support public directory self service for Listings/Exchanges (#10485) (b660d68)
- **bigquery:** Add rounding mode to FieldSchema (#10328) (1a9e204)
- **bigquery:** Json support on managedwriter/adapt pkg (#10542) (978d4a1)
- **bigquery:** Support column name character map in load jobs (#10425) (b829327)

[b660d68](https://github.com/googleapis/google-cloud-go/commit/b660d6870658fe6881883785bcebaea0929fec0a)
[#10485](https://github.com/googleapis/google-cloud-go/issues/10485)
[b660d68](https://github.com/googleapis/google-cloud-go/commit/b660d6870658fe6881883785bcebaea0929fec0a)
[#10328](https://github.com/googleapis/google-cloud-go/issues/10328)
[1a9e204](https://github.com/googleapis/google-cloud-go/commit/1a9e204d7752c5bfe9edfd7bc7ee36c5b1385783)
[#10542](https://github.com/googleapis/google-cloud-go/issues/10542)
[978d4a1](https://github.com/googleapis/google-cloud-go/commit/978d4a1e47cbd8d4bf567b616381a2f12fac4cab)
[#10425](https://github.com/googleapis/google-cloud-go/issues/10425)
[b829327](https://github.com/googleapis/google-cloud-go/commit/b82932789af82b5e0799c20a096aab98132b5eb1)
- **bigquery/storage/managedwriter:** Faster context failure on send (#10169) (1fb0e64)
- **bigquery:** Bump google.golang.org/api@v0.187.0 (8fa9e39)
- **bigquery:** Bump google.golang.org/grpc@v1.64.1 (8ecc4e9)
- **bigquery:** Empty slice instead of nil slice for primitive repeated fields (#7315) (b371210)
- **bigquery:** Reduce default backoffs (#10558) (037e9ef)

[#10169](https://github.com/googleapis/google-cloud-go/issues/10169)
[1fb0e64](https://github.com/googleapis/google-cloud-go/commit/1fb0e6401d584bf8ede60a170b4d82dc211010b8)
[8fa9e39](https://github.com/googleapis/google-cloud-go/commit/8fa9e398e512fd8533fd49060371e61b5725a85b)
[8ecc4e9](https://github.com/googleapis/google-cloud-go/commit/8ecc4e9622e5bbe9b90384d5848ab816027226c5)
[#7315](https://github.com/googleapis/google-cloud-go/issues/7315)
[b371210](https://github.com/googleapis/google-cloud-go/commit/b3712100831061fea8605e574d482d7f768ecf14)
[#10558](https://github.com/googleapis/google-cloud-go/issues/10558)
[037e9ef](https://github.com/googleapis/google-cloud-go/commit/037e9efa929ad9f8d6f725b28ec8096c3e536b76)
- **bigquery/analyticshub:** A comment for message `DataExchange` is changed (b660d68)
- **bigquery/analyticshub:** A comment for message `Listing` is changed (b660d68)
- **bigquery/datatransfer:** Update OAuth links in `CreateTransferConfigRequest` and `UpdateTransferConfigRequest` (3df3c04)
- **bigquery:** Improve Inserter and StructSaver godoc (#10170) (c1cffb6)
- **bigquery:** Update description of query preview feature (#10554) (25c5cbe)

[b660d68](https://github.com/googleapis/google-cloud-go/commit/b660d6870658fe6881883785bcebaea0929fec0a)
[b660d68](https://github.com/googleapis/google-cloud-go/commit/b660d6870658fe6881883785bcebaea0929fec0a)
[3df3c04](https://github.com/googleapis/google-cloud-go/commit/3df3c04f0dffad3fa2fe272eb7b2c263801b9ada)
[#10170](https://github.com/googleapis/google-cloud-go/issues/10170)
[c1cffb6](https://github.com/googleapis/google-cloud-go/commit/c1cffb63c33ae49f3a705bd0bc7a32cd2b0319bc)
[#10554](https://github.com/googleapis/google-cloud-go/issues/10554)
[25c5cbe](https://github.com/googleapis/google-cloud-go/commit/25c5cbe6f31d62fdea1455889ac2e336d1287615)
## Java

## Changes for google-cloud-bigquery

[google-cloud-bigquery](https://github.com/googleapis/java-bigquery)
[2.42.0](https://github.com/googleapis/java-bigquery/compare/v2.41.0...v2.42.0)
- Add ability to specify RetryOptions and BigQueryRetryConfig when create job and waitFor (#3398) (1f91ae7)
- Add additional parameters to CsvOptions and ParquetOptions (#3370) (34f16fb)
- Add remaining Statement Types (#3381) (5f39b19)

[#3398](https://github.com/googleapis/java-bigquery/issues/3398)
[1f91ae7](https://github.com/googleapis/java-bigquery/commit/1f91ae7fa2100a05f969a7429cb619a2b8b42dee)
[#3370](https://github.com/googleapis/java-bigquery/issues/3370)
[34f16fb](https://github.com/googleapis/java-bigquery/commit/34f16fbaad236f5a6db26d693efde2025913d540)
[#3381](https://github.com/googleapis/java-bigquery/issues/3381)
[5f39b19](https://github.com/googleapis/java-bigquery/commit/5f39b19e8839f06d956addb8d95cf05e4b60a3f1)
- Null field mode inconsistency (#2863) (b9e96e3)

[#2863](https://github.com/googleapis/java-bigquery/issues/2863)
[b9e96e3](https://github.com/googleapis/java-bigquery/commit/b9e96e3aa738a1813ad452cf6141f792f437e8de)
- Update actions/upload-artifact action to v4.3.4 (#3382) (efa1aef)
- Update dependency com.google.api.grpc:proto-google-cloud-bigqueryconnection-v1 to v2.48.0 (#3374) (45b7f20)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20240616-2.0.0 (#3368) (ceb270c)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20240623-2.0.0 (#3384) (e1de34f)
- Update dependency com.google.apis:google-api-services-bigquery to v2-rev20240629-2.0.0 (#3392) (352562d)
- Update dependency com.google.cloud:google-cloud-datacatalog-bom to v1.52.0 (#3375) (2115c04)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.33.0 (#3405) (a4a9999)
- Update dependency org.junit.vintage:junit-vintage-engine to v5.10.3 (#3371) (2e804c5)
- Update github/codeql-action action to v2.25.11 (#3376) (f1e0014)
- Update github/codeql-action action to v2.25.12 (#3387) (af60b30)
- Update github/codeql-action action to v2.25.13 (#3395) (95c8d6f)
- Update github/codeql-action action to v2.25.15 (#3402) (a61ce7d)
- Update ossf/scorecard-action action to v2.4.0 (#3408) (66777a2)

[#3382](https://github.com/googleapis/java-bigquery/issues/3382)
[efa1aef](https://github.com/googleapis/java-bigquery/commit/efa1aef0a579baa379adbfbd2ee12f4ee5f3d987)
[#3374](https://github.com/googleapis/java-bigquery/issues/3374)
[45b7f20](https://github.com/googleapis/java-bigquery/commit/45b7f20e1b324d9b77183c0f8bb5ae14724d6aef)
[#3368](https://github.com/googleapis/java-bigquery/issues/3368)
[ceb270c](https://github.com/googleapis/java-bigquery/commit/ceb270c5cc2af4d69948ac89af1d72990fe1a7ee)
[#3384](https://github.com/googleapis/java-bigquery/issues/3384)
[e1de34f](https://github.com/googleapis/java-bigquery/commit/e1de34f0c4c67d75bcf15f35fe86c411b61d04ac)
[#3392](https://github.com/googleapis/java-bigquery/issues/3392)
[352562d](https://github.com/googleapis/java-bigquery/commit/352562da445e35a8207bcf77442130867f32e52d)
[#3375](https://github.com/googleapis/java-bigquery/issues/3375)
[2115c04](https://github.com/googleapis/java-bigquery/commit/2115c0448b242ddd887f2bac3d68c45847273c3d)
[#3405](https://github.com/googleapis/java-bigquery/issues/3405)
[a4a9999](https://github.com/googleapis/java-bigquery/commit/a4a9999def9805b8fecbc1820cc9f6f6c1997991)
[#3371](https://github.com/googleapis/java-bigquery/issues/3371)
[2e804c5](https://github.com/googleapis/java-bigquery/commit/2e804c56eeef5009cc46c7544fe9b04bfdd65d7a)
[#3376](https://github.com/googleapis/java-bigquery/issues/3376)
[f1e0014](https://github.com/googleapis/java-bigquery/commit/f1e0014dca5ca04522796b44ff313696d2b41176)
[#3387](https://github.com/googleapis/java-bigquery/issues/3387)
[af60b30](https://github.com/googleapis/java-bigquery/commit/af60b30cd774992c5d82063106471926dc6aaa6e)
[#3395](https://github.com/googleapis/java-bigquery/issues/3395)
[95c8d6f](https://github.com/googleapis/java-bigquery/commit/95c8d6f65c5c5355fc52a0a2b54002d8f9cdb1ef)
[#3402](https://github.com/googleapis/java-bigquery/issues/3402)
[a61ce7d](https://github.com/googleapis/java-bigquery/commit/a61ce7d710e2e8b000ee25ec9d295abbc2b63dd1)
[#3408](https://github.com/googleapis/java-bigquery/issues/3408)
[66777a2](https://github.com/googleapis/java-bigquery/commit/66777a2c3c7b0462330bd1c820e2f04ad4727465)
- Add short mode query sample (#3397) (6dca6ff)
- Add simple query connection read api sample (#3394) (d407baa)

[#3397](https://github.com/googleapis/java-bigquery/issues/3397)
[6dca6ff](https://github.com/googleapis/java-bigquery/commit/6dca6fffe96937db87713e45f0501d64fd5b544f)
[#3394](https://github.com/googleapis/java-bigquery/issues/3394)
[d407baa](https://github.com/googleapis/java-bigquery/commit/d407baa3e95ad894d4028aa46def7ca8efe930c3)


---------------------------------------------

# Cloud Logging

## Libraries

 A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
## Go

## Changes for logging/apiv2

[logging/apiv2](https://github.com/googleapis/google-cloud-go/tree/main/logging/apiv2)
[1.11.0](https://github.com/googleapis/google-cloud-go/compare/logging/v1.10.0...logging/v1.11.0)
- **logging:** OpenTelemetry trace/span ID integration for Go logging library (#10030) (c6711b8)

[#10030](https://github.com/googleapis/google-cloud-go/issues/10030)
[c6711b8](https://github.com/googleapis/google-cloud-go/commit/c6711b83cb6f9f35032e69a40632b7268fcdbd0a)
- **logging:** Bump google.golang.org/api@v0.187.0 (8fa9e39)
- **logging:** Bump google.golang.org/grpc@v1.64.1 (8ecc4e9)
- **logging:** Skip automatic resource detection if a CommonResource (#10441) (fc4c910)
- **logging:** Update dependencies (257c40b)

[8fa9e39](https://github.com/googleapis/google-cloud-go/commit/8fa9e398e512fd8533fd49060371e61b5725a85b)
[8ecc4e9](https://github.com/googleapis/google-cloud-go/commit/8ecc4e9622e5bbe9b90384d5848ab816027226c5)
[#10441](https://github.com/googleapis/google-cloud-go/issues/10441)
[fc4c910](https://github.com/googleapis/google-cloud-go/commit/fc4c91099443385d3052e1d6cf1020c7918c0e5a)
[257c40b](https://github.com/googleapis/google-cloud-go/commit/257c40bd6d7e59730017cf32bda8823d7a232758)
- **logging:** Documentation for automatic trace/span ID extraction (#10536) (8cf89a3)

[#10536](https://github.com/googleapis/google-cloud-go/issues/10536)
[8cf89a3](https://github.com/googleapis/google-cloud-go/commit/8cf89a340ad75cc1c39e8a9b876b47af069aa273)
## Python

## Changes for google-cloud-logging

[google-cloud-logging](https://github.com/googleapis/python-logging)
[3.11.0](https://github.com/googleapis/python-logging/compare/v3.10.0...v3.11.0)
- OpenTelemetry trace/spanID integration for Python handlers (#889) (78168a3)

[#889](https://github.com/googleapis/python-logging/issues/889)
[78168a3](https://github.com/googleapis/python-logging/commit/78168a38577b698130a861af4e4d229f42660330)
- Added environment specific labels to client library when running in Cloud Run Jobs (#877) (9c5e8f0)
- Added missing import into logger.py (#896) (9ca242d)
- Added type hints to CloudLoggingHandler constructor (#903) (6959345)

[#877](https://github.com/googleapis/python-logging/issues/877)
[9c5e8f0](https://github.com/googleapis/python-logging/commit/9c5e8f0548f88235fe6474469bc37685e2498dd1)
[#896](https://github.com/googleapis/python-logging/issues/896)
[9ca242d](https://github.com/googleapis/python-logging/commit/9ca242d10f9f3bca120b292f478d62f5fa1d3c06)
[#903](https://github.com/googleapis/python-logging/issues/903)
[6959345](https://github.com/googleapis/python-logging/commit/69593459614be968f7a0136aa76701c4fc408834)
- Add summary_overview template (#878) (b60714c)
- Changed table in web-framework-integration to bulleted list (#875) (a4aa3a7)
- Documentation update for OpenTelemetry (#915) (2a0539a)
- Update `dictConfig` snippet (#885) (6264107)

[#878](https://github.com/googleapis/python-logging/issues/878)
[b60714c](https://github.com/googleapis/python-logging/commit/b60714cb1cc3aac79c86225f8f9cbd24d8ab170f)
[#875](https://github.com/googleapis/python-logging/issues/875)
[a4aa3a7](https://github.com/googleapis/python-logging/commit/a4aa3a7cf1e3bb32ec2772084a7dc6c16e1454ff)
[#915](https://github.com/googleapis/python-logging/issues/915)
[2a0539a](https://github.com/googleapis/python-logging/commit/2a0539a30e6dcf45c0970e3aacfd4a2772877526)
[#885](https://github.com/googleapis/python-logging/issues/885)
[6264107](https://github.com/googleapis/python-logging/commit/62641075042a3da9bb9c059d963bad14a1586b1c)


---------------------------------------------

# Cloud Storage

## Libraries

 A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
## Python

## Changes for google-cloud-storage

[google-cloud-storage](https://github.com/googleapis/python-storage)
[2.18.0](https://github.com/googleapis/python-storage/compare/v2.17.0...v2.18.0)
- Add OpenTelemetry Tracing support as a preview feature (#1288) (c2ab0e0)

[#1288](https://github.com/googleapis/python-storage/issues/1288)
[c2ab0e0](https://github.com/googleapis/python-storage/commit/c2ab0e035b179a919b27c7f50318472f14656e00)
- Allow Protobuf 5.x (#1317) (152b249)
- Correct notification error message (#1290) (1cb977d), closes #1289

[#1317](https://github.com/googleapis/python-storage/issues/1317)
[152b249](https://github.com/googleapis/python-storage/commit/152b249472a09342777237d47b6c09f99c2d28e6)
[#1290](https://github.com/googleapis/python-storage/issues/1290)
[1cb977d](https://github.com/googleapis/python-storage/commit/1cb977daa2d97c255a382ce81f56a43168b0637d)
[#1289](https://github.com/googleapis/python-storage/issues/1289)


---------------------------------------------

# Secret Manager

## Libraries

 A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
## Go

## Changes for secretmanager/apiv1

[secretmanager/apiv1](https://github.com/googleapis/google-cloud-go/tree/main/secretmanager/apiv1)
[1.13.5](https://github.com/googleapis/google-cloud-go/compare/secretmanager/v1.13.4...secretmanager/v1.13.5)
- **secretmanager:** Update dependencies (257c40b)

[257c40b](https://github.com/googleapis/google-cloud-go/commit/257c40bd6d7e59730017cf32bda8823d7a232758)


