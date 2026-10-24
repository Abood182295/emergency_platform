# Isolated Authentication + RBAC prototype

> **Prototype only — not integrated with the Emergency Management System.**
> This is a standalone Rails app under `demo_slice/auth_rbac_demo/`. It has its
> own routes, controllers, model, SQLite database, password hashes and
> in-memory server-side sessions. It does not load the main app's configuration,
> assets, credentials, database, or Ruby source.

## Requirements

- Ruby 3.2.x (tested target: Ruby 3.2.11) and Bundler on Windows.
- Internet access one time to fetch the gems declared in this app's Gemfile.
- No PostgreSQL, Node, or external service is used. SQLite data stays in this
  folder's ignored `storage/` directory.

## Run in Windows PowerShell

Clone only the demo branch, then enter the isolated app:

```powershell
git clone --branch demo/auth-rbac --single-branch https://github.com/Abood182295/emergency_platform.git emergency_platform-auth-rbac
Set-Location .\emergency_platform-auth-rbac\demo_slice\auth_rbac_demo
ruby --version
bundle install
bundle exec rails db:prepare db:seed
bundle exec rails server --binding 127.0.0.1 --port 3100
```

Open **http://127.0.0.1:3100**. Stop the server with **Ctrl+C**. Port 3100 keeps
the prototype separate from the main Rails server's usual port 3000.

To run the test suite before starting the server:

```powershell
bundle exec rails test
```

## Local-only demo credentials

These synthetic accounts are seeded into the prototype's local SQLite database.
They are not real users and must never be used in production.

| Role | Email | Password |
| --- | --- | --- |
| Administrator | `admin@demo.local` | `AdminDemo!2026` |
| Coordinator | `coordinator@demo.local` | `CoordinatorDemo!2026` |
| Responder | `responder@demo.local` | `ResponderDemo!2026` |

## Security and scope

- `has_secure_password` stores BCrypt password digests; plaintext passwords are
  only in this demo's clearly labeled local seed file.
- Rails CSRF protection is enabled. Successful login rotates the session.
- Session contents live in Rails' in-memory cache on the server; the browser
  receives only Rails' opaque session cookie. Sessions expire after one hour
  and whenever the server restarts.
- The default secret key is explicitly local-development-only. Production mode
  refuses to boot without `SECRET_KEY_BASE`.
- This is a demonstration foundation, not production-ready authentication. It
  has no account recovery, rate limiting/lockout, persistent session storage,
  HTTPS setup, or production secrets management.
