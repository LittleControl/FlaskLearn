INSERT INTO main_user (ip, port, service_name, vendor, os, equip_type, asset, operate, bug_count, weak_pawd_count, poc_count, exp_count)
VALUES (
    '127.0.0.1', 22, 'SSH', 'Google', 'CentOS', '服务器', 23, '详情',
    23, 34, 23, 23
);
INSERT INTO main_user (ip, port, service_name, vendor, os, equip_type, asset, operate, bug_count, weak_pawd_count, poc_count, exp_count)
VALUES (
    '127.0.0.1', 80, 'HTTP', 'Apple', 'Ubuntu', '云服务器资源', 32, '详情',
    12, 34, 56, 78
);
INSERT INTO main_user (ip, port, service_name, vendor, os, equip_type, asset, operate, bug_count, weak_pawd_count, poc_count, exp_count)
VALUES (
    '56.56.56.78', 80, 'HTTP', 'Apple', 'Ubuntu', '物联网设备', 34, '详情',
    12, 34, 56, 78
);
INSERT INTO main_user (ip, port, service_name, vendor, os, equip_type, asset, operate, bug_count, weak_pawd_count, poc_count, exp_count)
VALUES (
    '192.168.1.1', 443, 'HTTPS', 'Tencent', 'CentOS', '物联网设备', 43, '详情',
    23, 34, 23, 23
);
INSERT INTO main_user (ip, port, service_name, vendor, os, equip_type, asset, operate, bug_count, weak_pawd_count, poc_count, exp_count)
VALUES (
    'www.google.com', 21, 'FTP', 'Google', 'ArchLinux', '交换路由设备', 23, '详情',
    23, 34, 23, 23
);
INSERT INTO main_user (ip, port, service_name, vendor, os, equip_type, asset, operate, bug_count, weak_pawd_count, poc_count, exp_count)
VALUES (
    'www.littlecontrol.io', 22, 'SSH', 'LittleControl', 'ArchLinux', '工业控制设备', 23, '详情',
    23, 34, 23, 23
);

INSERT INTO weak_pawd_table (ip, username, passwd)
VALUES ('127.0.0.1', 'iyuxuan', 'iyuxuan');
INSERT INTO weak_pawd_table (ip, username, passwd)
VALUES ('192.168.1.1', 'root', 'admin');
INSERT INTO weak_pawd_table (ip, username, passwd)
VALUES ('23.23.23.23', 'little', 'control');
INSERT INTO weak_pawd_table (ip, username, passwd)
VALUES ('21.21.21.21', 'nothing', 'ArchLinux');

INSERT INTO poc_table (risk_level, poc_name, poc_type, poc_vendor)
VALUES (1, 'SQL注入', '路由交换设备', 'D-LINK');
INSERT INTO poc_table (risk_level, poc_name, poc_type, poc_vendor)
VALUES (2, '反序列化漏洞', '云服务资源', 'TP-LINK');
INSERT INTO poc_table (risk_level, poc_name, poc_type, poc_vendor)
VALUES (3, '未授权遍历', '网页技术', 'D-LINK');
INSERT INTO poc_table (risk_level, poc_name, poc_type, poc_vendor)
VALUES (2, '远程文件包含', '路由交换设备', 'D-LINK');

INSERT INTO bug_table (bug_level, bug_name, bug_class, bug_type)
VALUES (1, '下溢漏洞', 'Linux本地安全', '系统漏洞');
INSERT INTO bug_table (bug_level, bug_name, bug_class, bug_type)
VALUES (2, '溢出漏洞', '安全设备', '系统漏洞');
INSERT INTO bug_table (bug_level, bug_name, bug_class, bug_type)
VALUES (3, 'XSS攻击', 'Web安全', 'Web漏洞');
INSERT INTO bug_table (bug_level, bug_name, bug_class, bug_type)
VALUES (2, '主机信息纰漏', 'Windows安全', '系统漏洞');
