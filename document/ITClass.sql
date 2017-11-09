create DATABASE ITClass DEFAULT CHARSET UTF8;
use ITClass;
create TABLE admin(
  id int primary key auto_increment,
  mail varchar(50),
  password varchar(100),
  name varchar(50),
  headpath varchar(500),
  sex int,
  status int,
  createtime date
)ENGINE = InnoDB DEFAULT charset utf8;
select * from admin where mail = "905419850@qq.com" and password = "xxp123" and status = 1;