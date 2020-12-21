# coding=utf-8

from sqlalchemy import Column, Integer,String, create_engine, func
from sqlalchemy.orm import sessionmaker, aliased
from sqlalchemy.ext.declarative import declarative_base
from config import POSTGRES_DATABASE,POSTGRES_USERNAME,POSTGRES_PASSWORD,POSTGRES_HOST,POSTGRES_PORT

Base = declarative_base()

class Main_user(Base):
    __tablename__ = 'main_user'
    id = Column(Integer, primary_key = True)
    ip = Column(String(32))
    port = Column(Integer)
    service_name = Column(String(32))
    vendor = Column(String(64))
    os = Column(String(32))
    equip_type = Column(String(64))
    operate = Column(String(32))
    bug_count = Column(Integer)
    weakpawd_count = Column(Integer)
    poc_count = Column(Integer)
    exp_count = Column(Integer)
class Weakpawd_table(Base):
    __tablename__ = 'weakpawd_table'
    id = Column(Integer, primary_key = True)
    ip = Column(String(32))
    username = Column(String(32))
    passwd = Column(String(64))
class Poc_table(Base):
    __tablename__ = 'poc_table'
    id = Column(Integer, primary_key = True)
    risk_level = Column(Integer)
    poc_name = Column(String(64))
    poc_type = Column(String(64))
    poc_vendor = Column(String(64))
class Exp_table(Base):
    __tablename__ = 'exp_table'
    id = Column(Integer, primary_key = True)
    risk_level = Column(Integer)
    exp_name = Column(String(64))
    exp_type = Column(String(64))
    exp_vendor = Column(String(64))
class Bug_table(Base):
    __tablename__ = 'bug_table'
    id = Column(Integer, primary_key = True)
    bug_level = Column(Integer)
    bug_name = Column(String(64))
    bug_class = Column(String(32))
    bug_type = Column(String(32))

engine = create_engine('postgresql+psycopg2://' + POSTGRES_USERNAME + ':' + POSTGRES_PASSWORD + '@' + POSTGRES_HOST + ':' + str(POSTGRES_PORT) + '/' + POSTGRES_DATABASE)
DBSession = sessionmaker(bind = engine)
session = DBSession()

def tagQuery():
    session = DBSession()
    tags = {}
    tags['bug_count'] = session.query(func.sum(Main_user.bug_count)).scalar()
    tags['weakpawd_count'] = session.query(func.sum(Main_user.weakpawd_count)).scalar()
    tags['poc_count'] = session.query(func.sum(Main_user.poc_count)).scalar()
    tags['exp_count'] = session.query(func.sum(Main_user.exp_count)).scalar()
    session.close()
    return tags

def assetQuery():
    session = DBSession()
    assets = {}
    assets['all_assets'] = session.query(Main_user).count()
    assets['switch'] = session.query(Main_user).filter(Main_user.equip_type == '交换路由设备').count()
    assets['industrial'] = session.query(Main_user).filter(Main_user.equip_type == '工业控制设备').count()
    assets['lot'] = session.query(Main_user).filter(Main_user.equip_type == '物联网设备').count()
    assets['others'] = assets['all_assets'] - assets['switch'] - assets['industrial'] - assets['lot'] 
    session.close()
    return assets

def midQuery():
    session = DBSession()
    mids = {}
    mids['vendor_data'] = []
    mids['os_data'] = []
    mids['ip_data'] = []
    mids['port_data'] = []
    table1 = aliased(Main_user)
    table2 = aliased(Main_user)
    tempDict = {}
    # vendorDatq
    tempQuery = session.query(table1.vendor).filter(table1.vendor == table2.vendor).all()
    for item in tempQuery:
        if(tempDict.has_key(item.vendor)):
            tempDict[item.vendor]['asset_count'] += 1
        else:
            tempDict[item.vendor] = {}
            tempDict[item.vendor]['id'] = item.vendor + item.vendor
            tempDict[item.vendor]['vendor'] = item.vendor
            tempDict[item.vendor]['asset_count'] = 1
    for item in tempDict:
        mids['vendor_data'].append(tempDict[item])
    # osData
    tempDict = {}
    tempQuery = session.query(table1.os).filter(table1.os == table2.os).all()
    for item in tempQuery:
        if(tempDict.has_key(item.os)):
            tempDict[item.os]['ocount'] += 1
        else:
            tempDict[item.os] = {}
            tempDict[item.os]['id'] = item.os + item.os
            tempDict[item.os]['os'] = item.os
            tempDict[item.os]['ocount'] = 1
    for item in tempDict:
        mids['os_data'].append(tempDict[item])

    # ipData
    tempDict = {}
    tempQuery = session.query(table1.ip).filter(table1.ip == table2.ip).all()
    for item in tempQuery:
        if(tempDict.has_key(item.ip)):
            tempDict[item.ip]['service_count'] += 1
        else:
            tempDict[item.ip] = {}
            tempDict[item.ip]['id'] = item.ip + item.ip
            tempDict[item.ip]['ip'] = item.ip
            tempDict[item.ip]['service_count'] = 1
    for item in tempDict:
        mids['ip_data'].append(tempDict[item])

    # portData
    tempDict = {}
    tempQuery = session.query(table1.port, table1.service_name).filter(table1.port == table2.port).filter(table1.service_name == table2.service_name).filter(table1.id != table2.id).all()
    for item in tempQuery:
        if(tempDict.has_key(item.port)):
            tempDict[item.port]['pcount'] += 1
        else:
            tempDict[item.port] = {}
            tempDict[item.port]['port'] = item.port
            tempDict[item.port]['id'] = item.service_name + item.service_name
            tempDict[item.port]['service'] = item.service_name
            tempDict[item.port]['pcount'] = 1
    for item in tempDict:
        mids['port_data'].append(tempDict[item])
    tempQuery = session.query(table1.port, table1.service_name).all()
    for item in tempQuery:
        if(tempDict.has_key(item.port)):
            if(tempDict[item.port]['service'] != item.service_name):
                mids['port_data'].append({
                    'port': item.port,
                    'id': item.service_name + item.service_name,
                    'service': item.service_name,
                    'pcount': 1
                })
        else:
            mids['port_data'].append({
                    'port': item.port,
                    'id': item.service_name + item.service_name,
                    'service': item.service_name,
                    'pcount': 1
                })

    session.close()
    return mids

def appQuery():
    session = DBSession()
    apps = []
    weakpawd_data = []
    poc_data = []
    bug_data = []
    exp_data = []
    tempQuery = session.query(Weakpawd_table).all()
    for item in tempQuery:
        weakpawd_data.append({
            'id': item.id,
            'ip': item.ip,
            'username': item.username,
            'passwd': item.passwd
        })
    tempQuery = session.query(Poc_table).all()
    for item in tempQuery:
        poc_data.append({
            'id': item.id,
            'risk_level': item.risk_level,
            'poc_name': item.poc_name,
            'poc_type': item.poc_type,
            'poc_vendor': item.poc_vendor
        })
    tempQuery = session.query(Bug_table).all()
    for item in tempQuery:
        bug_data.append({
            'id': item.id,
            'bug_level': item.bug_level,
            'bug_class': item.bug_class,
            'bug_type': item.bug_type
        })
    tempQuery = session.query(Exp_table).all()
    for item in tempQuery:
        exp_data.append({
            'id': item.id,
            'risk_level': item.risk_level,
            'exp_name': item.exp_name,
            'exp_type': item.exp_type,
            'exp_vendor': item.exp_vendor
        })
    tempQuery = session.query(Main_user).all()
    for item in tempQuery:
        tempDict = {}
        tempDict['id'] = item.id
        tempDict['ip'] = item.ip
        tempDict['port'] = item.port
        tempDict['service_name'] = item.service_name
        tempDict['vendor'] = item.vendor
        tempDict['os'] = item.os
        tempDict['equip_type'] = item.equip_type
        tempDict['weakpawd_count'] = {'type': 'weakpawd', 'text': item.weakpawd_count, 'data': weakpawd_data}
        tempDict['bug_count'] = {'type': 'bug', 'text': item.bug_count, 'data': bug_data }
        tempDict['poc_count'] = {'type': 'poc', 'text': item.poc_count, 'data': poc_data}
        tempDict['exp_count'] = {'type': 'exp', 'text': item.exp_count, 'data': exp_data}
        tempDict['operate'] = {'type': 'operate', 'text': item.operate}
        apps.append(tempDict)

    session.close()
    return apps

def tableQuery():
    session = DBSession()
    table_data = []
    for item in session.query(Main_user.id, Main_user.ip, Main_user.port, Main_user.service_name, Main_user.os, Main_user.equip_type, Main_user.vendor, Main_user.operate).all():
        table_data.append({
            'id': item.id,
            'ip': item.ip,
            'port': item.port,
            'service_name': item.service_name,
            'os': item.os,
            'equip_type': item.equip_type,
            'vendor': item.vendor,
            'operate': item.operate
        })
    return table_data
    session.close()

# print tagQuery()
# print assetQuery()
# print midQuery()
# print appQuery()
# print tableQuery()

# /api/controlcenter
def ccenter_data():
    data = {}
    data['tags'] = tagQuery()
    data['assets'] = assetQuery()
    data['mids'] = midQuery()
    data['apps'] = appQuery()
    return data

# /api/targetdetection
def tdetect_data():
    data = {}
    data['table_data'] = tableQuery()
    return data
