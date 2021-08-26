# TerraformConfig
Configuration files for deployment with Terraform and Pipeline definitions
| Status |
|:--:|
|[![Board Status](https://dev.azure.com/wesleytrust/e877378a-4a78-460d-bcc8-36cef3decd0e/4f6e88ab-5c49-41c2-94c2-7429981e9a8a/_apis/work/boardbadge/928ae330-92c8-4f3e-8f73-2692da0ab73a?columnOptions=1)](https://dev.azure.com/wesleytrust/e877378a-4a78-460d-bcc8-36cef3decd0e/_boards/board/t/4f6e88ab-5c49-41c2-94c2-7429981e9a8a/Microsoft.EpicCategory/)|

## Services
| Root Module | Deployment Module  | main  | develop |
|:---|:---|:----: | :-----: |
| Directory Services | Windows_virtual_machine <br>Network_peering<br>Recovery_services |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DirectoryServices/SVC-CP%3BENV-P%3B%20Directory%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=41&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DirectoryServices/SVC-CP%3BENV-D%3B%20Directory%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=44&branchName=develop)|
| File Services | Windows_virtual_machine <br>Network_peering<br>Storage_sync<br>Recovery_services |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/FileServices/SVC-CP%3BENV-P%3B%20File%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=42&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/FileServices/SVC-CP%3BENV-D%3B%20File%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=45&branchName=develop)|
| Edge Services | Linux_virtual_machine <br>Network_peering<br>Recovery_services |[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/EdgeServices/SVC-NW%3BENV-P%3B%20Edge%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=43&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/EdgeServices/SVC-NW%3BENV-D%3B%20Edge%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=46&branchName=develop)|
| Management Services | Windows_virtual_machine <br>Network_peering<br>Recovery_services<br>Traffic_manager|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/ManagementServices/SVC-CP%3BENV-P%3B%20Management%20Services?branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=47&branchName=main)|[![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/ManagementServices/SVC-CP%3BENV-D%3B%20Management%20Services?branchName=develop)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=50&branchName=develop)|

## Modules
### Deployments
| Parent Module | Required Dependencies | Optional Dependencies
| :---------------------- | :---------------------- | :---------------------- |
| Resource_group      |  |
| Network_peering    | |
| Static_site       | Resource_group |
| Traffic_manager     | Resource_group |
| Storage_sync    | Resource_group |
| Recovery_services    | Resource_group |
| Windows_virtual_machine | Resource_group<br>Key_vault<br>Network<br>Network_interfaces | Disks<br>Public_load_balancer |
| Linux_virtual_machine  | Resource_group<br>Key_vault<br>Network<br>Network_interfaces | Disks<br>Public_load_balancer |

### Resources
| Child Module |
| :---------------------- |
| Disks |
| Key_vault |
| Network |
| Network_interfaces |
| Public_load_balancer |