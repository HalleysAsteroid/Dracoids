-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dracoidsDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dracoidsDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dracoidsDB` DEFAULT CHARACTER SET utf8mb4 ;
USE `dracoidsDB` ;

-- -----------------------------------------------------
-- Table `dracoidsDB`.`faction_tiers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`faction_tiers` (
  `faction_tier_id` INT NOT NULL,
  `faction_tier_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`faction_tier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`kins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`kins` (
  `kin_id` INT NOT NULL,
  `kin_name` VARCHAR(45) NULL,
  PRIMARY KEY (`kin_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`wrixes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`wrixes` (
  `wrix_id` INT NOT NULL,
  `version_number` VARCHAR(45) NULL,
  PRIMARY KEY (`wrix_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`player_character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`player_character` (
  `player_character_id` INT NOT NULL AUTO_INCREMENT,
  `player_character_name` VARCHAR(45) NULL,
  `health_points` INT NOT NULL,
  `strength_score` INT NOT NULL,
  `dexterity_score` INT NOT NULL,
  `constitution_score` INT NOT NULL,
  `intelligence_score` INT NOT NULL,
  `wisdom_score` INT NOT NULL,
  `charisma_score` INT NOT NULL,
  `faction_tier_id` INT NULL,
  `kin_id` INT NULL,
  `equipped_wrix_id` INT NULL,
  `total_level` INT NOT NULL,
  `soul_points` INT NOT NULL,
  `armor_class` INT NOT NULL,
  `barrier_class` INT NOT NULL,
  `height_inches` DOUBLE NULL,
  `weight_pounds` DOUBLE NULL,
  `age` INT NULL,
  `hair_color` VARCHAR(45) NULL,
  `eye_color` VARCHAR(45) NULL,
  `righteousness` INT NOT NULL,
  PRIMARY KEY (`player_character_id`),
  INDEX `faction_tier_id_idx` (`faction_tier_id` ASC) VISIBLE,
  INDEX `kin_id_idx` (`kin_id` ASC) VISIBLE,
  INDEX `equipped_wrix_id_idx` (`equipped_wrix_id` ASC) VISIBLE,
  CONSTRAINT `faction_tier_id`
    FOREIGN KEY (`faction_tier_id`)
    REFERENCES `dracoidsDB`.`faction_tiers` (`faction_tier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `kin_id`
    FOREIGN KEY (`kin_id`)
    REFERENCES `dracoidsDB`.`kins` (`kin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `equipped_wrix_id`
    FOREIGN KEY (`equipped_wrix_id`)
    REFERENCES `dracoidsDB`.`wrixes` (`wrix_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`approaches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`approaches` (
  `approach_id` INT NOT NULL,
  `approach_name` VARCHAR(45) NULL,
  PRIMARY KEY (`approach_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`pc_assigned_approaches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`pc_assigned_approaches` (
  `approach_id` INT NOT NULL,
  `player_character_id` INT NOT NULL,
  `is_primary` TINYINT NOT NULL,
  `approach_level` INT NOT NULL,
  PRIMARY KEY (`approach_id`, `player_character_id`),
  INDEX `player_character_idx` (`player_character_id` ASC) VISIBLE,
  CONSTRAINT `assigned_approaches_approach_id`
    FOREIGN KEY (`approach_id`)
    REFERENCES `dracoidsDB`.`approaches` (`approach_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `assigned_approaches_player_character_id`
    FOREIGN KEY (`player_character_id`)
    REFERENCES `dracoidsDB`.`player_character` (`player_character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`skills` (
  `skill_id` INT NOT NULL,
  `skill_name` VARCHAR(45) NOT NULL,
  `skill_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`skill_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`pc_assigned_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`pc_assigned_skills` (
  `skill_id` INT NOT NULL,
  `player_character_id` INT NOT NULL,
  PRIMARY KEY (`skill_id`, `player_character_id`),
  INDEX `player_character_id_idx` (`player_character_id` ASC) VISIBLE,
  CONSTRAINT `assigned_skills_skill_id`
    FOREIGN KEY (`skill_id`)
    REFERENCES `dracoidsDB`.`skills` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `assigned_skills_player_character_id`
    FOREIGN KEY (`player_character_id`)
    REFERENCES `dracoidsDB`.`player_character` (`player_character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`weapons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`weapons` (
  `weapon_id` INT NOT NULL,
  `weight` INT NULL,
  PRIMARY KEY (`weapon_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`owned_weapons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`owned_weapons` (
  `weapon_id` INT NOT NULL,
  `player_character_id` INT NOT NULL,
  `is_preferred` TINYINT NOT NULL,
  `weapon_full_name` VARCHAR(45) NULL,
  PRIMARY KEY (`weapon_id`, `player_character_id`),
  INDEX `player_character_id_idx` (`player_character_id` ASC) VISIBLE,
  CONSTRAINT `owned_weapons_weapon_id`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `dracoidsDB`.`weapons` (`weapon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `owned_weapons_player_character_id`
    FOREIGN KEY (`player_character_id`)
    REFERENCES `dracoidsDB`.`player_character` (`player_character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`items` (
  `item_id` INT NOT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`owned_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`owned_items` (
  `item_id` INT NOT NULL,
  `player_character_id` INT NOT NULL,
  PRIMARY KEY (`item_id`, `player_character_id`),
  INDEX `player_character_id_idx` (`player_character_id` ASC) VISIBLE,
  CONSTRAINT `owned_items_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `dracoidsDB`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `owned_items_player_character_id`
    FOREIGN KEY (`player_character_id`)
    REFERENCES `dracoidsDB`.`player_character` (`player_character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`soul_abilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`soul_abilities` (
  `soul_ability_id` INT NOT NULL,
  `approach_id` INT NULL,
  PRIMARY KEY (`soul_ability_id`),
  INDEX `approach_id_idx` (`approach_id` ASC) VISIBLE,
  CONSTRAINT `approach_id`
    FOREIGN KEY (`approach_id`)
    REFERENCES `dracoidsDB`.`approaches` (`approach_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`pc_assigned_soul_abilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`pc_assigned_soul_abilities` (
  `soul_ability_id` INT NOT NULL,
  `player_character_id` INT NOT NULL,
  PRIMARY KEY (`soul_ability_id`, `player_character_id`),
  INDEX `player_character_id_idx` (`player_character_id` ASC) VISIBLE,
  CONSTRAINT `assigned_soul_abilities_soul_ability_id`
    FOREIGN KEY (`soul_ability_id`)
    REFERENCES `dracoidsDB`.`soul_abilities` (`soul_ability_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `assigned_soul_abilities_player_character_id`
    FOREIGN KEY (`player_character_id`)
    REFERENCES `dracoidsDB`.`player_character` (`player_character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`ability_modifiers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`ability_modifiers` (
  `ability_modifier_id` INT NOT NULL,
  `ability_modifier_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ability_modifier_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`weapon_ability_modifiers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`weapon_ability_modifiers` (
  `ability_modifier_id` INT NOT NULL,
  `weapon_id` INT NOT NULL,
  PRIMARY KEY (`ability_modifier_id`, `weapon_id`),
  INDEX `weapon_id_idx` (`weapon_id` ASC) VISIBLE,
  CONSTRAINT `weapon_ability_modifiers_ability_modifier_id`
    FOREIGN KEY (`ability_modifier_id`)
    REFERENCES `dracoidsDB`.`ability_modifiers` (`ability_modifier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `weapon_ability_modifiers_weapon_id`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `dracoidsDB`.`weapons` (`weapon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dracoidsDB`.`faction_tier_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dracoidsDB`.`faction_tier_skills` (
  `faction_tier_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  PRIMARY KEY (`faction_tier_id`, `skill_id`),
  INDEX `skill_id_idx` (`skill_id` ASC) VISIBLE,
  CONSTRAINT `faction_tier_skills_skill_id`
    FOREIGN KEY (`skill_id`)
    REFERENCES `dracoidsDB`.`skills` (`skill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `faction_tier_skills_faction_tier_id`
    FOREIGN KEY (`faction_tier_id`)
    REFERENCES `dracoidsDB`.`faction_tiers` (`faction_tier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
