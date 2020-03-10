create user 'xiaoxia'@'192.168.0.%' identified by '123';
create user 'jinyao'@'192.168.0.%' identified by '123';
create user 'wujing'@'192.168.0.%' identified by '123';
create user 'yirui'@'192.168.0.%' identified by '123';
create user 'kunkun'@'192.168.0.%' identified by '123';
create user 'linlin'@'192.168.0.%' identified by '123';
create user 'dunqing'@'192.168.0.%' identified by '123';

create user 'haihui'@'192.168.0.%' identified by '123';
create user 'siyuan'@'192.168.0.%' identified by '123';
create user 'wangzhong'@'192.168.0.%' identified by '123';

GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'xiaoxia'@'192.168.0.%';
GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'jinyao'@'192.168.0.%';
GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'wujing'@'192.168.0.%';
GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'yirui'@'192.168.0.%';
GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'kunkun'@'192.168.0.%';
GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'linlin'@'192.168.0.%';

GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'haihui'@'192.168.0.%';
GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'siyuan'@'192.168.0.%';
GRANT EXECUTE,INSERT,SELECT,UPDATE ON faradaylaser.* TO 'wangzhong'@'192.168.0.%';

ALTER USER 'xiaoxia'@'192.168.0.%' IDENTIFIED WITH mysql_native_password BY '193710';
ALTER USER 'jinyao'@'192.168.0.%' IDENTIFIED WITH mysql_native_password BY '697365';
ALTER USER 'wujing'@'192.168.0.%' IDENTIFIED WITH mysql_native_password BY '287392';
ALTER USER 'yirui'@'192.168.0.%' IDENTIFIED WITH mysql_native_password BY '592034';
ALTER USER 'kunkun'@'192.168.0.%' IDENTIFIED WITH mysql_native_password BY '938751';
ALTER USER 'linlin'@'192.168.0.%' IDENTIFIED WITH mysql_native_password BY '390732';

ALTER USER 'haihui'@'192.168.0.%' IDENTIFIED WITH mysql_native_password BY '609123';
ALTER USER 'siyuan'@'192.168.0.%' IDENTIFIED WITH mysql_native_password BY '018201';
ALTER USER 'wangzhong'@'192.168.0.%' IDENTIFIED WITH mysql_native_password BY '234870';

FLUSH PRIVILEGES;