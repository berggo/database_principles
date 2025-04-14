DROP FUNCTION IF EXISTS get_longer_string;

DELIMITER //
CREATE FUNCTION get_longer_string(str1 TEXT, str2 TEXT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    IF CHAR_LENGTH(str1) >= CHAR_LENGTH(str2) THEN
        RETURN str1;
    ELSE
        RETURN str2;
    END IF;
END //
DELIMITER ;

-- Test cases
SELECT get_longer_string('hello', 'world'); -- Expect 'hello' or 'world' (same length)
SELECT get_longer_string('short', 'longertext'); -- Expect 'longertext'
SELECT get_longer_string('muchlongerstring', 'tiny'); -- Expect 'muchlongerstring'
SELECT get_longer_string('', 'nonempty'); -- Expect 'nonempty'
SELECT get_longer_string('same', 'size'); -- Expect 'same' or 'size' (same length)
