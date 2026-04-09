# Installing QA Superpowers Globally

---

## Option 1 — From GitHub (Global, Recommended)

Push this repo to GitHub first (replace `your-username`):

```bash
git init && git add . && git commit -m "feat: qa-superpowers v1.0.0"
git remote add origin https://github.com/your-username/qa-superpowers.git
git push -u origin main
```

Then in Claude Code (any machine, installs globally):

```bash
/plugin marketplace add your-username/qa-superpowers
/plugin install qa-superpowers@qa-superpowers --scope user
/reload-plugins
```

---

## Option 2 — From Local Folder (Before GitHub)

Unzip the plugin, then in Claude Code:

```bash
/plugin marketplace add /path/to/qa-superpowers-v2
/plugin install qa-superpowers@qa-superpowers --scope user
/reload-plugins
```

For example if you unzipped to your home folder:

```bash
/plugin marketplace add ~/qa-superpowers-v2
/plugin install qa-superpowers@qa-superpowers --scope user
/reload-plugins
```

---

## Verify

In Claude Code, type: `how does this work`
The `using-qa-superpowers` skill should load automatically.

Or check: `/plugin` → **Installed** tab → `qa-superpowers` should be listed.

---

## Per-Project Use

If you want the plugin active only in a specific project (not globally):

```bash
/plugin install qa-superpowers@qa-superpowers --scope project
```

This writes to `.claude/settings.json` in the project — teammates get it too when they trust the folder.

---

## Every New Project — Don't Forget

```bash
echo "MEMORY.md" >> .gitignore
```

The plugin reminds you at session start, but do it now.

---

## On a New Machine

Same two commands:

```bash
/plugin marketplace add your-username/qa-superpowers
/plugin install qa-superpowers@qa-superpowers --scope user
```

---

## Updates

```bash
/plugin marketplace update qa-superpowers
/reload-plugins
```
