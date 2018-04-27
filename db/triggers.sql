create trigger hr_insert if not exists after insert on users
when (new.user_type = 'HR')
begin
  insert into hrs values(new.id)
end

create trigger faculty_insert if not exists after insert on users
when (new.user_type = 'FACULTY')
begin
  insert into faculties values(new.id)
end