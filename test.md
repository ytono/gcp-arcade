はい、以下のように校正・添削しました。

---

# Keycloak 構築手順

## Keycloak のコンテナイメージ

Keycloak のコンテナイメージは、以下のサイトで公開されています。
* 公式ページ: `quay.io/keycloak/keycloak:25.0.1`
* Docker Hub: `keycloak/keycloak:25.0.1`

プロジェクトでは Docker Hub を推奨しているため、Docker Hub から取得します。

## Keycloak コンテナイメージの Nexus Repository への登録

Docker Hub の Keycloak イメージを、Nexus リポジトリの `docker-snapshots/infr/keycloak` に手動で登録します。（〇〇様にて実施）

> 補足: GitLab パイプラインでの自動登録を試みましたが、Docker Hub からのイメージ取得に失敗し、自動登録できませんでした。〇〇 DevOps チームに確認したところ、Nexus が対応していない OCI イメージであるため、取得できないとのことでした。（2024/7/23 時点）

## Keycloak コンテナイメージの Artifact Registry への登録

GitLab のパイプラインを利用して、Keycloak のコンテナイメージをカスタマイズし、Google Cloud の Artifact Registry に登録します。

### Keycloak コンテナイメージのカスタマイズ

Keycloak コンテナイメージのカスタマイズ（ログイン画面の変更、プラグインの追加）を行うため、パイプラインの build ステップを構築し、実行します。

### カスタマイズした Keycloak コンテナイメージを Artifact Registry に登録

Artifact Registry に登録するため、パイプラインの push ステップを構築し、実行します。

## Keycloak のデータベース作成

Keycloak 用のデータベースを AlloyDB 上に作成します。

```
psql -U postgres -h xxx.xxx.xxx.xxx
```

```sql
CREATE USER keycloak with CREATEDB PASSWORD 'passkey';
GRANT alloydbsuperuser to keycloak;
\c postgresql keycloak
create database keycloak;
```

## Cloud Run へのデプロイメント

Keycloak のベースイメージには、UBI micro images (`ubi-micro`) を使用しています。このイメージにソフトウェアを追加する際は、`buildah` コマンドを使用します。詳細は以下のページを参照してください。

### Image Layer の一覧

[https://hub.docker.com/layers/keycloak/keycloak/latest/images/sha256-37ab95271a5607ae06d7f82efaeaaedf995a8b62859b3c9eed32174b31ccb796?context=explore](https://hub.docker.com/layers/keycloak/keycloak/latest/images/sha256-37ab95271a5607ae06d7f82efaeaaedf995a8b62859b3c9eed32174b31ccb796?context=explore)
```
LABEL name="ubi9/ubi-micro"
LABEL version="9.5"
```

### Buildah のインストール手順

[https://github.com/containers/buildah/blob/main/install.md](https://github.com/containers/buildah/blob/main/install.md)

### Podman のインストール

[https://podman.io/docs](https://podman.io/docs)

### UBI コンテナへのソフトウェア追加方法

[https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/building_running_and_managing_containers/assembly_adding-software-to-a-ubi-container_building-running-and-managing-containers#using-the-ubi-init-images_assembly_adding-software-to-a-ubi-container](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/building_running_and_managing_containers/assembly_adding-software-to-a-ubi-container_building-running-and-managing-containers#using-the-ubi-init-images_assembly_adding-software-to-a-ubi-container)

```bash
# Ubuntu 20.10 以降
sudo apt-get -y update
sudo apt-get -y install buildah
```

```bash
# Ubuntu 20.10 以降
sudo apt-get update
sudo apt-get -y install podman
```
