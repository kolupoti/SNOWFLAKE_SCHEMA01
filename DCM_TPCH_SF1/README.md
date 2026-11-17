# DCM_TPCH_SF1

## 1. Project Overview

This project manages Snowflake Data Cloud Management
(DCM) definitions for the business schema:

**Business Schema:** TPCH_SF1

**DCM Project:** DCM_TPCH_SF1

**DCM Project Owner:** DCM_TPCH_SF1_DEPLOYER

This project uses Git-based version control to manage
Snowflake database object definitions.

## 2. Project Objectives

- Maintain individual SQL files for database objects.
- Organize SQL definitions by object type.
- Support DEV, QA, UAT and PROD environments.
- Maintain version-controlled definitions.
- Support controlled DCM Plan and Deploy operations.
- Provide deployment traceability.

## 3. Project Structure

```text
DCM_TPCH_SF1/
|
|-- manifest.yml
|-- README.md
|-- .gitignore
|
|-- sources/
|   |
|   |-- definitions/
|   |   |
|   |   |-- database/
|   |   |-- schemas/
|   |   |-- tables/
|   |   |-- views/
|   |   |-- procedures/
|   |   |-- functions/
|   |   |-- streams/
|   |   |-- tasks/
|   |   |-- grants/
|   |
|   |-- macros/
|       |-- common.sql
```

## 4. SQL File Organization

Each database object must be maintained in
an independent SQL definition file.

| Folder | Purpose |
|---|---|
| database | Database definitions |
| schemas | Schema definitions |
| tables | Individual table definitions |
| views | Individual view definitions |
| procedures | Individual stored procedures |
| functions | Individual function definitions |
| streams | Individual stream definitions |
| tasks | Individual task definitions |
| grants | Individual grant definitions |

Example:

```text
tables/
|
|-- customer.sql
|-- orders.sql
|-- products.sql
|-- employees.sql
```

Every object should have its own SQL file.

Additional object files can be created without
changing the GitHub Actions workflow.

## 5. Manifest Configuration

The manifest.yml contains:

- Snowflake account identifier.
- DEV, QA, UAT and PROD targets.
- Environment-specific DCM project names.
- Project owner role.
- Templating configurations.

The DCM project objects are located under:

DCM_SNOWFLAKE_SAMPLE_DATA.DCM_TPCH_SF1

The managed business schema is:

TPCH_SF1

These are separate configuration concepts.

## 6. Environment Configuration

| Environment | DCM Project |
|---|---|
| DEV | DCM_TPCH_SF1_DEV |
| QA | DCM_TPCH_SF1_QA |
| UAT | DCM_TPCH_SF1_UAT |
| PROD | DCM_TPCH_SF1_PROD |

## 7. Development Guidelines

1. Create one SQL file per database object.
2. Place the file in the corresponding object folder.
3. Use valid Snowflake DCM DEFINE, GRANT or ATTACH syntax.
4. Follow consistent object naming conventions.
5. Commit changes to the appropriate Git branch.
6. Execute DCM Plan.
7. Review proposed changes.
8. Deploy after required approvals.
9. Validate the deployed objects.

## 8. Deployment Promotion

Recommended sequence:

DEV -> QA -> UAT -> PROD

- DEV: Development and initial validation.
- QA: Integration and regression testing.
- UAT: Business acceptance testing.
- PROD: Approved production deployment.

## 9. Deployment Prerequisites

- DCM project objects must exist in Snowflake.
- Manifest values must be validated.
- Project owner roles must be configured.
- Required Snowflake privileges must be granted.
- Snowflake CLI must be configured.
- Secure authentication must be available.
- SQL definitions must contain valid DCM syntax.

## 10. Important Considerations

- Bootstrap creates Git directories and files only.
- It does not create Snowflake DCM project objects.
- It does not create database objects.
- Generated SQL files are starter templates.
- Replace templates with actual DCM definitions.
- Existing SQL files are preserved during bootstrap.
- Existing manifest.yml is preserved during bootstrap.
- Git deletion does not automatically drop Snowflake objects.

## 11. Project Ownership

Project Owner: DCM_TPCH_SF1_DEPLOYER

Business Schema: TPCH_SF1

Environments: DEV, QA, UAT, PROD

Framework: Snowflake DCM with GitHub Actions

