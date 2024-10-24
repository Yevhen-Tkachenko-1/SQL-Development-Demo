-- Create, update, delete queries

-- 1. Check Artist
SELECT * FROM Artist WHERE Name IS 'Yevhen T'

-- 2. Add Artist
INSERT INTO
	Artist (Name)
VALUES
	('Yevhen T')

-- 3. Check newly added Artist
SELECT * FROM Artist WHERE name IS 'Yevhen T'

-- 4. Update Artist
UPDATE
	Artist
SET
	Name = 'Yevhen'
WHERE
	Name IS 'Yevhen T'

-- 5. Check updated Artist
SELECT * FROM Artist WHERE name IS 'Yevhen'

-- 6. Delete Artist
DELETE FROM
	Artist
WHERE
	Name = 'Yevhen'

-- 7. Check deleted Artist
SELECT * FROM Artist WHERE name IS 'Yevhen'

-- 8. Check all Artists
SELECT * FROM Artist