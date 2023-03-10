-- DROP TABLE IF EXISTS supprime une table si elle existe
-- C'est pratique si on execute ce script plusieurs fois, pour effacer et recommencer de 0

-- Attention, la syntaxe SQL est capricieuse. Pas de virugle à la fin d'une liste ce champ lors de la création d'une table
-- Attention, les valeurs rentrée lors du INSERT INTO doivent être entre simple quote 
-- A priori, REQUIRED n'existe pas, je sais pas d'où je le sortais

BEGIN;


DROP TABLE IF EXISTS "monster",
"personnages_from_user", 
"personnage_base",
"inventory",
"teams",
"users" CASCADE;



INSERT INTO "users" ("username", "email", "password") VALUES 
    ('alex', 'alex@something.truc', 'testPassword');

INSERT INTO "personnage_base" ("name", "lvl", "power_click", "cost", "auto_click_cost", "growth_rate", "images", "game_logo_img", "quotes" ) VALUES
    ('Cloud Strife', 0, 100, 25, 5000, 1.17, '/assets/images/cloud.jpeg', '/assets/images/ff7Logo.jpeg', 'Désolé, je ne suis pas intéressé' ),
    (E'Y\'shtola', 0, 5, 2500, 40000, 1.53, '/assets/images/Yshtola.jpeg', '/assets/images/ff14Logo.jpeg', E'Je vais vous montrez pourquoi j\'ai choisi le nom de Matoya'),
    ('Balthier', 0, 12, 9000, 100000, 1.29, '/assets/images/balthier.jpeg', '/assets/images/ff12Logo.jpeg', 'Les pirates retrouvent leurs ailes'),
    ('Edge', 0, 24, 17800, 400500, 1.48, '/assets/images/edge.jpeg', '/assets/images/ff4Logo.jpeg', 'Vous pensez que notre colère est une faiblesse ? Alors laissez-moi vous montrer... comment vous avez tort !'),
    ('Ramza', 0, 41, 30000, 985000, 2.55, '/assets/images/ramza.jpeg', '/assets/images/ffTacticsLogo.jpeg','What stokes the fires of this conflict? ');

INSERT INTO "inventory" ("users_id", "xp_amount", "powerclick_amount") VALUES
    (1, 0, 1);

INSERT INTO "teams" ("name", "users_id") VALUES
    ('Hautvent', 1);

INSERT INTO "personnages_from_user" ("name", "lvl", "power_click", "cost", "auto_click_cost", "growth_rate", "images", "teams_id" ) VALUES
    ('Cloud Strife', 5, 5, 5000, 5000, 1.17, '/assets/images/cloud_strife.png',1),
    ('Yshtola', 3, 15, 12500, 40000, 1.52, '/assets/images/Yshtola.png',1),
    ('Balthier', 3, 36, 599000, 100000, 1.29, '/assets/images/balthier.jpeg',1);

INSERT INTO "monster" ("name", "images") VALUES 
    ('Shinra Soldier', '/assets/images/soldier_shinra_ff7.png');

COMMIT;

-- SELECT *  FROM users AS u INNER JOIN teams AS t ON (u.id = t.users_id) INNER JOIN personnages_from_user AS pu ON (t.id = pu.teams_id)  WHERE u.id = 1