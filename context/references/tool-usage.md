# Tool usage

Use this file to choose the right `aynit` tool without reading the Python source.

## Surfaces

Preferred command form from this repo checkout:

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli <command> ...
```

After installing the package, the command names are also exposed directly:

- `vendor-conventions`
- `hash-conventions`
- `check-conventions`
- `check-project`
- `manifest-artifact`
- `index-artifacts`
- `index-docs`
- `check-artifacts`
- `run-job`

Python imports use the short package name:

```python
from aynit import (
    check_artifacts,
    check_conventions,
    check_project,
    hash_conventions,
    index_artifacts,
    index_docs,
    manifest_artifact,
    read_job_status,
    start_job,
    stop_job,
    tail_job_log,
    vendor_conventions,
    wait_job,
)
```

## Which tool

| When you need to... | Use |
| --- | --- |
| Adopt this framework's convention bundle into another repo's `context/` | `vendor-conventions` |
| Seal the current conventions/references/templates bundle | `hash-conventions` |
| Check bundle indexes, links, vendored-link robustness, and optional hash decay | `check-conventions` |
| Check whether a repo is ready for agentic copilot work | `check-project` |
| Write a provenance sidecar immediately after creating an artifact | `manifest-artifact` |
| Regenerate an artifact index from sidecars | `index-artifacts` |
| Regenerate a work-document index from Markdown frontmatter | `index-docs` |
| Check artifact existence/hash and warn on provenance drift | `check-artifacts` |
| Run tests, MATLAB, analysis scripts, servers, or other hang-prone commands | `run-job` |

Use direct shell for quick inspection commands such as `git status`, `rg`, `Get-Content`, `dir`, or `python --version`. Use `run-job` when a command may run long, block on input, stream useful output, or need timeout / idle-timeout protection.

## Recipes

### Vendor conventions

Copy the framework bundle into a consuming repo's `context/`, write `conventions-bundle.json`, and check the result:

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli vendor-conventions . <other-repo>/context
```

Refuses overwrite by default. Use `--overwrite` only when replacing the existing vendored bundle intentionally.

### Seal conventions

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli hash-conventions . --output run/conventions-bundle.json
```

### Check conventions

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli check-conventions . --manifest run/conventions-bundle.json --format text
```

Without a manifest, it checks indexes and links but not hash decay:

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli check-conventions . --format text
```

### Check project readiness

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli check-project . --format text
```

Failures mean the agent entry path is blocked. Warnings mean useful support signals are missing but the repo may still be workable.

### Manifest an artifact

Call this immediately after the script creates the artifact:

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli manifest-artifact data/interim/result.txt --input data/raw/input.txt --producer scripts/make_result.py --params configs/run.json --description "processed result" --tag stage:interim --root .
```

`--producer` is the script or program that created the artifact, not the manifest writer.

Python scripts can call:

```python
from aynit import manifest_artifact

manifest_artifact(
    "data/interim/result.txt",
    inputs=["data/raw/input.txt"],
    producer=__file__,
    params="configs/run.json",
    description="processed result",
    tags=["stage:interim"],
    root=".",
)
```

MATLAB scripts can call `aynit.manifest_artifact(...)`; the wrapper shells to `python -m aynit.cli manifest-artifact`.

### Index artifacts

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli index-artifacts . --output context/artifacts.json
```

### Index work documents

Print selected fields as JSON:

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli index-docs context/efforts --kind scheme --fields name,status
```

Regenerate a Markdown gate index:

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli index-docs context/efforts --kind effort --fields path,name,status,description,updated --format markdown --output context/efforts.md
```

`index-docs` scans the folder passed as `<root>` recursively. JSON output contains `rows` and `unindexed`. Files it cannot index are listed under `unindexed` with a reason, so one bad or plain Markdown file does not stop the whole folder index.

### Check artifacts

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli check-artifacts . --index context/artifacts.json --format text
```

Missing artifacts or changed artifact hashes fail. Missing or changed recorded inputs, producer scripts, params, or stale indexes warn.

### Run a supervised job

Start a hang-prone command:

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli run-job start --root . --name tests --timeout 600 --idle-timeout 60 -- python -m pytest tools/tests -q
```

Then use the run id returned by `start`:

```powershell
$env:PYTHONPATH='tools/src'; python -m aynit.cli run-job status <run-id> --root .
$env:PYTHONPATH='tools/src'; python -m aynit.cli run-job tail <run-id> --root . --lines 40
$env:PYTHONPATH='tools/src'; python -m aynit.cli run-job wait <run-id> --root . --timeout 700
$env:PYTHONPATH='tools/src'; python -m aynit.cli run-job stop <run-id> --root .
```

Each run writes `command.json`, `status.json`, `console.log`, `stdout.log`, `stderr.log`, and `supervisor.log` under `run/jobs/<run-id>/`.

## Exit behavior

- `check-*` commands exit nonzero when a `fail` finding exists.
- `check-*` warnings do not make the command fail.
- `run-job wait` exits zero only when the job state is `succeeded`.
- `vendor-conventions` exits nonzero when overwrite is refused or the vendored bundle check fails.
