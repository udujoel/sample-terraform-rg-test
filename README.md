
# Terraform Project Documentation

## Project Overview

This Terraform project provisions:
- 3 Resource Groups
- 2 Users
- 2 User Roles 
The two User roles are 'Contributor' and 'Reader', and are each assigned to a different user. The scope of the roles are the 3 resource groups.

This Project focuses on creating Azure Resource Groups and managing user roles within those groups. It uses Terraform modules to achieve better modularity and reusability, allowing for scalable and manageable IaC.

### Key Features:
- **Resource Group Management**: Automated creation of Azure resource groups.
- **User Management**: Creation of Azure AD users and assignment of roles within resource groups.
- **Modular Design**: Separate modules for resource groups and users to enhance maintainability.
- **Flexibility**: Secure handling of sensitive information and flexible configuration through variables.

## Design Decisions

### Module Utilization
- **Resource Group Module**: Holds the logic for creating Azure resource groups, with focus on promoting reusability.
- **User Module**: Manages Azure AD user creation and role assignments, allowing for consistent and automated user management across resource groups.

### Configuration Flexibility
- **Variables**: Extensive use of input variables provides the flexibility to customize resources like names, locations, and user roles, facilitating adaptability to different deployment scenarios.

### Output Values
- Selected outputs like resource group IDs and user principal IDs are exposed to enable integration with other Terraform configurations or modules.


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
resource_group_ids = [  "/subscriptions/xxx/resourceGroups/resourceGroup1",  
                        "/subscriptions/xxx/resourceGroups/resourceGroup2",  
                        "/subscriptions/xxx/resourceGroups/resourceGroup3"
                     ]

`
### User Module (`users`)

#### Purpose
- To create Azure AD users and assign them specific roles within the resource groups. A user can be assigned to multiple scopes/resource group IDs. The scope(s) is sent as a list while it is being called.

#### Inputs
- `user_details`: Object containing user(s) attributes (display name, password, principal name).
- `role_scopes`: List of resource group IDs where the user will have the specified role.

##### Example
`
User Details:

users = {
  user1 = {
    display_name     = "User1"
    password         = "password123"
    principal_name   = "user1@email.onmicrosoft.com"
    role             = "Contributor"
  },
  user2 = {
    display_name     = "User2"
    password         = "password456"
    principal_name   = "user2@email.onmicrosoft.com"
    role             = "Reader"
  }
}


Role Scopes:

role_scopes = [  "/subscriptions/xxx/resourceGroups/resourceGroup1",  
                        "/subscriptions/xxx/resourceGroups/resourceGroup2",  
                        "/subscriptions/xxx/resourceGroups/resourceGroup3"
                     ]

`

#### Outputs
- `user_principal_id`: The principal ID of the created Azure AD user, useful for further identity and access management.
- `user_principal_name`: UPN of created user

##### Example
`
Outputs:

user_object_id = "00000000-1111-2222-3333-000000000000"
user_principal_name = "user1@email.onmicrosoft.com"

`

## Project Usage

### Prerequisites
- Terraform installed and configured.
- Azure provider set up with appropriate credentials.
- You can add a .tfvars file with your environment's configs and resource specs

### Steps for Usage
1. **Initialization**:
   - Run `terraform init` to initialize the project, installing required providers.

2. **Configuration**:
   - Set input variables either through `*.tfvars`, environment variables, Azure DevOps Secrets, etc.

3. **Planning**:
   - Execute `terraform plan` (or `terraform plan -var-file="*.tfvars"` if you're using .tfvars) to preview the changes Terraform will make.

4. **Applying**:
   - Run `terraform apply` (or `terraform apply -var-file="*.tfvars"` if you're using .tfvars) to apply the changes and create the resources.

5. **Viewing Outputs**:
   - After successful apply, view the outputs for resource IDs and user details.

