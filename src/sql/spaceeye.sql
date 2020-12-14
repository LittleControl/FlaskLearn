--CREATE DATABASE spaceeye WITH TEMPLATE = template0 OWNER = postgres ENCODING = 'UTF8';


-- DROP TABLE IF EXISTS adminuser;
CREATE TABLE adminuser
(
  id serial NOT NULL,
  name character varying DEFAULT '',
  fullname character varying DEFAULT '',
  pwd character varying DEFAULT '',
  parentid integer DEFAULT 0,
  type integer,   --superman= 0 admin=1 audit=2 report=3
  groupid integer DEFAULT 0,
  refuse integer DEFAULT 0,
  timeout integer DEFAULT 30,
  errcount integer DEFAULT 5,
  tiptime character varying DEFAULT '',
  obj character varying NOT NULL DEFAULT ''::character varying,
  CONSTRAINT pk_adminuser PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );
ALTER TABLE adminuser OWNER TO postgres;


-- DROP TABLE IF EXISTS admingroup;
CREATE TABLE admingroup
(
  id serial NOT NULL,
  name character varying DEFAULT '',
  comment character varying DEFAULT '',
  parentid integer DEFAULT 0,
  model character varying DEFAULT '',
  grouptype character varying DEFAULT '',
  industry character varying DEFAULT '',
  obj character varying NOT NULL DEFAULT ''::character varying,
  CONSTRAINT pk_admingroup PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );
ALTER TABLE admingroup OWNER TO postgres;

--DELETE FROM admingroup;
INSERT INTO admingroup(id, name, comment,parentid,model) VALUES (1, '系统管理员', '', 0 ,'superman');
INSERT INTO admingroup(id, name, comment,parentid,model,grouptype,industry) VALUES (2, '一级单位', '', 1 ,'provincemgr', 'scompany', 'edu');
INSERT INTO admingroup(id, name, comment,parentid,model,grouptype,industry) VALUES (3, '一级单位', '', 2 ,'provinceresp', 'sdepartment', 'edu');
INSERT INTO admingroup(id, name, comment,parentid,model,grouptype,industry) VALUES (4, '一级单位', '', 2 ,'screenmgr', 'sdepartment', 'edu');


--DELETE FROM adminuser;
INSERT INTO adminuser(id, name, fullname, pwd,  parentid, type, groupid) VALUES (1, 'superman', 'superman', '9ddc017ee2f05ffabbae4a8f95740907', 0, 0, 1);
INSERT INTO adminuser(id, name, fullname, pwd,  parentid, type, groupid) VALUES (2, 'admin', 'admin', 'd68bdae8a9522b6c33f8bb3f66308aae', 1, 1, 2);
INSERT INTO adminuser(id, name, fullname, pwd,  parentid, type, groupid) VALUES (3, 'user', 'user', 'c28cc01f685c2a52a49919c8327e369e', 2, 1, 3);
INSERT INTO adminuser(id, name, fullname, pwd,  parentid, type, groupid) VALUES (4, 'screen', 'screen', '8da158eab635483970431fe2e0f56139', 2, 1, 4);

SELECT pg_catalog.setval('adminuser_id_seq', 100, true);
SELECT pg_catalog.setval('admingroup_id_seq', 100, true);

-- DROP TABLE IF EXISTS loginaccess;
CREATE TABLE loginaccess
(
  id serial NOT NULL,
  userid integer DEFAULT 0,
  ip character varying DEFAULT '',
  username character varying DEFAULT '',
  opttime character varying DEFAULT '',
  updatetime character varying DEFAULT '',
  random character varying DEFAULT '',
  status integer DEFAULT 1, --off=0 on=1
  curcount integer DEFAULT 0,
  obj character varying NOT NULL DEFAULT ''::character varying,
  CONSTRAINT pk_loginaccess PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );
ALTER TABLE loginaccess OWNER TO postgres;

-- DROP TABLE IF EXISTS auditlog;
CREATE TABLE auditlog
(
  id serial NOT NULL,
  username character varying DEFAULT '',
  category character varying DEFAULT '', --adminuser/raylog/event/...
  action character varying DEFAULT '', --add/update/delete/other/
  loglevel character varying DEFAULT '', --error/warn/info/debug
  createtime character varying DEFAULT '',
  msg character varying DEFAULT '',
  groupid integer DEFAULT 0,
  notice integer DEFAULT 0, --no=0/yes=1
  obj character varying NOT NULL DEFAULT ''::character varying,
  userid integer DEFAULT 0,
  CONSTRAINT pk_auditlog PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );
ALTER TABLE auditlog OWNER TO postgres;

--DROP VIEW IF EXISTS getadminuser;
CREATE OR REPLACE VIEW getadminuser AS
  SELECT adminuser.id, adminuser.name, adminuser.fullname, adminuser.pwd, adminuser.type, adminuser.groupid, adminuser.refuse, adminuser.parentid,
    adminuser.timeout, adminuser.errcount, adminuser.obj,
    admingroup.name AS admingroupname, admingroup.grouptype, admingroup.industry, admingroup.parentid AS admingroupparentid, admingroup.comment, admingroup.model,
    admingroup.obj AS admingroupobj
   FROM adminuser
   LEFT JOIN admingroup ON adminuser.groupid = admingroup.id;

--DROP VIEW IF EXISTS getloginaccess;
CREATE OR REPLACE VIEW getloginaccess AS
  SELECT loginaccess.id, loginaccess.userid, loginaccess.ip, loginaccess.username, loginaccess.opttime, loginaccess.updatetime, loginaccess.random, loginaccess.status, loginaccess.curcount, loginaccess.obj,
    getadminuser.name, getadminuser.type,getadminuser.admingroupname, getadminuser.model, getadminuser.timeout, getadminuser.errcount, getadminuser.parentid, getadminuser.obj as adminuserobj
   FROM loginaccess
   LEFT JOIN getadminuser ON loginaccess.userid = getadminuser.id;

--DROP VIEW IF EXISTS getauditadmin;
CREATE OR REPLACE VIEW getauditadmin AS
  SELECT auditlog.id, auditlog.username, auditlog.action, auditlog.loglevel, auditlog.createtime, auditlog.msg, auditlog.groupid, auditlog.notice, auditlog.userid,
    getadminuser.name, getadminuser.admingroupname, getadminuser.model, getadminuser.errcount, getadminuser.parentid, getadminuser.obj as adminuserobj
   FROM auditlog
   LEFT JOIN getadminuser ON auditlog.userid = getadminuser.id;

-- DROP TABLE IF EXISTS notice;
CREATE TABLE notice
(
  id serial NOT NULL,
  title character varying DEFAULT '',
  comment character varying DEFAULT '',
  createtime character varying DEFAULT '',
  operator character varying DEFAULT '',
  eventid integer DEFAULT 0,
  type integer DEFAULT 0,
  read integer DEFAULT 0,
  filename character varying DEFAULT '',
  userid integer DEFAULT 0,
  obj character varying NOT NULL DEFAULT ''::character varying,
  CONSTRAINT pk_notice PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );
ALTER TABLE notice OWNER TO postgres;
