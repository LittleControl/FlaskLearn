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
