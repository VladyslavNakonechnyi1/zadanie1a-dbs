-- -----------------------------------------------------
-- Table `mydb`.`fact_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fact_sales` (
  `sale_id` INT NOT NULL,
  `quantity` INT NULL,
  `unit_price` DECIMAL(10,2) NULL,
  `total_amount` DECIMAL(10,2) NULL,
  `customer_id` INT NOT NULL,
  `date_id` INT NOT NULL,
  `track_id` INT NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `fk_fact_sales_customer_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_fact_sales_date_idx` (`date_id` ASC) VISIBLE,
  INDEX `fk_fact_sales_track_idx` (`track_id` ASC) VISIBLE,
  CONSTRAINT `fk_fact_sales_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`dim_customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_sales_date`
    FOREIGN KEY (`date_id`)
    REFERENCES `mydb`.`dim_date` (`date_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_sales_track`
    FOREIGN KEY (`track_id`)
    REFERENCES `mydb`.`dim_track` (`track_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;