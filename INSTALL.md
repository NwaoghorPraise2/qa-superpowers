# Installing QA Superpowers Globally

This guide covers every way to install QA Superpowers so it works across
**all your projects** on any machine running Claude Code.

---

## Option 1 — Install from GitHub (Recommended — Global)

Once you push this repo to GitHub, anyone (including yourself on any machine)
can install it globally with two commands in Claude Code:

```bash
# Step 1: Register your marketplace
/plugin marketplace add your-username/qa-superpowers

# Step 2: Install globally (user scope = all projects, all sessions)
/plugin install qa-superpowers@qa-superpowers --scope user
```

Then reload:
```bash
/reload-plugins
```

That's it. Every Claude Code session on this machine now has QA Superpowers loaded.

---

## Option 2 — Install from Local Folder (Before GitHub)

If you haven't pushed to GitHub yet, install directly from the unzipped folder:

```bash
# Step 1: Register the local marketplace
/plugin marketplace add /path/to/qa-superpowers

# Step 2: Install globally
/plugin install qa-superpowers@qa-superpowers --scope user

# Step 3: Reload
/reload-plugins
```

---

## Option 3 — Drop into Claude Code's Global Config Directly

The most direct approach — no marketplace needed:

```bash
# Create Claude Code's global plugins directory if it doesn't exist
mkdir -p ~/.claude/plugins

# Copy (or symlink) the plugin folder there
cp -r /path/to/qa-superpowers ~/.claude/plugins/qa-superpowers

# OR use a symlink so changes to the folder apply instantly:
ln -s /path/to/qa-superpowers ~/.claude/plugins/qa-superpowers
```

Then in Claude Code:
```bash
/reload-plugins
```

---

## Option 4 — Add to Global settings.json (Team / Shared Machines)

Edit `~/.claude/settings.json` (create it if it doesn't exist):

```json
{
  "extraKnownMarketplaces": {
    "qa-superpowers": {
      "source": {
        "source": "github",
        "repo": "your-username/qa-superpowers"
      }
    }
  },
  "enabledPlugins": ["qa-superpowers@qa-superpowers"]
}
```

This makes the plugin available globally and auto-loads it.

---

## Verify Installation

In any Claude Code session, type:

```
how does this work
```

or

```
/qa-superpowers:using-qa-superpowers
```

You should see the QA Superpowers orientation skill load.

---

## Verify Skills Are Active

Run `/plugin` → go to **Installed** tab → you should see `qa-superpowers` listed.

To see all skills loaded, run:
```bash
/reload-plugins
```

Output will show something like:
```
Reloaded plugins: 19 skills, 0 agents, 0 hooks
```

---

## Using with Cursor

In Cursor Agent chat:
```
/add-plugin qa-superpowers
```

Or search for "qa-superpowers" in Cursor's plugin marketplace.

---

## Keeping it Updated

If installed from GitHub:
```bash
/plugin marketplace update qa-superpowers
```

If installed from local folder, just update the files — changes apply on next `/reload-plugins`.

---

## The One Thing to Always Remember

Every project that uses this plugin needs:
```bash
echo "MEMORY.md" >> .gitignore
```

The plugin will remind you if you forget. But do it first.

---

## Pushing to GitHub (One-Time Setup)

```bash
cd /path/to/qa-superpowers
git init
git add .
git commit -m "feat: initial release of QA Superpowers plugin"
git remote add origin https://github.com/your-username/qa-superpowers.git
git push -u origin main
```

Replace `your-username` with your actual GitHub username everywhere in the plugin files.
Then update the `homepage` field in `.claude-plugin/plugin.json` and `marketplace.json`.
