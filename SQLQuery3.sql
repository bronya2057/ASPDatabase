set identity_insert dbo.specialize_vrach on
delete from dbo.specialize_vrach
where id_specialize >8
insert into dbo.specialize_vrach ([id_specialize],[name_specialize]) values (9,'kozolog');
set identity_insert dbo.specialize_vrach off

set identity_insert dbo.specialize_vrach on
TRUNCATE TABLE dbo.specialize_vrach

SET IDENTITY_INSERT dbo.specialize_vrach ON;  
GO  