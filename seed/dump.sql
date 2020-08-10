INSERT INTO city VALUES(1, 'Chennai', 'Tamil Nadu', '600054', now(), now());
INSERT INTO city VALUES(2, 'Coimbatore', 'Tamil Nadu', '600071', now(), now());

INSERT INTO cinema VALUES(1, 'Sangam', 3, 1, now(), now());
INSERT INTO cinema VALUES(2, 'INOX', 3, 2, now(), now());
INSERT INTO cinema VALUES(3, 'FUN CITY', 3, 1, now(), now());

INSERT INTO genre VALUES (1, 'WAR DRAMA', now(), now());
INSERT INTO genre VALUES (2, 'HORROR', now(), now());
INSERT INTO genre VALUES (3, 'COMEDY', now(), now());
INSERT INTO genre VALUES (4, 'ROMANCE', now(), now());

INSERT INTO movie VALUES (1, 'spartacus', 'spartacus', 120, now(), 'Italy', 1, now(), now());
INSERT INTO movie VALUES (2, 'vikings', 'vikings', 140, now(), 'England', 1, now(), now());
INSERT INTO movie VALUES (3, 'last kingdom', 'last kingdom', 160, now(), 'England', 1, now(), now());
INSERT INTO movie VALUES (4, 'Haunting of the hill house', 'hill house', 160, now(), 'England', 2, now(), now());


INSERT INTO cinema_hall VALUES (1, 'padmam', 5, 1, now(), now());
INSERT INTO cinema_hall VALUES (2, 'roobam', 5, 1, now(), now());
INSERT INTO cinema_hall VALUES (3, 'pvr gate 1', 5, 2, now(), now());
INSERT INTO cinema_hall VALUES (4, 'pvr gate 2', 5, 2, now(), now());
INSERT INTO cinema_hall VALUES (5, 'saga', 5, 3, now(), now());
INSERT INTO cinema_hall VALUES (6, 'ganicus', 5, 3, now(), now());


INSERT INTO cinema_seat VALUES (1, 1, 'SINGLE', 1, now(), now());
INSERT INTO cinema_seat VALUES (2, 2, 'SINGLE', 1, now(), now());
INSERT INTO cinema_seat VALUES (3, 3, 'SINGLE', 1, now(), now());
INSERT INTO cinema_seat VALUES (4, 4, 'SINGLE', 1, now(), now());
INSERT INTO cinema_seat VALUES (5, 5, 'SINGLE', 1, now(), now());
INSERT INTO cinema_seat VALUES (6, 1, 'SINGLE', 2, now(), now());
INSERT INTO cinema_seat VALUES (7, 2, 'SINGLE', 2, now(), now());
INSERT INTO cinema_seat VALUES (8, 3, 'SINGLE', 2, now(), now());
INSERT INTO cinema_seat VALUES (9, 4, 'SINGLE', 2, now(), now());
INSERT INTO cinema_seat VALUES (10, 5, 'SINGLE', 2, now(), now());

INSERT INTO show VALUES (1, '2020-08-10', '2020-08-10 10:00:00', '2020-08-10 12:00:00', 1, 1, now(), now());
INSERT INTO show VALUES (2, '2020-08-10', '2020-08-10 10:00:00', '2020-08-10 12:00:00', 1, 2, now(), now());
