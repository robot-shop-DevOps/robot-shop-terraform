azuread_group = [
    {
        display_name     = "robotshop-dev-platformadmin"
        security_enabled = true
    },
    {
        display_name     = "robotshop-dev-devops"
        security_enabled = true
    },
    {
        display_name     = "robotshop-dev-developers"
        security_enabled = true
    },
    {
        display_name     = "robotshop-dev-web_microservice"
        security_enabled = true
    }
]

role_assignment = [
    {
        role_name            = "robotshop-dev-platformadmin-owner"
        role_definition_name = "Owner"
        scope                = "subscription"
        principal_id         = "robotshop-dev-platformadmin"
        principal_type       = "Group"
    },
    {
        role_name            = "robotshop-dev-devops-resourcegroup-reader"
        role_definition_name = "Reader"
        scope                = "resource_group"
        principal_id         = "robotshop-dev-devops"
        principal_type       = "Group"
    },
    {
        role_name            = "robotshop-dev-developers-aks-cluster-creds-reader"
        role_definition_name = "Azure Kubernetes Service Cluster User Role"
        scope                = "kubernetes_cluster"
        principal_id         = "robotshop-dev-developers"
        principal_type       = "Group"
    },
    {
        role_name            = "robotshop-dev-web_microservice-storageaccount-reader"
        role_definition_name = "Reader"
        scope                = "storage_account"
        principal_id         = "robotshop-dev-web_microservice"
        principal_type       = "Group"
    },
    {
        role_name            = "robotshop-dev-web_microservice-storageaccount-blob-data-reader"
        role_definition_name = "Storage Blob Data Reader"
        scope                = "storage_account"
        principal_id         = "robotshop-dev-web_microservice"
        principal_type       = "Group"
    }
]