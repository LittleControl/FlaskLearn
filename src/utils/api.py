# coding=utf-8
import psycopg2
import Main

str = 'SELECT port FROM main_user;'
res = Main.dbquery(str)
print res
