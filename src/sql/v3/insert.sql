INSERT INTO centable1 (tags, assets, mids)
VALUES(
    ROW(2, 3, 4, 5),
    ROW(6, 7, 8, 9),
    ROW(
        '[{"id":"i1","ip":"127.0.0.1","serviceCount":147},{"id":"i2","ip":"147.25.25.25","serviceCount":258},{"id":"i3","ip":"127.0.0.1","serviceCount":147},{"id":"i4","ip":"147.25.25.25","serviceCount":258}]',
        '[{"id":"p1","port":22,"service":"SSH","pcount":233},{"id":"p2","port":23,"service":"SSH","pcount":258},{"id":"p3","port":25,"service":"HTTPS","pcount":145},{"id":"p4","port":26,"service":"FTP","pcount":369}]',
        '[{"id":"f1","name":"阿帕契服务器文件读取漏洞","url":"http://www.webray.com.cn"},{"id":"f2","name":"Citrix路径遍历漏洞","url":"http://www.webray.com.cn"},{"id":"f3","name":"Tomcat任意文件上传漏洞","url":"http://www.webray.com.cn"},{"id":"f4","name":"败者食尘技能漏洞","url":"http://www.webray.com.cn"}]',
        '[{"id":"f1","name":"阿帕契服务器文件读取漏洞","url":"http://www.webray.com.cn"},{"id":"f2","name":"Citrix路径遍历漏洞","url":"http://www.webray.com.cn"},{"id":"f3","name":"Tomcat任意文件上传漏洞","url":"http://www.webray.com.cn"},{"id":"f4","name":"败者食尘技能漏洞","url":"http://www.webray.com.cn"}]',
        '[{"id":"f1","name":"阿帕契服务器文件读取漏洞","url":"http://www.webray.com.cn"},{"id":"f2","name":"Citrix路径遍历漏洞","url":"http://www.webray.com.cn"},{"id":"f3","name":"Tomcat任意文件上传漏洞","url":"http://www.webray.com.cn"},{"id":"f4","name":"败者食尘技能漏洞","url":"http://www.webray.com.cn"}]',
        '[{"id":"f1","name":"阿帕契服务器文件读取漏洞","url":"http://www.webray.com.cn"},{"id":"f2","name":"Citrix路径遍历漏洞","url":"http://www.webray.com.cn"},{"id":"f3","name":"Tomcat任意文件上传漏洞","url":"http://www.webray.com.cn"},{"id":"f4","name":"败者食尘技能漏洞","url":"http://www.webray.com.cn"}]',
        '[{"id":"v1","vendor":"Google","assetCount":233},{"id":"v2","vendor":"FaceBook","assetCount":214},{"id":"v3","vendor":"Apple","assetCount":415},{"id":"v4","vendor":"WebRay","assetCount":852}]',
        '[{"id":"o1","os":"Linux","ocount":233},{"id":"o2","os":"Windows","ocount":124},{"id":"o3","os":"MacOS","ocount":258},{"id":"o4","os":"Android","ocount":296}]'
    )
);

INSERT INTO centable2 (target, port ,service, vendor, os, equipment, weakpasswd, loophole, poc,my_exp, operate)
VALUES(
    '172.18.0.1', 22, 'SSH', '安钛克', 'Ubuntu', '服务器',
    ROW('weakpasswd', '3', '[{"id":"d01","ip":"127.0.0.1","username":"Little","passwd":"Nothing"},{"id":"d02","ip":"192.168.1.1","username":"Control","passwd":"Iyuxuan"},{"id":"d03","ip":"255.255.255.255","username":"Archer","passwd":"@Control"}]'),
    ROW('loophole', '未检测', '[{"id":"d04","level":0,"name":"缓冲区下溢漏洞","sort":"Linux本地安全","type":"系统漏洞"},{"id":"d05","level":0,"name":"缓冲区溢出漏洞","sort":"安全设备","type":"系统漏洞"},{"id":"d06","level":1,"name":"PHP5.6.x<5.6.33多个漏洞","sort":"Web安全","type":"WEB漏洞"},{"id":"d07","level":2,"name":"远程主机信息披露","sort":"Windows安全","type":"系统漏洞"}]'),
    ROW('poc', '5', '[{"id":"d08","level":0,"name":"远程文件包含","sort":"路由交换设备","vendor":"D-Link"},{"id":"d09","level":0,"name":"反序列化漏洞","sort":"云服务资源","vendor":"TP-Link"},{"id":"d10","level":1,"name":"未授权遍历","sort":"网页技术","vendor":"Google"},{"id":"d11","level":2,"name":"IIOP反序列化漏洞","sort":"网页技术","vendor":"HUAWEI"}]'),
    ROW('exp', '未检测','[{"id":"d12","level":0,"name":"远程文件包含","sort":"路由交换设备","vendor":"D-Link"},{"id":"d13","level":0,"name":"反序列化漏洞","sort":"云服务资源","vendor":"TP-Link"},{"id":"d14","level":1,"name":"未授权遍历","sort":"网页技术","vendor":"Google"},{"id":"d15","level":2,"name":"IIOP反序列化漏洞","sort":"网页技术","vendor":"HUAWEI"}]'),
    ROW('operate', 'nothing')
);

INSERT INTO centable2 (target, port ,service, vendor, os, equipment, weakpasswd, loophole, poc,my_exp, operate)
VALUES(
    '', 80, 'HTTP', 'Google', 'ArchLinux', '云服务器资源',
    ROW('weakpasswd', '6', '[{"id":"d01","ip":"127.0.0.1","username":"Little","passwd":"Nothing"},{"id":"d02","ip":"192.168.1.1","username":"Control","passwd":"Iyuxuan"},{"id":"d03","ip":"255.255.255.255","username":"Archer","passwd":"@Control"}]'),
    ROW('loophole', '未检测', '[{"id":"d04","level":0,"name":"缓冲区下溢漏洞","sort":"Linux本地安全","type":"系统漏洞"},{"id":"d05","level":0,"name":"缓冲区溢出漏洞","sort":"安全设备","type":"系统漏洞"},{"id":"d06","level":1,"name":"PHP5.6.x<5.6.33多个漏洞","sort":"Web安全","type":"WEB漏洞"},{"id":"d07","level":2,"name":"远程主机信息披露","sort":"Windows安全","type":"系统漏洞"}]'),
    ROW('poc', '5', '[{"id":"d08","level":0,"name":"远程文件包含","sort":"路由交换设备","vendor":"D-Link"},{"id":"d09","level":0,"name":"反序列化漏洞","sort":"云服务资源","vendor":"TP-Link"},{"id":"d10","level":1,"name":"未授权遍历","sort":"网页技术","vendor":"Google"},{"id":"d11","level":2,"name":"IIOP反序列化漏洞","sort":"网页技术","vendor":"HUAWEI"}]'),
    ROW('exp', '未检测','[{"id":"d12","level":0,"name":"远程文件包含","sort":"路由交换设备","vendor":"D-Link"},{"id":"d13","level":0,"name":"反序列化漏洞","sort":"云服务资源","vendor":"TP-Link"},{"id":"d14","level":1,"name":"未授权遍历","sort":"网页技术","vendor":"Google"},{"id":"d15","level":2,"name":"IIOP反序列化漏洞","sort":"网页技术","vendor":"HUAWEI"}]'),
    ROW('operate', 'nothing')
);
INSERT INTO centable2 (target, port ,service, vendor, os, equipment, weakpasswd, loophole, poc,my_exp, operate)
VALUES(
    'www.a.com', 443, 'HTTPS', 'Lenovo', 'Windows', '物联网设备',
    ROW('weakpasswd', '3', '[{"id":"d01","ip":"127.0.0.1","username":"Little","passwd":"Nothing"},{"id":"d02","ip":"192.168.1.1","username":"Control","passwd":"Iyuxuan"},{"id":"d03","ip":"255.255.255.255","username":"Archer","passwd":"@Control"}]'),
    ROW('loophole', '未检测', '[{"id":"d04","level":0,"name":"缓冲区下溢漏洞","sort":"Linux本地安全","type":"系统漏洞"},{"id":"d05","level":0,"name":"缓冲区溢出漏洞","sort":"安全设备","type":"系统漏洞"},{"id":"d06","level":1,"name":"PHP5.6.x<5.6.33多个漏洞","sort":"Web安全","type":"WEB漏洞"},{"id":"d07","level":2,"name":"远程主机信息披露","sort":"Windows安全","type":"系统漏洞"}]'),
    ROW('poc', '5', '[{"id":"d08","level":0,"name":"远程文件包含","sort":"路由交换设备","vendor":"D-Link"},{"id":"d09","level":0,"name":"反序列化漏洞","sort":"云服务资源","vendor":"TP-Link"},{"id":"d10","level":1,"name":"未授权遍历","sort":"网页技术","vendor":"Google"},{"id":"d11","level":2,"name":"IIOP反序列化漏洞","sort":"网页技术","vendor":"HUAWEI"}]'),
    ROW('exp', '未检测','[{"id":"d12","level":0,"name":"远程文件包含","sort":"路由交换设备","vendor":"D-Link"},{"id":"d13","level":0,"name":"反序列化漏洞","sort":"云服务资源","vendor":"TP-Link"},{"id":"d14","level":1,"name":"未授权遍历","sort":"网页技术","vendor":"Google"},{"id":"d15","level":2,"name":"IIOP反序列化漏洞","sort":"网页技术","vendor":"HUAWEI"}]'),
    ROW('operate', 'nothing')
);
