
-- IF NOT EXISTS (SELECT .. ) BEGIN (TASK) END ELSE BEGIN (TASK) END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.SplitBack') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
    EXEC('
            CREATE FUNCTION SplitBack
            (
                @inputString NVARCHAR(MAX),
                @expression NVARCHAR(MAX)
            )
            RETURNS NVARCHAR(MAX)
            AS
            BEGIN
                DECLARE @result NVARCHAR(MAX);

                IF CHARINDEX(@expression, @inputString) > 0
                BEGIN
                    SELECT @result = SUBSTRING(@inputString, 
                                            CHARINDEX(@expression, @inputString) + LEN(@expression), 
                                            LEN(@inputString) - CHARINDEX(@expression, @inputString) - LEN(@expression) + 1);
                END
                ELSE
                BEGIN
                    SET @result = NULL; 
                END

                RETURN @result;
            END;
    ');
END
ELSE
BEGIN
    PRINT 'Function Already Exists.';
END
