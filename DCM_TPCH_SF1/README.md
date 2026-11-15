# DCM_TPCH_SF1

## 1. Project Overview

This project manages Snowflake Data Cloud Management (DCM)
definitions for the Snowflake schema:

**Schema Name:** TPCH_SF1

**DCM Project Directory:** DCM_TPCH_SF1

This project provides a standardized approach to managing
Snowflake database objects through Git-based version control
and Snowflake DCM Projects.

The project is independently maintained within the
centralized Snowflake DCM Git repository.

## 2. Project Objectives

- Manage Snowflake database object definitions through Git.
- Maintain version-controlled SQL definitions.
- Support DEV, QA, UAT and PROD environments.
- Standardize DCM project organization.
- Enable controlled environment promotion.
- Support automated DCM Plan and Deploy operations.
- Maintain deployment traceability and auditability.

## 3. Project Structure

```text
DCM_TPCH_SF1/
|
|-- manifest.yml
|-- README.md
|
|-- sources/
|   |
|   |-- definitions/
|   |   |-- database.sql
|   |   |-- schema.sql
|   |   |-- tables.sql
|   |   |-- views.sql
|   |   |-- procedures.sql
|   |   |-- functions.sql
|   |   |-- streams.sql
|   |   |-- tasks.sql
|   |   |-- grants.sql
|   |   |-- streamlit.sql
|   |
|   |-- macros/
|       |-- common.sql
|
```

## 4. File Descriptions

### manifest.yml

Defines the DCM project configuration, environment targets,
Snowflake project names, project owners and templating
configurations.

### sources/definitions/

Contains Snowflake SQL definitions managed by this project.

| File | Description |
|---|---|
| database.sql | Database definitions |
| schema.sql | Schema definitions |
| tables.sql | Table definitions |
| views.sql | View definitions |
| procedures.sql | Stored procedure definitions |
| functions.sql | User-defined functions |
| streams.sql | Snowflake stream definitions |
| tasks.sql | Snowflake task definitions |
| grants.sql | Access and privilege definitions |
| streamlit.sql | Streamlit definitions |

Use the appropriate files to organize valid DCM-supported
SQL definitions.

### sources/macros/

Contains reusable SQL macros and common project-level
SQL logic supported by the DCM templating model.

## 5. Environment Configuration

This project supports four environments.

| Environment | DCM Project |
|---|---|
| DEV | DCM_TPCH_SF1_DEV |
| QA | DCM_TPCH_SF1_QA |
| UAT | DCM_TPCH_SF1_UAT |
| PROD | DCM_TPCH_SF1_PROD |

Each environment must reference its corresponding
Snowflake DCM project.

## 6. Manifest Configuration

The manifest.yml file contains the environment-specific
project configuration.

Before deployment, configure and validate:

- Snowflake account identifier.
- Snowflake database.
- Snowflake schema containing the DCM projects.
- DCM project names.
- Project owner and required privileges.
- Environment-specific templating configurations.

The generated manifest includes placeholder account,
database and schema values. Replace them with actual
Snowflake configuration values.

Do not assume the managed business schema and the schema
containing the DCM project objects are necessarily the same.

## 7. Development Guidelines

1. Make database definition changes in the appropriate
   SQL definition file.
2. Review the SQL changes before committing.
3. Follow the organization's Git branching strategy.
4. Use Pull Requests for controlled promotions.
5. Execute DCM Plan before deployment.
6. Review the proposed changes.
7. Execute deployment only after appropriate approval.
8. Validate the deployed database objects.

## 8. Deployment Lifecycle

Recommended promotion sequence:

DEV -> QA -> UAT -> PROD

### DEV

- Develop and maintain SQL definitions.
- Validate DCM project changes.
- Execute DCM Plan.
- Deploy approved development changes.

### QA

- Promote approved DEV changes.
- Execute DCM Plan against QA.
- Deploy approved changes.
- Perform integration and regression testing.

### UAT

- Promote approved QA changes.
- Execute DCM Plan against UAT.
- Deploy approved changes.
- Complete business acceptance testing.

### PROD

- Promote approved UAT changes.
- Obtain production change approval.
- Execute DCM Plan against PROD.
- Review the proposed changes.
- Deploy approved changes.
- Validate production database objects.

## 9. Deployment Prerequisites

Before executing deployments, ensure:

- The corresponding Snowflake DCM project exists.
- manifest.yml references the correct targets.
- The required project owner is configured.
- Appropriate Snowflake privileges are available.
- Snowflake CLI and required DCM commands are configured.
- Secure authentication is configured.
- The deployment process has been validated.

## 10. Git and Change Management

- Maintain version-controlled SQL definitions.
- Use meaningful commit messages.
- Review changes through Pull Requests.
- Protect higher-environment branches.
- Obtain required approvals before production deployment.
- Maintain deployment evidence and execution logs.

## 11. Security Guidelines

- Never commit Snowflake passwords or private keys.
- Store authentication information in approved
  secrets management solutions.
- Follow least-privilege access principles.
- Restrict production deployment permissions.
- Review grants and role changes before deployment.

## 12. Important Considerations

- This project README is generated during bootstrap.
- Bootstrap creates Git files and directories only.
- Bootstrap does not create Snowflake DCM projects.
- SQL placeholder files must be populated with valid
  DCM definitions.
- Manifest placeholders must be configured before use.
- DCM Plan and Deploy workflows must be configured
  before automated deployment.
- Deleting this Git project does not drop Snowflake objects.

## 13. Support and Maintenance

The project maintainers are responsible for:

- Maintaining SQL definitions.
- Maintaining manifest configuration.
- Reviewing project changes.
- Managing environment promotions.
- Monitoring deployment execution.
- Maintaining project documentation.

---

**Project:** DCM_TPCH_SF1

**Snowflake Schema:** TPCH_SF1

**Managed Environments:** DEV, QA, UAT, PROD

**Documentation:** Schema-specific DCM project guide.
