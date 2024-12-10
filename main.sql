-- SQL COMMENT 
-- DDL - Data Definition Language
-- The following statements create and modify database structures and data

CREATE TABLE kinds (
    id int,          -- Define a column 'id' as an integer type, serves as unique identifier for kinds
    name varchar(25) -- Define a column 'name' as a variable character field of max length 25, for kind name
);

INSERT INTO kinds (id, name)   -- Insert data into the 'kinds' table, specifying columns and values
    VALUES
        (1, 'Dog'),    -- Insert a row representing a kind with id=1 and name='Dog'
        (2, 'Cat'),    -- Insert a row for a kind with id=2 and name='Cat'
        (3, 'Rabbit'); -- Insert a row for a kind with id=3 and name='Rabbit'

CREATE TABLE pets (
    id int,           -- 'id' integer column for unique pet identifier
    name varchar(25), -- 'name' is a varchar field (up to 25 chars) for the pet's name
    kind int          -- 'kind' is an integer referencing 'kinds.id', indicating the type of pet (foreign key)
);

INSERT INTO pets (id, name, kind) -- Insert data into 'pets' table
    VALUES
        (1, 'Dandy', 1),   -- Insert a pet with id=1, name='Dandy', kind=1 (Dog)
        (2, 'Bianca', 2),  -- Insert a pet with id=2, name='Bianca', kind=2 (Cat)
        (3, 'Finley', 2),  -- Insert a pet with id=3, name='Finley', kind=2 (Cat)
        (4, 'Koshka', 1),  -- Insert a pet with id=4, name='Koshka', kind=1 (Dog)
        (5, 'Koshka', 1);  -- Insert another pet with id=5, name='Koshka', kind=1 (Dog)

SELECT id, name, kind         -- Select these columns from the combined result set of pets and kinds
    FROM pets
    LEFT JOIN kinds            -- Perform a LEFT JOIN to include all pets, and match with kinds where possible
    ON pets.kind = kinds.id    -- Match rows from pets to kinds based on the kind ID
    WHERE kinds.name='Dog';    -- Filter only the rows where the kind name is 'Dog'

SELECT kinds.name, COUNT(kinds.name) -- Select the kind's name and the count of how many pets belong to that kind
FROM kinds JOIN pets ON kinds.id = pets.kind -- Inner join to connect each kind with the pets that reference it
GROUP BY pets.kind; -- Group the result by the kind ID to aggregate the counts per kind
