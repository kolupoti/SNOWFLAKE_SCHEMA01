# Snowflake DCM Git Repository

## 1. Overview

This repository provides a centralized Git-based framework
for managing Snowflake Data Cloud Management (DCM) Projects.

The repository supports multiple Snowflake schemas, with
each schema maintained through an independent DCM project.

The implementation provides:

- Standardized DCM project structures.
- Multiple schema management within one repository.
- Git-based SQL version control.
- DEV, QA, UAT and PROD environment support.
- Automated project structure creation.
- Controlled code promotion.
- DCM Plan and Deploy workflow integration.
- Change traceability and deployment governance.

## 2. Repository Architecture

Each Snowflake schema is maintained as a separate
DCM project directory.

Example:

```text
SNOWFLAKE_SCHEMA01/
|
|-- .github/
|   |-- workflows/
|       |-- bootstrap-structure.yml
|       |-- delete-structure.yml
|       |-- dcm-plan.yml
|       |-- dcm-deploy.yml
|
|-- DCM_TPCH_SF1/
|   |-- manifest.yml
|   |-- README.md
|   |-- sources/
|
|-- DCM_SALES/
|   |-- manifest.yml
|   |-- README.md
|   |-- sources/
|
|-- README.md
```

The project directories are created dynamically
using the Snowflake schema name provided during bootstrap.

## 3. Supported Environments

| Environment | Git Branch | Purpose |
|---|---|---|
| DEV | dev | Development and initial validation |
| QA | qa | Integration and quality testing |
| UAT | uat | Business acceptance testing |
| PROD | prod | Production deployment |

Each DCM project has independent environment targets.

## 4. Current DCM Projects

The following DCM projects are present in this repository:

- **TPCH_SF1** - `DCM_TPCH_SF1`


Each project has its own manifest.yml, README.md,
SQL definitions and reusable macros.

## 5. Creating a New DCM Project

Use the GitHub Actions Bootstrap workflow.

### Step 1: Open GitHub Actions

1. Open this GitHub repository.
2. Select Actions.
3. Select Bootstrap Snowflake DCM Project Structure.
4. Click Run workflow.

### Step 2: Enter Workflow Inputs

| Input | Description | Example |
|---|---|---|
| target_branch | Target Git branch | dev |
| schema_name | Snowflake schema name | SALES |

The schema name must be entered manually.

Supported characters:
- Letters A-Z and a-z.
- Numbers 0-9.
- Underscore.

The first character must be a letter or underscore.

### Step 3: Execute Bootstrap

Click Run workflow.

The workflow automatically:

1. Checks out the selected branch.
2. Validates the schema name.
3. Creates the DCM project directory.
4. Creates sources/definitions and sources/macros.
5. Generates manifest.yml.
6. Generates SQL definition placeholders.
7. Generates the project-level README.md.
8. Creates DCM Plan and Deploy placeholders if absent.
9. Updates this repository-level README.md.
10. Commits and pushes the changes.

### Step 4: Verify the Results

Navigate to the selected Git branch and verify
the generated DCM project directory and documentation.

## 6. DCM Project Configuration

Each DCM project contains a manifest.yml file.

It defines:

- Manifest version.
- DCM project type.
- Default deployment target.
- Snowflake account identifier.
- DCM project names.
- Project owners.
- Environment-specific templating configurations.

The generated manifest contains placeholders for
the Snowflake account, database and DCM project schema.

These values must be configured before deployment.

## 7. Git Branching and Promotion Strategy

Recommended environment promotion:

```text
DEV
 |
 v
QA
 |
 v
UAT
 |
 v
PROD
```

### DEV

- Develop and maintain SQL definitions.
- Perform initial validation.
- Execute DCM Plan.
- Deploy development changes.

### QA

- Promote approved DEV changes.
- Execute DCM Plan.
- Perform integration testing.
- Complete regression testing.

### UAT

- Promote approved QA changes.
- Execute DCM Plan.
- Complete business acceptance testing.
- Obtain business approval.

### PROD

- Promote approved UAT changes.
- Obtain production change approval.
- Execute DCM Plan.
- Deploy approved changes.
- Perform post-deployment validation.

Use Pull Requests and branch protection to control
promotions across environments.

## 8. GitHub Actions Workflows

### bootstrap-structure.yml

Creates a standardized DCM project structure.

Inputs:
- Target branch.
- Snowflake schema name.

It creates the project directory, manifest, SQL
definition placeholders and detailed documentation.

### delete-structure.yml

Removes a selected DCM project directory from
the selected Git branch.

The deletion workflow should validate the requested
project and require explicit confirmation.

Deleting Git files does not automatically delete
Snowflake DCM projects or database objects.

### dcm-plan.yml

Intended to execute Snowflake DCM Plan operations.

The configured workflow should identify proposed
changes and provide deployment review information.

### dcm-deploy.yml

Intended to execute approved Snowflake DCM Deploy
operations.

The configured workflow should support environment
selection, deployment execution, and logging.

Note: DCM Plan and Deploy workflows are placeholders
until Snowflake CLI, authentication and actual DCM
commands are configured.

## 9. Snowflake Prerequisites

Before deploying a DCM project, verify:

1. The required Snowflake DCM projects exist.
2. DEV, QA, UAT and PROD targets are configured.
3. The manifest references the correct project names.
4. The project owners are configured.
5. Required Snowflake privileges are granted.
6. The appropriate Snowflake CLI and DCM functionality
   is available.
7. Authentication is securely configured.
8. The project definitions are valid.

## 10. GitHub Security and Permissions

### Repository Secret

Configure:

| Secret | Purpose |
|---|---|
| BOOTSTRAP_TOKEN | Checkout and push authentication |

The token must have appropriate repository access
and Contents Read and Write permissions.

### Workflow Permissions

The bootstrap workflow uses:

```yaml
permissions:
  contents: write
```

### Snowflake Authentication

Use an approved Snowflake authentication mechanism.

Store sensitive credentials in GitHub Secrets
or an approved enterprise secrets management solution.

Never commit passwords, private keys or access tokens.

## 11. Deployment Process

Recommended execution sequence:

1. Bootstrap the DCM project.
2. Configure manifest.yml.
3. Add valid SQL definitions.
4. Review and commit changes in DEV.
5. Execute DCM Plan.
6. Review proposed changes.
7. Deploy to DEV.
8. Promote changes to QA.
9. Complete QA testing.
10. Promote changes to UAT.
11. Obtain business acceptance.
12. Promote changes to PROD.
13. Obtain production approval.
14. Execute production deployment.
15. Validate and capture deployment evidence.

## 12. Naming Conventions

| Component | Naming Convention | Example |
|---|---|---|
| Project directory | DCM_SCHEMA | DCM_SALES |
| DEV project | DCM_SCHEMA_DEV | DCM_SALES_DEV |
| QA project | DCM_SCHEMA_QA | DCM_SALES_QA |
| UAT project | DCM_SCHEMA_UAT | DCM_SALES_UAT |
| PROD project | DCM_SCHEMA_PROD | DCM_SALES_PROD |
| Project owner | DCM_SCHEMA_DEPLOYER | DCM_SALES_DEPLOYER |

## 13. Operational Guidelines

- Maintain one independent DCM project per schema.
- Use consistent naming conventions.
- Preserve existing project definitions.
- Review manifest configuration before deployment.
- Use Pull Requests for code promotion.
- Protect higher-environment branches.
- Obtain production deployment approvals.
- Maintain deployment logs and evidence.
- Follow organizational change management procedures.
- Do not store sensitive credentials in Git.

## 14. Important Considerations

- Bootstrap creates Git repository structures only.
- Bootstrap does not create Snowflake DCM projects.
- Bootstrap does not deploy database objects.
- SQL placeholders must be populated with valid definitions.
- Manifest placeholders must be replaced with actual values.
- Plan and Deploy workflows require additional configuration.
- Git branch promotion and Snowflake deployment
  are separate operations.
- Removing a project directory from Git does not
  automatically remove Snowflake objects.

## 15. Future Enhancements

Potential implementation enhancements:

- Automated DCM Plan execution.
- Automated DCM Deploy execution.
- Snowflake CLI integration.
- Environment-specific deployment configuration.
- Pull Request validation.
- Automated deployment approvals.
- Deployment audit and status reporting.
- Git tag-based release management.
- Rollback and recovery procedures.
- Multi-schema deployment orchestration.

## 16. Ownership and Maintenance

Repository maintainers are responsible for:

- Maintaining GitHub Actions workflows.
- Managing repository access and permissions.
- Maintaining DCM project configurations.
- Reviewing SQL definitions.
- Managing environment promotions.
- Monitoring deployments.
- Maintaining documentation.

---

**Repository:** SNOWFLAKE_SCHEMA01

**Framework:** Snowflake DCM with GitHub

**Supported Environments:** DEV, QA, UAT, PROD

**Project Strategy:** One independent DCM project per schema

**Documentation:** Repository-level and project-level README files
