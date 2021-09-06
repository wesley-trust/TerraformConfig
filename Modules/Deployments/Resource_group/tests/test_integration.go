package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestIntegrationExample(t *testing.T) {
	t.Parallel()

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where the Terraform code is located
		TerraformDir: "../examples/",
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	output := terraform.Output(t, terraformOptions, "resourceGroupName")
	assert.Equal(t, "Services-Test-UKS-01-rg", output)
}