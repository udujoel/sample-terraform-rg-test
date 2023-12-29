## Module Documentation

### Resource Group Module (`resource_group`)

#### Purpose
- To create and manage Azure resource groups, serving as a container for related resources.

#### Inputs
This take in a list of objects containing: 
- `name (string)`: The desired name for the resource group.
- `location = (string)` The Azure region where the resource group will be located.
- `tags (map)`: The tags to be attached to the created resources

##### Example
`
resource_groups = [
  {
    name     = "resourceGroup1"
    location = "East US"
    tags = {
      Environment = "Dev"
      Project     = "ProjectA"
      Creator     = "user1"
    }
  },
  {
    name     = "resourceGroup2"
    location = "West Europe"
    tags = {
      Environment = "Prod"
      Project     = "ProjectB"
    }

}

]
`
#### Outputs
- `resource_group_ids`: The unique identifier of the created resource groups.

##### Example
`
resource_group_ids = [  "/subscriptions/xxx/resourceGroups/resourceGroup1",  "/subscriptions/xxx/resourceGroups/resourceGroup2",  "/subscriptions/xxx/resourceGroups/resourceGroup3"]

`