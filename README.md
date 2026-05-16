# ✦ Job Search Superpower

> *An evidence-grounded prompt for the job search you actually want to run.*

![Job Search Superpower banner](assets/banner.svg)

---

## ◆ What this is

**Job Search Superpower** is a portable prompt — usable as a system prompt in any LLM, or as a Claude skill via the included YAML frontmatter — that walks a user through a complete, structured job-search workflow. It covers industry and role alignment, employment-type guidance, resume optimization or build-from-scratch, LinkedIn profile refinement or build-from-scratch, portfolio and cover-letter strategy, and a prioritized action plan with honest LinkedIn Premium vs. free ROI guidance. Every recommendation is grounded in current best practices, LinkedIn algorithm and recruiter behavior data, standard occupation taxonomies (NAICS / SOC / O\*NET in the US; ISCO / NOC / ANZSCO / SOC2020 elsewhere), and 21 role-family tunings spanning software, product, design, sales, customer success, marketing, technical writing, data, healthcare, legal, finance, government, academic-to-industry pivots, nonprofit, construction and trades, returners, recent grads, career changers, founder re-entry, executive search, and international candidates.

## ▸ Structure, inputs, outputs

**Inputs.** The user may supply any combination of: a resume or CV (pasted text, PDF, Word, plain text, Markdown), a structured-format export (JSON Resume schema, LinkedIn full data archive JSON, resume-parser output), a LinkedIn profile URL — handled via an opt-in lookup workflow that returns a numbered list of candidate matches the user confirms — a LinkedIn profile PDF export, steering notes (target industries, geography, comp floor, deal-breakers), or nothing at all (the prompt runs as a guided interview). When both a resume and LinkedIn are provided, the prompt uses both and explicitly flags any inconsistencies between them. **Outputs.** A single structured markdown report with named sections: Profile Summary, Skills / Experience / Interests Alignment, Employment Type and Logistics, Application Materials (resume + LinkedIn + portfolio + cover letter — mode-stacked based on what the user provided), Next Steps and Action Plan, and Sources and Caveats. The report is scannable — short paragraphs, bulleted lists, drafted text rather than abstract advice — and its length scales to the depth of intake.

## → How it works

The assistant runs six steps in order: silently grounding itself in current best practices and LinkedIn platform conventions; conducting an adaptive intake interview with explicit stop-rules so it doesn't over-interrogate; aligning the user's background against industry and occupation taxonomies and ranking 3–6 strongest fits with hop-length classification (short / medium / long); matching employment type and geography to the user's stated preferences and constraints; producing mode-stacked application-material recommendations including a 12-subsection LinkedIn profile spec that works as either an edit guide or a build-from-scratch template; and delivering a prioritized, time-bound action plan that includes role-family-specific interview prep, compensation prep with total-comp math for transitions, bridge-work suggestions when the user signals urgency, and honest Premium ROI guidance. The file also contains an inactive **Further Refinement** section — wrapped in HTML comments, ready to activate when sanctioned LinkedIn data access becomes available — that specifies a complete back-testing methodology including outcome signals, cohort design, trajectory analysis, randomized A/B testing of the prompt's own recommendations, and disparate-impact auditing.

---

## ⌘ Quick start

**As a prompt:** copy the contents of [`job-search-superpower-prompt-skill.md`](./job-search-superpower-prompt-skill.md) into any LLM as a system prompt or first turn. The YAML frontmatter is harmless preamble for non-skill consumers.

**As a Claude skill:** drop the file into `~/.claude/skills/job-search-superpower/SKILL.md` and Claude Code will auto-discover and activate it on relevant prompts.

## ◇ Status and scope

✓ Production-ready, 23-persona-tested, ~500 lines  
✓ Covers 21 role families with industry-specific tuning  
✓ Includes honest Premium-vs-free ROI guidance  
✓ Title-integrity, freelance-consolidation, and disparate-impact guardrails  
✗ Not legal, financial, immigration, or licensed career advice — flagged in-prompt  
✗ Hiring-trend data is approximate — users directed to authoritative sources to verify

## ✦ License and attribution

MIT with attribution. See [LICENSE](./LICENSE). Free to use, fork, and adapt — attribution preserved.

## ✦ Author

**Mike Bengtson** · [mike.bengtson@gmail.com](mailto:mike.bengtson@gmail.com) · [X / @MHBengtson](https://x.com/mhbengtson) · [GitHub gist](https://gist.github.com/MikeBengtson)
