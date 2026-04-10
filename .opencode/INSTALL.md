# Installing QA Superpowers for OpenCode

## Prerequisites

- [OpenCode.ai](https://opencode.ai) installed

## Installation

Add qa-superpowers to the `plugin` array in your `opencode.json` (global or project-level):

```json
{
  "plugin": ["qa-superpowers@git+https://github.com/NwaoghorPraise2/qa-superpowers.git"]
}
```

Restart OpenCode. The plugin auto-installs and registers all skills.

Verify by asking: "Tell me about your qa-superpowers"

## Updating

QA Superpowers updates automatically when you restart OpenCode.

To pin a specific version:

```json
{
  "plugin": ["qa-superpowers@git+https://github.com/NwaoghorPraise2/qa-superpowers.git#v1.0.0"]
}
```
