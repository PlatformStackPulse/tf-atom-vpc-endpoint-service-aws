# Unit Tests for tf-atom-vpc-endpoint-service-aws
#
# These tests use a mock AWS provider — no real AWS calls are made.
# Run with:         terraform test -test-directory=tests/unit
# Run verbose:      terraform test -test-directory=tests/unit -verbose
# Run one test:     terraform test -test-directory=tests/unit -run "creates_when_enabled"
#
# NOTE: Assertions target plan-KNOWN values only (the tf-label id string,
# resource count, and input pass-throughs). Computed attributes such as the
# endpoint service arn/id/service_name are UNKNOWN under a mock provider and
# must not be asserted on at plan time.

mock_provider "aws" {}

variables {
  # tf-label context
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  # module-specific inputs
  #
  # The AWS provider requires the *_load_balancer_arns attributes to have at
  # least one item when present; an empty list ([], the module default) fails
  # provider schema validation. Passing null omits the attribute entirely, so
  # only the NLB attribute is sent to the resource.
  acceptance_required        = true
  network_load_balancer_arns = ["arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/net/eg-test-nlb/0123456789abcdef"]
  gateway_load_balancer_arns = null
  supported_ip_address_types = ["ipv4"]
}

# ---------------------------------------------------------------------------
# Test: module creates the endpoint service when enabled (default)
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = output.enabled == true
    error_message = "Module should be enabled by default"
  }

  assert {
    condition     = length(aws_vpc_endpoint_service.default) == 1
    error_message = "Exactly one aws_vpc_endpoint_service should be planned when enabled"
  }

  assert {
    condition     = aws_vpc_endpoint_service.default[0].acceptance_required == true
    error_message = "acceptance_required input should pass through to the resource"
  }

  assert {
    condition     = module.this.id == "eg-test-thing"
    error_message = "tf-label id should be namespace-stage-name (eg-test-thing)"
  }
}

# ---------------------------------------------------------------------------
# Test: module creates nothing when disabled
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = length(aws_vpc_endpoint_service.default) == 0
    error_message = "No endpoint service should be planned when enabled = false"
  }

  assert {
    condition     = output.enabled == false
    error_message = "enabled output should be false when disabled"
  }
}
