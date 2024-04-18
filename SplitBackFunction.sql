
-- CHARINDEX(<column or string>, <input_string>) - 해당 문자열의 시작 위치 반환
-- SUBSTRING(<column or string>, <start_location_cnt>, <length) - 특정 위치부터 문자열 추출

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
