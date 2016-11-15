import pymysql as pm
import time
from django.contrib.auth.hashers import make_password
qike = pm.connect(host='localhost',user='root',passwd='root',db='qike',port=3306,charset='utf8')
sport = pm.connect(host='localhost',user='root',passwd='root',db='sport',port=3306,charset='utf8')
try:
    qc = qike.cursor()
    sc = sport.cursor()
    qc.execute('select * from bike where bid>=242 ')
    bike_data = qc.fetchall()
    for index,bike in enumerate(bike_data):
        # 现在的车号+1
        id = index + 75
        bikeNumber = bike[1]
        bikeName = bike[2]
        map = {1:"renting",4:"deleted",3:"checking"}
        status = map[bike[44]]
        hourRent = float(bike[29])
        dayRent = float(bike[30])
        weekRent = float(bike[31])
        deposit = int(bike[32])
        if bike[33] == '是':
            studentDeposit = 1
        else :
            studentDeposit = 0
        pledge_map = {"校园卡":'campusId',"身份证":'userId',"无需抵押":'noPledge',"学生证":'studentId'}
        pledge = pledge_map[bike[34]]
        suitHeight = bike[4]
        howOld_map = {"九成":90,"八成":80,"七成":70,"全新":100}
        howOld = howOld_map[bike[6]]
        sexualFix_map = {"男女通用":'heterosexual',"男":'man',"女":'female'}
        sexualFix = sexualFix_map[bike[13]]
        equipment_map = {"车锁":"lock","头盔":"helmet","手套":"glove","手机支架":"phoneHolder","水壶架":"kettleHolder","梁包":"bag","后座":"backseat","码表":"stopwatch","手电":"flashlight","尾灯":"backlight","指南针":"compass"}
        temp = bike[15].split(',')
        for i,equipment in enumerate(temp):
            temp[i] = equipment_map[equipment]
        equipments = ','.join(temp)
        minDuration = float(bike[37])*3600*1000000
        maxDuration = float(bike[38])*3600*1000000*7*24
        added = str(bike[40])
        begintime = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(bike[35]))
        endtime =  time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(bike[36]))
        # 现在的地址+1
        address_id = index + 75
        # id重新设置+++++++++++++++++++++++++++++++++++++++++
        address_name = bike[25] or '未知'
        latitude = bike[28]
        longitude = bike[27]
        description = bike[20]
        # 现在的照片+1
        photo_id = index + 75
        photo_url = "user/{0}/{1}".format(bike[42],bike[16].split('/')[-1])
        sql_address = "INSERT INTO bike_address VALUES ({0},'{1}','{2}','{3}')".format(address_id,address_name,longitude,latitude)
        sql_photo = "INSERT INTO bike_photo VALUES ({0},'缩略图1','{1}',{2})".format(photo_id,photo_url,id)
        try:
            sql_find = "SELECT id FROM auth_user WHERE username = {0}".format(bike[42])
            sc.execute(sql_find)
            user_id = sc.fetchone()[0]
        except:
            pass
        sql_bike = "INSERT INTO bike_bike VALUES ({0},'{1}','{2}',1,'{3}',{4},{5},{6},{7},{8},'{9}','{10}',{11},'{12}','{13}',{14},{15},'{16}','{17}','{18}','{19}',0,{20},{21},'其他',0)".format(id,bikeName,bikeNumber,status,hourRent,dayRent,weekRent,deposit,studentDeposit,pledge,suitHeight,howOld,sexualFix,equipments,maxDuration,minDuration,added,begintime,endtime,description,address_id,user_id)
        sc.execute(sql_address)
        sc.execute(sql_bike)
        sc.execute(sql_photo)
        print(bikeName+'/n')
finally:
    qike.close()
    sport.commit()
    sport.close()
