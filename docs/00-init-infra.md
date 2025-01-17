# 前提環境の構築

1. Azure ポータルを開く

    https://portal.azure.com/

1. Cloud Shell (Bash) を起動

    (*) PowerShell になっている場合、 Bash に切り替える

    ![](../images/ex00/0001-cloudshell.png)

1. [設定]-[クラシックバージョンに移動]

    ![](../images/ex00/0002-cloudshell.png)

1. リポジトリをクローン

    ```
    git clone https://github.com/atsugoms/handson-server-security.git
    ```

1. `infra` フォルダへ移動

    ```
    cd ./handson-server-security/infra/
    ```

1. 変数ファイルを作成

    ```
    code ./terraform.tfvars
    ```

    ファイルの内容は以下の通り

    `/infra/terraform.tfvars`
    ```
    project         = "<PROJECT_NAME>"
    environment     = "<ENVIRONMENT_NAME>"
    vm_username     = "<YOUR_VM_USERNAME>"
    vm_password     = "<YOUR_VM_PASSWORD>"
    subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    tenant_id       = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    ```

<!--
1. Azure へログイン

    ```
    az login --use-device-code
    ```
-->

1. サブスクリプションの選択 

    ```
    az account set --subscription <SUBSCRIPTION_ID>
    ```

1. リソースのデプロイ

    ```
    terraform init
    terraform apply
    ```
