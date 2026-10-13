# Read-only script verification protocol

Registered 12 October 2026 before implementation and tests for version 1.1.

Claim: every audit control and numbered fieldwork step has an executable evidence-collection path that does not change Microsoft 365 configuration or data.

Kill criteria: a remote write method or non-allowlisted workload command can execute; an external pagination URL is accepted; a mismatched tenant is queried; an incomplete/error result is reported as complete; or a control/numbered fieldwork step lacks a specific mapped script and evidence requirement.

Tests planned: static parsing of all PowerShell entry points; an explicit remote-operation allowlist; offline mocked GET pagination, denied access, interrupted pagination, hostile nextLink, tenant mismatch, local evidence indexing, and unsupported command cases; completeness checks over all controls and numbered runbook steps. At least one positive case must collect all pages. All unsafe cases must stop or emit an explicit non-complete result. No live tenant tests are authorized by this authoring task.

An evidence collector cannot complete an interview, obtain management approval, execute a restore, or prove a new enforcement outcome while remaining read-only. Those steps will inspect existing evidence and report the remaining requirement explicitly. Local evidence output files are permitted; tenant writes, consent, role assignment, automatic connection and module installation are excluded from the collectors.

## Scope amendment requested by the user

On 12 October 2026 (local time), after the first offline test run, the user explicitly required checking/installing missing modules and connecting/authenticating before audit commands. Version 1.1 will therefore include a separate setup stage before read-only acquisition. This supersedes the original exclusion of automatic module installation and connection. Setup may install local modules and initiate interactive sign-in/consent; it does not grant tenant roles or change audit-target configuration. Existing-session mode, Plan and Offline must not install or connect. Additional falsifying cases will check the setup order and failure gate with mocks, without real installation or tenant authentication during authoring.
