**Considering Translation of Args**

I'm currently focusing on translating the provided list of Google Cloud Filestore Terraform arguments into a Japanese Markdown table. I'm thinking about the best way to structure the table for clarity and how to accurately convey the argument meanings in Japanese.


**Revising Table Structure**

I'm currently grappling with the structure of the Japanese Markdown table. Specifically, I'm ensuring all Filestore Terraform arguments are included, as requested. The challenge is representing the nested arguments clearly while maintaining readability. I'm leaning towards direct translations for argument names and meticulously conveying their "required/optional" status and explanations.


**Planning Detailed Table Layout**

I'm now meticulously planning the layout of the Japanese Markdown table, based on the updated requirements. The imperative this time is to list every single argument without omission and to retain the original argument names. This necessitates a clear representation of nested structures, possibly using dot notation like `file_shares.name`. The plan involves grouping arguments into logical sections like "Basic Settings," "File Share Settings," and "Network Settings" for better readability. I intend to reference `gcloud filestore instances create` for translation accuracy and context.


**Organizing Argument Grouping**

I'm currently restructuring the table to mirror the newly requested format precisely. The primary focus is on avoiding any omissions and preserving argument names as they appear in the original Terraform configuration. I am organizing arguments into logical groupings like "Basic Settings," "File Share Settings," and "Network Settings." My plan includes detailed Japanese translations for each argument, referencing the official Google Cloud documentation for Filestore and, where possible, `gcloud` equivalents for context and clarity. The table will also incorporate explanations of "required/optional" status.


**Finalizing Detailed Translations**

I'm now focusing on translating the Filestore arguments into Japanese, meticulously adhering to the requirements. I am utilizing the provided documentation, including gcloud, as a reference. I've ensured that all arguments and their names are included, mirroring the original Terraform definitions. The current efforts involve completing the Japanese descriptions, addressing the "required/optional" aspects, and finalizing the Markdown table's overall structure.


**Finalizing Detailed Translations**

I'm now focused on translating the core Filestore arguments into Japanese, meticulously adhering to the updated requirements, which include listing all arguments by name and preserving them as is. I've incorporated detailed Japanese descriptions and added context from the official Google Cloud documentation, including the `gcloud` command equivalents where applicable, and have finalized the structure of the markdown table. I am now concentrating on finalizing the descriptions, including details of their "required/optional" attributes.


**Implementing Dot Notation & Structure**

I'm currently meticulously translating the Google Cloud Filestore Terraform arguments to a Japanese Markdown table, as per the updated requirements, including all names and details. I'm leaning towards the dot notation for nested structures like `file_shares.name` for enhanced clarity, and also focusing on logical argument groupings to improve readability and ease of understanding.


**Implementing Translations & Structure**

I'm currently focused on translating the Filestore arguments into Japanese, ensuring that I include all arguments by name, as requested, and maintaining the original format for each. I am incorporating logical groupings to improve readability. The next step involves finalizing descriptions while considering the context, including 'required/optional' details, to complete the markdown table.


承知いたしました。Google Cloud Filestore の Terraform パラメータに関する資料を、gcloud CLI の情報も参考にしながら、指定された形式ですべての項目を網羅した、分かりやすい日本語のマークダウン表を作成します。

---

### Google Cloud Filestore Terraform パラメータシート

このドキュメントは、Terraform を使用して Google Cloud Filestore インスタンスを構成する際の全パラメータについて、その詳細と設定内容を日本語で説明します。

---

### 1. インスタンス基本設定

インスタンスの基本的な構成情報を設定します。

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `name` | 必須 | **インスタンスのリソース名。**<br>インスタンスを一意に識別するための名前（ID）。 |
| `tier` | 必須 | **サービス階層。**<br>インスタンスの性能や機能を決定します。ワークロードの要件に合わせて選択します。<br>**選択可能な値:** `STANDARD`, `PREMIUM`, `BASIC_HDD`, `BASIC_SSD`, `HIGH_SCALE_SSD`, `ZONAL`, `REGIONAL`, `ENTERPRISE` |
| `file_shares` | 必須 | **ファイルシステム共有設定。**<br>インスタンス上のファイル共有に関する設定ブロック。詳細はセクション2を参照。このバージョンでは単一のファイル共有のみサポートされます。 |
| `networks` | 必須 | **VPCネットワーク設定。**<br>インスタンスが接続するVPCネットワークに関する設定ブロック。詳細はセクション3を参照。このバージョンでは単一のネットワークのみサポートされます。 |
| `description` | 任意 | **説明。**<br>インスタンスに関する自由記述の説明。管理目的で使用します。 |
| `protocol` | 任意 | **ファイル共有プロトコル。**<br>`NFS_V3` または `NFS_V4_1` を選択します。`NFS_V4_1` は `HIGH_SCALE_SSD`, `ZONAL`, `REGIONAL`, `ENTERPRISE` 階層で使用可能です。<br>**デフォルト値:** `NFS_V3` |
| `labels` | 任意 | **ラベル。**<br>ユーザー定義のメタデータを表すリソースラベル。<br>**注:** このフィールドで管理されるのは設定ファイル内のラベルのみです。リソースに存在するすべてのラベルは `effective_labels` フィールドを参照してください。 |
| `kms_key_name` | 任意 | **KMS暗号鍵名。**<br>データ暗号化に使用するCloud KMSの鍵リソース名。 |
| `deletion_protection_enabled` | 任意 | **削除保護の有効化。**<br>インスタンスが削除から保護されているかどうかを示します。 |
| `deletion_protection_reason` | 任意 | **削除保護の理由。**<br>削除保護を有効にする理由を記述します。 |
| `performance_config` | 任意 | **パフォーマンス設定。**<br>インスタンスのパフォーマンス構成。指定しない場合、デフォルト設定が使用されます。詳細はセクション4を参照。 |
| `tags` | 任意 | **リソースマネージャータグ。**<br>リソースマネージャータグのマップ。キーは `tagKeys/{tag_key_id}`、値は `tagValues/456` の形式です。作成時のみ設定可能で、変更するとリソースが再作成されます。 |
| `initial_replication` | 任意 | **初期レプリケーション設定。**<br>レプリケーション構成。一度設定すると更新できません。レプリカインスタンス側でのみ指定します。詳細はセクション5を参照。 |
| `directory_services` | 任意 (Beta) | **ディレクトリサービス設定。**<br>LDAPなどのディレクトリサービス構成。`protocol` が `NFS_V4_1` の場合にのみ設定します。詳細はセクション6を参照。 |
| `zone` | 任意 (非推奨) | **インスタンスのゾーン名。**<br>**警告:** `zone` は非推奨であり、将来のメジャーリリースで削除されます。代わりに `location` を使用してください。 |
| `location` | 任意 | **ロケーション名。**<br>インスタンスの場所（リージョンまたはゾーン）。ENTERPRISE階層の場合はリージョンを指定できます。 |
| `project` | 任意 | **プロジェクトID。**<br>リソースが所属するプロジェクトのID。指定しない場合、プロバイダで設定されたプロジェクトが使用されます。 |

---

### 2. ファイル共有設定 (`file_shares` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `file_shares.name` | 必須 | **ファイル共有名。**<br>16文字以内で指定します。NFSでマウントする際の共有ボリューム名になります。 |
| `file_shares.capacity_gb` | 必須 | **ファイル共有の容量 (GiB)。**<br>STANDARD階層では1024 GiB以上、PREMIUM階層では2560 GiB以上が必要です。 |
| `file_shares.source_backup` | 任意 | **復元元バックアップ。**<br>ファイル共有の復元元となったバックアップのリソース名を `projects/{projectId}/locations/{locationId}/backups/{backupId}` の形式で指定します。 |
| `file_shares.nfs_export_options`| 任意 | **NFSエクスポートオプション。**<br>クライアントからのアクセス制御ルール。ファイル共有ごとに10個まで設定可能。詳細は次のサブセクションを参照。 |

#### 2.1. NFSエクスポートオプション (`nfs_export_options` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `nfs_export_options.ip_ranges`| 任意 | **IP範囲。**<br>ファイル共有へのマウントを許可するIPv4アドレスまたはCIDR形式の範囲のリスト。重複するIP範囲は設定できません。各ファイル共有で合計64個まで設定可能です。 |
| `nfs_export_options.access_mode`| 任意 | **アクセスモード。**<br>`READ_ONLY`（読み取り専用）または`READ_WRITE`（読み書き両方）を選択します。<br>**デフォルト値:** `READ_WRITE` |
| `nfs_export_options.squash_mode`| 任意 | **ルートユーザーのアクセス制御。**<br>`NO_ROOT_SQUASH`（rootアクセスを許可）または`ROOT_SQUASH`（rootアクセスを許可しない）を選択します。<br>**デフォルト値:** `NO_ROOT_SQUASH` |
| `nfs_export_options.anon_uid`| 任意 | **匿名ユーザーID。**<br>整数のユーザーID。`squash_mode`が`ROOT_SQUASH`の場合にのみ設定可能です。<br>**デフォルト値:** `65534` |
| `nfs_export_options.anon_gid`| 任意 | **匿名グループID。**<br>整数のグループID。`squash_mode`が`ROOT_SQUASH`の場合にのみ設定可能です。<br>**デフォルト値:** `65534` |
| `nfs_export_options.network`| 任意 (Beta) | **ソースVPCネットワーク。**<br>`ip_ranges`のソースVPCネットワーク。Private Service Connectを使用する場合は必須です。 |

---

### 3. ネットワーク設定 (`networks` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `networks.network` | 必須 | **GCE VPCネットワーク名。**<br>インスタンスが接続されるVPCネットワークの名前。 |
| `networks.modes` | 必須 | **IPバージョン。**<br>インスタンスに割り当てられるIPアドレスのバージョン。 <br>**選択可能な値:** `ADDRESS_MODE_UNSPECIFIED`, `MODE_IPV4`, `MODE_IPV6` |
| `networks.reserved_ip_range`| 任意 | **予約済みIP範囲。**<br>このインスタンス用に予約されたIPアドレス範囲を示す `/29` のCIDRブロック。 |
| `networks.ip_addresses` | (出力) | **IPアドレス。**<br>割り当てられたIPv4またはIPv6アドレスのリスト。（このフィールドは設定不可） |
| `networks.connect_mode` | 任意 | **ネットワーク接続モード。**<br>指定しない場合、`DIRECT_PEERING`がデフォルトとなります。<br>**デフォルト値:** `DIRECT_PEERING`<br>**選択可能な値:** `DIRECT_PEERING`, `PRIVATE_SERVICE_ACCESS`, `PRIVATE_SERVICE_CONNECT` |
| `networks.psc_config` | 任意 (Beta) | **Private Service Connect設定。**<br>`connect_mode`が`PRIVATE_SERVICE_CONNECT`の場合にのみ設定します。詳細は次のサブセクションを参照。 |

#### 3.1. Private Service Connect 設定 (`psc_config` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `networks.psc_config.endpoint_project` | 任意 | **エンドポイントプロジェクト。**<br>Private Service Connectのエンドポイントが設定されるコンシューマーサービスプロジェクト。共有VPCの場合にのみ relevant です。指定しない場合、エンドポイントはVPCホストプロジェクトに設定されます。 |

---

### 4. パフォーマンス設定 (`performance_config` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `performance_config.iops_per_tb`| 任意 | **TBあたりのIOPS設定。**<br>インスタンスのプロビジョニングIOPSが容量に応じて動的に変化します。詳細は次のサブセクションを参照。 |
| `performance_config.fixed_iops`| 任意 | **固定IOPS設定。**<br>インスタンスは容量に関係なく、固定のプロビジョニングIOPS値を持ちます。詳細は次のサブセクションを参照。 |

#### 4.1. TBあたりのIOPS設定 (`iops_per_tb` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `performance_config.iops_per_tb.max_iops_per_tb`| 任意 | **TBあたりの最大IOPS。**<br>インスタンスの最大IOPSは、インスタンス容量(TB)にこの値を掛け、最も近い1000に丸めることで計算されます。 |

#### 4.2. 固定IOPS設定 (`fixed_iops` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `performance_config.fixed_iops.max_iops`| 任意 | **最大IOPS。**<br>インスタンスにプロビジョニングするIOPSの数。1000の倍数である必要があります。 |

---

### 5. 初期レプリケーション設定 (`initial_replication` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `initial_replication.role` | 任意 | **レプリケーションロール。**<br>インスタンスの役割。<br>**デフォルト値:** `STANDBY`<br>**選択可能な値:** `ROLE_UNSPECIFIED`, `ACTIVE`, `STANDBY` |
| `initial_replication.replicas` | 任意 | **レプリカ設定ブロック。**<br>レプリケーションの相手となるピアインスタンスを指定します。詳細は次のサブセクションを参照。 |

#### 5.1. レプリカ設定 (`replicas` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `initial_replication.replicas.peer_instance`| 必須 | **ピアインスタンス。**<br>レプリケーションの相手となるプライマリ（アクティブ）インスタンスのリソース名を指定します。 |

---

### 6. ディレクトリサービス設定 (`directory_services` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `directory_services.ldap` | 任意 | **LDAPサーバー設定。**<br>LDAPサーバーのための設定ブロック。詳細は次のサブセクションを参照。 |

#### 6.1. LDAP設定 (`ldap` ブロック)

| 項目名 | 必須/任意 | 説明 |
|:---|:---:|:---|
| `directory_services.ldap.domain` | 必須 | **LDAPドメイン名。**<br>`my-domain.com` の形式で指定します。 |
| `directory_services.ldap.servers` | 必須 | **LDAPサーバー名。**<br>LDAPサーバー名を指定します。DNS名（例: `ldap.example.com`）またはIPアドレス（例: `10.0.0.1`）で指定でき、すべて同じ形式である必要があります。 |
| `directory_services.ldap.users_ou` | 任意 | **ユーザーのOU (組織単位)。**<br>LDAP名前空間での検索を高速化するためのヒントです。指定しない場合、FilestoreはLDAP名前空間全体をクエリします。 |
| `directory_services.ldap.groups_ou`| 任意 | **グループのOU (組織単位)。**<br>LDAP名前空間での検索を高速化するためのヒントです。指定しない場合、FilestoreはLDAP名前空間全体をクエリします。 |
