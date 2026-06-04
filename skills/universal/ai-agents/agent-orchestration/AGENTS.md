# Universal Agent Orchestration

Use when designing multi-agent systems.

## Rules

1. Define clear roles (architect, implementer, reviewer, tester, documenter)
2. Choose communication pattern: hub-and-spoke, pipeline, mesh, fan-out/fan-in
3. Use shared context/memory store for state
4. Define retry strategies and circuit breakers
5. Implement quality gates before merging outputs
6. Flag decisions needing human approval

## Anti-Patterns

- Too many agents (coordination overhead)
- Agents without clear goals
- Ignoring conflicts between outputs
- Skipping validation
- Unlocked shared state modifications
