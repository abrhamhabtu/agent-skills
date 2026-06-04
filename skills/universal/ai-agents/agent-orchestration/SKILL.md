---
name: universal-agent-orchestration
description: Multi-agent orchestration patterns for any AI agent. Use when designing systems with multiple AI agents, delegation, or parallel task execution. Triggers on multi-agent, orchestration, delegate, parallel, workflow, or agent pipeline tasks.
triggers:
  - multi-agent
  - orchestration
  - delegate
  - parallel
  - workflow
  - agent-pipeline
  - swarm
agent: universal
---

# Universal Agent Orchestration

## When to Use

Designing systems with multiple AI agents, delegation patterns, or parallel task execution. This skill ensures effective coordination between agents.

## Steps

1. **Define agent roles**
   - Architect: designs system structure
   - Implementer: writes code
   - Reviewer: checks quality
   - Tester: validates functionality
   - Documenter: writes docs
   - Each agent should have a clear, single responsibility

2. **Communication patterns**
   - **Hub-and-spoke**: Central orchestrator delegates to workers
   - **Pipeline**: Output of agent A feeds agent B
   - **Mesh**: Agents communicate directly with each other
   - **Fan-out**: One task split to many agents in parallel
   - **Fan-in**: Many agents report to one aggregator

3. **State management**
   - Use a shared context or memory store
   - Document decisions in a running log
   - Version control all agent outputs
   - Maintain a single source of truth for project state

4. **Error handling**
   - Define retry strategies for failed agents
   - Implement circuit breakers for unreliable agents
   - Log all failures with context
   - Have fallback agents for critical tasks

5. **Quality gates**
   - Require review before merging agent outputs
   - Run automated tests on all code
   - Enforce style guidelines
   - Validate against acceptance criteria

6. **Human-in-the-loop**
   - Flag decisions that need human approval
   - Provide clear summaries for human review
   - Allow override of agent decisions
   - Maintain audit trail of all actions

## Pitfalls

- **Don't** create too many agents (coordination overhead)
- **Don't** let agents work without clear goals
- **Don't** ignore conflicts between agent outputs
- **Don't** skip validation steps
- **Don't** allow agents to modify shared state without locks

## Patterns

### Sequential Pipeline
```
[Requirements] -> [Design] -> [Implement] -> [Test] -> [Deploy]
```

### Parallel Fan-Out
```
         -> [Frontend Agent]
[Task] -> [Backend Agent]   -> [Integration Agent]
         -> [DevOps Agent]
```

### Hub and Spoke
```
[Orchestrator] -> [Agent A]
             -> [Agent B]
             -> [Agent C]
             <- (results)
```
