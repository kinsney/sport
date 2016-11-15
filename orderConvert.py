import pymysql as pm
from django.contrib.auth.hashers import make_password
qike = pm.connect(host='localhost',user='root',passwd='root',db='qike',port=3306,charset='utf8')
sport = pm.connect(host='localhost',user='root',passwd='root',db='sport',port=3306,charset='utf8')
try:
    qc = qike.cursor()
    sc = sport.cursor()
    qc.execute('select * from bikeorder where oid>=421')
    order_data = qc.fetchall()
    commentId = 64
    # 评论序号设置
    for index,order in enumerate(order_data):
        id = index + 328
        added =str(order[13])
        if order[2] == 1:
            status = "confirming"
            modified = added
        else:
            if order[2] == 3:
                status = "completed"
                modified = str(order[4])
            else :
                if order[2] == 2:
                    status = "confirmed"
                    modified = order[21]
                else :
                    if order[2] == 0:
                        if order[16] == 1:
                            status = "rejected"
                            modified = added
                        else:
                            status = "canceled"
                            modified = added
        scoreRenter = int(order[17])
        scoreOwner  = int(order[19])
        try:
            qc.execute("SELECT bikeNumber FROM bike WHERE bid = {0}".format(order[12]))
            bid = qc.fetchone()[0]
            sql_find = "SELECT id FROM bike_bike WHERE number = {0}".format(bid)
            sc.execute(sql_find)
            bike_id = sc.fetchone()[0]
            renter_find = "SELECT id FROM auth_user WHERE username = {0}".format(order[9])
            sc.execute(renter_find)
            renter_id = sc.fetchone()[0]
        except:
            pass
        begintime = order[3]
        endtime = order[4]
        deposit = order[11]
        rentMoney = float(order[10])
        equipment_map = {"车锁":"lock","头盔":"helmet","手套":"glove","手机支架":"phoneHolder","水壶架":"kettleHolder","梁包":"bag","后座":"backseat","码表":"stopwatch","手电":"flashlight","尾灯":"backlight","指南针":"compass"}
        if order[7]:
            temp = order[7].split(',')
            for i,equipment in enumerate(temp):
                temp[i] = equipment_map[equipment.strip()]
            equipments = ','.join(temp)
        else:
            equipments=''

        ordernumber = order[1]
        amount = order[6]
        try:
            receiveTime = order[21] - order[13]
            receiveTime = int((receiveTime.total_seconds())*1000000)
        except:
            receiveTime = 'NULL'
        sql_order = "INSERT INTO order_order VALUES ({0},{1},1,'{2}','{3}','{4}',{5},{6},'noPledge','{7}',NULL,NULL,'{8}','{9}','{10}','{11}','{12}',{13},'{14}')".format(id,ordernumber,added,begintime,endtime,rentMoney,deposit,equipments,receiveTime,status,modified,scoreRenter,scoreOwner,bike_id,renter_id)
        print(sql_order)
        sc.execute(sql_order)
        print(id)
        if order[20].strip():
            commentId+=1
            rentercontent = order[20]
            sql_comment = "INSERT INTO order_comments VALUES({0},'{1}',{2},{3},'{4}')".format(commentId,rentercontent,id,renter_id,endtime)
            sc.execute(sql_comment)
            print(commentId)
        if order[18].strip():
            commentId+=1
            ownercontent = order[18]
            owner_find = "SELECT owner_id from bike_bike WHERE number = {0} ".format(bid)
            sc.execute(owner_find)
            owner_id = sc.fetchone()[0]
            sql_comment1 = "INSERT INTO order_comments VALUES({0},'{1}',{2},{3},'{4}')".format(commentId,ownercontent,id,owner_id,endtime)
            sc.execute(sql_comment1)
            print(commentId)


finally:
    qike.close()
    sport.commit()
    sport.close()
