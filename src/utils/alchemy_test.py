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
    asset = Column(Integer)
    operate = Column(String(32))
    bug_count = Column(Integer)
    weak_pawd_count = Column(Integer)
    poc_count = Column(Integer)
    exp_count = Column(Integer)

class Weak_pawd_table(Base):
    __tablename__ = 'weak_pawd_table'
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

# res = session.query(Main_user.ip).count()
# print res

# statis = session.query(func.sum(Main_user.bug_count)).scalar()
# print statis
# print type(statis)

def tagQuery():
    session = DBSession()
    tags = {}
    tags['bug_count'] = session.query(func.sum(Main_user.bug_count)).scalar()
    tags['weakpawd_count'] = session.query(func.sum(Main_user.weak_pawd_count)).scalar()
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
    apps = []
    

# print tagQuery()
# print assetQuery()
# print midQuery()

def data():
    data = {}
    data['tags'] = tagQuery()
    data['assets'] = assetQuery()
    data['mids'] = midQuery()
    # print data['mids']['port_data']
    return data

# data()
