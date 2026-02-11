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
        name                 = "platform-admin-owner"
        role_definition_name = "Owner"
        scope                = "subscription"
        principal_id         = "robotshop-dev-platformadmin"
        principal_type       = "group"
    },
    {
        name                 = "dev-devops-resource-group-read"
        role_definition_name = "Reader"
        scope                = "resource_group"
        principal_id         = "robotshop-dev-devops"
        principal_type       = "group"
    },
    {
        name                 = "dev-developers-aks-cluster-credential-read"
        role_definition_name = "Azure Kubernetes Service Cluster User Role"
        scope                = "kubernetes_cluster"
        principal_id         = "robotshop-dev-developers"
        principal_type       = "group"
    },
    {
        name                 = "dev-web_microservice-storage_account-read"
        role_definition_name = "Reader"
        scope                = "storage_account"
        principal_id         = "robotshop-dev-web_microservice"
        principal_type       = "group"
    },
    {
        name                 = "dev-web_microservice-storage_account-blob-read"
        role_definition_name = "Storage Blob Data Reader"
        scope                = "storage_account"
        principal_id         = "robotshop-dev-web_microservice"
        principal_type       = "group"
    }
]