## Keycloakバージョン毎のサポート状況
https://www.keycloak.org/docs/latest/release_notes/index.html

このドキュメントは、Keycloakバージョン16.0.0から25.0までのリリースノートに基づいており、各バージョンにおけるJavaのサポート状況、その他ミドルウェアのバージョン、変更点などをまとめたものです。

**凡例**

* ✅: サポートあり
* ⚠️: 廃止予定
* ❌: サポート終了
* N/A: 対象外

| バージョン | リリース日 | Java | WildFly | Quarkus | その他 |
|---|---|---|---|---|---|
| 25.0.0 | 2023-10-25 | ✅ OpenJDK 21<br>⚠️ OpenJDK 17 | ❌(Keycloak 20.0.0でサポート終了) | ✅ 3.2.0.Final | ・Account Console v2 theme 削除<br>・PatternFly 5へのアップグレード<br>・Argon2パスワードハッシュのデフォルト化<br>・新しいホスト名オプション(v2)<br>・永続ユーザーセッション(プレビュー)<br>・Cookieのアップデート<br>・軽量アクセストークンの軽量化<br>・トークンイントロスペクションエンドポイントでapplication/jwtメディアタイプをサポート<br>・パスワードにユーザー名を含めることを禁止するパスワードポリシー<br>・必須アクションの改善<br>・パスキーの改善<br>・SAMLのデフォルトクライアントプロファイル<br>・最初にブローカーログインした際に既存のIDPリンクを上書きするためのオーセンティケーター<br>・OpenID for Verifiable Credential Issuanceの試験的サポート<br>・ユーザー属性による検索は大文字小文字を区別するように変更<br>・認可クライアントライブラリの破壊的修正<br>・クライアントの認可設定をエクスポートする際にIDが設定されなくなった<br>・メトリクスとヘルスエンドポイント用の管理ポート<br>・リモートロギング用のSyslog<br>・EnvironmentDependentProviderFactoryクラスの変更<br>・すべてのキャッシュオプションがランタイムに<br>・高可用性ガイドの強化<br>・AccessToken、IDToken、JsonWebTokenクラスから非推奨メソッドを削除<br>・SingleUseObjectKeyModelにgetExpメソッドを追加<br>・PostgreSQL 16のサポート<br>・Customer Identity and Access Management (CIAM) とMulti-tenancyのサポート(テクノロジープレビュー) |
| 24.0.5 | 2023-07-06 | ✅ OpenJDK 17<br>✅ OpenJDK 21 | ❌(Keycloak 20.0.0でサポート終了) | ✅ | ・client_secret_postベースの認証を使用するPARクライアントのセキュリティ問題を修正 |
| 24.0.4 | 2023-06-21 | ✅ OpenJDK 17<br>✅ OpenJDK 21 | ❌(Keycloak 20.0.0でサポート終了) | ✅ | ・管理ユーザーAPIを介したユーザーの更新時に、ユーザー属性の部分的な更新がサポートされなくなった |
| 24.0.1 | 2023-06-13 | ✅ OpenJDK 17<br>✅ OpenJDK 21 | ❌(Keycloak 20.0.0でサポート終了) | ✅ | ・オペレーターを使用したKeycloakのデプロイ時に、24.0.0ではなくナイトリービルドがデプロイされる問題を修正 |
| 24.0.0 | 2023-06-07 | ✅ OpenJDK 17<br>✅ OpenJDK 21 | ❌(Keycloak 20.0.0でサポート終了) | ✅ | ・サポートされるユーザープロファイルとプログレッシブプロファイリング<br>・ユーザープロファイルSPIの破壊的変更<br>・ユーザープロファイルとレルムに基づいてページをレンダリングするためのFreeMarkerテンプレートの変更<br>・ブローカーを介した最初のログイン時にユーザープロファイルの更新ページ用の新しいFreeMarkerテンプレート<br>・Javaアダプターの廃止と削除<br>・Jettyアダプターの削除<br>・新しいウェルカムページ<br>・新しいアカウントコンソールがデフォルトに<br>・パスワードハッシュの変更<br>・OAuth / OIDC関連の改善<br>・認証関連の改善<br>・デプロイメント関連の改善<br>・アダプター関連の改善<br>・サーバー配布関連の改善<br>・管理コンソール関連の改善<br>・Keycloak JS関連の改善<br>・認可ポリシー関連の改善<br>・Keycloak CR関連の改善<br>・一時的なロックアウトログがイベントに置き換えられた<br>・Cookieの更新<br>・SAMLユーザ属性マッパーの改善<br>・コンテナで実行する場合の異なるJVMメモリ設定<br>・GELFログハンドラーが非推奨に<br>・マルチサイトアクティブパッシブデプロイメントのサポート<br>・ユーザープロファイルとレルムに基づいてページをレンダリングするためのFreeMarkerテンプレートの変更 |
| 23.0.0 | 2023-03-09 | ⚠️ OpenJDK 11<br>✅ OpenJDK 17 | ❌(Keycloak 20.0.0でサポート終了) | ✅ 3.2.0.Final | ・OpenID Connect / OAuth 2.0の改善<br>・認証関連の改善<br>・デプロイメント関連の改善<br>・アダプター関連の変更<br>・サーバー配布関連の改善<br>・管理コンソール関連の改善<br>・Javascriptアダプター関連の改善<br>・管理API関連の変更<br>・オペレーター関連の変更<br>・IDブローカー関連の改善<br>・LDAPフェデレーション関連の変更<br>・ストレージ関連の変更 |
| 22.0.3 | 2022-12-16 | ✅ OpenJDK 11<br>✅ OpenJDK 17 | ❌(Keycloak 20.0.0でサポート終了) | ✅ | ・テンプレートを使用したユーザーの登録または更新時のセキュリティの脆弱性を修正 |
| 22.0.2 | 2022-12-12 | ✅ OpenJDK 11<br>✅ OpenJDK 17 | ❌(Keycloak 20.0.0でサポート終了) | ✅ | ・LDAPとKerberosの統合における改善 |
| 22.0.0 | 2022-11-10 | ❌ OpenJDK 11<br>✅ OpenJDK 17 | ❌(Keycloak 20.0.0でサポート終了) | ✅ 3.x | ・Java 11のサポート終了<br>・Quarkus 3.xへのアップグレード<br>・Java EEからJakarta EEへの移行<br>・Hibernate ORM 6へのアップグレード<br>・Elytronクレデンシャルストアの置き換え<br>・KeyStore Config Sourceの追加<br>・ホスト名のデバッグツールの追加<br>・パススルー proxy モードの変更<br>・エクスポートとインポートで自動ビルドを実行<br>・管理コンソール関連の変更<br>・JavaScriptアダプター関連の変更<br>・管理API関連の変更<br>・オペレーター関連の変更<br>・IDブローカー関連の変更<br>・LDAPフェデレーション関連の変更<br>・ストレージ関連の変更 |
| 21.1.2 | 2022-09-20 | ✅ OpenJDK 11<br>✅ OpenJDK 17 | ❌(Keycloak 20.0.0でサポート終了) | ✅ | ・有効なリダイレクトURIの検証スキームの変更 |
| 21.1.0 | 2022-09-08 | ✅ OpenJDK 11<br>✅ OpenJDK 17 | ❌(Keycloak 20.0.0でサポート終了) | ✅ | ・モノレポ化<br>・FIPS 140-2サポートの正式サポート<br>・Experimental Account Console version 3の追加<br>・Keycloak JavaベースアダプターでのKeycloak Authorization Servicesサポートの変更<br>・Javascriptエンジンのデフォルトでの利用可能 |
| 21.0.0 | 2022-06-08 | ⚠️ OpenJDK 11<br>✅ OpenJDK 17 | ❌(Keycloak 20.0.0でサポート終了) | ✅ | ・古い管理コンソールの削除<br>・KeycloakがメトリクスにMicrometerを使用するように変更<br>・KeycloakサーバーのJava 11サポートの廃止予定<br>・Hashicop Vaultのサポート終了<br>・非推奨のユーザーセッションプロバイダーのメソッドが削除<br>・新しいストレージ: IS_CLIENT_ROLE検索可能フィールドが非推奨に<br>・FIPS 140-2プレビューサポート<br>・リバースプロキシの背後にある場合の標準のForwardedヘッダーのサポート<br>・コンテナイメージがubi9-microベースになった<br>・その他の改善 |
| 20.0.0 | 2022-03-03 | ✅ OpenJDK 8<br>✅ OpenJDK 11<br>✅ OpenJDK 17 | ❌ | ✅ | ・WildFlyディストリビューションの削除<br>・新しいKeycloak Operatorのアップグレード<br>・サポートされるOpenJDKバージョン<br>・ホスト名プロバイダーが完全なベースURLの構成をサポート<br>・WindowsでKeycloakを実行する際のkc.batの改善<br>・埋め込みH2データベースのアップグレード<br>・Keycloak JavaScriptアダプターをホストするための機能ガード<br>・OTPアプリケーションSPI<br>・カスタムIDプロバイダーがプロバイダーのアイコンを設定できるようになった<br>・FIPS 140-2の試験的サポート<br>・属性によるグループの検索<br>・アカウントコンソールでグループメンバーシップを表示<br>・データプロバイダーとモデルから非推奨のメソッドが削除 |
| 19.0.0 | 2021-11-04 | ✅ OpenJDK 8<br>✅ OpenJDK 11<br>✅ OpenJDK 17 | ⚠️ | ✅ | ・OpenID ConnectおよびSAMLアダプターのサポート終了<br>・新しい管理コンソールの卒業<br>・Keycloakストレージの変更<br>・OIDCログアウトの変更<br>・メールの更新ワークフロー<br>・レガシーKeycloak OperatorのpodDisruptionBudgetの廃止<br>・集中ロギングの初期サポート |
| 18.0.0 | 2021-06-10 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ | ✅ | ・新しいOperatorのプレビュー<br>・新しい管理コンソールのプレビュー<br>・ステップアップ認証<br>・クライアントシークレットのローテーション<br>・リカバリーコード<br>・OpenID Connectログアウトの改善<br>・WebAuthnの改善<br>・非推奨のupload-script機能の削除<br>・セッションの制限<br>・SAML ECPプロファイルがデフォルトで無効化<br>・Quarkusディストリビューションの改善<br>・リバースプロキシの背後にある場合の標準のForwardedヘッダーのサポート<br>・コンテナイメージがubi9-microベースになった<br>・その他の改善 |
| 17.0.0 | 2021-03-04 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ | ✅ | ・Quarkusディストリビューションが完全にサポート<br>・Quarkusディストリビューションの更新<br>・オフラインセッションの遅延ロード<br>・ユーザー検索の改善 |
| 16.1.0 | 2021-01-21 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ 26.0.0 | N/A | ・Wildfly 26.0.0へのアップグレード |
| 16.0.0 | 2020-11-20 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ 25.0.1 | ✅ 2.5.3 | ・Wildfly 25.0.1へのアップグレード<br>・Quarkus 2.5.3へのアップグレード |
| 15.1.0 | 2020-09-29 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ | ✅ | ・Quarkusディストリビューションのプレビュー<br>・新しい管理コンソールのプレビュー<br>・WildFlyアダプターの廃止予定<br>・Spring SecurityおよびBootアダプターの廃止予定<br>・OpenID Connectフロントチャネルログアウトのサポート<br>・Keycloak Operatorの非推奨機能 |
| 15.0.1 | 2020-07-16 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ | N/A | ・重要なバグ修正 |
| 15.0.0 | 2020-06-25 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ | N/A | ・Financial-grade API（FAPI）の改善、FAPI CIBA、およびOpen Banking Brasil |
| 14.0.0 | 2020-03-11 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ | N/A | ・クライアントポリシーとFinancial-grade API（FAPI）のサポート<br>・ユーザープロファイルSPIの改善と宣言型構成のサポート<br>・オフラインセッションの改善<br>・その他の改善 |
| 13.0.0 | 2019-12-04 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ 23 | N/A | ・Wildfly 23へのアップグレード<br>・OAuth 2.0デバイス認可付与（RFC 8628）<br>・OpenID Connectクライアント開始バックチャネル認証（CIBA）<br>・サーバーからクライアントへの通信におけるSAMLアーティファクトバインディング<br>・IDブローカーのPKCEのサポート<br>・デフォルトロール処理の改善 |
| 12.0.0 | 2019-09-04 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ 20 | ✅ Quarkus (Preview) | ・Keycloak.Xディストリビューションのプレビュー<br>・新しいアカウントコンソールがデフォルトに<br>・OpenID Connectバックチャネルログアウト<br>・WildFly 20へのアップグレード<br>・SAML IDプロバイダーでAuthnContextを要求する機能<br>・FAPI RWのサポートとクライアントポリシーの初期サポート<br>・ログインテーマのPatternFly 4へのアップグレード<br>・Gatekeeperのサポート終了<br>・その他の改善 |
| 11.0.0 | 2019-06-27 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ 18 | N/A | ・LDAPv3パスワード変更操作<br>・LDAPグループマッパーのネームスペースのサポート<br>・WildFly 19へのアップグレード<br>・その他の改善 |
| 10.0.0 | 2018-12-03 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ 16 | N/A | ・IDブローカー同期モード<br>・OpenID Connect / OAuth 2.0のクライアントセッションタイムアウト<br>・OAuth 2.0トークン失効（RFC 7009）<br>・セキュリティヘッダーSPIとレスポンスフィルター<br>・WildFly 18へのアップグレード<br>・その他の改善 |
| 9.0.1 | 2018-09-10 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ | N/A | ・JavaScriptアダプターからPromiseTypeを削除<br>・LocaleSelectorSPIへの破壊的なAPI変更を元に戻す<br>・Spring BootアプリケーションのKeycloakConfigResolverインスタンスの自動解決を修正 |
| 9.0.0 | 2018-08-16 | ✅ OpenJDK 8<br>✅ OpenJDK 11 | ✅ | N/A | ・Droolsポリシーの削除<br>・クライアントのページネーションのサポート<br>・新しいElytronクレデンシャルストアVaultプロバイダー<br>・W3C WebAuthnと認証フローの更新<br>・ユーザーロケールの処理の改善<br>・その他の改善 |
| 8.0.2 | 2018-06-26 | ✅ OpenJDK 8 | ✅ | N/A | ・今後のGoogle Chromeアップデートに伴うSameSite Cookieの変更 |
| 8.0.1 | 2018-06-07 | ✅ OpenJDK 8 | ✅ 18.0.1 | N/A | ・LDAPの重大な脆弱性の修正<br>・WildFly 18.0.1.Finalへのアップグレード |
| 8.0.0 | 2018-05-31 | ✅ OpenJDK 8 | ✅ 18 | N/A | ・Vault<br>・新しいデフォルトホスト名プロバイダー<br>・テーマリソースのメッセージ<br>・SAMLアダプターのRoleMappingsProvider SPI<br>・WildFly 18へのアップグレード<br>・W3C Web認証のサポート<br>・パスワードなし認証、多要素認証、ユーザーごとの複数認証情報のサポート<br>・その他の改善 |
| 7.0.1 | 2018-03-20 | ✅ OpenJDK 8 | ✅ | N/A | ・サーバーへのスクリプトのデプロイ |
| 7.0.0 | 2018-03-01 | ✅ OpenJDK 8 | ✅ 17 | N/A | ・WildFly 17へのアップグレード<br>・Tomcat 9アダプターのサポート<br>・新しいアカウントコンソール<br>・署名済みおよび暗号化されたIDトークンのサポート<br>・テストとリリースの自動化<br>・その他の改善 |
| 6.0.0 | 2017-11-28 | ✅ OpenJDK 8 | ✅ 16 | N/A | ・WildFly 16へのアップグレード<br>・SmallRye HealthおよびMetrics拡張機能<br>・PS256のサポート<br>・MP-JWTクライアントスコープ |
| 5.0.0 | 2017-09-20 | ✅ OpenJDK 8 | ✅ 15 | N/A | ・WildFly 15へのアップグレード |
| 4.8.0 | 2017-06-29 | ✅ OpenJDK 8 | ✅ | N/A | ・OpenShift統合<br>・Rules / Droolsポリシーがテクノロジープレビュー機能としてマークされた<br>・DB2のサポートの削除 |
| 4.7.0 | 2017-05-10 | ✅ OpenJDK 8 | ✅ | N/A | ・強化されたRemember Me<br>・グループのページネーションのサポート<br>・多数のオフラインセッションでの起動時間の短縮 |
| 4.6.0 | 2017-04-27 | ✅ OpenJDK 8 | ✅ 14 | N/A | ・WildFly 14へのアップグレード<br>・Keycloak Gatekeeper |
| 4.5.0 | 2017-02-16 | ✅ OpenJDK 8 | ✅ | N/A | ・署名SPI<br>・新しい署名アルゴリズム<br>・OpenID Connectクライアントのオーディエンスサポートの改善<br>・その他の改善 |
| 4.4.0 | 2016-11-29 | ✅ OpenJDK 8 | ✅ 13 | N/A | ・WildFly 13へのアップグレード<br>・Node.jsの認可サービスのサポート<br>・その他の改善 |
| 4.3.0 | 2016-10-05 | ✅ OpenJDK 8 | ✅ | N/A | ・ホスト名SPI<br>・X509クライアントオーセンティケーター<br>・認可サービスのパフォーマンスの向上<br>・サーバーから権限を取得する際の応答モードの選択<br>・NodeJSポリシーエンフォーサー<br>・Googleログインのホストドメインのサポート<br>・HTML出力の安全でないタグのエスケープ |
| 4.2.0 | 2016-08-30 | ✅ OpenJDK 8 | ✅ | N/A | ・Cordovaのブラウザタブのサポート<br>・SAMLアダプターのマルチテナンシーのサポート<br>・ドット(.)を含むクレームを作成するオプション |
| 4.1.0 | 2016-07-20 | ✅ OpenJDK 8 | ✅ | N/A | ・Spring Boot 2をデフォルトのスターターにする |
| 4.0.0 | 2016-06-28 | ✅ OpenJDK 8 | ✅ | N/A | ・クライアントスコープとOAuth2スコープパラメータのサポート<br>・OAuth2証明書にバインドされたアクセストークン<br>・認可サービス<br> ・UMA 2.0のサポート<br> ・Keycloakアカウントサービスを介したユーザー管理アクセス<br> ・非同期認可フロー<br> ・ユーザー管理アクセス許可API<br> ・プッシュされたクレーム<br> ・リソース属性<br> ・ポリシーエンフォーサーが通常のアクセストークンを受け入れるようになった<br> ・ポリシーエンフォーサーがサーバーからオンデマンドでリソースをロードできるようになった<br> ・ポリシーエンフォーサーがリソースキャッシュの構成をサポートするようになった<br> ・クレーム情報ポイント<br> ・評価APIの改善<br>・テーマとテーマリソース<br>・Instagram IDプロバイダー<br>・管理コンソールでのユーザーIDによる検索<br>・アダプター<br> ・Spring Boot 2<br> ・Fuse 7<br> ・JavaScript-ネイティブPromiseのサポート<br> ・JavaScript-Cordovaオプション |

**注意:**
これは概要であり、詳細な情報は各バージョンのリリースノートを参照してください。
