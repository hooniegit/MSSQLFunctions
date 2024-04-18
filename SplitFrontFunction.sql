
-- CHARINDEX(<column or string>, <input_string>) - 해당 문자열의 시작 위치 반환
-- LEFT(<column or string>, <>) - 특정 위치까지 문자열 추출

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
