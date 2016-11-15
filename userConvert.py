import pymysql as pm
qike = pm.connect(host='localhost',user='root',passwd='root',db='qike',port=3306,charset='utf8')
sport = pm.connect(host='localhost',user='root',passwd='root',db='sport',port=3306,charset='utf8')
try:
    qc = qike.cursor()
    sc = sport.cursor()
    qc.execute('select * from user where uid<=321 and uid>=309')
    user_data = qc.fetchall()
    for index,user in enumerate(user_data):
        passwd = "double_md5$"+user[2]
        lastlog = str(user[17])
        username = str(user[3])
        regtime = str(user[15])
        nickname = str(user[1])
        photo = str(user[5])
        realname = str(user[6]).strip()
        if realname == "请输入真实姓名":
            realname = ""
        idnumber = str(user[7]).strip()
        if idnumber == "请输入ID":
            idnumber = ""

        studentid = str(user[13]).strip()
        if studentid == "请输入学号":
            studentid = ""
        # id重设+++++++++++++++++++++++++++++++++++++++++++
        id = int(index) + 278
        if user[18] == 6:
            status = "verified"
        else :
            status = "notYet"
        school = str(user[10].strip())
        if school =='' or school == "北京邮电大学(海淀校区)":
            school = "北京邮电大学"
        # 补充缺省学校
        avatar = 'user/{0}/{1}'.format(username,photo.split('/')[-1])
        sql_user = "INSERT INTO auth_user VALUES ({0},'{1}','{2}',0,'{3}','','','',0,1,'{4}')".format(id,passwd,lastlog,username,regtime)
        sql_participator = "INSERT INTO participator_participator VALUES ({0},'{1}',NULL,'{2}',NULL,'{3}','{4}','{5}',NULL,0,'','{6}','{7}')".format(id,nickname,realname,idnumber,studentid,status,avatar,school)
        sc.execute(sql_user)
        sc.execute(sql_participator)

finally:
    qike.close()
    sport.commit()
    sport.close()


