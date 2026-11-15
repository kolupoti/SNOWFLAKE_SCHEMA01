# Snowflake DCM Git Repository

## 1. Overview

This repository provides a centralized Git-based framework
for managing Snowflake Data Cloud Management (DCM) Projects.

Each Snowflake schema is maintained as an independent
DCM project directory.

## 2. Supported Environments

| Environment | Git Branch |
|---|---|
| DEV | dev |
| QA | qa |
| UAT | uat |
| PROD | prod |

## 3. Current DCM Projects

The following DCM projects are currently present
in this repository:



## 4. Project Management

### Bootstrap DCM Project

Use the GitHub Actions workflow:

`bootstrap-structure.yml`

Provide the target branch and Snowflake schema name
to create a new DCM project structure.

### Delete DCM Project

Use the GitHub Actions workflow:

`delete-structure.yml`

Provide the target branch and Snowflake schema name.
Enter DELETE to confirm the removal.

## 5. Environment Promotion

Recommended promotion sequence:

DEV -> QA -> UAT -> PROD

Use Pull Requests and appropriate approvals
to control environment promotions.

## 6. Important Considerations

- Each schema has an independent DCM project.
- Project deletion removes Git repository files.
- Deletion does not drop Snowflake DCM projects.
- Deletion does not drop Snowflake database objects.
- Snowflake resources must be managed separately.
- Existing projects are preserved during other
  schema-specific deletion operations.

## 7. Security Guidelines

- Use GitHub Secrets for authentication.
- Never commit Snowflake credentials.
- Restrict production branch write access.
- Require approvals for sensitive changes.

---

**Framework:** Snowflake DCM with GitHub

**Supported Environments:** DEV, QA, UAT, PROD

**Project Strategy:** One independent DCM project per schema
