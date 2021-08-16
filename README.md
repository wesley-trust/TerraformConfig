# TerraformConfig
Configuration files for deployment with Terraform and Pipeline definitions
## Services
| Root Module | Deployment Module  | main  | develop |
|:---|:---|:----: | :-----: |
| Directory Services | Windows_virtual_machine <br>Recovery_services |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DirectoryServices/SVC-CP%3BENV-P%3B%20Directory%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=41&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DirectoryServices/SVC-CP%3BENV-D%3B%20Directory%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=44&branchName=develop)|
| File Services | Windows_virtual_machine <br>Storage_sync <br>Recovery_services |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/FileServices/SVC-CP%3BENV-P%3B%20File%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=42&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/FileServices/SVC-CP%3BENV-D%3B%20File%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=45&branchName=develop)|
| Edge Services | Linux_virtual_machine <br>Recovery_services |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/EdgeServices/SVC-NW%3BENV-P%3B%20Edge%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=43&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/EdgeServices/SVC-NW%3BENV-D%3B%20Edge%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=46&branchName=develop)|
| Management Services | Windows_virtual_machine <br>Recovery_services<br>Traffic_manager|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/ManagementServices/SVC-CP%3BENV-P%3B%20Management%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=47&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/ManagementServices/SVC-CP%3BENV-D%3B%20Management%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=50&branchName=develop)|

## Modules
### Deployments
| Parent Module | Required Dependencies | Optional Dependencies
| :---------------------- | :---------------------- | :---------------------- |
| Resource_group      |  |
| Static_site       | Resource_group |
| Traffic_manager     | Resource_group |
| Storage_sync    | Resource_group |
| Recovery_services    | Resource_group |
| Windows_virtual_machine | Resource_group<br>Key_vault<br>Network<br>Network_peering<br>Network_interfaces | Disks<br>Public_load_balancer |
| Linux_virtual_machine  | Resource_group<br>Key_vault<br>Network<br>Network_peering<br>Network_interfaces | Disks<br>Public_load_balancer |

### Resources
| Child Module |
| :---------------------- |
| Disks |
| Key_vault |
| Network |
| Network_peering |
| Network_interfaces |
| Public_load_balancer |