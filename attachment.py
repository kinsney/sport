import pymysql as pm
qike = pm.connect(host='localhost',user='root',passwd='root',db='qike',port=3306,charset='utf8')
sport = pm.connect(host='localhost',user='root',passwd='root',db='sport',port=3306,charset='utf8')
try:
    qc = qike.cursor()
    sc = sport.cursor()
    qc.execute('select * from user')
    user_data = qc.fetchall()
    index = 1
    for i,user in enumerate(user_data):

        username = str(user[3])
        if user[11].split('/')[-1] != "idfront.jpg":
            idfront = "user/{0}/{1}".format(username,str(user[11]).split('/')[-1])
            idback = "user/{0}/{1}".format(username,str(user[12]).split('/')[-1])
            stucard = "user/{0}/{1}".format(username,str(user[14]).split('/')[-1])
            try:
                sql_find = "SELECT id FROM auth_user WHERE username = {0}".format(username)
                sc.execute(sql_find)
                user_id = sc.fetchone()[0]
            except:
                pass
            sql_attach_f = "INSERT INTO participator_verifyattachment VALUES ({0},'{1}',{2},'身份证前面')".format(index,idfront,user_id)
            index+=1
            sql_attach_b = "INSERT INTO participator_verifyattachment VALUES ({0},'{1}',{2},'身份证后面')".format(index,idback,user_id)
            index+=1
            sql_attach_s = "INSERT INTO participator_verifyattachment VALUES ({0},'{1}',{2},'学生证')".format(index,stucard,user_id)
            index+=1
            sc.execute(sql_attach_f)
            sc.execute(sql_attach_b)
            sc.execute(sql_attach_s)

finally:
    qike.close()
    sport.commit()
    sport.close()


