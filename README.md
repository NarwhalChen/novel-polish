# novel-polish

A Claude Code skill system for polishing novels through a structured 6-phase editing workflow.

## Installation

```bash
git clone https://github.com/NarwhalChen/novel-polish.git ~/.claude/skills/novel-polish
cd ~/.claude/skills/novel-polish
./install.sh
```

## Usage

In any novel project directory:

```bash
/novel-init <title>      # Initialize state, create chapters/ directory
/novel-status            # Show current phase progress
/novel-expand            # Phase 0 (optional): expansion opportunities
/novel-cold-read         # Phase 1: cold read — editor's letter
/novel-dev-edit          # Phase 2: developmental edit — structure & character
/novel-line-edit         # Phase 3: line edit — sentence-level polish (repeatable)
/novel-copy-edit         # Phase 4: copy edit — consistency & grammar
/novel-proofread         # Phase 5: proofread — typos & formatting only
```

## How it works

Each skill reads `.novel/state.json` in the current directory to track phase status. Phases are gated — you must complete each phase before the next unlocks. The AI only outputs suggestions; you make all edits manually, then run `--mark-done` to advance.

```
/novel-init → /novel-cold-read → /novel-dev-edit → /novel-line-edit → /novel-copy-edit → /novel-proofread
```

## State file

`.novel/state.json` is created per novel project and gitignored. It tracks phase statuses, iteration counts, and completion timestamps.

## Update

```bash
cd ~/.claude/skills/novel-polish && git pull
```

Symlinks auto-update — no reinstall needed.
