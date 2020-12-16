import psycopg2
import ../../utils.Main as Main

str = 'SELECT port FROM main_user;'
res = Main.dbquery(str)
print res
