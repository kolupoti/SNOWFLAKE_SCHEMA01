# DCM_TPCH_SF1

Snowflake Data Cloud Management (DCM) project.

Snowflake schema: TPCH_SF1

## Project Structure

- manifest.yml - DCM project configuration and deployment targets.
- sources/definitions/ - Snowflake SQL definitions.
- sources/macros/ - Reusable SQL macros.

## Supported Environments

- DEV
- QA
- UAT
- PROD

## Deployment

DCM project deployments are managed through
Snowflake DCM and GitHub Actions.

Review manifest.yml and environment configurations
before executing deployments.
