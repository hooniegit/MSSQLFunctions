
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
GO
