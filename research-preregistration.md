# Research and falsification protocol

Registered before targeted falsification: 2026-10-12.

This repository is an audit methodology, not a completed tenant assessment. No tenant access has been provided.

## Claims to challenge

| Claim under test | Kill criterion | Cheapest test | Preregistered decision |
|---|---|---|---|
| A high Microsoft Secure Score can stand in for a complete audit opinion. | Microsoft identifies attack surfaces or assurance limitations outside the score. | Read the product's documented limitations and compare against audit coverage. | Reject the substitution after one explicit limitation. |
| An MFA registration report or an enabled Conditional Access policy establishes effective MFA for everyone. | One documented policy state, exclusion, or non-human identity case defeats that inference. | Check report-only, exclusions, and workload identity documentation. | Reject the inference after one counterexample. |
| Microsoft 365 audit evidence has a universal retention period across tenants and workloads. | One documented license, workload, or policy dependency changes retention. | Compare Purview Audit and Entra log retention documentation. | Reject a universal duration after one counterexample. |
| A configuration scanner alone can complete the audit. | Its maintainers document manual or unsupported checks, or the scope omits operational evidence. | Inspect CISA ScubaGear documentation and compare with restore and incident response testing needs. | Require manual and operational work after one gap. |
| A documented retention policy proves the business can recover within its recovery objectives. | Documentation distinguishes retention from backup, or a configuration record contains no measured restore result. | Read Microsoft 365 Backup and retention documentation; challenge a synthetic audit case. | Require a timed recovery test if the inference fails. |

## Artifact acceptance test

The final control catalog must include a unique ID, objective, applicability, evidence, execution procedure, assessment criterion, owner, priority, falsifying probe, and source references for every control. Any missing field, broken local link, duplicate ID, or unregistered source fails the structural release check. This is a document integrity test; it cannot validate live tenant controls.

For eight explicitly synthetic edge cases, the audit decision rules must avoid an unsupported Pass: report-only MFA, excluded administrator, registered-but-unenforced MFA, absent logs caused by denied access, premium feature unavailable, tenant sharing restriction with pre-existing access, backup configured without restore evidence, and scanner manual check. Pass threshold: 8/8 correctly classified; report the actual result and limits.

## Evidence policy

Use Microsoft documentation for product behavior; CISA, CIS, NIST, and tool maintainers for their own methods and limitations. Record research access date, distinguish license-dependent guidance, and do not imply that a linked but inaccessible benchmark was reviewed. Never publish tenant exports, credentials, or customer evidence in this methodology repository.
