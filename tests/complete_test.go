package main

import (
	"github.com/gruntwork-io/terratest/modules/test-structure"
	"testing"
)

func TestRoute53HealthCheck(t *testing.T) {
	t.Parallel()

	hcTfDir := "../examples/complete"

	defer test_structure.RunTestStage(t, "teardown", func() { teardown(t, hcTfDir) })
	test_structure.RunTestStage(t, "deploy", func() { deploy(t, hcTfDir, map[string]interface{}{}) })
}
