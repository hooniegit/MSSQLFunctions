
CREATE FUNCTION SplitFront
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
        SELECT @result = LEFT(@inputString, CHARINDEX(@expression, @inputString) - 1);
    END
    ELSE
    BEGIN
        SET @result = NULL; 
    END

    RETURN @result;
END;
GO
