-- liquibase formatted sql

-- changeset bmuratbek:init_1000:0
CREATE TABLE IF NOT EXISTS `streaming-service-data-manager`.roles (
	`role` varchar(100) NOT NULL,
	CONSTRAINT role_PK PRIMARY KEY (`role`)
) ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    COLLATE=utf8_general_ci;
--rollback drop table `streaming-service-data-manager`.roles IF EXISTS

-- changeset bmuratbek:init_1000:1
-- precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM `streaming-service-data-manager`.roles WHERE role = 'manager'
INSERT INTO `streaming-service-data-manager`.roles(role) VALUES ('manager'), ('subscriber'), ('publisher');
--rollback DELETE FROM `streaming-service-data-manager`.roles WHERE role='manager' or role='subscriber' or role='publisher';

-- changeset bmuratbek:init_1000:2
CREATE TABLE IF NOT EXISTS `streaming-service-data-manager`.users (
	id BIGINT auto_increment NOT NULL,
	first_name varchar(150) NOT NULL,
	last_name varchar(150) NOT NULL,
	role varchar(100) NULL,
    created_on DATE NULL,
    update_on DATE NULL,
	CONSTRAINT user_PK PRIMARY KEY (id)
) ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    COLLATE=utf8_general_ci;
--rollback drop table `streaming-service-data-manager`.users IF EXISTS

-- changeset bmuratbek:init_1000:3
-- precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'role_FK'
ALTER TABLE `streaming-service-data-manager`.users ADD CONSTRAINT roles_FK FOREIGN KEY (role) REFERENCES `streaming-service-data-manager`.roles(role);
--rollback DROP CONSTRAINT role_FK IF EXISTS

-- changeset bmuratbek:init_1000:4
CREATE TABLE IF NOT EXISTS `streaming-service-data-manager`.movies (
	id BIGINT auto_increment NOT NULL,
	title varchar(200) NOT NULL,
	info TEXT NULL,
	created_by BIGINT NOT NULL,
	created_on date NOT NULL,
	update_by BIGINT NULL,
	update_on date NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
) ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    COLLATE=utf8_general_ci;
--rollback drop table `streaming-service-data-manager`.movies IF EXISTS

-- changeset bmuratbek:init_1000:5
-- precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'movies_created_by_FK'
ALTER TABLE `streaming-service-data-manager`.movies ADD CONSTRAINT movies_created_by_FK FOREIGN KEY (created_by) REFERENCES `streaming-service-data-manager`.users(id)
--rollback DROP CONSTRAINT movies_created_by_FK IF EXISTS

-- changeset bmuratbek:init_1000:6
-- precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_NAME = 'movies_update_by_FK'
ALTER TABLE `streaming-service-data-manager`.movies ADD CONSTRAINT movies_update_by_FK FOREIGN KEY (update_by) REFERENCES `streaming-service-data-manager`.users(id)
--rollback DROP CONSTRAINT movies_update_by_FK IF EXISTS

-- changeset bmuratbek:init_1000:7
-- precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM `streaming-service-data-manager`.users WHERE first_name = 'Дэниэл' AND last_name = 'Мердикадзэ'
INSERT INTO `streaming-service-data-manager`.users (first_name, last_name, role, created_on, update_on) VALUES
    ('Дэниэл', 'Мердикадзэ', 'manager', '2012-06-20 15:23:45', null),
    ('Константин', 'Руфинов', 'manager', '2011-11-14 19:00:30', null),
    ('Алмаз', 'Кубеев', 'manager', '2014-01-23 14:13:24', null),
    ('Аркадий', 'Данилов', 'publisher', '2015-02-18 09:20:10', null),
    ('Рахат', 'Бактыбаев', 'publisher', '2017-09-09 17:11:03', null),
    ('Садор', 'Уколобоев', 'publisher', '2019-04-01 11:02:05', null),
    ('Рустем', 'Орконидзэ', 'publisher', '2020-07-15 13:02:02', null),
    ('Салтанат', 'Дюсюпова', 'publisher', '2021-08-18 16:22:12', null),
    ('Светлана', 'Константинова', 'publisher', '2020-03-03 11:04:09', null),
    ('Султан', 'Даирбеков', 'subscriber', '2018-02-19 16:15:18', null),
    ('Альфред', 'Бехтольш', 'subscriber', '2021-08-21 13:12:12', null),
    ('Ингрид', 'Больмапэль', 'subscriber', '2018-06-20 20:21:19', null),
    ('Жак', 'Биргюдо', 'subscriber', '2022-09-22 19:01:56', null);
--rollback select 1

-- changeset bmuratbek:init_1000:8
-- precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM `streaming-service-data-manager`.movies WHERE title = 'Метроминокон'
INSERT INTO `streaming-service-data-manager`.movies (title, info, created_by, created_on, update_by, update_on) VALUES
    ('Метрономикон', '{"info": {"description": "Фильм представляет собой некую альтернативную вселенную, где событие разворачивается во времена распада СССР. В тот момент, когда 15 республик ранее были в составе большой державы каждый из республик начинают постепенно декларировать свою независимость. Литва, Латвия, Эстония как и в современном мире действительно обрели первыми среди других стран, и потом они вступают в евросоюз и НАТО. Республика Казахстана и Грузии становятся демократическими республиками, хотя в начале 90-х бывшие президенты обеих республик стараются удержать диктатуру, однако обоим из них не удается этого сделать, и в итоге, страны становятся парламентскими республиками и далее держат курс на Запад вступая  в Северо-Атлантический союз тем самым обезопася себя от рук империалистов Севера. В Украине старательно сражаются за свободу и в итоге они попадают под цепи российских властителей, и главный герой фильма, Сергио Голищенко с малым отрядом партизанов активно организовывают массовые сопротивления по всей стране. Получится ли у оставшихся патриотов страны с поддержкой Запада отбить страну от русских?", "descriptionKz": null, "descriptionEn": null}}', 4, '2015-02-20 11:09:11', null, null),
    ('Бионом', '{"info": {"description": "Вымышленный город Гесторбург подвержен массовому распространению вируса “Бионом” разработанный группой ученых в целях био-оружия, который был запланирован для использования в самых экстренных ситуациях и военных целях правительством Ореоргиорэн. Часть вируса была слита и тем самым вызвала заражение по городу. Военные оцепили город и лишь до правой части города пока что не попал вирус, пока. Как только вирус попадает в организм человека, у человека пропадает рассудок и вирус вызывает галлюцинации, показывая всех живых организмов в их глазах как нечто жудких существ тем самым делая их автоматически врагами. Человек один раз заразившийся вирусом, больше не будет считаться живым, можно сказать что это ходячий мертвец погрязший в мир иллюзии. В фильме, последние оставшиеся люди активно сопротивляются массовому нападению инфицированных людей. Правительство активно эвакуирует жителей города в самой далекой точке правой части Гесторбурга. Но в ходе эвакуации, Эшли и Якоб остаются заточенными в метро города и чтобы дойти до ближайшей точки радиоперехватчика, паре придётся приодолеть немало трудностей на пути.", "descriptionKz": null, "descriptionEn": null}}', 7, '2020-07-20 13:05:45', null, null),
    ('Бъерн Вуйчич', '{"info": {"description": "Фильм повествует о великом ученом, которому удалось приблизить открытие машины времени благодаря экспериментам с аппаратом над которым он трудился с университетских лет. После успешной попытки создать машину времени, ученый решается протестировать устройство и отправится на 20 лет вперед, и попадает в дистопию, где нынешние мировые правительства были разрушены, сожжены города и миром правит хаос. Изобрев данное устройство, ученый не учел катастрофических последствии, которое может повлечь собой данное изобретение. В одном из местных сел уцелевших от войн, Бъерн встречает  в баре историка Гарри Оруэлла, где он повествует о том, что ученый изобрев данное устройство тем самым поробащает мир в хаос. Об его устройство узнает некий человек по имени Аргус Меншенальд и крадёт его для использования в своих целях и в данной вселенной он становится диктатором, который угнетает целые народы и страны и пр.евращает мир в варварство. Главному герою нужно будет заполучить устройство и уничтожить его, и затем вернуться в свой мир и просто прекратить дальнейшее развитие, чтобы предотвратить целое уничтожение цивилизации.", "descriptionKz": null, "descriptionEn": null}}', 8, '2021-09-01 09:25:08', null, null);
--rollback select 1