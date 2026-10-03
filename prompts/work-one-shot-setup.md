Prepare this project for efficient ChatGPT Work usage while preserving correctness.

Do not rewrite product/business content merely to shorten it.

Create or improve a compact .context layer:
- .context/PROJECT_CONTEXT.md
- .context/CURRENT_TASK.md
- .context/DECISIONS.md
- .context/SOURCE_INDEX.md

Rules:
1. Inspect project-level instructions and the top-level file/source structure first.
2. Do not preload every source.
3. Build SOURCE_INDEX.md as a routing index to authoritative sources.
4. PROJECT_CONTEXT.md must contain only stable project-wide facts and constraints.
5. CURRENT_TASK.md must remain task-specific and short.
6. DECISIONS.md must contain durable decisions only, not chat transcripts.
7. Preserve existing useful context files; merge rather than blindly overwrite.
8. Original files remain authoritative. Expand context whenever correctness requires it.
9. Do not claim exact Work token savings unless actual telemetry is available.
10. Report the approximate size of the persistent context files and warn if they are becoming large.

If essential project facts cannot be inferred cheaply, ask at most 5 concise questions in one batch.

At the end, report:
- files created/updated;
- existing content preserved;
- source index coverage;
- approximate persistent context size;
- any large context source that should stay on-demand;
- the shortest normal prompt to use in future Work chats.
