
insert into dbo.vrach (surname_vrach,name_vrach,lastname_vrach,number_kabinet,study_vrach,type_vrach_id,experience,phone_vrach,born_vrach)
values ('Brodskyi','Alexandr','Jurevich',66,'ONPU',5,'1 Год','+380636543042',1980-08-14)

delete from dbo.vrach 
where number_kabinet = 66