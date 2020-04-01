CREATE TABLE `instagram_accounts` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
    `realUser` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
    `avatar_url` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
    PRIMARY KEY (`id`)
)
COLLATE='utf8mb4_bin'
ENGINE=InnoDB
AUTO_INCREMENT=340
;

CREATE TABLE `instagram_pics` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `authorId` INT(11) NOT NULL,
    `realUser` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
    `message` VARCHAR(256) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `pic` VARCHAR(256) NOT NULL COLLATE 'utf8mb4_unicode_ci',
    `time` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
    `likes` INT(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    INDEX `FK_instagram_pics_instagram_accounts` (`authorId`),
    CONSTRAINT `FK_instagram_pics_instagram_accounts` FOREIGN KEY (`authorId`) REFERENCES `instagram_accounts` (`id`)
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=98
;

CREATE TABLE `instagram_likes` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `authorId` INT(11) NULL DEFAULT NULL,
    `picId` INT(11) NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    INDEX `FK_instagram_likes_instagram_accounts` (`authorId`),
    INDEX `FK_instagram_likes_instagram_pics` (`picId`),
    CONSTRAINT `FK_instagram_likes_instagram_accounts` FOREIGN KEY (`authorId`) REFERENCES `instagram_accounts` (`id`),
    CONSTRAINT `FK_instagram_likes_instagram_pics` FOREIGN KEY (`picId`) REFERENCES `instagram_pics` (`id`) ON DELETE CASCADE
)
COLLATE='utf8mb4_bin'
ENGINE=InnoDB
;

