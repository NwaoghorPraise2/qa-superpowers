# Installing QA Superpowers for Codex

Enable QA Superpowers skills in Codex via native skill discovery.

## Prerequisites

- Git

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/NwaoghorPraise2/qa-superpowers.git ~/.codex/qa-superpowers
   ```

2. **Create the skills symlink:**
   ```bash
   mkdir -p ~/.agents/skills
   ln -s ~/.codex/qa-superpowers/skills ~/.agents/skills/qa-superpowers
   ```

   **Windows (PowerShell):**
   ```powershell
   New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.agents\skills"
   cmd /c mklink /J "$env:USERPROFILE\.agents\skills\qa-superpowers" "$env:USERPROFILE\.codex\qa-superpowers\skills"
   ```

3. **Restart Codex** to discover the skills.

## Verify

```bash
ls -la ~/.agents/skills/qa-superpowers
```

You should see a symlink pointing to your qa-superpowers skills directory.

## Updating

```bash
cd ~/.codex/qa-superpowers && git pull
```
