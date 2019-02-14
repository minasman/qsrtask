
$(document).ready(function(){
    attachListeners()
    showShopType()
    selectArea()
})

    var totalTimer = 0;
    var timer = -1;
    var thecodtime = 0
    var thegreettime = 0;
    var theoetime = 0;
    var thecashtime = 0;
    var thechangetime = 0;
    var thepresenttime = 0;
    var thepftime = 0;

    var fcstrt = 0;
    var fcgrt = 0;
    var fcoc = 0;
    var fcchg = 0;
    var fccomp = 0;

function fcstarttimer() {
    fctimestart = document.getElementById("fcstart");
    fctimestart.innerHTML = fcstrt;
    fccomp = fcstrt;
    fcstrt = fcstrt + 1;
    fctotaltimestart = document.getElementById("fcdone");
    fctotaltimestart.innerHTML = fccomp;
    fcos = setTimeout(fcstarttimer, 1000);
    document.getElementById("fcstartbutton").setAttribute("disabled", "true");

}

function fcgreettimer() {
    fcgreetstart = document.getElementById("fcgreeted");
    fccomp = fcgrt + fcstrt;
    fcgrt = fcgrt + 1;
    fcgreetstart.innerHTML = fcgrt;
    fcgt = setTimeout(fcgreettimer, 1000);
    clearTimeout(fcos);
    fctotaltimestart = document.getElementById("fcdone");
    fctotaltimestart.innerHTML = fccomp;
    document.getElementById("fcgreetbutton").setAttribute("disabled", "true");

}

function fcoctimer() {
    fcocstart = document.getElementById("fcordercomplete");
    fccomp = fcoc + fcgrt + fcstrt;
    fcoc = fcoc + 1;
    fcocstart.innerHTML = fcoc;
    fcocs = setTimeout(fcoctimer, 1000);
    clearTimeout(fcgt);
    fctotaltimestart = document.getElementById("fcdone");
    fctotaltimestart.innerHTML = fccomp;
    document.getElementById("fcorderbutton").setAttribute("disabled", "true");

}

function fcchangetimer() {
    fcchgs = document.getElementById("fcchange");
    fccomp = fcchg + fcoc + fcgrt + fcstrt;
    fcchg = fcchg + 1;
    fcchgs.innerHTML = fcchg;
    chg = setTimeout(fcchangetimer, 1000);
    clearTimeout(fcocs);
    fctotaltimestart = document.getElementById("fcdone");
    fctotaltimestart.innerHTML = fccomp;
    document.getElementById("fcchangebutton").setAttribute("disabled", "true");
}

function fctotaltimer() {
    clearTimeout(chg);
    wt = document.getElementById("shop_fcWaitTime");
    del = document.getElementById("shop_fcDeliveryTIme");
    tot = document.getElementById("shop_fcTotalTime");
    wt.value = fcstrt;
    del.value = fcchg;
    tot.value = fccomp;
}

function startTimer() {
    timeStart = document.getElementById("orderStart");
    totalTimer = timer;
    timer = timer + 1;
    timeStart.innerHTML = timer;
    thetotaltime = document.getElementById("total");
    thetotaltime.innerHTML = totalTimer;
    os = setTimeout(startTimer,1000);
    document.getElementById("startButton").setAttribute("disabled", "true");
}

function codtimer() {
    codstart = document.getElementById("atcod");
    totalTimer = thecodtime + timer;
    thecodtime = thecodtime + 1;
    codstart.innerHTML = thecodtime;
    cods = setTimeout(codtimer,1000);
    clearTimeout(os);
    thetotaltime = document.getElementById("total");
    thetotaltime.innerHTML = totalTimer;
    document.getElementById("codButton").setAttribute("disabled", "true");
}

function greettimer() {
    greetstart = document.getElementById("greeted");
    totalTimer = thecodtime + thegreettime + timer;
    thegreettime = thegreettime + 1;
    greetstart.innerHTML = thegreettime;
    greets = setTimeout(greettimer,1000);
    clearTimeout(cods);
    thetotaltime = document.getElementById("total");
    thetotaltime.innerHTML = totalTimer;
    document.getElementById("greetedButton").setAttribute("disabled", "true");
}

function oetimer() {
    oestart = document.getElementById("orderend");
    totalTimer = thecodtime + thegreettime + theoetime + timer;
    theoetime = theoetime + 1;
    oestart.innerHTML = theoetime;
    oe = setTimeout(oetimer,1000);
    clearTimeout(greets);
    thetotaltime = document.getElementById("total");
    thetotaltime.innerHTML = totalTimer;
    document.getElementById("oeButton").setAttribute("disabled", "true");
}

function cashtimer() {
    cashstart = document.getElementById("atcash");
    totalTimer = thecodtime + thegreettime + theoetime + thecashtime + timer;
    thecashtime = thecashtime + 1;
    cashstart.innerHTML = thecashtime;
    cs = setTimeout(cashtimer,1000);
    clearTimeout(oe);
    thetotaltime = document.getElementById("total");
    thetotaltime.innerHTML = totalTimer;
    document.getElementById("cashierButton").setAttribute("disabled", "true");
}

function changetimer() {
    changestart = document.getElementById("change");
    totalTimer = thecodtime + thegreettime + theoetime + thecashtime + thechangetime + timer;
    thechangetime = thechangetime + 1;
    changestart.innerHTML = thechangetime;
    change = setTimeout(changetimer,1000);
    clearTimeout(cs);
    thetotaltime = document.getElementById("total");
    thetotaltime.innerHTML = totalTimer;
    document.getElementById("changeButton").setAttribute("disabled", "true");
}

function presenttimer() {
    presentstart = document.getElementById("atpresent");
    totalTimer = thecodtime + thegreettime + theoetime + thecashtime + thechangetime + thepresenttime + timer;
    thepresenttime = thepresenttime + 1;
    presentstart.innerHTML = thepresenttime;
    psent = setTimeout(presenttimer,1000);
    clearTimeout(change);
    thetotaltime = document.getElementById("total");
    thetotaltime.innerHTML = totalTimer;
    document.getElementById("presentButton").setAttribute("disabled", "true");
}

function pftimer() {
    pfstart = document.getElementById("pulledfwd");
    totalTimer = thecodtime + thegreettime + theoetime + thecashtime + thechangetime + thepresenttime + thepftime + timer;
    thepftime = thepftime + 1;
    pfstart.innerHTML = thepftime;
    pfs = setTimeout(pftimer,1000);
    clearTimeout(psent);
    thetotaltime = document.getElementById("total");
    thetotaltime.innerHTML = totalTimer;
    document.getElementById("pulledButton").setAttribute("disabled", "true");
}

function donetimer() {
    if (thepftime > 0) {
        clearTimeout(pfs);
    } else {
        clearTimeout(psent);
        document.getElementById("pulledButton").setAttribute("disabled", "true");
    }
    wait = document.getElementById("shop_waitTime");
    resp = document.getElementById("shop_responseTime");
    psnt = document.getElementById("shop_presentTime");
    oept = document.getElementById("shop_oepTime");
    ttime = document.getElementById("shop_totalTime");
    pftime = document.getElementById("shop_pullForwardTime");
    wait.value = timer;
    resp.value= thecodtime;
    psnt.value = thepresenttime + thepftime;
    oept.value = theoetime + thecashtime + thechangetime + thepresenttime + thepftime;
    ttime.value = totalTimer;
    pftime.value = thepftime;
}

function attachListeners(){
    let totalPossible = 0
    let totalEarned = 0
    let score = ""
    $("input[type=radio]").change(function(){
        totalPossible = $("input[type=radio]:checked").length
        totalEarned = 0
        $("input[type=radio]:checked").each(function(){
            if (this.value === "Yes") {
                totalEarned++
                          }
            if (this.value === "N/A") {
                totalPossible--
            }
            score = totalEarned / totalPossible
            $('#score').html(`<h1> Possible Points: ${totalPossible} Achieved Points: ${totalEarned} Score: ${parseFloat(score * 100).toPrecision(3)}% </h1>`)
            document.getElementById('shop_score').value = score
        })
    })
}

function showShopType(){
    let store = ""
    $('select#shop_store_id').change(function(){
        let shopStoreType = ""
        $.get("/store_type.json", function(data){
            let shopStore = document.getElementById('shop_store_id').value
            if (data[parseInt(shopStore,10)-1].store_type == "Traditional") {
                    $('.traditional').show()
                    $('.wm').hide()
                } else {
                    $('.traditional').hide()
                    $('.wm').show()
                    $('#dt').hide()
                    $('#fc').show()
                }
            })
        })
}

function selectArea(){
    $('#shop_shopType').change(function(){
        let shopType = document.getElementById('shop_shopType').value
        if (shopType == "DT") {
            $('#dt').show()
            $('#fc').hide()
        } else {
            $('#dt').hide()
            $('#fc').show()
        }
        })
}