# Host the Hackathon Build-Off — Supabase + GitHub Pages (≈10 min, fully live)

Each exec votes from their own device, and your Results screen updates **the instant**
each vote lands. Votes live in your Supabase Postgres database; the page is served free
from GitHub Pages.

You'll touch two files in this folder: **schema.sql** (run once in Supabase) and
**index.html** (paste two values, then publish).

---

## Part A — Supabase (the database, ~4 min)

1. Go to **https://supabase.com/dashboard** and open your project (or **New project** —
   pick any name/password, free tier is fine; wait ~1 min for it to spin up).
2. Left sidebar ▸ **SQL Editor** ▸ **+ New query**.
3. Open **schema.sql** from this folder, copy all of it, paste, and click **Run**.
   You should see “Success.” This creates the `votes` table, the security rules that let
   the public anon key read + insert (but not edit/delete), and turns on live updates.
4. Left sidebar ▸ **Project Settings** (gear) ▸ **API**. Copy two things:
   - **Project URL**  — looks like `https://abcdxyz.supabase.co`
   - **anon public** key — a long string under “Project API keys”

## Part B — Put your keys in the app (~1 min)

1. Open **index.html** from this folder in a text editor.
2. Near the top of the `<script>` block, find the CONFIG lines and replace the placeholders:
   ```js
   const SUPABASE_URL      = "https://YOUR-PROJECT-REF.supabase.co";   // ← your Project URL
   const SUPABASE_ANON_KEY = "YOUR-ANON-PUBLIC-KEY";                   // ← your anon public key
   ```
3. Save. (The anon key is meant to be public — the security rules from schema.sql protect the data.)

   **Test it locally:** double-click index.html. The red config banner should be gone.
   Cast a test vote, open the **📊 Results** tab — it should appear. (Open a second browser
   window to the same file and watch it pop in live.) Clear test rows later in Part D.

## Part C — Publish on GitHub Pages (~4 min)

1. Go to **https://github.com/new** and create a repo, e.g. **hackathon-vote** (Public).
2. On the repo page click **Add file ▸ Upload files**, drag in your edited **index.html**,
   and **Commit changes**.
3. Repo **Settings ▸ Pages**. Under “Build and deployment”, set **Source: Deploy from a
   branch**, **Branch: main**, **/ (root)**, then **Save**.
4. Wait ~1 minute, refresh the Pages settings — it shows your live URL, like
   `https://YOURNAME.github.io/hackathon-vote/`. **That's the link to share.**

## Part D — Run the vote

- Send the GitHub Pages URL to the execs (Slack/email/calendar, or make a QR code).
- Put the **📊 Results** tab on the big screen — bars, podium, and the roster update live
  as votes arrive.
- When everyone's in, click **🎯 Suggest assignments** for a conflict-free builder plan.
- **Fresh round / remove a bad vote:** Supabase ▸ **Table Editor ▸ votes** ▸ delete rows
  (or run `delete from votes;` in the SQL Editor).

---

## Good to know
- **Cost:** $0. Comfortably within Supabase and GitHub Pages free tiers for a group this size.
- **Security:** the anon key only allows reading and adding votes — no edits or deletes from
  the page. Anyone with the link can vote (no login), so share it privately. The name field
  is honor-system (it doesn't verify identity) — fine for a known group of execs.
- **Updated the page later?** Re-upload index.html to the repo; Pages redeploys in ~1 min,
  same URL.
- **App number → name** (for reading the table):
  1 Executive Scorecard Analyzer · 2 Monthly Finance Analyzer · 3 Model QC Guardian ·
  4 Better One-on-Ones · 5 Value Stream Atlas · 6 LDP App · 7 DMS Meeting Evaluator ·
  8 DMS Learning Game · 9 Lean Game
