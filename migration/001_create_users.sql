-- 001_create_users.sql
-- Initial migration: Create users table

CREATE TABLE IF NOT EXISTS users (
    uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id VARCHAR NOT NULL UNIQUE,
    role VARCHAR NOT NULL DEFAULT 'user',
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS ix_users_id ON users(id);
CREATE INDEX IF NOT EXISTS ix_users_role ON users(role);

-- Seed admin users
INSERT INTO users (id, role) VALUES ('posetmage@gmail.com', 'admin') ON CONFLICT (id) DO NOTHING;
INSERT INTO users (id, role) VALUES ('mail@posetmage.com', 'admin') ON CONFLICT (id) DO NOTHING;
