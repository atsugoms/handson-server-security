# Ex05: Microsoft Sentinel へログの集約

#### ⏳ 推定時間

- 20 ~ 30分

#### 💡 学習概要

攻撃者は [MITR ATT&CK](https://attack.mitre.org/) に定義されるような戦術や技術を用いて攻撃を行ってきます。
今回はその流れを簡略化した以下のような流れに沿って必要な脅威検出の情報を集約していきます。

1. 特定個人への攻撃
    - 攻撃者は標的とする個人に対してフィッシングやソーシャルエンジニアリングを用いて最初の侵入を試みます。
    - Defender XDR (Defender for Endpoint)
1. 社内情報を捜索
    - 侵入後、攻撃者はアクセス可能なネットワークやファイルを探索し、重要な情報やシステム構造を把握します。
    - Entra ID singin log
1. 管理権限の奪取
    - 次に、攻撃者は権限昇格の技術を用いて、管理者アカウントやシステム全体へのアクセスを取得します。
    - Azure Activity log
1. サーバーへの攻撃
    - 最終的に、攻撃者は主要サーバーに対して攻撃を行い、データの窃取や破壊、ランサムウェアの展開などを実行します。
    - Defender for Cloud
    - Windows Security Events


#### 🗒️ 目次

<!--
1. [Microsoft Defender XDR コネクタの有効化 (オプション)](#microsoft-defender-xdr-コネクタの有効化-オプション)
-->
1. [Microsoft Entra ID コネクタの有効化](#microsoft-entra-id-コネクタの有効化)
1. [Azure アクティビティ コネクタの有効化](#azure-アクティビティ-コネクタの有効化)
1. [Microsoft Defender for Cloud コネクタの有効化](#microsoft-defender-for-cloud-コネクタの有効化)
1. [Windows Security イベント コネクタの有効化](#windows-security-イベント-コネクタの有効化)

> [!WARNING]  
> Microsoft Defender XDR, Microsoft Entra ID, Azure アクティビティ 
> に関してはテナント全体が Log Analytics ワークスペース へ保管されます。
> 保管されるデータ容量および発生するコストにご注意ください。

> [!NOTE]  
> Microsoft 365 E5 利用による特典は以下を参照
> - [Microsoft 365 E5、A5、F5、G5 のお客様向けの Microsoft Sentinel 特典](https://azure.microsoft.com/ja-jp/pricing/offers/sentinel-microsoft-365-offer)

<!--
## Microsoft Defender XDR コネクタの有効化 (オプション)

Microsoft Defender XDR はエンドポイント、ID、メール、アプリケーションを保護し、巧妙な脅威の検出、防止、調査、自動的な対応に役立つ情報を提供します。
本手順では [Microsoft Defender XDR コネクタ](https://learn.microsoft.com/azure/sentinel/data-connectors/microsoft-defender-xdr) を有効化します。

1. Azure ポータルを開き、 Sentinel の ハンズオンで利用するワークスペースを開く

1. [コンテンツ管理]-[コンテンツハブ] を開く

    ![](../images/ex05/001-defenderxdr.png)

1. `Microsoft Defender XDR` を検索して選択、「インストール」

    ![](../images/ex05/002-defenderxdr.png)

1. インストール後、「管理」を開く

    ![](../images/ex05/003-defenderxdr.png)

1. `Microsoft Defender XDR` データコネクタ を選択、「コネクタページを開く」を選択

    ![](../images/ex05/004-defenderxdr.png)

1. 構成にある「インシデントとアラートを接続する」を検索して選択

    ![](../images/ex05/005-defenderxdr.png)

1. 構成にある「イベントの接続」で「Microsoft Defender for Endpoint」をすべて選択して「変更の適用」

    ![](../images/ex05/006-defenderxdr.png)
-->

## Microsoft Entra ID コネクタの有効化

監査およびサインインのログを Microsoft Sentinel に接続して、Microsoft Entra ID に関する分析情報を得ます。
本手順では [Microsoft Entra ID コネクタ](https://learn.microsoft.com/azure/sentinel/data-connectors/microsoft-entra-id) を有効化します。

1. Azure ポータルを開き、 Sentinel の ハンズオンで利用するワークスペースを開く

1. [コンテンツ管理]-[コンテンツハブ] を開く

    ![](../images/ex05/101-entraid.png)

1. `Microsoft Entra ID` を検索して選択、「インストール」

    ![](../images/ex05/102-entraid.png)

1. インストール後、「管理」を開く

    ![](../images/ex05/103-entraid.png)

1. `Microsoft Entra ID` のデータコネクタを選択して「コネクタページを開く」を選択

    ![](../images/ex05/104-entraid.png)

1. 構成から以下のログを選択して「変更の適用」

    - Sign-In Logs
    - Audit Logs (監査ログ)
    - Non-Interactive User Sign-In Log
    - Service Principal Sign-In Logs
    - Managed Identity Sign-In Logs
    - Provisioning Logs
    - ADFS Sign-In Logs
    - Risky User (危険なユーザー)

    ![](../images/ex05/105-entraid.png)


## Azure アクティビティ コネクタの有効化

Azureで発生するイベント（リソースに対する操作）をSentinelへ収集します。
本手順では [Azure アクティビティ コネクタ](https://learn.microsoft.com/azure/sentinel/data-connectors/azure-activity) を有効化します。

1. Azure ポータルを開き、 Sentinel の ハンズオンで利用するワークスペースを開く

1. [コンテンツ管理]-[コンテンツハブ] を開く

    ![](../images/ex05/201-azureactivity.png)

1. `Azure Activity` を検索して選択、「インストール」

    ![](../images/ex05/202-azureactivity.png)

1. インストール後、「管理」を開く

    ![](../images/ex05/203-azureactivity.png)

1. `Azure Activity` コネクタを選択して「コネクタページを開く」

    ![](../images/ex05/204-azureactivity.png)

1. 構成にある「Azure Policy の割り当てウィザードの起動」を選択

    ![](../images/ex05/205-azureactivity.png)

1. Azure ポリシーの作成

    1. 基本

        - スコープ： (本ハンズオンで利用するサブスクリプション)
        - 割り当て名： `指定された Log Analytics ワークスペースにストリーミングするように Azure アクティビティ ログを構成します` (デフォルトまま)

        ![](../images/ex05/206-azureactivity.png)

    1. 詳細

        デフォルトまま

        ![](../images/ex05/207-azureactivity.png)

    1. パラメーター

        - プライマリ Log Analytics ワークスペース； （Sentinelワークスペースに利用している Log Analytics ワークスペース）

        ![](../images/ex05/208-azureactivity.png)

    1. 修復

        - 修復タスクを作成する: `有効`
            - 修復するポリシー: `指定された Log Analytics ワークスペースにストリーミングするように Azure アクティビティ ログを構成します`
        - マネージドIDを作成する: `有効`
            - マネージドIDの種類: `システム割り当てマネージドID`
            - システム割り当てIDの場所: (リソースグループと同じ)

        ![](../images/ex05/209-azureactivity.png)

    1. 非準拠メッセージ

        空欄（デフォルトまま）

        ![](../images/ex05/210-azureactivity.png)

    1. 確認および作成

        作成するポリシー概要を確認して「作成」

        ![](../images/ex05/211-azureactivity.png)



## Microsoft Defender for Cloud コネクタの有効化

Azure、ハイブリッド、マルチクラウドのワークロード全体の脅威検出を Sentinel へ統合します。
本手順では [Microsoft Defender for Cloud コネクタ](https://learn.microsoft.com/azure/sentinel/data-connectors/tenant-based-microsoft-defender-for-cloud) を有効化します。

1. Azure ポータルを開き、 Sentinel の ハンズオンで利用するワークスペースを開く

1. [コンテンツ管理]-[コンテンツハブ] を開く

    ![](../images/ex05/301-defenderforcloud.png)

1. `Microsoft Defender for Cloud` を検索して選択、「インストール」

    ![](../images/ex05/302-defenderforcloud.png)

1. インストール後、「管理」を開く

    ![](../images/ex05/303-defenderforcloud.png)

1. `Subscription-based Microsoft Defender for Cloud (Legacy)` コネクタを選択して「コネクタページを開く」を選択

    ![](../images/ex05/304-defenderforcloud.png)

1. 構成から接続したいサブスクリプションのステータスを選択して接続に変更

    ![](../images/ex05/305-defenderforcloud.png)


## Windows Security イベント コネクタの有効化

Azure Monitor Agent を用いて Windows のセキュリティイベントを Sentinel へ統合します。
本手順では [Windows Security イベント コネクタ](https://learn.microsoft.com/azure/sentinel/data-connectors/windows-security-events-via-ama) を有効化します。

1. Azure ポータルを開き、 Sentinel の ハンズオンで利用するワークスペースを開く

1. [コンテンツ管理]-[コンテンツハブ] を開く

    ![](../images/ex05/401-winsecevt.png)

1. `Windows Security Events` を検索して選択、「インストール」

    ![](../images/ex05/402-winsecevt.png)

1. インストール後、「管理」を開く

    ![](../images/ex05/403-winsecevt.png)

1. `Windows Security Events via AMA` コネクタを選択して「コネクタページを開く」を選択

    ![](../images/ex05/404-winsecevt.png)

1. 構成にある「Create data collection rule」を選択

    ![](../images/ex05/405-winsecevt.png)

1. データ収集ルールを作成

    1. 基本

        - ルール名: (任意)
        - サブスクリプション: (本ハンズオンで利用しているサブスクリプション)
        - リソースグループ: (本ハンズオンで利用しているリソースグループ)

        ![](../images/ex05/406-winsecevt.png)

    1. リソース

        - 本ハンズオンで利用している仮想マシンのみ選択

        ![](../images/ex05/407-winsecevt.png)

    1. 収集

        - `すべてのセキュリティイベント (All Security Events)`

        ![](../images/ex05/408-winsecevt.png)

    1. 確認と作成

        設定内容を確認して「作成」

        ![](../images/ex05/409-winsecevt.png)


## 接続済みデータコネクタの確認

1. Azure ポータルを開き、 Sentinel の ハンズオンで利用するワークスペースを開く

1. [構成]-[データコネクタ] を開く

    ![](../images/ex05/501-dataconnector.png)

1. 設定した接続が有効になっていることを確認

    - Defender for XDR
    - Microsoft Entra ID
    - Azure Activity
    - Subscription-based Microsoft Defender for Cloud
    - Windows Security Events via AMA

    ![](../images/ex05/502-dataconnector.png)
