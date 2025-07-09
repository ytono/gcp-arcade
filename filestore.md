### 概要

Google Cloud Filestore は、フルマネージドのネットワークアタッチトストレージ（NAS）サービスです。 このドキュメントは、Terraform を使用して Filestore インスタンスを構成する際の各パラメータについて、その詳細と設定方法を網羅的に説明します。

---

### 1. インスタンス基本設定

インスタンスの最も基本的な構成情報を設定します。

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `name` | 必須 | **インスタンスの名前（ID）**<br>インスタンスを一意に識別するためのリソース名です。`gcloud filestore instances create` コマンドの `INSTANCE_ID` に相当します。 |
| `tier` | 必須 | **サービス階層**<br>インスタンスの性能、機能、料金を決定します。ワークロードの要件に合わせて選択します。<br>**選択可能な値:** `STANDARD`, `PREMIUM`, `BASIC_HDD`, `BASIC_SSD`, `HIGH_SCALE_SSD`, `ZONAL`, `REGIONAL`, `ENTERPRISE` |
| `location` | 任意 | **ロケーション**<br>インスタンスをデプロイする場所（リージョンまたはゾーン）を指定します。ENTERPRISE階層ではリージョンを指定できます。<br>**注意:** 以前の `zone` パラメータは非推奨であり、将来のバージョンで削除されるため、この `location` を使用してください。 |
| `description` | 任意 | **説明**<br>インスタンスに関する自由記述の説明です。管理目的で使用します。 |
| `protocol` | 任意 | **ファイル共有プロトコル**<br>ファイル共有に使用するNFSプロトコルのバージョンを選択します。<br>・`NFS_V3`: 標準的なプロトコルです。全てのサービス階層でサポートされます。<br>・`NFS_V4_1`: LDAPやKerberosによる認証をサポートします。`HIGH_SCALE_SSD`, `ZONAL`, `REGIONAL`, `ENTERPRISE` 階層で使用可能です。<br>**デフォルト値:** `NFS_V3` |
| `labels` | 任意 | **ラベル**<br>リソースを整理・分類するためのKey-Value形式のメタデータ。 |
| `kms_key_name` | 任意 | **KMS暗号鍵**<br>データを暗号化するためのCloud KMSの鍵リソース名。指定しない場合、Googleが管理する鍵で暗号化されます。 |
| `deletion_protection_enabled` | 任意 | **削除保護**<br>インスタンスの誤った削除を防ぐために `true` に設定します。 |
| `deletion_protection_reason` | 任意 | **削除保護の理由**<br>削除保護を有効にする理由を記述します。`deletion_protection_enabled` が `true` の場合に設定可能です。 |
| `tags` | 任意 | **リソースマネージャータグ**<br>リソースに階層的なポリシーを適用するためのタグ。作成時のみ設定可能で、後からの変更はリソースの再作成を引き起こします。 |
| `project` | 任意 | **プロジェクトID**<br>リソースが所属するプロジェクトのID。指定しない場合、Terraformプロバイダで設定されたプロジェクトが使用されます。 |
| `zone` | 任意 (非推奨) | **ゾーン**<br>インスタンスのゾーン名。**警告:** このフィールドは非推奨です。代わりに `location` を使用してください。 |

### 2. ファイル共有設定 (`file_shares`)

インスタンス上で提供されるNFSファイル共有の詳細を設定します。現在サポートされているファイル共有は1つのみです。

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `file_shares.name` | 必須 | **ファイル共有名**<br>NFSでマウントする際の共有ボリューム名です。16文字以内で指定します。 |
| `file_shares.capacity_gb` | 必須 | **容量 (GiB)**<br>ファイル共有の容量をギビバイト単位で指定します。サービス階層によって最小容量が異なります（例: `STANDARD`は1024 GiB、`PREMIUM`は2560 GiB）。 |
| `file_shares.source_backup` | 任意 | **復元元バックアップ**<br>このファイル共有を復元する際に使用したバックアップのリソース名を指定します。<br>**形式:** `projects/{projectId}/locations/{locationId}/backups/{backupId}` |
| `file_shares.nfs_export_options` | 任意 | **NFSエクスポートオプション**<br>クライアントからのアクセスを制御するためのルールを設定します。詳細は次のセクションを参照してください。1ファイル共有あたり10個まで設定可能です。 |

#### 2.1. NFSエクスポートオプション (`nfs_export_options`)

特定のIP範囲に対してアクセスモードやユーザーマッピングを定義します。

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `ip_ranges` | 任意 | **IP範囲**<br>このファイル共有へのマウントを許可するクライアントのIPv4アドレス、またはCIDR形式の範囲のリスト。重複するIP範囲は設定できません。1ファイル共有あたり合計64個まで指定可能です。 |
| `access_mode` | 任意 | **アクセスモード**<br>・`READ_WRITE`: 読み取りと書き込みの両方を許可します。<br>・`READ_ONLY`: 読み取りリクエストのみを許可します。<br>**デフォルト値:** `READ_WRITE` |
| `squash_mode` | 任意 | **ルートユーザーのアクセス制御**<br>・`NO_ROOT_SQUASH`: クライアントのrootユーザーがサーバー上でもroot権限を持ちます。<br>・`ROOT_SQUASH`: クライアントのrootユーザーからのアクセスを匿名ユーザーにマッピングし、権限を制限します。<br>**デフォルト値:** `NO_ROOT_SQUASH` |
| `anon_uid` | 任意 | **匿名ユーザーID**<br>`squash_mode`が`ROOT_SQUASH`の場合にマッピングされるユーザーID。このフィールドを指定する場合は`ROOT_SQUASH`である必要があります。<br>**デフォルト値:** 65534 |
| `anon_gid` | 任意 | **匿名グループID**<br>`squash_mode`が`ROOT_SQUASH`の場合にマッピングされるグループID。このフィールドを指定する場合は`ROOT_SQUASH`である必要があります。<br>**デフォルト値:** 65534 |
| `network` | 任意 (Beta) | **ソースVPCネットワーク**<br>`ip_ranges`が属するVPCネットワークを指定します。Private Service Connectを使用する場合は必須です。 |

### 3. ネットワーク設定 (`networks`)

インスタンスが接続するVPCネットワーク情報を設定します。現在サポートされているネットワークは1つのみです。

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `networks.network` | 必須 | **VPCネットワーク名**<br>インスタンスを接続するGCE VPCネットワークの名前。 |
| `networks.modes` | 必須 | **IPバージョン**<br>インスタンスに割り当てるIPアドレスのバージョン。現在は`MODE_IPV4`のみが一般的です。<br>**選択可能な値:** `ADDRESS_MODE_UNSPECIFIED`, `MODE_IPV4`, `MODE_IPV6` |
| `networks.reserved_ip_range` | 任意 | **予約済みIP範囲**<br>インスタンス用に予約するIPアドレス範囲を `/29` のCIDRブロックで指定します。指定しない場合、利用可能な範囲が自動的に割り当てられます。 |
| `networks.connect_mode` | 任意 | **接続モード**<br>クライアントとFilestoreインスタンスの接続方式。<br>・`DIRECT_PEERING`: VPCピアリングを使用して接続します。<br>・`PRIVATE_SERVICE_ACCESS`: プライベートサービスアクセスを使用して接続します。<br>・`PRIVATE_SERVICE_CONNECT`: Private Service Connectを使用して接続します。<br>**デフォルト値:** `DIRECT_PEERING` |
| `networks.psc_config` | 任意 (Beta) | **Private Service Connect設定**<br>`connect_mode` が `PRIVATE_SERVICE_CONNECT` の場合にのみ設定します。 |
|`networks.psc_config.endpoint_project`| 任意 |**エンドポイントプロジェクト**<br>共有VPC環境で、Private Service Connectのエンドポイントが作成されるコンシューマー側のサービスプロジェクト。指定されない場合、VPCホストプロジェクトに作成されます。|
| `networks.ip_addresses` | 出力のみ | **IPアドレス**<br>インスタンスに割り当てられたIPv4またはIPv6アドレスのリスト。この値はTerraformによって出力され、設定はできません。 |

### 4. 高度な設定

#### 4.1. パフォーマンス設定 (`performance_config`)

インスタンスのIOPS（秒間I/O処理数）をカスタマイズします。指定しない場合はデフォルト設定が使用されます。

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
|`performance_config.iops_per_tb`| 任意 | **容量ベースのIOPS**<br>インスタンスの容量（TB）に応じてIOPSが動的に変動する設定ブロック。 |
|`performance_config.iops_per_tb.max_iops_per_tb`| 任意 | **TBあたりの最大IOPS**<br>インスタンス容量(TB)にこの値を掛け、最も近い1000に丸めた数が最大IOPSとなります。 |
|`performance_config.fixed_iops`| 任意 | **固定IOPS**<br>インスタンスの容量に関わらず、IOPSを固定値でプロビジョニングする設定ブロック。 |
|`performance_config.fixed_iops.max_iops`| 任意 | **最大IOPS**<br>インスタンスにプロビジョニングする固定のIOPS数。1000の倍数である必要があります。 |

#### 4.2. レプリケーション設定 (`initial_replication`)

レプリケーション構成を設定します。レプリカインスタンス側でのみ指定し、一度設定すると変更できません。

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
|`initial_replication.role`| 任意 | **レプリケーションロール**<br>インスタンスの役割を指定します。<br>**選択可能な値:** `ROLE_UNSPECIFIED`, `ACTIVE`, `STANDBY`<br>**デフォルト値:** `STANDBY` |
|`initial_replication.replicas`| 任意 | **レプリカ設定**<br>ピアとなるインスタンス（アクティブ側）を指定するための設定ブロック。 |
|`initial_replication.replicas.peer_instance`| 必須 | **ピアインスタンス**<br>レプリケーションのペアとなるアクティブ側インスタンスのリソース名を指定します。 |

#### 4.3. ディレクトリサービス設定 (`directory_services`)

LDAPサーバーとの連携を設定します。`protocol` が `NFS_V4_1` の場合にのみ設定可能です。

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
|`directory_services.ldap`| 任意 | **LDAPサーバー設定**<br>LDAPサーバーとの連携を設定するためのブロック。 |
|`directory_services.ldap.domain`| 必須 | **LDAPドメイン名**<br>`my-domain.com` のような形式でLDAPドメイン名を指定します。 |
|`directory_services.ldap.servers`| 必須 | **LDAPサーバー**<br>LDAPサーバーのDNS名（例: `ldap.example.com`）またはIPアドレス（例: `10.0.0.1`）のリスト。リスト内のサーバー名は全て同じ形式（全てDNS名または全てIPアドレス）である必要があります。 |
|`directory_services.ldap.users_ou`| 任意 | **ユーザーOU (組織単位)**<br>LDAP名前空間での検索を高速化するためのヒントとして、ユーザーが含まれるOUを指定します。 |
|`directory_services.ldap.groups_ou`| 任意 | **グループOU (組織単位)**<br>LDAP名前空間での検索を高速化するためのヒントとして、グループが含まれるOUを指定します。 |
