# ✦ Job Search Superpower

> *An evidence-grounded prompt for the job search you actually want to run.*

![Job Search Superpower banner](assets/banner.svg)

---

## ◆ What this is

**Job Search Superpower** is a portable prompt — usable as a system prompt in any LLM, or as a Claude skill via the included YAML frontmatter — that walks a user through a complete, structured job-search workflow.

What it covers:

- ▸ Industry and role alignment with hop-length classification (short / medium / long)
- ▸ Employment-type guidance (FTE, contract, freelance, fractional, founding)
- ▸ Resume optimization (Mode A) or build-from-scratch resume plan (Mode B)
- ▸ Resume shader options for role-, industry-, platform-, or job-description-specific targeting
- ▸ LinkedIn profile refinement or build-from-scratch (Mode C — works as edit guide or template)
- ▸ Portfolio and cover-letter strategy
- ▸ Prioritized action plan with role-family-specific interview prep and compensation math
- ▸ Honest LinkedIn Premium vs. free ROI guidance
- ▸ Optional Engagement Stack export for Career OS ingestion

Grounded in:

- ▸ Current LinkedIn algorithm and recruiter behavior data
- ▸ Standard occupation taxonomies — NAICS / SOC / O\*NET (US); ISCO / NOC / ANZSCO / SOC2020 (international)
- ▸ 21 role-family tunings — software, product, design, sales, customer success, marketing, technical writing, data, healthcare, legal, finance, government, academic-to-industry, nonprofit, construction/trades, returners, recent grads, career changers, founder re-entry, executive, international

## ▸ Structure, inputs, outputs

**Inputs** the user may supply (any combination, or nothing):

- ▸ Resume or CV — pasted text, PDF, Word, plain text, Markdown
- ▸ Structured-format export — JSON Resume schema, LinkedIn full data archive JSON, resume-parser output
- ▸ LinkedIn profile URL — handled via an opt-in lookup workflow that returns a numbered list of candidate matches the user confirms
- ▸ LinkedIn profile PDF export
- ▸ Steering notes — target industries, geography, comp floor, deal-breakers
- ▸ Engagement Stack repository context, when the user wants a Career OS handoff
- ▸ Nothing — the prompt runs as a guided interview

When both a resume and LinkedIn are provided, the prompt uses both and explicitly flags any inconsistencies between them.

**Outputs** — a single structured markdown report with these named sections:

- ▸ Profile Summary
- ▸ Skills / Experience / Interests Alignment
- ▸ Employment Type and Logistics
- ▸ Application Materials — resume + LinkedIn + portfolio + cover letter, mode-stacked based on what the user provided
- ▸ Next Steps and Action Plan
- ▸ Sources and Caveats
- ▸ Optional Engagement Stack export — `job-search-report.md` plus `job-search-export.yaml`

The report is scannable — short paragraphs, bulleted lists, drafted text rather than abstract advice — and its length scales to the depth of intake.

## → How it works

The assistant runs seven steps in order, with the seventh running only when the user wants an Engagement Stack handoff:

1. **Internal grounding** — silently consolidates current best practices and LinkedIn platform conventions
2. **Adaptive intake** — interview with explicit stop-rules so it doesn't over-interrogate
3. **Alignment** — ranks 3–6 strongest industry/role fits with hop-length classification
4. **Employment type and geography** — matches employment style and location to the user's stated preferences and constraints
5. **Application materials** — mode-stacked recommendations including a 12-subsection LinkedIn profile spec
6. **Next Steps and Action Plan** — prioritized, time-bound actions including bridge work, networking, materials, interview prep, compensation prep, and Premium ROI
7. **Optional Engagement Stack export** — emits a human-readable report and advisory YAML handoff when the user is maintaining an Engagement Stack Career OS

The file also contains an inactive **Further Refinement** section — wrapped in HTML comments, ready to activate when sanctioned LinkedIn data access becomes available — specifying:

- ▸ Outcome signals and cohort design
- ▸ Trajectory analysis (profile diffs in the 60–90 days before hire)
- ▸ Randomized A/B testing of the prompt's own recommendations
- ▸ Disparate-impact auditing
- ▸ Mapping of every finding back to a named section of the prompt with a versioned changelog

---

## → Engagement Stack handoff

When the user maintains an Engagement Stack Career OS, this prompt can emit an advisory handoff packet:

- ▸ `job-search-report.md` — the human-readable strategy report
- ▸ `job-search-export.yaml` — target roles, industries, employment preferences, resume recommendations, LinkedIn recommendations, evidence gaps, and described resume-shader recommendations

Engagement Stack can ingest that packet after user review, keeping the job-search prompt as the strategy surface and Engagement Stack as the durable source of truth. Shader recommendations include both structured targeting fields and human-readable descriptions so the user can decide which tailored resume variants are worth maintaining.

---

## ⌘ Quick start

- **As a prompt:** copy the contents of [`job-search-superpower-prompt-skill.md`](./job-search-superpower-prompt-skill.md) into any LLM as a system prompt or first turn. The YAML frontmatter is harmless preamble for non-skill consumers.
- **As a Claude skill:** drop the file into `~/.claude/skills/job-search-superpower/SKILL.md` and Claude Code will auto-discover and activate it on relevant prompts.

## ◇ Status and scope

- ✓ Production-ready, 23-persona-tested, ~500 lines
- ✓ Covers 21 role families with industry-specific tuning
- ✓ Includes honest Premium-vs-free ROI guidance
- ✓ Title-integrity, freelance-consolidation, and disparate-impact guardrails
- ✓ Optional Engagement Stack export handoff for Career OS workflows
- ✗ Not legal, financial, immigration, or licensed career advice — flagged in-prompt
- ✗ Hiring-trend data is approximate — users directed to authoritative sources to verify

## ✦ License and attribution

MIT with attribution. See [LICENSE](./LICENSE). Free to use, fork, and adapt — attribution preserved.

## ✦ Author

**Mike Bengtson** · [mike.bengtson@gmail.com](mailto:mike.bengtson@gmail.com) · [X / @MHBengtson](https://x.com/mhbengtson) · [GitHub gist](https://gist.github.com/MikeBengtson)
