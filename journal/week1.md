# Terraform Beginner Bootcamp 2023 - Week 1 

## Fixing Tags

[How to Delete Local and Remote Tags on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

Locall delete a tag
```sh
git tag -d <tag_name>
```

Remotely delete tag

```sh
git push --delete origin tagname
```

Checkout the commit that you want to retag. Grab the sha from your Github history.

```sh
git checkout <SHA>
git tag M.M.P
git push --tags
git checkout main
```

## Journal TOC and Major Version :open_book:

I was able to restructure the `README.md` file because I needed to break it down into different sizes, in the sense that I needed a **journal** directory followed with several weeks of tasks as **files** in that folder.


| Documentation                                              | Description                                           |
|------------------------------------------------------------|-------------------------------------------------------|
| [Refactored README.md](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/edit/main/README.md)      | Updated README for Terraform beginner bootcamp.     |
| [Weekly journals in journal folder](https://github.com/Firdous2307/terraform-beginner-bootcamp-2023/tree/main/journal) | Weekly journals located in the 'journal' folder.   |

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules

```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)


## Terraform and Input Variables

### Terraform Cloud Variables

In Terraform, you can set two kinds of variables:
- **Environment Variables:** These are set in your shell, e.g., AWS credentials. They are typically used for sensitive data and are not displayed in the UI.
- **Terraform Variables:** These are typically set in `.tfvars` files. In Terraform Cloud, you can set them and mark them as sensitive to hide them in the UI.


### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)



#### Using `-var` Flag

You can use the `-var` flag to set or override input variables. For example:
```bash
terraform apply -var user_id="my-user_id"

```

#### Using -var-file Flag

The `-var-file` flag loads variables from a specified file:

```bash
terraform apply -var-file=myvars.tfvars
```

#### Terraform.tfvars
`terraform.tfvars` is the default file Terraform uses to load variable values when no other file is specified using -var-file.


#### auto.tfvars (Terraform Cloud)

In Terraform Cloud, `auto.tfvars` is a special file. If it exists in your working directory, Terraform Cloud automatically loads variable values from it.


## Order of Terraform Variables

When multiple sources provide variable values, Terraform follows an order of precedence:

1. **Environment Variables:** Highest precedence, overriding any values from files.
2. **Command-Line Flags:**  Values provided using `-var` or `-var-file` flags take precedence.
3. **auto.tfvars (Terraform Cloud):**  Automatically loaded and takes precedence if present.
4. **terraform.tfvars:**  Default if no other values specified.
5. **Default Values in Variable Definitions:**  Used if no other values provided.

Terraform allows you to set, override, and manage input variables in a structured way, with Terraform Cloud offering a secure method to handle sensitive data.



## Import and Configuration Drift
In Terraform, `import` adds existing resources to management, while `configuration drift` is when actual and desired states differ, which Terraform helps detect and correct for maintaining infrastructure consistency.


## What happens if we lose our state file?
Losing your Terraform state file usually requires manual removal of your cloud infrastructure. Terraform import may work for some resources, but you'll need to consult the provider documentation to see which resources support it.


### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`


[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)

[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)



### Fix Manual Configuration
If someone makes manual changes to cloud resources through ClickOps, running `Terraform plan` will attempt to reconcile and bring the infrastructure back to its expected state, effectively addressing any configuration drift.


## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

While it is advisable to organize modules in a directory named modules when working on them locally, you have flexibility in choosing the directory name as per your preference.



### Passing Input Variables

Input variables can be provided to a module, and for this to work correctly, the module needs to define these Terraform variables in its own `variables.tf` file.


```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

The `source` attribute allows you to import a module from various sources, including local paths, GitHub repositories, and the Terraform Registry.


```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```


[Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources)


## Important Considerations for Using ChatGPT to Generate Terraform Code

1. **Outdated Information**: Language Models like ChatGPT may lack access to the latest Terraform documentation, potentially leading to code that doesn't align with current best practices.

2. **Deprecated Examples**: Generated code might rely on outdated conventions or deprecated Terraform features, which can result in issues when applied to modern infrastructure.

3. **Provider Changes**: Providers frequently update their APIs, affecting Terraform configurations. LLM-generated code may not account for these changes, causing configuration errors.

4. **Mitigation**: Always cross-reference generated code with official Terraform documentation, stay informed about provider updates, and prioritize up-to-date best practices to ensure accurate and reliable infrastructure code.


## Working with Files in Terraform


### Fileexists function

This is a built in terraform function to check the existance of a file.

```tf
condition = fileexists(var.error_html_filepath)
```

[Terraform `fileexists` Function](https://developer.hashicorp.com/terraform/language/functions/fileexists)

### Filemd5

[Terraform filemd5 Function](https://developer.hashicorp.com/terraform/language/functions/filemd5)

### Path Variable

In terraform there is a special variable called `path` that allows us to reference local paths:
- path.module = get the path for the current module
- path.root = get the path for the root module

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

```
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
}
```


## Terraform Locals

Locals allows us to define local variables.
It can be very useful when we need transform data into another format and have referenced a varaible.

```tf
locals {
  s3_origin_id = "MyS3Origin"
}
```
[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)


## Terraform Data Sources

Data sources enable us to retrieve information from cloud resources, providing a means to reference and utilize cloud resource data without the need for importing them explicitly.


```tf
data "aws_caller_identity" "current" {}
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```
[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)



## Working with JSON

We use the jsonencode to create the json policy inline in the hcl.

```tf
> jsonencode({"hello"="world"})
{"hello":"world"}
```

[jsonencode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

### Changing the Lifecycle of Resources

[Meta Arguments Lifcycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)


## Terraform Data

You can't use Local Values and Input Variables in **replace_triggered_by** since they lack side-effects for planning. Instead, leverage Terraform data's automatic planning action on input changes to indirectly trigger replacements using plain values

[Terraform Data](https://developer.hashicorp.com/terraform/language/resources/terraform-data)


## :wrench: Provisioners

Provisioners provide the capability to run commands on compute instances, like AWS CLI commands, as part of your Terraform workflow.

While not the preferred approach according to HashiCorp, as Configuration Management tools like Ansible are typically a better fit, provisioners still offer functionality when necessary.

Explore [Provisioners Syntax](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax) in the documentation.



### :computer: Local-exec Provisioner

The Local-exec provisioner allows you to run commands on the machine executing Terraform commands, such as `plan` or `apply`.

Here's an example of how to use it with an AWS instance resource:

```tf
resource "aws_instance" "web" {
  # ...
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
  }
}
```

[Local-Exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)


### :rocket: Remote-exec Provisioner

The Remote-exec provisioner allows you to execute commands on a targeted machine. You'll need to provide credentials, such as SSH, to access the remote machine.

Here's an example using an AWS instance resource:

```tf
resource "aws_instance" "web" {
  # ...
  # Establishes connection to be used by all
  # generic remote provisioners (i.e., file/remote-exec)
  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
  }
}

```

[Remote-Exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec)

## For Each Expressions

For each allows us to enumerate over complex data types

```sh
[for s in var.list : upper(s)]
```

This is mostly useful when you are creating multiples of a cloud resource and you want to reduce the amount of repetitive terraform code.

[For Each Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)