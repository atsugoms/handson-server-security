# Server Security Hands-on

![cover](./images/coverimage.png)

## 目的

本ハンズオンを通して サーバーサイド の セキュリティ強化方法 について学びます。


## 目標

サーバーサイドのセキュリティ強化にかかわる以下のソリューションの扱いについて学習します。

- Defender for Cloud
- Azure Update Manager
- Microsoft Sentinel
- Microsoft Security Copilot


## 対象

以下のような方を対象として想定しています。

- クラウド管理者​
- クラウドアーキテクト​
- ネットワークエンジニア​
- セキュリティ管理者​
- セキュリティアーキテクト


## 前提条件

- ハンズオンを実施するためには サブスクリプション が必要です。
- 本ハンズオン用にサブスクリプションを用意するのが推奨です。
  既存サブスクリプションを再利用する場合、 Defender for Cloud の設定が既存システムに影響します。


## ハンズオン 目次

事前準備
1. [ハンズオン環境準備](./docs/00-init-infra.md)

ハンズオン手順

- Defender for Cloud
    1. [Defender for Cloud の適用](./docs/10-defender.md)
    1. [Defender for Cloud の活用](./docs/20-defender.md)
- Azure Update Manager
    1. [Update Manager の利用](./docs/30-updatemanager.md)
- Microsoft Sentinel
    1. [Microsoft Sentinel の構築](./docs/40-sentinel.md)
    1. [Microsoft Sentinel へログの集約](./docs/50-dataconnector.md)
    1. [UEBAの有効化](./docs/60-ueba.md)
    1. [Microsoft Sentinel を使った インシデント対応](./docs/70-sentinel.md)
- Microsoft Security Copilot
    1. [Microsoft Security Copilot の活用](./docs/80-copilotforsecurity.md)

