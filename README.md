# GeorgeTeamAgentTemplate

One-command setup for your team's AI.

This is a public-safe starter template for packaging a team's agent workflow so
every engineer starts with the same base context:

- root `AGENTS.md` instructions
- agent spec
- MCP/tool configuration
- shared and team-owned skills
- install/start/session hooks
- lightweight memory conventions
- safety and adoption docs

The point is not this exact runtime. The point is the distribution pattern:
treat team agent context like installable infrastructure.

## The Idea

Most teams do not have one AI workflow.

They have scattered rituals:

- one engineer has a strong prompt
- another has custom steering docs
- another has useful scripts
- another remembers the setup sequence
- another has team context in a private note

That does not scale.

This template turns the workflow into an installable team package.

```bash
team-agent install GeorgeTeamAgentTemplate
```

Then the team starts the configured agent with one command or alias.

```bash
ai
```

## Package Shape

```text
GeorgeTeamAgentTemplate/
├── AGENTS.md
├── README.md
├── index.md
├── IMPROVEMENTS.md
├── CHANGELOG.md
├── package.example.yaml
├── package.json
├── .github/workflows/validate.yml
├── agents/
│   └── team-ai.agent-spec.json
├── context/
│   └── team-context-discovery.md
├── docs/
│   ├── ADOPTING.md
│   ├── LIFECYCLE.md
│   ├── MEMORY_GOVERNANCE.md
│   └── SAFETY.md
├── hooks/
│   ├── AGENTS.md
│   ├── install.sh
│   ├── agent-start.sh
│   ├── doctor.sh
│   ├── uninstall.sh
│   └── session-summary.sh
├── schemas/
│   ├── agent-spec.schema.json
│   └── package.schema.json
├── scripts/
│   └── validate.js
├── skills/
│   ├── AGENTS.md
│   ├── README.md
│   ├── index.md
│   ├── IMPROVEMENTS.md
│   ├── code-review-prep-ops/
│   │   └── SKILL.md
│   └── service-change-ops/
│       └── SKILL.md
└── memory/
    ├── AGENTS.md
    ├── README.md
    ├── index.md
    ├── journals/
    │   └── 2026/06/2026-06-03_example-user.md
    ├── weekly/
    │   └── 2026-W23.md
    └── promoted/
        └── team-ai-current-patterns.md
```

## How It Works

1. `package.example.yaml` declares the umbrella package.
2. `agents/team-ai.agent-spec.json` defines the default agent.
3. `AGENTS.md` gives the base behavior every engineer receives.
4. `context/team-context-discovery.md` shows how to find team-specific context.
5. `skills/` shows the shape of reusable workflow skills.
6. `hooks/` installs, starts, validates, logs, and uninstalls the setup.
7. `memory/` shows the shape of incremental journals and promoted memory docs.

## Instruction Tree Pattern

Start with one root `AGENTS.md`.

Add nested `AGENTS.md` files only when a folder needs local rules.

Good examples in this template:

- `hooks/AGENTS.md`: hooks can edit local shell state, so safety rules matter.
- `skills/AGENTS.md`: skills need naming, frontmatter, and ownership rules.
- `memory/AGENTS.md`: memory needs privacy, retention, and promotion rules.

Avoid adding local `AGENTS.md` files that only repeat root behavior.

## Install Flow

Preview shell changes:

```bash
./hooks/install.sh --dry-run
```

Install the local launcher:

```bash
./hooks/install.sh
```

Start the agent:

```bash
ai
```

Disable session-start auto-update:

```bash
TEAM_AI_AUTO_UPDATE=0 ./hooks/agent-start.sh
```

Pin the package to a Git ref:

```bash
TEAM_AI_PINNED_REF=v0.1.0 ./hooks/agent-start.sh
```

Uninstall:

```bash
./hooks/uninstall.sh --dry-run
./hooks/uninstall.sh
```

## Validation

```bash
npm run validate
./hooks/doctor.sh
```

## License

MIT.

## What To Replace

- `team-ai`
- `GeorgeTeamAgentTemplate`
- `platform-ai-team`
- example MCP/tool names
- example skill names
- discovery rules in `context/team-context-discovery.md`
- runtime adapter notes in `examples/`

Keep the package philosophy intact: one install path, owned context, explicit
hooks, reusable skills, and memory that is useful without becoming a data dump.
