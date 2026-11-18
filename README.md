# Snowflake DCM Git Repository

## 1. Overview

Centralized Git repository for managing Snowflake
Data Cloud Management (DCM) projects.

Each business schema is maintained through
an independent DCM project.

## 2. Repository Architecture

```text
Repository/
|
|-- .github/
|   |-- workflows/
|       |-- bootstrap-structure.yml
|       |-- delete-structure.yml
|       |-- dcm-plan.yml
|       |-- dcm-deploy.yml
|
|-- DCM_SCHEMA01/
|   |-- manifest.yml
|   |-- README.md
|   |-- sources/
|       |-- definitions/
|       |   |-- database/
|       |   |-- schemas/
|       |   |-- tables/
|       |   |-- views/
|       |   |-- procedures/
|       |   |-- functions/
|       |   |-- streams/
|       |   |-- tasks/
|       |   |-- grants/
|       |
|       |-- macros/
|
|-- DCM_SCHEMA02/
|-- README.md
```

## 3. Current DCM Projects

- **PUBLIC** - `DCM_PUBLIC`


## 4. Supported Environments

| Environment | Branch |
|---|---|
| DEV | dev |
| QA | qa |
| UAT | uat |
| PROD | prod |

## 5. Creating a New DCM Project

1. Navigate to GitHub Actions.
2. Select Bootstrap Snowflake DCM Project Structure.
3. Click Run workflow.
4. Select the target Git branch.
5. Enter the Snowflake business schema name.
6. Enter the Snowflake account identifier.
7. Enter the DCM database.
8. Enter the DCM schema.
9. Execute the workflow.

## 6. Generated Project Structure

The workflow automatically creates:

- DCM project directory.
- Environment-specific manifest.yml.
- Separate SQL folders by object type.
- Individual SQL starter files.
- Common macro file.
- Project README.
- DCM Plan workflow placeholder.
- DCM Deploy workflow placeholder.

## 7. SQL Definition Management

Each database object must have its own SQL file.

For example:

```text
definitions/
|
|-- tables/
|   |-- customer.sql
|   |-- orders.sql
|   |-- products.sql
|
|-- views/
|   |-- customer_view.sql
|   |-- order_view.sql
|
|-- procedures/
|   |-- process_orders.sql
```

New SQL files can be added without modifying
the bootstrap workflow.

## 8. Git Promotion Strategy

DEV -> QA -> UAT -> PROD

Use Pull Requests, branch protection and approvals
to control environment promotions.

## 9. Snowflake Deployment

The DCM Plan and Deploy workflows are generated
as placeholders.

Configure Snowflake CLI, authentication and actual
DCM commands before using automated deployments.

## 10. Security

The bootstrap workflow uses BOOTSTRAP_TOKEN
for repository checkout and push operations.

Snowflake credentials must be stored securely.

Never commit passwords, private keys or tokens.

## 11. Important Considerations

- Bootstrap creates Git structures only.
- Snowflake DCM objects must be created separately.
- SQL templates must be replaced with valid definitions.
- Existing project files are preserved.
- Git deletion does not drop Snowflake objects.
- Git promotion and Snowflake deployment are separate.

---

Repository: SNOWFLAKE_SCHEMA01

Framework: Snowflake DCM with GitHub Actions

Supported Environments: DEV, QA, UAT, PROD

Strategy: One DCM project per business schema.

