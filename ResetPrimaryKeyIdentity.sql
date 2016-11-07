declare @max int
select @max=max(id_specialize)from [dbo].[specialize_vrach]
if @max IS NUll   
  SET @max = 0
DBCC CHECKIDENT ('dbo.specialize_vrach', RESEED,@max)