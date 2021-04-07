package test

import (
	"crypto/tls"
	"fmt"
	"testing"
	"regexp"
	"github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestWebserverModule(t *testing.T) {

	opts := &terraform.Options{
		TerraformDir: "./",
	}

	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)
	
	webserversIp := terraform.OutputRequired(t, opts, "access_ip")
	a := regexp.MustCompile(`\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}`)
	ip_addrs := a.FindAllString(webserversIp, -1)
	expectedStatus := 200
	for _, ip_addr := range ip_addrs{
		url := fmt.Sprintf("http://%s", ip_addr)
		statusCode, _ := http_helper.HttpGet(t, url, &tls.Config{})
		if statusCode != expectedStatus {
			t.Fatal("Test Failed!")
			break
		}
	}
}
