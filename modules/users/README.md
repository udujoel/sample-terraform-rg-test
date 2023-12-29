
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
