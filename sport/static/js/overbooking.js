void function($){

function GetDateDiff(startDate,endDate)
{
    var startTime = new Date(Date.parse(startDate.replace(/-/g,   "/"))).getTime();
    var endTime = new Date(Date.parse(endDate.replace(/-/g,   "/"))).getTime();
    var dates = Math.abs((startTime - endTime))/(1000*60*60*24);
    date = {"week":0,"day":0,"hours":0}
    date["week"] = Math.floor(dates/7) + Number((dates - Math.floor(dates/7)*7)>=6.25)
    date["day"] = Math.floor(dates) + Number((dates-Math.floor(dates))>=0.25) - date["week"]*7
    date["hours"] = (dates*24 - date["week"]*7*24 - date["day"]*24)>0?Math.round(dates*24 - date["week"]*7*24 - date["day"]*24):0
    return  date;
}
function calculate(){
    var starttime = $('#starttime').val()
    var endtime = $('#endtime').val()
    var DateDiff = GetDateDiff(starttime,endtime)
    $('span.week').text(DateDiff["week"])
    $('input[name="week"]').val(DateDiff["week"])
    $('span.day').text(DateDiff["day"])
    $('input[name="day"]').val(DateDiff["day"])
    $('span.hour').text(DateDiff["hours"])
    $('input[name="hour"]').val(DateDiff["hours"])
}
$('#starttime,#endtime').on('change',function(){
    calculate()
})
calculate()

}(window.jQuery)


