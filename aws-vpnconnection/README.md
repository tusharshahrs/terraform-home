
# AWS VPC, VPN Gateway, Customer Gateway, VPN Connection, & VPN Connection Route

AWS VPC, VPN Gateway, Customer Gateway, VPN Connection, & VPN Connection Route in terraform

## Deployment

1. Terraform [format](https://www.terraform.io/docs/cli/commands/fmt.html)
   ```bash
   terraform fmt
   ```

1. Terraform [validate](https://www.terraform.io/docs/cli/commands/validate.html) for syntax errors
   ```bash
   terraform valiate
   ```

1. Terraform [apply](https://www.terraform.io/docs/cli/commands/apply.html)

   ```bash
   terraform apply
   ```


1. View the outputs.
   ```bash
   terraform output
   ```

   Results
   ```bash
    customergateway_id = "cgw-0856e2ad83055638d"
    private_subnets = [
    "subnet-04fa7c4c0f619b6a8",
    "subnet-0a5906bcb47068fdd",
    "subnet-0fc6a55cbc08828c7",
    ]
    public_subnets = [
    "subnet-0332678f6281659bb",
    "subnet-0d7c8a4e96082002d",
    "subnet-04944bf4cd110315f",
    ]
    vgw_gateway_id = "vgw-08da11d47b1ae66d3"
    vpc_id = "vpc-06052d248e3ea5cc9"
    vpn_connection_id = "vpn-04224ded8ce839c67"
   ```

1. The aws console will show the **static route** on the `site-2-site vpn connections -> select the vpn connection -> static routes`
1. Change the name of the resource called **office** to **office1**

1. Terraform apply again
   ```bash
   terraform apply
   ```

   Results:
   ```bash
   aws_vpn_connection_route.office1: Creating...
    ╷
    │ Error: Plugin did not respond
    │ 
    │ The plugin encountered an error, and failed to respond to the plugin.(*GRPCProvider).ApplyResourceChange call. The plugin logs may contain more details.
    ╵
    ╷
    │ Error: Plugin did not respond
    │ 
    │   with aws_vpn_connection_route.office1,
    │   on main.tf line 57, in resource "aws_vpn_connection_route" "office1":
    │   57: resource "aws_vpn_connection_route" "office1" {
    │ 
    │ The plugin encountered an error, and failed to respond to the plugin.(*GRPCProvider).ApplyResourceChange call. The plugin logs may contain more details.
    ╵

    Stack trace from the terraform-provider-aws_v3.56.0_x5 plugin:

    panic: runtime error: invalid memory address or nil pointer dereference
    [signal SIGSEGV: segmentation violation code=0x1 addr=0x10 pc=0x633e97d]

    goroutine 72 [running]:
    github.com/terraform-providers/terraform-provider-aws/aws.resourceAwsVpnConnectionRouteCreate.func1(0xc0023c16e0, 0xc0023c16a0, 0x0, 0x0, 0x2, 0x8c40e01)
            /opt/teamcity-agent/work/5d79fe75d4460a2f/src/github.com/hashicorp/terraform-provider-aws/aws/resource_aws_vpn_connection_route.go:69 +0x9d
    github.com/hashicorp/terraform-plugin-sdk/v2/helper/resource.(*StateChangeConf).WaitForStateContext.func1(0xc00066e960, 0xc0016a90a0, 0xc00289a7e0, 0xc000deaf00, 0xc000054e30, 0xc000054de8)
            /opt/teamcity-agent/work/5d79fe75d4460a2f/pkg/mod/github.com/gdavison/terraform-plugin-sdk/v2@v2.0.2-0.20210714181518-b5a3dc95a675/helper/resource/state.go:110 +0x2e9
    created by github.com/hashicorp/terraform-plugin-sdk/v2/helper/resource.(*StateChangeConf).WaitForStateContext
            /opt/teamcity-agent/work/5d79fe75d4460a2f/pkg/mod/github.com/gdavison/terraform-plugin-sdk/v2@v2.0.2-0.20210714181518-b5a3dc95a675/helper/resource/state.go:83 +0x1c6

    Error: The terraform-provider-aws_v3.56.0_x5 plugin crashed!

    This is always indicative of a bug within the plugin. It would be immensely
    helpful if you could report the crash with the plugin's maintainers so that it
    can be fixed. The output above should help diagnose the issue.


   ```

1. Clean up
   ```bash
   terraform destroy
   ```
