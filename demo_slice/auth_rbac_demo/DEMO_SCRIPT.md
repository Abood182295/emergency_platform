# Professor demonstration (2–3 minutes)

Keep the local app running at **http://127.0.0.1:3100**. Introduce it as an
isolated prototype that does not change or depend on the main Rails app.

1. **0:00–0:25 — Sign-in page.** Show the Arabic-first RTL page and explain that
   this standalone Rails app uses its own SQLite database and server-side
   sessions.
2. **0:25–0:50 — Invalid login.** Try `admin@demo.local` with an incorrect
   password. Point out the friendly error. Then sign in with
   `AdminDemo!2026`.
3. **0:50–1:15 — Administrator dashboard.** Show the role badge and the
   administrator-specific cards. Open “فتح صفحة الدور المقيدة” to show the
   administrator route.
4. **1:15–1:50 — Authorization denial.** Log out and sign in as
   `responder@demo.local` using `ResponderDemo!2026`. Manually open
   `http://127.0.0.1:3100/dashboard/administrator`; show the 403 page. Explain
   that the server checks the stored role on every restricted request.
5. **1:50–2:15 — Logout.** Return to the Responder dashboard, choose
   “تسجيل الخروج”, then revisit `/dashboard`; it redirects to sign-in because
   the session was cleared.
6. **2:15–2:40 — Close.** Mention the Coordinator role (`coordinator@demo.local`,
   `CoordinatorDemo!2026`), BCrypt digests, CSRF protection, and that integration
   with the main project is a future, separately reviewed step.

All demo credentials are local-only and documented in [README.md](README.md).
