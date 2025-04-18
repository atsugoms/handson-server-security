# 各種リソースの削除

#### 🗒️ 目次

1. [Microsfot Sentinel コネクタの切断](#microsfot-sentinel-コネクタの切断)
1. [検証環境の削除](#検証環境の削除)



## Microsfot Sentinel コネクタの切断

### Microsoft Defender XDR

> [!CAUTION]  
> Sentinelのリソースを先に削除してしまうと、Microsoft Defender XDR の診断設定を削除する手段がなくなる。
> 必ず Sentinel リソース削除前に Microsoft Defender XDR の接続設定は切断しておく。

接続解除

1. Azure ポータルから Sentinel を開く

1. [コンテンツ管理]-[コンテンツハブ] を開く

1. 「Microsoft Defender XDR」を選択し、「管理」を開く

1. `Microsoft Defender XDR` データコネクタ を選択して「コネクタページを開く」

1. 「イベントの接続」にある選択をすべて外して「変更の適用」

(*) 参考：実際の診断設定の場所。確認のみでここから削除は不可。

1. Defender管理センター を開く

1. 左メニューから [設定] を開き、 [Microsoft Defender XDR] を開く

1. [全般]-[ストリーミングAPI] を開き、設定されている診断設定を確認


### Microsoft Entra ID

診断設定の削除

1. Azure ポータル にて "Microsoft Entra ID" を探して開く

1. [監視]-[診断設定] を開く

1. `AzureSentinel_<Log Analytics Workspace 名前>` の診断設定を削除


### Azure アクティビティ

ポリシーの削除

1. Azure ポータル にて "Policy" を探して開く

1. [作成]-[割り当て] を開く

1. `指定された Log Analytics ワークスペース にストリーミングするように Azure アクティビティ ログを構成します` を削除

診断設定の削除

1. Azure ポータルにて "監視(Monitor)" を探して開く

1. [アクティビティログ] を開く

1. 「診断設定」を開く

1. `subscriptionToLa` を削除


### Microsoft Defender for Cloud

接続設定を無効化

1. Azure ポータル にて Sentiinel を開く

1. [構成]-[データコネクタ] を開く

1. `Subscription-based Microsoft Defender for Cloud` を開く

1. 接続しているサブスクリプションを選択して「Disconnect」


### Windows Security イベント

1. Azure ポータルにて "監視(Monitor)" を探して開く

1. [設定]-[データ収集ルール] を開く

1. 作成したデータ収集ルールを選択して削除


## 検証環境の削除

デプロイ済みの仮想マインおよび仮想ネットワークを削除。

Sentinel 含めて削除する場合、リソースグループごと削除。
