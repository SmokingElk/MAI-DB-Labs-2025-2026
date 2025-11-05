CREATE TABLE IF NOT EXISTS app_user (
    id            UUID PRIMARY KEY,
    username      VARCHAR(32) UNIQUE NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()  
);

-- e. g. meters, repeats, hours
CREATE TABLE IF NOT EXISTS unit (
    id   UUID PRIMARY KEY,
    name VARCHAR(16) UNIQUE NOT NULL
);

-- e. g. sum, average
CREATE TABLE IF NOT EXISTS agregation (
    id   UUID PRIMARY KEY,
    name VARCHAR(16) UNIQUE NOT NULL
);

-- e. g. Jogging, Swimming
CREATE TABLE IF NOT EXISTS activity (
    id   UUID PRIMARY KEY,
    name VARCHAR(64) UNIQUE NOT NULL 
);

-- e. g. Distance, Time
CREATE TABLE IF NOT EXISTS metrics (
    id           UUID PRIMARY KEY,
    name         VARCHAR(64) UNIQUE NOT NULL,
    unit_id      UUID REFERENCES unit(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS allowed_metrics_for_activity (
    id          SERIAL PRIMARY KEY,
    activity_id UUID REFERENCES activity(id) NOT NULL,
    metrics_id  UUID REFERENCES metrics(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS target (
    id            UUID PRIMARY KEY, 
    activity_id   UUID REFERENCES activity(id) NOT NULL,
    metrics_id    UUID REFERENCES metrics(id) NOT NULL,
    agregation_id UUID REFERENCES agregation(id) NOT NULL,
    user_id       UUID REFERENCES app_user(id) ON DELETE CASCADE NOT NULL,
    period        INTERVAL NOT NULL,
    target_value  BIGINT NOT NULL,
    created_at    TIMESTAMP WITH TIME ZONE DEFAULT NOW()  
);

CREATE TABLE IF NOT EXISTS workout (
    id          UUID PRIMARY KEY,
    activity_id UUID REFERENCES activity(id) NOT NULL,
    user_id     UUID REFERENCES app_user(id) ON DELETE CASCADE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()  
);

CREATE TABLE IF NOT EXISTS measurement (
    id         UUID PRIMARY KEY,
    workout_id UUID REFERENCES workout(id) ON DELETE CASCADE NOT NULL,
    metrics_id UUID REFERENCES metrics(id) NOT NULL,
    value      BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS users_audit (
    id         SERIAL PRIMARY KEY,
    op         VARCHAR(4) NOT NULL,
    user_id    UUID NOT NULL,
    user_name  VARCHAR(32) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);