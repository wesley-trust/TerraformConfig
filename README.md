# TerraformConfig
Configuration files for deployment with Terraform and Pipeline definitions
## Services
| Service Root Module | Dependencies | main  | develop |
|:---| :---- | :----: | :-----: |
| Directory Services | Windows_virtual_machine
Recovery_services |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DirectoryServices/SVC-CP%3BENV-P%3B%20Directory%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=41&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DirectoryServices/SVC-CP%3BENV-D%3B%20Directory%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=44&branchName=develop)|
| File Services | Windows_virtual_machine, Recovery_services |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/FileServices/SVC-CP%3BENV-P%3B%20File%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=42&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/FileServices/SVC-CP%3BENV-D%3B%20File%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=45&branchName=develop)|
| Edge Services | Linux_virtual_machine, Recovery_services |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/EdgeServices/SVC-NW%3BENV-P%3B%20Edge%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=43&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/EdgeServices/SVC-NW%3BENV-D%3B%20Edge%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=46&branchName=develop)|
| Management Services | Windows_virtual_machine, Recovery_services, Traffic_manager  |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/ManagementServices/SVC-CP%3BENV-P%3B%20Management%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=47&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/ManagementServices/SVC-CP%3BENV-D%3B%20Management%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=50&branchName=develop)|

## Modules
### Deployments
| Deployment Parent Module | Required Dependencies | Optional Dependencies |
| :---------------------- | :---------------------- | :---------------------- |
| Resource_group      |  |
| Static_site       | Resource_group |
| Traffic_manager     | Resource_group |
| Recovery_services    | Resource_group |
| Windows_virtual_machine | Resource_group, Key_vault, Network, Network_interfaces | Disks, Public_load_balancer |
| Linux_virtual_machine  | Resource_group, Key_vault, Network, Network_interfaces | Disks, Public_load_balancer |

### Resources
| Resource Child Module |
| :---------------------- |
| Disks |
| Key_vault |
| Network |
| Network_interfaces |
| Public_load_balancer |

