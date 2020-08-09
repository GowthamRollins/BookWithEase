CREATE TABLE users
(
    id            BIGSERIAL PRIMARY KEY,
    user_name     text NOT NULL,
    password      text NOT NULL,
    email         text NOT NULL,
    mobile_number text NOT NULL,
    created_at    TIMESTAMP WITH TIME ZONE,
    updated_at    TIMESTAMP WITH TIME ZONE
);

CREATE TABLE user_login
(
    id            BIGSERIAL PRIMARY KEY,
    user_id       BIGSERIAL,
    last_login_at TIMESTAMP WITH TIME ZONE,
    CONSTRAINT fk_user_login_user FOREIGN KEY (user_id) REFERENCES users (id)
);
