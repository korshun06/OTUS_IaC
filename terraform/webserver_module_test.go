package test

import (
	"crypto/tls"
	"fmt"
	"testing"
	"github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestWebserverModule(t *testing.T) {

	opts := &terraform.Options{
		TerraformDir: "./",
	}

	defer terraform.Destroy(t, opts)
	terraform.InitAndApply(t, opts)
	webserverIp := terraform.OutputRequired(t, opts, "access_ip")
	url := fmt.Sprintf("http://%s", webserverIp)
	expectedStatus := 200
	statusCode, _ := http_helper.HttpGet(t, url, &tls.Config{})

	if statusCode != expectedStatus {
		t.Fatal("Test Failed!")
	}
}
