select fio,
[number_patient],
[address],
[district],
[policynumber],
[year],
[department],
name_privileges ,
[cost_privileges]from dbo.patient
Inner Join dbo.privileges
on dbo.privileges.id_privileges = dbo.patient.privileges_id