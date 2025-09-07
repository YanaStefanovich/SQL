-- Task: Row numbering
-- Number enrollee for each program
-- Source: Stepik SQL Course

SET @program := 1;
SET @student := 0;
UPDATE applicant_order
SET str_id = IF(program_id=@program,@student :=@student+1,@student := 1 AND @program :=@program+1);
SELECT * FROM applicant_order
