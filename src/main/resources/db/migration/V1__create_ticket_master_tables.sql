CREATE TABLE genre
(
    id         BIGSERIAL PRIMARY KEY,
    type       text NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);


CREATE TABLE movie
(
    id           BIGSERIAL PRIMARY KEY,
    title        text    NOT NULL,
    description  text    NOT NULL,
    duration     INTEGER NOT NULL,
    release_date TIMESTAMP WITHOUT TIME ZONE,
    country      text    NOT NULL,
    genre_id     BIGINT,
    created_at   TIMESTAMP WITH TIME ZONE,
    updated_at   TIMESTAMP WITH TIME ZONE,
    CONSTRAINT fk_movie_genre FOREIGN KEY (genre_id) REFERENCES genre (id)
);

CREATE TABLE city
(
    id         BIGSERIAL PRIMARY KEY,
    name       text NOT NULL,
    state      text NOT NULL,
    zip_code   text NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);


CREATE TABLE cinema
(
    id          BIGSERIAL PRIMARY KEY,
    name        text    NOT NULL,
    cinema_hall INTEGER NOT NULL,
    city_id     BIGINT,
    created_at  TIMESTAMP WITH TIME ZONE,
    updated_at  TIMESTAMP WITH TIME ZONE,
    CONSTRAINT fk_cinema_city FOREIGN KEY (city_id) REFERENCES city (id)
);

CREATE TABLE cinema_hall
(
    id          BIGSERIAL PRIMARY KEY,
    name        text    NOT NULL,
    total_seats INTEGER NOT NULL,
    cinema_id   BIGINT,
    created_at  TIMESTAMP WITH TIME ZONE,
    updated_at  TIMESTAMP WITH TIME ZONE,
    CONSTRAINT fk_cinema_cinema_hall FOREIGN KEY (cinema_id) REFERENCES cinema (id)
);


CREATE TABLE cinema_seat
(
    id             BIGSERIAL PRIMARY KEY,
    seat_number    INTEGER NOT NULL,
    type           text    NOT NULL,
    cinema_hall_id BIGINT,
    created_at     TIMESTAMP WITH TIME ZONE,
    updated_at     TIMESTAMP WITH TIME ZONE,
    CONSTRAINT fk_cinema_seat_cinema_hall FOREIGN KEY (cinema_hall_id) REFERENCES cinema_hall (id)
);


CREATE TABLE show
(
    id             BIGSERIAL PRIMARY KEY,
    date           TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    start_time     TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    end_time       TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    movie_id       BIGINT,
    cinema_hall_id BIGINT,
    created_at     TIMESTAMP WITH TIME ZONE,
    updated_at     TIMESTAMP WITH TIME ZONE,
    CONSTRAINT fk_show_movie FOREIGN KEY (movie_id) REFERENCES movie (id),
    CONSTRAINT fk_show_cinema_hall FOREIGN KEY (cinema_hall_id) REFERENCES cinema_hall (id)
);

