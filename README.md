Title: August 05, 2024Link: https://cloud.google.com/release-notes#August_05_2024

## Cloud Storage リリースノート 分析 (2024-07-11)

**対象バージョン:**

* Google Cloud Composer 2: 影響を受ける可能性があります
* Google Kubernetes Engine 1.27, 1.28: 影響を受ける可能性があります
* ApigeeX: 影響を受けません

**分析の詳細:**

このリリースノートはCloud Storageのクライアントライブラリに関する更新情報です。 
Google Cloud Composer 2 や Google Kubernetes Engine 1.27, 1.28 では、Cloud Storageのクライアントライブラリを内部的に使用している可能性があるため、間接的に影響を受ける可能性があります。

**各アナウンスの詳細と影響・対処方法:**

* **Libraries: A weekly digest of client library updates from across the Cloud SDK.**
    * **内容**: これはCloud SDK全体のクライアントライブラリの週間ダイジェストです。 
    * **影響**: Cloud SDKを使用している場合は、関連する変更がある可能性があります。
    * **対処方法**:  Cloud SDK の最新情報をチェックし、必要があればアップデートしてください。
* **Node.js - Changes for @google-cloud/logging**
    * **内容**: Node.js 用のロギングライブラリのアップデート情報です。OpenTelemetryの統合、スパンIDの修正などが含まれます。
    * **影響**:  Node.js でロギングライブラリを使用している場合は、影響を受ける可能性があります。
    * **対処方法**:  @google-cloud/logging の最新バージョン (v11.2.0) へのアップデートを検討してください。
* **Java - Changes for google-cloud-logging**
    * **内容**:  Java 用のロギングライブラリのアップデート情報です。OpenTelemetry 関連のドキュメント更新、依存関係のアップデートなどが含まれます。
    * **影響**:  Java でロギングライブラリを使用している場合は、影響を受ける可能性があります。
    * **対処方法**:  google-cloud-logging の最新バージョン (v3.20.0) へのアップデートを検討してください。
* **Libraries: A weekly digest of client library updates from across the Cloud SDK.**
    * **内容**:  これはCloud SDK全体のクライアントライブラリの週間ダイジェストです。
    * **影響**:  Cloud SDKを使用している場合は、関連する変更がある可能性があります。
    * **対処方法**: Cloud SDK の最新情報をチェックし、必要があればアップデートしてください。 
* **Java - Changes for google-cloud-storage**
    * **内容**:  Java 用の Cloud Storage クライアントライブラリのアップデート情報です。gRPC クライアントの OpenTelemetry メトリクスレポートの有効化、エラー処理の改善、依存関係のアップデートなどが含まれます。
    * **影響**:  Java で Cloud Storage クライアントライブラリを使用している場合は、影響を受ける可能性があります。
    * **対処方法**: google-cloud-storage の最新バージョン (v2.41.0) へのアップデートを検討してください。

**CVEに関して:**

このリリースノートにはCVEに関する情報は含まれていません。 


==========================================================
---------------------------------------------

# Cloud Storage

## Libraries

 A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
## Node.js

## Changes for @google-cloud/logging

[@google-cloud/logging](https://github.com/googleapis/nodejs-logging)
[11.2.0](https://github.com/googleapis/nodejs-logging/compare/v11.1.0...v11.2.0)
- Open telemetry integration and span Id fix for nodejs logging library (#1497) (91577e0)

[#1497](https://github.com/googleapis/nodejs-logging/issues/1497)
[91577e0](https://github.com/googleapis/nodejs-logging/commit/91577e0c46cefd1333bb3a69e62a50e0aab74615)
## Java

## Changes for google-cloud-logging

[google-cloud-logging](https://github.com/googleapis/java-logging)
[3.20.0](https://github.com/googleapis/java-logging/compare/v3.19.0...v3.20.0)
- Enable hermetic library generation (#1620) (034b9c4)

[#1620](https://github.com/googleapis/java-logging/issues/1620)
[034b9c4](https://github.com/googleapis/java-logging/commit/034b9c42ac8ba12f20dbde9e90ae8e59ea4c5748)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.33.0 (#1664) (cb6de76)

[#1664](https://github.com/googleapis/java-logging/issues/1664)
[cb6de76](https://github.com/googleapis/java-logging/commit/cb6de767ba726a1178b4ebd0b481a4fc2454b910)
- Documentation update for OpenTelemetry and tracing (#1657) (e3c6670)

[#1657](https://github.com/googleapis/java-logging/issues/1657)
[e3c6670](https://github.com/googleapis/java-logging/commit/e3c667094170ac7d404addc797facbe997ca51d3)
## Libraries

 A weekly digest of client library updates from across the Cloud SDK.

[Cloud SDK](https://cloud.google.com/sdk)
## Java

## Changes for google-cloud-storage

[google-cloud-storage](https://github.com/googleapis/java-storage)
[2.41.0](https://github.com/googleapis/java-storage/compare/v2.40.1...v2.41.0)
- Enable gRPC client open telemetry metrics reporting (#2590) (d153228)

[#2590](https://github.com/googleapis/java-storage/issues/2590)
[d153228](https://github.com/googleapis/java-storage/commit/d153228a301007b5952de9722f370dda0784473a)
- Add UnknownHostException to set of retriable exception (#2651) (18de9fc)
- Update grpc resumable upload error categorization to be more tolerant (#2644) (95697dd)
- Update Storage#readAllBytes to respect shouldReturnRawInputStream option (#2635) (dc883cc)
- Update TransferManager downloads to reduce in memory buffering (#2630) (fc2fd75)
- Use fast calculation for totalRemaining number of bytes from multiple ByteBuffers (#2633) (758b3dd)

[#2651](https://github.com/googleapis/java-storage/issues/2651)
[18de9fc](https://github.com/googleapis/java-storage/commit/18de9fcdb831132336eca4112dfe0515174bba7b)
[#2644](https://github.com/googleapis/java-storage/issues/2644)
[95697dd](https://github.com/googleapis/java-storage/commit/95697dd3d744351058c13793c6ae576820f6b638)
[#2635](https://github.com/googleapis/java-storage/issues/2635)
[dc883cc](https://github.com/googleapis/java-storage/commit/dc883cce5f547def7cfb34c4f8a2d409493e4cb9)
[#2630](https://github.com/googleapis/java-storage/issues/2630)
[fc2fd75](https://github.com/googleapis/java-storage/commit/fc2fd750ed60b840e6285a4b1f4ecce739df4c09)
[#2633](https://github.com/googleapis/java-storage/issues/2633)
[758b3dd](https://github.com/googleapis/java-storage/commit/758b3dd3cc4f6dfc2dfc12c3a77472d97c31c5d5)
- Update dependency com.google.apis:google-api-services-storage to v1-rev20240625-2.0.0 (#2616) (b22babb)
- Update dependency com.google.apis:google-api-services-storage to v1-rev20240706-2.0.0 (#2634) (1ccaa0c)
- Update dependency com.google.cloud:sdk-platform-java-config to v3.33.0 (#2647) (8196259)
- Update dependency net.jqwik:jqwik to v1.9.0 (#2608) (a20eb66)
- Update dependency org.junit.vintage:junit-vintage-engine to v5.10.3 (#2604) (8c79f39)
- Update junit-platform.version to v5.10.3 (#2605) (a532ee4)

[#2616](https://github.com/googleapis/java-storage/issues/2616)
[b22babb](https://github.com/googleapis/java-storage/commit/b22babbe26572d8c4289a65a0b125b2a60e8ef79)
[#2634](https://github.com/googleapis/java-storage/issues/2634)
[1ccaa0c](https://github.com/googleapis/java-storage/commit/1ccaa0c64887a0661438957e9427237ee005ccf1)
[#2647](https://github.com/googleapis/java-storage/issues/2647)
[8196259](https://github.com/googleapis/java-storage/commit/8196259927330ecfe3e604c24d248f7935e7fe0d)
[#2608](https://github.com/googleapis/java-storage/issues/2608)
[a20eb66](https://github.com/googleapis/java-storage/commit/a20eb660ddfa4b68d79ce04496064f3025676d5a)
[#2604](https://github.com/googleapis/java-storage/issues/2604)
[8c79f39](https://github.com/googleapis/java-storage/commit/8c79f39ad78d100065c189bcf8e18644b29ff9ed)
[#2605](https://github.com/googleapis/java-storage/issues/2605)
[a532ee4](https://github.com/googleapis/java-storage/commit/a532ee49e2ff5972ea8a2aabbab2dcf6fe0df774)



