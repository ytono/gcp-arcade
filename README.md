## gcloud beta run deploy コマンド説明

## gcloud beta run deploy コマンド 説明 (表形式)


| 項目名 | フラグ | 説明 | デフォルト値 | 設定値 |
|---|---|---|---|---|
| サービス | [SERVICE] | サービスの ID または完全修飾識別子 | なし | |
| 名前空間 | --namespace=NAMESPACE | Kubernetes 名前空間 | なし | |
| 非同期 | --async | 処理の完了を待たずに返す | False | |
| 並行性 | --concurrency=CONCURRENCY | コンテナインスタンスあたりの最大同時リクエスト数 | なし | |
| コンテナ | --container=CONTAINER | コンテナを名前で指定 | なし | |
| イングレス | --ingress=INGRESS; default="all" | サービスを呼び出すことができるインバウンドトラフィックソース | "all" | |
| 最大インスタンス数 | --max-instances=MAX_INSTANCES | 実行するサービスのコンテナインスタンスの最大数 | なし | |
| 最小インスタンス数 | --min-instances=MIN_INSTANCES | 実行するサービスのリビジョンのコンテナインスタンスの最小数 | なし | |
| プラットフォーム | --platform=PLATFORM; default="managed" | コマンドを実行するためのターゲットプラットフォーム | "managed" | |
| サービスアカウント | --service-account=SERVICE_ACCOUNT | リビジョンのサービスアカウント | なし | |
| タグ | --tag=TAG | 新規作成されたリビジョンに割り当てるトラフィックタグ | なし | |
| タイムアウト | --timeout=TIMEOUT | 最大リクエスト実行時間 | なし | |
| トラフィックなし | --no-traffic | リビジョンへのトラフィックの送信を回避 | False | |
| ボリュームマウントの追加 | --add-volume-mount=[volume=NAME,mount-path=MOUNT_PATH,…] | ボリュームを現在のコンテナに追加 | なし | |
| 引数 | --args=[ARG,…] | コンテナイメージで実行されるコマンドに渡されるコンマ区切りの引数 | なし | |
| ボリュームマウントのクリア | --clear-volume-mounts | 現在のコンテナから既存のすべてのマウントを削除 | なし | |
| コマンド | --command=[COMMAND,…] | コンテナイメージのエントリポイント | なし | |
| CPU | --cpu=CPU | Kubernetes CPU 単位で CPU 制限を設定 | なし | |
| 依存関係 | --depends-on=[CONTAINER,…] | 現在のコンテナに追加するコンテナの依存関係のリスト | なし | |
| メモリ | --memory=MEMORY | メモリ制限を設定 | なし | |
| ポート | --port=PORT | リクエストを受け取るコンテナポート | なし | |
| ボリュームマウントの削除 | --remove-volume-mount=[MOUNT_PATH,…] | 指定されたパスのボリュームを現在のコンテナから削除 | なし | |
| HTTP/2 の使用 | --[no-]use-http2 | サービスへの接続に HTTP/2 を使用するかどうか | なし | |
| 環境変数のクリア | --clear-env-vars | すべての環境変数を削除 | なし | |
| 環境変数ファイル | --env-vars-file=FILE_PATH | すべての環境変数の定義を含むローカル YAML ファイルへのパス | なし | |
| 環境変数の設定 | --set-env-vars=[KEY=VALUE,…] | 環境変数として設定するキーバリューペアのリスト | なし | |
| 環境変数の削除 | --remove-env-vars=[KEY,…] | 削除する環境変数のリスト | なし | |
| 環境変数の更新 | --update-env-vars=[KEY=VALUE,…] | 環境変数として設定するキーバリューペアのリスト | なし | |
| シークレットのクリア | --clear-secrets | すべてのシークレットを削除 | なし | |
| シークレットの設定 | --set-secrets=[KEY=VALUE,…] | シークレットとして設定するキーバリューペアのリスト | なし | |
| シークレットの削除 | --remove-secrets=[KEY,…] | 削除するシークレットのリスト | なし | |
| シークレットの更新 | --update-secrets=[KEY=VALUE,…] | シークレットとして設定するキーバリューペアのリスト | なし | |
| イメージ | --image=IMAGE | デプロイするコンテナイメージの名前 | なし | |
| ソース | --source=SOURCE | ビルドするソースの場所 | なし | |
| ラベル | --clear-labels | すべてのラベルを削除 | なし | なし |
| ラベルの削除 | --remove-labels | 削除するラベルのキーのリスト | なし | なし |
| ラベルの設定 | --labels | 追加するラベルのキーと値のペアのリスト | なし | なし |
| ラベルの更新 | --update-labels | 更新するラベルのキーと値のペアのリスト | なし | なし |
| コネクティビティ | --connectivity | クラウドランの接続方法を指定します。 | external | external、internal |
| 設定マップのクリア | --clear-config-maps | すべての設定マップを削除します。 | なし | なし |
| 設定マップの追加 | --add-config-maps | キーと値のペアで設定マップを追加します。 | なし | なし |
| 設定マップの更新 | --update-config-maps | キーと値のペアで設定マップを更新します。 | なし | なし |
| 設定マップの削除 | --remove-config-maps | キーのリストで設定マップを削除します。 | なし | なし |
| 許可 | --[no-]allow-unauthenticated | Cloud Run (完全に管理) に接続する場合にのみ適用されます。サービスの呼び出しを許可される ID を個別に制御します。 | デフォルト値はありません | --allow-unauthenticated で有効にするか、--no-allow-unauthenticated で無効にする |
| セキュリティの突破 | --breakglass=JUSTIFICATION | サービスをデプロイする前に追加の確認を求める | なし | JUSTIFICATION |
| VPC コネクタ | --clear-vpc-connector | VPC コネクタを削除 | 設定されてない | なし |
| CPU ブースト | --[no-]cpu-boost | コールド スタート要求の待ち時間を減らすために起動時にコンテナに余分な CPU を割り当てる | 有効 | なし |
| CPU スロットリング | --[no-]cpu-throttling | コンテナがアクティブにリクエストを処理していないときに CPU をスロットリングする | 有効 | なし |
| デフォルト URL | --[no-]default-url | サービスのデフォルト URL を有効にする | 有効 | なし |
| ヘルスの確認 | --[no-]deploy-health-check | リビジョンの単一インスタンスをスケジュールし、デプロイが成功するまで起動プローブが渡されるまで待つ | 有効 | なし |
| 説明 | --description=DESCRIPTION | サービスの説明を入力可能 | なし | DESCRIPTION |
| 実行環境 | --execution-environment=EXECUTION_ENVIRONMENT | アプリケーションの実行環境を選択 | gen1 | gen1、gen2 |
| コンテナの削除 | --remove-containers=[CONTAINER,…] | 削除するコンテナのリスト | なし | CONTAINER |
| リビジョンのサフィックス | --revision-suffix=REVISION_SUFFIX | リビジョン名のサフィックスを指定 | なし | REVISION_SUFFIX |
| サービスの最小インスタンス数 | --service-min-instances=SERVICE_MIN_INSTANCES | 実行するコンテナインスタンスの最小数 | なし | SERVICE_MIN_INSTANCES |
| セッション アフィニティ | --[no-]session-affinity | サービスへの接続のセッション アフィニティを有効にする | 無効 | なし |
| VPC コネクタ | --vpc-connector=VPC_CONNECTOR | サービスのリソースに VPC コネクタを設定 | なし | VPC_CONNECTOR |
| VPC エグレス | --vpc-egress=VPC_EGRESS | VPC コネクタ経由で送信する送信トラフィックを指定 | デフォルト: private-ranges-only | all、all-traffic、private-ranges-only |
| Cloud SQL インスタンス | --add-cloudsql-instances=[CLOUDSQL-INSTANCES,…] | 現在の Cloud SQL インスタンスに追加 | なし | CLOUDSQL-INSTANCES |
| Cloud SQL インスタンス | --clear-cloudsql-instances | 現在の Cloud SQL インスタンスを空にする | なし | なし |
| Cloud SQL インスタンス | --remove-cloudsql-instances=[CLOUDSQL-INSTANCES,…] | 現在の Cloud SQL インスタンスから削除 | なし | CLOUDSQL-INSTANCES |
| Cloud SQL インスタンス | --set-cloudsql-instances=[CLOUDSQL-INSTANCES,…] | 現在の Cloud SQL インスタンスを完全に置き換える | なし | CLOUDSQL-INSTANCES |
| カスタムオーディエンス | --add-custom-audiences=[CUSTOM-AUDIENCES,…] | 現在のカスタムオーディエンスに追加 | なし | CUSTOM-AUDIENCES |
| カスタムオーディエンス | --clear-custom-audiences | 現在のカスタムオーディエンスを空にする | なし | なし |
| カスタムオーディエンス | --remove-custom-audiences=[CUSTOM-AUDIENCES,…] | 現在のカスタムオーディエンスから削除 | なし | CUSTOM-AUDIENCES |
| カスタムオーディエンス | --set-custom-audiences=[CUSTOM-AUDIENCES,…] | 現在のカスタムオーディエンスを完全に置き換える | なし | CUSTOM-AUDIENCES |
| ボリュームの追加 | --add-volume=[KEY=VALUE,…] | Cloud Run リソースにボリュームを追加 | なし | KEY=VALUE |
| ボリュームの削除 | --clear-volumes | Cloud Run リソースからすべての既存のボリュームを削除 | なし | なし |
| ボリュームの削除 | --remove-volume=[VOLUME,…] | Cloud Run リソースからボリュームを削除 | なし | VOLUME |
| バイナリ認証 | --binary-authorization=POLICY | チェックするバイナリ認証ポリシー | なし | default |
| バイナリ承認 | --binary-authorization | バイナリ承認ポリシー | なし | "default" |
| CMEKキーシャットダウン時間 | --encryption-key-shutdown-hours | CMEKキーの失効が検出されてからの自動シャットダウンするまでの待機時間（時間） | なし | 数値 |
| CMEKキー | --key | コンテナの暗号化に使用するCMEKキーの参照 | なし | キーのパス |
| VPCネットワーク | --network | Cloud Runサービスがトラフィックを送信できるVPCネットワーク | なし | ネットワーク名 |
| VPCサブネットワーク | --subnet | Cloud RunサービスがIPを取得するVPCサブネットワーク | なし | サブネットワーク名 |
| コンピュートエンジンタグ | --network-tags | Cloud Runサービスに適用するコンピューテエンジンタグ（コンマ区切り） | なし | タグのリスト |
| CMEKキー失効後のアクションタイプ | --post-key-revocation-action-type | CMEKキー失効後のアクションタイプ | なし | prevent-new/shut-down |
| リージョン | --region | リソースが配置されているリージョン | なし | リージョン名 |
| クラスタ | --cluster | Kubernetes Engineクラスタ | なし | クラスタ名 |
| クラスタのロケーション | --cluster-location | クラスタが配置されているゾーン | なし | ゾーン名 |
| コンテキスト | --context | kubectlコンフィグファイル内のコンテキスト | なし | コンテキスト名 |
| kubeconfigファイル | --kubeconfig | kubectlコンフィグファイルの絶対パス | なし | ファイルパス |


| Vpcコネクタのクリア | --clear-vpc-connector | このリソースのVPCコネクタを削除します。 | なし | なし |
| 環境の世代 | --execution-environment | アプリケーションを実行する実行環境を選択 | gen2 | gen1、gen2 |
| ブレークグラス | --breakglass | バイナリ承認ポリシーの制約をバイパスして操作を許可する正当化 | なし | 正当化の理由 |
| CPU ブースト | --[no-]cpu-boost | コールドスタートリクエストの待ち時間を短縮するために、起動時にコンテナに余分な CPU を割り当てる | 有効 | 無効、有効 |
| CPU スロットリング | --[no-]cpu-throttling | コンテナがアクティブにリクエストを処理していないときに CPU をスロットリングする | 無効 | 無効、有効 |
| デフォルト URL | --[no-]default-url | Run サービスのデフォルト URLを切り替える | 有効 | 無効、有効 |
| ヘルスの健全性チェックのデプロイ | --[no-]deploy-health-check | デプロイメントの成功のために、リビジョンの単一インスタンスをスケジュールし、起動プローブが通過するのを待つ | 有効 | 無効、有効 |
| 説明 | --description | サービスのオプションの、人間が理解できる説明 | なし | 説明 |
| 最小インスタンス数 | --service-min-instances | このサービスを実行するためのコンテナインスタンスの最小数 | なし | 数値または "default" |
| セッションアフィニティ | --[no-]session-affinity | サービスへの接続に対してセッションアフィニティを有効にする | 無効 | 無効、有効 |
| VPC コネクタ | --vpc-connector | このリソースの VPC コネクタを設定 | なし | VPC コネクタ |
| VPC エグレス | --vpc-egress | ダイレクト VPC エグレスまたはこのリソースの VPC コネクタから送信されるアウトバウンドトラフィックを指定 | private-ranges-only | all、all-traffic、private-ranges-only |
| Cloud SQL インスタンス | --add-cloudsql-instances | サービスが接続する Cloud SQL インスタンスを追加 | なし | Cloud SQL インスタンス |
| カスタムオーディエンス | --add-custom-audiences | 認証済みリクエストの ID トークンのオーディエンスフィールドで使用できるカスタムオーディエンスを追加 | なし | カスタムオーディエンス |
| ボリューム | --add-volume | Run リソースにボリュームを追加 | なし | ボリューム |
| バイナリ承認 | --binary-authorization | チェックするバイナリ承認ポリシー | なし | "default" |
| 暗号化キーのシャットダウン時間 | --encryption-key-shutdown-hours | CMEK キーの取り消しが検出された後に自動シャットダウンサーバーを待機する時間 | なし | 値（時間） |
| キー | --key | コンテナを暗号化する CMEK キーの参照 | なし | CMEK キー |
| ネットワーク | --network | Run サービスがトラフィックを送信できる VPC ネットワーク | なし | ネットワーク |
| サブネットワーク | --subnet | Run サービスが IP を取得する VPC サブネットワーク | なし | サブネットワーク |
| ネットワークタグ | --network-tags | Run サービスに適用する Compute Engine タグ（コンマ区切り） | なし | タグ |
| CMEK キー失効後のアクションタイプ | --post-key-revocation-action-type | CMEK キーの失効後のアクションタイプ | なし | prevent-new、shut-down |







| 項目名 | フラグ | 説明 | デフォルト値 | 設定値 |
|---|---|---|---|---|
| サービス | [SERVICE] | サービスの ID または完全修飾識別子 | なし | |
| 名前空間 | --namespace=NAMESPACE | Kubernetes 名前空間 | なし | |
| 非同期 | --async | 処理の完了を待たずに返す | False | |
| 並行性 | --concurrency=CONCURRENCY | コンテナインスタンスあたりの最大同時リクエスト数 | なし | |
| コンテナ | --container=CONTAINER | コンテナを名前で指定 | なし | |
| イングレス | --ingress=INGRESS; default="all" | サービスを呼び出すことができるインバウンドトラフィックソース | "all" | |
| 最大インスタンス数 | --max-instances=MAX_INSTANCES | 実行するサービスのコンテナインスタンスの最大数 | なし | |
| 最小インスタンス数 | --min-instances=MIN_INSTANCES | 実行するサービスのリビジョンのコンテナインスタンスの最小数 | なし | |
| プラットフォーム | --platform=PLATFORM; default="managed" | コマンドを実行するためのターゲットプラットフォーム | "managed" | |
| サービスアカウント | --service-account=SERVICE_ACCOUNT | リビジョンのサービスアカウント | なし | |
| タグ | --tag=TAG | 新規作成されたリビジョンに割り当てるトラフィックタグ | なし | |
| タイムアウト | --timeout=TIMEOUT | 最大リクエスト実行時間 | なし | |
| トラフィックなし | --no-traffic | リビジョンへのトラフィックの送信を回避 | False | |
| ボリュームマウントの追加 | --add-volume-mount=[volume=NAME,mount-path=MOUNT_PATH,…] | ボリュームを現在のコンテナに追加 | なし | |
| 引数 | --args=[ARG,…] | コンテナイメージで実行されるコマンドに渡されるコンマ区切りの引数 | なし | |
| ボリュームマウントのクリア | --clear-volume-mounts | 現在のコンテナから既存のすべてのマウントを削除 | なし | |
| コマンド | --command=[COMMAND,…] | コンテナイメージのエントリポイント | なし | |
| CPU | --cpu=CPU | Kubernetes CPU 単位で CPU 制限を設定 | なし | |
| 依存関係 | --depends-on=[CONTAINER,…] | 現在のコンテナに追加するコンテナの依存関係のリスト | なし | |
| メモリ | --memory=MEMORY | メモリ制限を設定 | なし | |
| ポート | --port=PORT | リクエストを受け取るコンテナポート | なし | |
| ボリュームマウントの削除 | --remove-volume-mount=[MOUNT_PATH,…] | 指定されたパスのボリュームを現在のコンテナから削除 | なし | |
| HTTP/2 の使用 | --[no-]use-http2 | サービスへの接続に HTTP/2 を使用するかどうか | なし | |
| 環境変数のクリア | --clear-env-vars | すべての環境変数を削除 | なし | |
| 環境変数ファイル | --env-vars-file=FILE_PATH | すべての環境変数の定義を含むローカル YAML ファイルへのパス | なし | |
| 環境変数の設定 | --set-env-vars=[KEY=VALUE,…] | 環境変数として設定するキーバリューペアのリスト | なし | |
| 環境変数の削除 | --remove-env-vars=[KEY,…] | 削除する環境変数のリスト | なし | |
| 環境変数の更新 | --update-env-vars=[KEY=VALUE,…] | 環境変数として設定するキーバリューペアのリスト | なし | |
| シークレットのクリア | --clear-secrets | すべてのシークレットを削除 | なし | |
| シークレットの設定 | --set-secrets=[KEY=VALUE,…] | シークレットとして設定するキーバリューペアのリスト | なし | |
| シークレットの削除 | --remove-secrets=[KEY,…] | 削除するシークレットのリスト | なし | |
| シークレットの更新 | --update-secrets=[KEY=VALUE,…] | シークレットとして設定するキーバリューペアのリスト | なし | |
| イメージ | --image=IMAGE | デプロイするコンテナイメージの名前 | なし | |
| ソース | --source=SOURCE | ビルドするソースの場所 | なし | |
| ラベルのクリア | --clear-labels | すべてのラベルを削除 | なし |

| カテゴリ | 項目名 | フラグ | 説明 | 適用プラットフォーム | デフォルト値 | 設定値 |
|---|---|---|---|---|---|---|
| **必須引数** | サービス名 | `[SERVICE]` | デプロイ先のサービス。 | 全て | - | サービスIDまたは完全修飾名 |
| | | `--namespace=NAMESPACE` | サービスのKubernetes名前空間 (Cloud Run for Anthosの場合)。 | GKE, Kubernetes | Cloud Run for Anthos on GKE: `default`, その他: プロジェクトID | 名前空間 |
| **共通フラグ** | 非同期実行 | `--async` | 処理の完了を待たずにすぐに戻る。 | 全て | False | True |
| | 並行処理数 | `--concurrency=CONCURRENCY` | コンテナインスタンスごとに許可される最大同時リクエスト数。 | 全て | サーバーのデフォルト値 | 数値または`default` |
| | コンテナ指定 | `--container=CONTAINER` | フラグを適用するコンテナ名を指定。 | 全て | プライマリイングレスコンテナ | コンテナ名 |
| | イングレス設定 | `--ingress=INGRESS` | サービス呼び出しを許可するインバウンドトラフィックソースを設定。 | 全て | `all` | `all`, `internal`, `internal-and-cloud-load-balancing` |
| | 最大インスタンス数 | `--max-instances=MAX_INSTANCES` | サービスの最大コンテナインスタンス数。 | 全て | プラットフォームのデフォルト値 | 数値または`default` |
| | 最小インスタンス数 | `--min-instances=MIN_INSTANCES` | サービスの最小コンテナインスタンス数。 | 全て | 0 | 数値または`default` |
| | ターゲットプラットフォーム | `--platform=PLATFORM` | コマンドを実行するターゲットプラットフォーム。 | 全て | `managed` | `managed`, `gke`, `kubernetes` |
| | サービスアカウント | `--service-account=SERVICE_ACCOUNT` | リビジョンに関連付けられたサービスアカウント。 | 全て | プロジェクトまたはKubernetes名前空間のデフォルトサービスアカウント | サービスアカウントのメールアドレス(Managed)またはKubernetesサービスアカウント名(GKE, Kubernetes) |
| | トラフィックタグ | `--tag=TAG` | 新しく作成されたリビジョンに割り当てるトラフィックタグ。 | 全て | - | タグ名 |
| | タイムアウト時間 | `--timeout=TIMEOUT` | 最大リクエスト実行時間 (タイムアウト)。 | 全て | - | 時間 (例: `10m5s`) |
| | トラフィック無効化 | `--no-traffic` | デプロイされるリビジョンへのトラフィック送信を回避。 | 全て | False | True |
| **コンテナフラグ** | | | | | | |
| | ボリュームマウント追加 | `--add-volume-mount=[volume=NAME,mount-path=MOUNT_PATH,…]` | 現在のコンテナにマウントを追加。 | 全て | - | `volume=NAME,mount-path=/PATH` |
| | 引数 | `--args=[ARG,…]` | コンテナイメージによって実行されるコマンドに渡される引数。 | 全て | コンテナイメージのデフォルトコマンド | 引数 |
| | ボリュームマウント削除 | `--clear-volume-mounts` | 現在のコンテナから既存のマウントをすべて削除。 | 全て | - | - |
| | エントリポイント | `--command=[COMMAND,…]` | コンテナイメージのエントリポイント。 | 全て | コンテナイメージのデフォルトエントリポイント | コマンド |
| | CPU制限 | `--cpu=CPU` | Kubernetes CPU単位でのCPU制限。 | 全て | - | CPU (例: `2`, `2.0`, `2000m`, `.5`, `500m`) |
| | コンテナ依存関係 | `--depends-on=[CONTAINER,…]` | 現在のコンテナに追加するコンテナの依存関係のリスト。 | 全て | - | コンテナ名 |
| | メモリ制限 | `--memory=MEMORY` | メモリ制限。 | 全て | - | メモリサイズ (例: `1024Mi`, `4Gi`) |
| | ポート番号 | `--port=PORT` | リクエストを受信するコンテナポート。 | 全て | - | ポート番号 |


## gcloud beta run deploy コマンド説明

| 項目名 | フラグ | 説明 | 適用プラットフォーム | デフォルト値 | 設定値 |
|---|---|---|---|---|---|
| **サービスリソース** | | デプロイ先のサービス。このグループの引数は、このリソースの属性を指定するために使用できます。 | | | |
| サービス名 | `[SERVICE]` | サービスのIDまたは完全修飾名。 | 全て | | サービス名 |
| 名前空間 | `--namespace=NAMESPACE` | Anthos 用 Cloud Run に固有: サービスの Kubernetes 名前空間。 | GKE, Kubernetes | Cloud Run for Kubernetes Engine の場合、「default」。それ以外の場合はプロジェクト ID。 | 名前空間名 |
| **フラグ** | | | | | |
| 非同期 | `--async` | 実行中の処理が完了するのを待たずに、すぐに返します。 | 全て | | |
| 並行性 | `--concurrency=CONCURRENCY` | コンテナインスタンスごとに許可される最大同時リクエスト数を設定します。並行性を指定しないか、特別な値 'default' を指定すると、サーバーのデフォルト値が使用されます。 | 全て | | 数値 |
| コンテナ名 | `--container=CONTAINER` | 名前でコンテナを指定します。--container に続くフラグは、指定されたコンテナに適用されます。 | 全て | | コンテナ名 |
| イングレス | `--ingress=INGRESS; default="all"` | サービスの呼び出しを許可するインバウンドトラフィックソースを設定します。Cloud Run (フルマネージド) の場合、`--[no-]allow-unauthenticated` フラグは、サービスの呼び出しを許可する ID を個別に制御します。`INGRESS` は以下のいずれかである必要があります。 | 全て | all | all, internal, internal-and-cloud-load-balancing |
| | | * all: すべてのソースからのインバウンドリクエストが許可されます。 | | |
| | | * internal: Cloud Run (フルマネージド) の場合、同じプロジェクトまたは VPC Service Controls ペリメータ内の VPC ネットワークからのインバウンドリクエスト、および同じプロジェクトまたは VPC Service Controls ペリメータ内の Pub/Sub サブスクリプションと Eventarc イベントのみが許可されます。その他のすべてのリクエストは拒否されます。Cloud Run (フルマネージド) の内部トラフィックの定義の詳細については、https://cloud.google.com/run/docs/securing/ingress を参照してください。Anthos 用 Cloud Run の場合、同じクラスターからのインバウンドリクエストのみが許可されます。 | | |
| | | * internal-and-cloud-load-balancing: Cloud Run (フルマネージド) でのみサポートされています。Google Cloud Load Balancing または internal オプションで許可されているトラフィックソースからのインバウンドリクエストのみが許可されます。 | | |
| 最大インスタンス数 | `--max-instances=MAX_INSTANCES` | 実行するサービスのコンテナインスタンスの最大数。制限を解除してプラットフォームのデフォルトを使用するには、「default」を使用します。 | 全て | | 数値 |
| 最小インスタンス数 | `--min-instances=MIN_INSTANCES` | 実行するサービスのこのリビジョンのコンテナインスタンスの最小数。最小値を削除するには、「default」を指定します。 | 全て | | 数値 |
| プラットフォーム | `--platform=PLATFORM; default="managed"` | コマンドを実行するためのターゲットプラットフォーム。または、プロパティ [run/platform] を設定します。`PLATFORM` は以下のいずれかである必要があります。 | 全て | managed | managed, gke, kubernetes |
| | | * managed: フルマネージドバージョンの Cloud Run。`--region` フラグを使用するか、[run/region] プロパティを設定して、Cloud Run リージョンを指定します。 | | |
| | | * gke: Google Cloud 上の Anthos 用 Cloud Run。`--cluster` および `--cluster-location` フラグを使用するか、[run/cluster] および [run/cluster_location] プロパティを設定して、特定のゾーンのクラスターを指定します。 | | |
| | | * kubernetes: Knative 互換の Kubernetes クラスターを使用します。`--kubeconfig` および `--context` フラグを使用して、kubeconfig ファイルと接続のコンテキストを指定します。 | | |
| プラットフォーム | `--platform` | コマンドを実行するターゲットプラットフォーム。代わりに、プロパティ [run/platform] を設定することもできます。 | 全て | `managed` | - `managed`: フルマネージド版の Cloud Run。`--region` フラグを使用するか、[run/region] プロパティを設定して Cloud Run リージョンを指定します。<br> - `gke`: Google Cloud 上の Anthos 向け Cloud Run。`--cluster` および `--cluster-location` フラグを使用するか、[run/cluster] および [run/cluster_location] プロパティを設定して、特定のゾーンにあるクラスタを指定します。<br> - `kubernetes`: Knative 互換の Kubernetes クラスタを使用します。`--kubeconfig` および `--context` フラグを使用して、kubeconfig ファイルと接続に使用するコンテキストを指定します。 |
| リージョン | `--region` | リソースが存在するリージョン。代わりに、プロパティ [run/region] を設定することもできます。 | `managed` | | リージョン名 |
| クラスタ | `--cluster` | 接続する Kubernetes Engine クラスタの ID または完全修飾識別子。 | `gke` | | クラスタ名 |
| クラスタロケーション | `--cluster-location` | クラスタが存在するゾーン。代わりに、プロパティ [run/cluster_location] を設定することもできます。 | `gke` | | ゾーン名 |
| コンテキスト | `--context` | 接続に使用する kubectl 設定ファイル内のコンテキストの名前。 | `kubernetes` | | コンテキスト名 |
| Kubeconfig ファイル | `--kubeconfig` | kubectl 設定ファイルの絶対パス。指定しない場合、$KUBECONFIG で指定されたコロンまたはセミコロン区切りのパスリストが使用されます。$KUBECONFIG が設定されていない場合、デフォルトは ~/.kube/config です。 | `kubernetes` | | ファイルパス |
