# Terraform Beginner Bootcamp 2023 - Week 1 


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

