DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
	project_id INT NOT NULL AUTO_INCREMENT,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours int NOT NULL,
	actual_hours int NOT NULL,
	difficulty VARCHAR(32) NOT NULL,
	notes VARCHAR(128) NOT NULL,
	PRIMARY KEY (project_id)
);

CREATE TABLE material (
	material_id INT NOT NULL AUTO_INCREMENT,
	project_id INT NOT NULL,
	material_name VARCHAR(64) NOT NULL,
	num_required INT NOT NULL,
	cost INT NOT NULL,
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE step (
	step_id INT NOT NULL AUTO_INCREMENT,
	project_id INT NOT NULL,
	step_text VARCHAR(64) NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
	
);

CREATE TABLE category (
	category_id INT NOT NULL AUTO_INCREMENT,
	category_name VARCHAR(64) NOT NULL,
	PRIMARY KEY(category_id) 
);

CREATE TABLE project_category (
	category_id INT NOT null, 
	project_id INT NOT null, 
	FOREIGN KEY (project_id)  REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id)REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY(project_id, category_id)
	
);