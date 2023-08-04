let oldContainerHistory = []
let currentContainer = "home";
let contactList = [];
let gpsFilters = [];
let keyFilters = [];
let gurgleEntries = [];
let manageGroup = "";
let playerId = 0;

let isSprint = false;
let curLap = 0;
let maxLaps = 0;
let maxCheckpoints = 0;
let curCheckpoint = 0;
let startTime = 0;
let previousLapTime = 0;
let currentStartTime = 0;
let fastestLapTime = 0;
let overallLapTime = 0;
let drawRaceStatsIntervalId = 0;
let races = {};
let maps = {};
let noty = false
let pPhoneOpen = false

/* Call info */
let currentCallState = 0;
let currentCallInfo = "";

const callStates = {
    0: "isNotInCall",
    1: "isDialing",
    2: "isReceivingCall",
    3: "isCallInProgress"
}

const timer = document.getElementById('stopwatch');

var hr = 0;
var min = 0;
var sec = 0;
var stoptime = true;
var timeAmount = "00:00:00"

function startTimer() {
  if (stoptime == true) {
        stoptime = false;
        timerCycle();
    }
}
function stopTimer() {
  if (stoptime == false) {
    stoptime = true;
    timerCycle();
  }
}

function timerCycle() {
    if (stoptime == false) {
    sec = parseInt(sec);
    min = parseInt(min);
    hr = parseInt(hr);

    sec = sec + 1;

    if (sec == 60) {
      min = min + 1;
      sec = 0;
    }
    if (min == 60) {
      hr = hr + 1;
      min = 0;
      sec = 0;
    }

    if (sec < 10 || sec == 0) {
      sec = '0' + sec;
    }
    if (min < 10 || min == 0) {
      min = '0' + min;
    }

    timeAmount = min + ':' + sec;
    $('#notificaçao-time').text(timeAmount);
    setTimeout("timerCycle()", 1000);
} else {
    sec = 0;
    min = 0;
    hr = 0;
  }
}

var decodeEntities = (function () {
    // this prevents any overhead from creating the object each time
    var element = document.createElement('div');

    function decodeHTMLEntities(str) {
        if (str && typeof str === 'string') {
            // strip script/html tags
            str = str.replace(/<script[^>]*>([\S\s]*?)<\/script>/gmi, '');
            str = str.replace(/<\/?\w(?:[^"'>]|"[^"]*"|'[^']*')*>/gmi, '');
            element.innerHTML = str;
            str = element.textContent;
            element.textContent = '';
        }

        return str;
    }

    return decodeHTMLEntities;
})();

const calendarFormatDate = {
    sameDay: '[Today at] HH:mm',
    nextDay: '[Tomorrow at] HH:mm',
    nextWeek: 'dddd [at] HH:mm',
    lastDay: '[Yesterday at] HH:mm',
    lastWeek: '[Last] dddd [at] HH:mm',
    sameElse: 'YYYY-MM-DD HH:mm:ss'
}

moment.updateLocale('en', {
    relativeTime: {
        past: function (input) {
            return input === 'now'
                ? input
                : input + ' ago'
        },
        s: 'now',
        future: "in %s",
        ss: '%ds',
        m: "1m",
        mm: "%dm",
        h: "1h",
        hh: "%dh",
        d: "1d",
        dd: "%dd",
        M: "1mo",
        MM: "%dmo",
        y: "1y",
        yy: "%dy"
    }
});

var debounce = function (func, wait, immediate) {
    var timeout;
    return function () {
        var context = this, args = arguments;
        var later = function () {
            timeout = null;
            if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
    };
};

$(document).ready(function () {
    $('.collapsible').collapsible();
    $('.modal').modal();

    $.post('http://rd-racing/getWeather', JSON.stringify({}));

    setInterval(function () {
        $.post('http://rd-racing/getWeather', JSON.stringify({}));
    }, 60 * 1000);

    /* This handles keyEvents - ESC etc */
    document.onkeyup = function (data) {
        // If Key == ESC -> Close Phone
        if (data.which == 27) {
            $.post('http://rd-racing/close', JSON.stringify({}));
        }
    }

    $(".phone-screen").on('click', '.phone-button', function (e) {
        var action = $(this).data('action');
        var actionButton = $(this).data('action-button');
        if (actionButton !== undefined) {
            switch (actionButton) {
                case "home":
                    if (currentContainer !== "home") {
                        openContainer('home');
                    }
                    break;
                case "back":
                    if (oldContainerHistory.length > 0)
                        openContainer(oldContainerHistory.pop(), null, currentContainer);
                    break;
                case "browser":
                    openBrowser($(this).data('site'));
                    openContainer("importados");
                    break;
            }
        }
        if (action !== undefined) {
            switch (action) {
                case "yellow-pages-delete":
                    $.post('http://rd-racing/deleteYP', JSON.stringify({}));
                    break;
                case "racing-create":
                    $('racing-map-creation').fadeIn(150);
                    break;
                case "newPostSubmit":
                    e.preventDefault();
                    $.post('http://rd-racing/newPostSubmit', JSON.stringify({
                        advert: escapeHtml($("#yellow-pages-form #yellow-pages-form-advert").val())
                    }));
                    $("#yellow-pages-form #yellow-pages-form-advert").attr("style", "").val('')
                    break;
                case "group-manage":
                    $.post('http://rd-racing/manageGroup', JSON.stringify({ GroupID: $(this).data('action-data') }));
                    break;
                case "btnTaskGang":
                    manageGroup = $(this).data('action-data');
                    $.post('http://rd-racing/btnTaskGang', JSON.stringify({}));
                    break;
                case "group-manage-pay-external":
                    $('#group-manage-pay-modal').modal('open');
                    $('#group-manage-pay-form').trigger('reset');
                    $('#group-manage-pay-modal #group-manage-id').prop('disabled', false);
                    M.updateTextFields();
                    break;
                case "group-manage-hire-external":
                    $('#group-manage-rank-modal').modal('open');
                    $('#group-manage-rank-form').trigger('reset');
                    $('#group-manage-rank-modal #group-manage-rank-id').prop('disabled', false);
                    M.updateTextFields();
                    break;
                case "radio":
                    openRadio();
                    break;
                case "getCallHistory":
                    if (callStates[currentCallState] === "isCallInProgress" && currentContainer !== "incoming-call")
                        openContainer("top-notifications-chamadas");
                    else
                        $.post('http://rd-racing/' + action, JSON.stringify({}));
                    break;
                case "spotify":
                    openBrowser('http://mysound.ge/index.php');
                    break;
                default:
                    $.post('http://rd-racing/' + action, JSON.stringify({}));
                    break;
            }
        }
    });

    window.addEventListener('message', function (event) {
        var item = event.data;

        if (item.newContact === true) {
            addContact(item.contact, true);
            $(".flex-centered").css("display" , "none")
        }

        if (item.removeContact === true) {
            removeContact(item.contact);
        }

        if (item.emptyContacts === true) {
            contactList = [];
            $(".contacts-entries").empty();
            $(".flex-centered").css("display" , "flex")
        }

        if (item.openPhone === true) {
            pPhoneOpen = true
            $('.top-notifications-wrapper').removeClass("slideinnotify").addClass("slideoutnotify").fadeOut()
            $('.notification-container-twitter').removeClass("slideinnotify").addClass("slideoutnotify").fadeOut()
            
            $(".phone-screen").removeClass("slideout").css("bottom" , "31px")
            $(".phone-app").removeClass("slidein").addClass("slideout").fadeOut()
            $(".phone-app").css("bottom" , "0");
            
            $(".phone-screen").css("top" , "");
            $(".phone-screen").css("left" , "");
            $(".phone-screen").css("right" , "");
            $(".phone-screen").css("width" , "");
            $(".phone-screen").css("bottom" , "");
            $(".phone-screen").css("height" , "");
            $(".phone-screen").css("min-width" , "");
            $(".phone-screen").css("min-height" , "");
            $(".phone-screen").css("margin" , "");
            document.getElementById("tela").style.backgroundImage = "url(https://c4.wallpaperflare.com/wallpaper/683/633/291/windows-11-microsoft-hd-wallpaper-preview.jpg" +")";
            if (item.wallpaper) {
                document.getElementById("tela").style.backgroundImage = "url("+item.wallpaper+"&w=1366&h=768" +")";
            }
            
            $(".navigation-menu").css("bottom" , "-25px")
            $(".row .col.s3 ").css("width" , "")
            openPhoneShell();
            playerId = item.playerId;
            $('.status-bar-player-id').text(item.playerId);
              
            openContainer("home")

            if(callStates[currentCallState] !== "isNotInCall") {
              
            }
        }

        if (item.openPhone === false) {
            pPhoneOpen = false
            closePhoneShell();
            $('#browser').fadeOut(300);
            closeContainer("home");
        }

        if (item.isRealEstateAgent === true) {
            $('.btn-real-estate').hide().fadeIn(150);
        }

        if (item.hasDecrypt === true) {
            $('.btn-decrypt').hide().fadeIn(150);
        }
        $("#housing-found-form").submit(function (event) {
            event.preventDefault();
        
            $.post('http://rd-racing/housing:buyProperty', JSON.stringify({}));
        });        

        if (item.hasDecrypt2 === true) {
            $('.btn-vpn').hide().fadeIn(150);
        }

        if (item.hasTrucker === true) {
            $('.btn-delivery-job').hide().fadeIn(150);
        }

        switch (item.openSection) {
            case "timeheader":
                $(".status-bar-time").empty();
                $(".status-bar-time").html(item.timestamp);
                break;
            case "server-time":
                setBatteryLevel(item.serverTime);
                break;
            case "notificationsYP":
                $(".yellow-pages-entries").empty();
                if (item.list && Object.keys(item.list).length > 0) {
                    for (let message of item.list) {
                        if (message) {
                            addYellowPage(message);
                        }
                    }
                }
                openContainer("yellow-pages");
                break;
            case "messages":
                $(".messages-entries").empty();
                if (item.list && Object.keys(item.list).length > 0) {
                    for (let message of item.list) {
                        if (message && message.receiver && message.message) {
                            addMessage(message, item.clientNumber);
                        }
                    }
                }
                $('.notification-sms').fadeOut(150);
                openContainer("messages");
                break;
            case "messageRead":
                $(".message-entries").empty();
                $(".message-recipient").empty();
                $(".message-recipient").append(item.displayName);
                if (item.messages && Object.keys(item.messages).length > 0) {
                    for (let message of item.messages) {
                        if (message && message.receiver && message.message) {
                            addMessageRead(message, item.clientNumber, item.displayName);
                        }
                    }
                }
                openContainer("message");
                break;
            case "messagesOther":
                $(".messages-entries").empty();
                if (item.list && Object.keys(item.list).length > 0) {
                    for (let message of item.list) {
                        if (message && message.receiver && message.message) {
                            addMessageOther(message, item.clientNumber);
                        }
                    }
                }
                // openContainer("messages");
                break;
            case "contacts":
                openContainer("contacts");
                break;
            case "callHistory":
                $(".call-history-entries-wrapper").empty();
                addCallHistoryEntries(item.callHistory);
                openContainer("call-history");
                break;
            case "tweetnotify":
                addNoti(item.ptwat, item.phandle, item.ptime);
                break;
            case "emailnotify":
                addNotiEmail(item.pEMessages, item.pEHandle);
                break;
            case "jobNotify":
                addNotiJob(item.pEMessages, item.pEHandle);
                break;
            case "messagenotify":
                addNotiMessage(item.pMMessage, item.pMNumber);
                break;
            case "callnotify":
                startTimer()
                $('.top-notifications-chamadas').show();
                $('#notificaçaoapp-titel').text(item.pCNumber);
                break;
            case "callnotifyEnd":
                stopTimer();
                $('.top-notifications-chamadas').fadeOut();
                break;
            case "twatter":
                $(".twatter-entries").empty();
                addTweets(item.twats, item.myhandle);
                openContainer("twatter");
                $('.notification-twatter').fadeOut(150);
                break;
            case "accountInformation":
                addAccountInformation(item.response);
                openContainer("account-information");
                break;
                case "calculadoraInformation":
                
                openContainer("calculadora");
                break;
            case "GPS":
                if (item.locations !== undefined) {
                    addGPSLocations(item.locations);
                }
                openContainer("gps")
                break;
            case "Garage":
                $('.garage-container-entries-wrapper').empty();
                addVehicles(item.vehicleData, item.showCarPaymentsOwed)
                openContainer("garage");
                break;
            case "addStocks":
                $('.stocks-entries-wrapper').empty();
                addStocks(item.stocksData);
                openContainer('stocks');
                break;
            case "google":
                openContainer('gurgle');
                break;

            case "iphone":
                $(".notch").css("display" , "flex");
                $(".phone-screen").css("border-radius" , "");
                
                $(".jss1264").css("top" , "");
                $(".jss1264").css("left" , "");
                
                $(".jss1264").css("bottom" , "");
                $(".jss1264").css("right" , "");
                $(".jss1264").css("width" , "");
                $(".jss1264").css("height" , "");
                $(".jss1264").css("padding" , "");
                $(".jss1264").css("z-index" , "");
                $(".jss1264").css("position" , "");
                $(".jss1264").css("background" , "");
                $(".jss1264").css("border-radius" , "1");
                $(".jss1264").css("transform" , "1");
                $(".jss1264").css("top" , "1");
                $(".jss1264").css("left" , "1");
                $(".jss1264").css("min-width" , "1");
                $(".jss1264").css("min-height" , "1");
                $(".jss1264").css("transform-style" , "1");
                $(".jss1264").css("margin" , "1");
                $(".jss1264").css("transition" , "1");
                $(".jss16465").css("top" , "");
                $(".jss16465").css("left" , "");
                $(".jss16465").css("width" , "");
                $(".jss16465").css("height" , "");
                $(".jss16465").css("z-index" , "");
                $(".jss16465").css("position" , "");
                $(".jss16465").css("background" , "");
                $(".jss16465").css("border-top" , "");
                $(".jss16465").css("box-shadow" , "");
                $(".jss16465").css("border-bottom" , " ");
                $(".jss16465").css("border-radius" , "");
                $(".jss16471").css("top" , "");
                $(".jss16471").css("left" , "");
                $(".jss16471").css("width" , "");
                $(".jss16471").css("height" , "");
                $(".jss16471").css("overflow" , "");
                $(".jss16471").css("position" , "");
                $(".jss16471").css("border-radius" , "");
                $(".jss16472").css("top" , "");
                $(".jss16472").css("left" , "");
                $(".jss16472").css("width" , "");
                $(".jss16472").css("height" , "");
                $(".jss16472").css("z-index" , "");
                $(".jss16472").css("position" , "");
                $(".jss16472").css("border-radius" , "");
                $(".jss16472").css("box-shadow" , "");
                $(".jss16472").css("pointer-events" , ""); 
            break;
            case "rodarphone":
                $(".phone-screen").css("top" , "0px");
                $(".phone-screen").css("left" , "0px");
                $(".phone-screen").css("right" , "52px");
                $(".phone-screen").css("width" , "978px");
                $(".phone-screen").css("bottom" , "-53px");
                $(".phone-screen").css("height" , "420px");
                $(".phone-screen").css("min-width" , "978px");
                $(".phone-screen").css("min-height" , "420px");
                $(".phone-screen").css("margin" , "auto");

                $(".browser-window").css("width" , "98%");
                $(".browser-window").css("height" , "379px");
                $(".browser-window").css("margin-left" , "184px");
                $(".browser-window").css("margin-top" , "232px");

                $(".notch").css("transform" , "rotate( -90deg ) scale(1)")
                $(".notch").css("top" , "170px");
                $(".notch").css("left" , "-59px");
                
                $(".navigation-menu").css("bottom" , "0px")

                // Aplicativos
                $(".row .col.s3 ").css("width" , "8%")
                $(".row .col.s12 ").css("width" , "120%")
                $(".row").css("margin-bottom" , "0px")

                //Contacts App
                $(".collapsible-header").css("margin-top" , "15px")
                $(".collapsible span.badge").css("margin-left" , "-114px")


                // Menu

                $(".modal.modal-fixed-footer").css("height" , "47%")
                $(".modal.modal-fixed-footer").css("margin-top" , "58px")
                $(".phone-modal").css("width" , "calc(40% - 50px);")

                break;
                case "phonenormal":
                

                    $(".phone-screen").css("top" , "");
                    $(".phone-screen").css("left" , "");
                    $(".phone-screen").css("right" , "");
                    $(".phone-screen").css("width" , "");
                    $(".phone-screen").css("bottom" , "");
                    $(".phone-screen").css("height" , "");
                    $(".phone-screen").css("min-width" , "");
                    $(".phone-screen").css("min-height" , "");
                    $(".phone-screen").css("margin" , "");



                    $(".browser-window").css("width" , "");
                    $(".browser-window").css("height" , "");
                    $(".browser-window").css("margin-left" , "");
                    $(".browser-window").css("margin-top" , "");

                    $(".notch").css("transform" , "")
                    $(".notch").css("top" , "");
                    $(".notch").css("left" , "");
                    
                    $(".navigation-menu").css("bottom" , "-25px")
                     // Aplicativos
                     $(".row .col.s3 ").css("width" , "")
                     $(".row .col.s12 ").css("width" , "")
                     $(".row").css("margin-bottom" , "")
 
                     //Contacts App
                     $(".collapsible-header").css("margin-top" , "")
                     $(".collapsible span.badge").css("margin-left" , "")
 
 
                     // Menu
 
                     $(".modal.modal-fixed-footer").css("height" , "")
                     $(".modal.modal-fixed-footer").css("margin-top" , "")
                     $(".phone-modal").css("width" , "")
                    break;
            case "weather":
                setWeather(item.weather);
                break;
            case "deepweb":
                if (true) {
                    openBrowser("http://www.static.online/morbrowser/mor-browser-setup-1/");
                }
                break;
            case "gurgleEntries":
                addGurgleEntries(item.gurgleData);
                break;
            case "deliveryJob":
                $('.delivery-job-entries').empty();
                openContainer("delivery-job");
                addDeliveries(item.deliveries);
                break;
            case "notifications":
                $('.emails-entries').empty();
                openContainer("emails");
               // $('.notification-email').fadeOut(150);
                addEmails(item.list);
                break;
            case "newemail":
               // $('.notification-email').css("display", "flex").hide().fadeIn(150);
                break;
            case "newsms":
                $('.notification-sms').css("display", "flex").hide().fadeIn(150);
                break;
            case "phonemedio":
                $(".phone-screen").removeClass("slideout").addClass('slidein').show().css("bottom" , "-531px").add($('.phone-screen')).fadeIn();
                $(".phone-app").removeClass("slideout").addClass('slidein').show().css("bottom" , "-550px").add($('.phone-screen')).fadeIn();
                break;
            case "phonemedioclose":
                if(pPhoneOpen === false) {
                    $(".phone-screen").removeClass("slidein").addClass("slideout").fadeOut()
                    $(".phone-app").removeClass("slidein").addClass("slideout").fadeOut()
                    $(".phone-app").css("bottom" , "10px")
                }
                break;
                case "housing:foundProperty":
                //console.log("inside foundProperty");
                if (item.foundHouse === true)
                {
                    //console.log("found house true");
                    $('.iamgay').empty();
                    showFoundPropertyModal(item.foundHouseName, item.foundHousePrice, item.foundHouseCategory)
                    $('#housing-found-property-modal').modal('open');
                }
                break;
                case "housing:noPropertyFound":
                    //console.log("inside noPropertyFound");
                    if (item.foundHouse === false)
                    {
                        //console.log("found house false");
                        $('.iamgay2').empty();
                        showNoPropertyFoundModal("No property found")
                        $('#housing-found-no-property-modal').modal('open');
                    }
                    break;
                    case "housing:purchaseSuccessful":
                        //console.log("inside purchaseSuccessful");
                        //if (item.boughtProperty === true)
                        //{
                            //console.log("bought house true");
                            //console.log("bought house true");
                            $('.iamgay3').empty();
                            $('.iamgay4').empty();
                            $('#housing-found-property-modal').modal('close');
                            //$('#housing-spinning-modal').modal('open');
                            //sleep(5000)
                            //$('#housing-spinning-modal').modal('close');
                            showPurchaseSuccessfulModal("Successfully Purchased Property!")
                            $('#housing-success-bought-property-modal').modal('open');
                           // showPurchaseSuccessfulModal("Successfully bought property!")
                            //$('#housing-bought-property-modal').modal('open');
                            //$(".housing-entries").empty();
                            //addHousing(item.boughtPropertyName)
                            //openContainer("housing2");


                            //or just skip modals, close current one and add it to their app? addYellowPage
                        //}
                        break;
                        case "housing:purchaseNotEnoughMoney":
                            //console.log("inside purchaseNotEnoughMoney");
                            if (item.boughtProperty === false)
                            {
                                //console.log("bought house false");
                                $('.iamgay3').empty();
                                if (item.hasEnoughMoney == false)
                                {
                                $('#housing-found-property-modal').modal('close');
                                showPurchaseUnsuccessfulModal("You can't afford this property")
                                $('#housing-bought-property-modal').modal('open');
                                }
                            }
                            break
                        case "housing:purchasePropertySold":
                            //console.log("inside purchasePropertySold");
                            if (item.boughtProperty === false)
                            {
                                //console.log("bought house false");
                                $('.iamgay3').empty();
                                if (item.isPropertySold == true)
                                {
                                $('#housing-found-property-modal').modal('close');
                                showPurchaseUnsuccessfulModal("Someone already owns this property")
                                $('#housing-bought-property-modal').modal('open');
                                }
                            }
                            break;
                        case "housing:purchaseTooManyProperties":
                            if (item.tooManyProperties == true)
                            {
                                $('.iamgay5').empty();
                                $('#housing-found-property-modal').modal('close');
                                showTooManyPropertiesModal("You own too many properties!")
                                $('#housing-too-many-properties-modal').modal('open');
                            }
                            break;
                        case "housing:propertyKeysSuccess":
                        //console.log("inside propertyKeysSuccess");
                            $('.iamgay3').empty();
                            $('.iamgay4').empty();
                            $('#housing-manage-keys-modal').modal('close');
                            showPurchaseSuccessfulModal("Successfully gave keys!")
                            $('#housing-success-bought-property-modal').modal('open');
                        break;
                        case "housing:propertyKeysError":
                                //console.log("inside propertyKeysError");
                                $('.iamgay3').empty();
                                $('#housing-manage-keys-modal').modal('close');
                                showPurchaseUnsuccessfulModal("Error giving keys.")
                                $('#housing-bought-property-modal').modal('open');
                            break
                        case "housing:closeModal":
                            $('#housing-bought-property-modal').modal('close');
                            $('#housing-success-bought-property-modal').modal('close');
                            $('#housing-too-many-properties-modal').modal('close');
                            $('#housing-found-property-modal').modal('close');
                            $('housing-found-no-property-modal').modal('close');
                            break;
            case "housing":
                $(".propertyname").empty();
                $(".housing2-entries").empty();
                $(".back-arrows").empty();
                if (item.owned && Object.keys(item.owned).length > 0) {
                    for (let ownedproperty of item.owned) {
                        if (ownedproperty) {
                            addHousing(ownedproperty);
                        }
                    }
                }
/*                 if (item.keys && Object.keys(item.keys).length > 0) {
                    for (let propertykeys of item.owned) {
                        if (propertykeys) {
                            addPropertyKeys(propertykeys);
                        }
                    }
                } */
                openContainer("housing2")
                break;
            case "newtweet":
                $('.notification-twatter').css("display", "flex").hide().fadeIn(150);
                break;
            case "newpager":
                let pagerNotification = $('#pager-notification')
                $(pagerNotification).css("display", "flex").hide().fadeIn(2000);
                this.setTimeout(function() {
                    $(pagerNotification).fadeOut(2000);
                }, 8000);
                break;
            case "groups":
                $('.groups-entries').empty();
                openContainer("groups");
                addGroups(item.groups);
                break;
            case "addTasks":
                $('.group-tasks-entries').empty();
                addGroupTasks(item.tasks);
                openContainer("group-tasks");
                break;
            case "groupManage":
                $('.group-manage-entries').empty();
                addGroupManage(item.groupData);
                openContainer("group-manage");
                break;
                case "bankManage":
                    $('.bank-manage-entries').empty();
                    openContainer("bank-manage");
                    break;
            case "RealEstate":
                openContainer("real-estate");
                if(item.RERank >= 4) {
                    $('.btn-evict-house').css("visibility", "visible").hide().fadeIn(150);
                    $('.btn-transfer-house').css("visibility", "visible").hide().fadeIn(150);
                }
                break;
            // case "callState":
            //     currentCallState = item.callState;
            //     currentCallInfo = item.callInfo;
            //     phoneCallerScreenSetup();
            //     break;
            case "hoa-notification":
                $('#hoa-notification').fadeIn(300);
                $('.hoa-notification-title').text("Security System Alert");
                $('.hoa-notitication-body').text(`An alert has been triggered at ${item.alertLocation}`);
                $('#hoa-notification').fadeOut(15000);
                break;
            case "showOutstandingPayments":
                $('.outstanding-payments-entries').empty();
                addOutstandingPayments(item.outstandingPayments);
                openContainer('outstanding-payments');
                break;
            case "manageKeys":
                $('.manage-keys-entries').empty();
                addManageKeys(item.sharedKeys);
                openContainer('manage-keys')
                break;
            case "settings":
                $('#controlSettings').empty();
                if (item.currentControls !== undefined) {
                    currentBinds = item.currentControls;
                }
                if (item.currentSettings !== undefined) {
                    currentSettings = item.currentSettings;
                }
                createControlList();
                $('.tabs').tabs();
                openContainer("settings");
                setSettings();
                break;
            case "cores":
                openContainer("cores");
            break;

            case "importados":
                openContainer("importados");
            break;

            case "job-center":
                openContainer("job-center"); 
            break;
            case "racing:events:list":
                $('.racing-entries').empty();
                $("#flag-teste").css({"color":"#b4efb4"});
                $("#flag-teste").css({"border-bottom":"2px solid #b4efb4"});
                $("#flag-teste").css({"padding":"6px 15px"});
                races = item.races;
                addRaces(races);
                setInterval(racingStartsTimer, 1000);
                openContainer('racing')
                if (item.canMakeMap)
                    $('.racing-create').css("visibility", "visible").hide().fadeIn(150);
                break;
            case "racing-start":
                $('#racing-start-tracks').empty();
                maps = item.maps;
                addRacingTracks(maps);
                openContainer('racing-start');
                break;
            case "racing:hud:update":
                switch (item.hudState) {
                    case "starting":
                        $('#racing-hud').fadeIn(300);
                        startTime = moment.utc();
                        currentStartTime = startTime;
                        drawRaceStats();
                        break;
                    case "start":
                        isSprint = item.hudData.isSprint
                        if (isSprint)
                            $('#FastestLaptime').hide();
                        startTime = moment.utc();
                        currentStartTime = startTime;
                        curLap = 1;
                        maxLaps = item.hudData.maxLaps;
                        curCheckpoint = 1;
                        maxCheckpoints = item.hudData.maxCheckpoints;
                        fastestLapTime = 0;
                        drawRaceStatsIntervalId = this.setInterval(drawRaceStats, 10);
                        break;
                    case "update":
                        checkFastestLap(item.hudData.curLap);
                        curLap = item.hudData.curLap;
                        curCheckpoint = item.hudData.curCheckpoint;
                        break;
                    case "finished":
                        checkFastestLap(item.hudData.curLap);
                        endTime = moment.utc();
                        curLap = maxLaps;
                        curCheckpoint = maxCheckpoints;
                        this.clearInterval(drawRaceStatsIntervalId);
                        drawRaceStats();
                        $.post('http://rd-racing/race:completed', JSON.stringify({
                            fastestlap: moment(fastestLapTime).valueOf(),
                            overall: moment(endTime - startTime).valueOf(),
                            sprint: isSprint,
                            identifier: item.hudData.eventId
                        }));
                        break;
                    case "clear":
                        curLap = 0;
                        maxLaps = 0;
                        curCheckpoint = 0;
                        maxCheckpoints = 0;
                        fastestLapTime = 0;
                        endTime = 0;
                        startTime = 0;
                        currentStartTime = 0;
                        drawRaceStats();
                        $('#racing-hud').fadeOut(300);
                        break;
                }
                break;
            case "racing:event:update":
                if (item.eventId !== undefined) {
                    $(`.racing-entries li[data-event-id="${item.eventId}"]`).remove();
                    if (races !== undefined)
                        races[item.eventId] = item.raceData
                    addRace(item.raceData, item.eventId);
                } else
                    races = item.raceData
                break;
            case "racing:events:highscore":
                $('.racing-highscore-entries').empty();
                addRacingHighScores(item.highScoreList);
                openContainer('racing-highscore');
                break;
        }
    });
});

$('.phone-screen').on('copy', '.number-badge', function (event) {
    if (event.originalEvent.clipboardData) {
        let selection = document.getSelection();
        selection = selection.toString().replace(/-/g, "")
        event.originalEvent.clipboardData.setData('text/plain', selection);
        event.preventDefault();
    }
});

function checkFastestLap(dataLap) {
    if (curLap < dataLap) {
        let lapTime = curLap === 0 ? moment(startTime - currentStartTime) : moment(moment.utc() - currentStartTime);
        if (fastestLapTime === 0)
            fastestLapTime = lapTime;
        else if (lapTime.isBefore(fastestLapTime)) {
            fastestLapTime = lapTime;
        }
        currentStartTime = moment.utc();
    }
}

function drawRaceStats() {
    $('#Lap').text(`${curLap} / ${maxLaps}`);
    $('#Checkpoints').text(`${curCheckpoint} / ${maxCheckpoints}`);
    $('#Laptime').text(`${moment(moment.utc() - currentStartTime).format("mm:ss.SSS")}`);
    if (!isSprint)
        $('#FastestLaptime').text(`${moment(fastestLapTime).format("mm:ss.SSS")}`)
    $('#OverallTime').text(`${moment(moment.utc() - startTime).format("mm:ss.SSS")}`)
}

function setBatteryLevel(serverTime) {
    let restartTimes = ["00:00:00", "08:00:00", "16:00:00"];
    restartTimes = restartTimes.map(time => moment(time, "HH:mm:ss"));
    serverTime = moment(serverTime, "HH:mm:ss")

    let timeUntilRestarts = restartTimes.map(time => moment.duration(time.diff(serverTime)));
    timeUntilRestarts = timeUntilRestarts.map(time => time.asHours());
    let timeUntilRestart = timeUntilRestarts.filter(time => 0 <= time && time < 8);

    if (timeUntilRestart.length == 0) {
        timeUntilRestarts = timeUntilRestarts.map(time => time + 24);
        timeUntilRestart = timeUntilRestarts.filter(time => 0 <= time && time < 8);
    }
    timeUntilRestart = timeUntilRestart[0];

    if (timeUntilRestart >= 4.5)
        $('#status-bar-time').removeClass().addClass('fas fa-battery-full')
    else if (timeUntilRestart >= 3)
        $('#status-bar-time').removeClass().addClass('fas fa-battery-three-quarters')
    else if (timeUntilRestart >= 1.5)
        $('#status-bar-time').removeClass().addClass('fas fa-battery-half')
    else if (timeUntilRestart < 1.5 && timeUntilRestart > 0.16)
        $('#status-bar-time').removeClass().addClass('fas fa-battery-quarter')
    else
        $('#status-bar-time').removeClass().addClass('fas fa-battery-empty')
}

function addRacingHighScores(highScores) {
    for (let highScore in highScores) {
        let score = highScores[highScore]
        let highScoreElement = `
        <li>
        <div class="collapsible-header">
            <i class="fad fa-trophy" style="font-size: 55px"> </i>
            <i class="name-car" style="font-size: 18px;">${score.map}</i>
            <span  class="new-badge">Vencedor: ${score.fastestName}</span>
        </div>
        <div class="collapsible-body garage-body">
        <i class="fas fa-map-marker-alt fa-2x btn-contacts-send-message"  aria-label="${score.fastestName}" style="margin-top: 20px;margin-left: 47px;"></i>
        <i class="fas fa-closed-captioning fa-2x btn-contacts-send-message"  aria-label="${score.fastestSprintName}"style="margin-left: 10px;"></i>
        <i class="fas fa-oil-can fa-2x btn-contacts-send-message"  aria-label="${score.mapDistance}"></i>

     
    </div>
</li>`;
        $('.racing-highscore-entries').prepend(highScoreElement);
    }
}

function addRacingTracks(tracks) {
    $('#racing-start-tracks').append(`<option value="" disabled selected>Choose your option</option>`);
    for (let track in tracks) {
        $('#racing-start-tracks').append(`<option value="${track}">${tracks[track].track_name}</option>`)
    }
    $('select').formSelect();
}


function addbankManage(group) {
    $('.b-manage-company-name').text(group.groupName).data('group-id', group.groupId);
    $('.group-manage-company-bank').text('$' + group.bank);
    for (let i = 0; i < group.employees.length; i++) {
        let employee = group.employees[i];
        let employeeEntry = `
        <li>
            <div class="row no-padding">
                <div class="col s12">
                    <div class="card grey2 group-manage-entry-card">
                        <div class="card-content group-manage-entry-content">
                            <div class="row no-padding">
                                <div class="col s12">
                                    <span class="card-title group-manage-entry-title" style="color: rgb(255, 255, 255);">${employee.name} [${employee.cid}]</span>
                                    <span class="group-manage-entry-body" style="color: rgb(255, 255, 255);">Promoted to Rank ${employee.rank} by ${employee.giver}</span>
                                </div>
                            </div>
                            <div class="row no-padding" style="padding-top:10px !important">
                                <div class="col s12 center-align">
                                    <button class="waves-effect waves-light btn-small group-manage-pay" style="padding-left:18px;padding-right:18px" data-id="${employee.cid}" aria-label="Pay" data-balloon-pos="up-left"><i class="fas fa-hand-holding-usd"></i></button>
                                    <button class="waves-effect waves-light btn-small group-manage-rank" data-id="${employee.cid}" data-rank="${employee.rank}" aria-label="Set Rank" data-balloon-pos="up"><i class="fas fa-handshake"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        `
        console.log('here')
        $('.group-manage-entries').append(employeeEntry);
    }
}


function racingStartsTimer() {
    $('.racing-entries .racing-start-timer').each(function () {
        let startTime = moment.utc($(this).data('start-time'));
        if (startTime.diff(moment.utc()) > 0) {
            let formatedTime = makeTimer(startTime);
            $(this).text(`${formatedTime.minutes} min ${formatedTime.seconds} Seconds.`);
        }
        else {
            $(this).text('Closed');
        }
    });
}

function addRace(race, raceId) {
    let raceElement = `<li data-event-id="${raceId}">
    <div class="hovereffect">

    </h3>
    `
    if (race.open)
        raceElement += `<button id="hovercorridas" style="margin-left: 20px;" class="racing-entries-join phone-button" data-id="${race.identifier}" aria-label="Join race" data-balloon-pos="up"><i class="fas fa-flag-checkered icon"></i></button> `
    raceElement += `<button id="hovercorridas" class=" phone-button" data-action="racing:event:leave" aria-label="Leave race" data-balloon-pos="up"><i class="fas fa-sign-out-alt icon"></i></button> `
    raceElement +=
    `         
    </h3>
    

    <div class="collapsible-header row scrollbar--dark no-padding" style="margin-bottom: 0px;">
    <div class="col s12">
    <div class="row no-padding">
    <div class="col s12">

    <span class="name-racing">${race.raceName}</span>
    <span class="voltas-racing">Laps: ${race.laps}</span>
    </div>
    </div>
    <div class="row no-padding">
    <div class="col s12">
    <span data-balloon-pos="down" class="racing-start-timer" style=${race.open ?  "color:" + "white" : "margin-left:161px; + color:" + "red"} data-start-time="${race.startTime}" ></span>
    </div>
    </div>
 
    </li>
    `
    $('.racing-entries').prepend(raceElement);
}

function addRaces(races) {
    for (let race in races) {
        let curRace = races[race]
        addRace(curRace, race);
    }
}

function addManageKeys(keys) {
    for (let key in keys) {
        $('.manage-keys-house').text(keys[key].sharedHouseName);
        let manageHouseKey = `
            <li class="collection-item">
                <div class="row no-padding">
                    <div class="col s9" aria-label="${keys[key].sharedName}" data-balloon-pos="down">
                        <span  class="truncate" style="font-weight:bold">${keys[key].sharedName + "Longernamehereoklolasdasd"}</span>
                    </div>
                    <div class="col s3 right-align">
                        <span class="phone-button manage-keys-remove" data-target-id="${keys[key].sharedId}" aria-label="Remove Key" data-balloon-pos="left"><i class="fas red-text fa-user-times fa-2x"></i></span>
                    </div>
                </div>
                <div class="row no-padding">
                    <div class="col s12">
                        <span>Citizen ID: ${keys[key].sharedId}</span>
                    </div>
                </div>
            </li>
        `

        $('.manage-keys-entries').append(manageHouseKey);
    }
}

function addOutstandingPayments(payments) {
    for (let payment in Object.keys(payments)) {
        $('.outstanding-payments-entries').append("<div class='col s12 outstanding-payment-entry'>" + payments[payment].Plate + "<br>" + payments[payment].AmountDue + "<br>" + payments[payment].cid + "<br>" + payments[payment].Info + "<hr></div>");
        
    }
}

function addGroupManage(group) {
    $('.group-manage-company-name').text(group.groupName).data('group-id', group.groupId);
    $('.group-manage-company-bank').text('$' + group.bank);
    for (let i = 0; i < group.employees.length; i++) {
        let employee = group.employees[i];
        let employeeEntry = `
        <li>
            <div class="row no-padding">
                <div class="col s12">
                    <div id="group-cards" class="card grey2 group-manage-entry-card">
                        <div class="card-content group-manage-entry-content">
                            <div class="row no-padding">
                                <div class="col s12">
                                    <span class="card-title group-manage-entry-title" style="color: rgb(255, 255, 255);">${employee.name} [${employee.cid}]</span>
                                    <span class="group-manage-entry-body" style="color: rgb(255, 255, 255);">Promoted to Rank ${employee.rank} by ${employee.giver}</span>
                                </div>
                            </div>
                            <div class="row no-padding" style="padding-top:10px !important">
                                <div class="col s12 center-align">
                                    <button class="waves-effect waves-light btn-small group-manage-pay" style="padding-left:18px;padding-right:18px" data-id="${employee.cid}" aria-label="Pay" data-balloon-pos="up-left"><i class="fas fa-wallet"></i></button>
                                    <button class="waves-effect waves-light btn-small group-manage-rank" data-id="${employee.cid}" data-rank="${employee.rank}" aria-label="Set Rank" data-balloon-pos="up"><i class="fas fa-handshake"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>
        `
        $('.group-manage-entries').append(employeeEntry);
    }
}

function addGroupTasks(tasks) {
    for (let task in tasks) {
        if (tasks[task].groupId == manageGroup) {
            let currentTask = tasks[task];
            let taskElement = `
                <li class="collection-item">
                    <span style="font-weight:bold">${currentTask.name}</span>
                    <a href="#!" class="secondary-content">`

            if (currentTask.retrace == 1 && currentTask.status != "Successful" && currentTask.status != "Failed")
                taskElement += `<span class="group-tasks-track" data-id="${currentTask.identifier}" aria-label="Track" data-balloon-pos="left"><i class="fas fa-map-marker-alt fa-2x"></i></span>`

            taskElement += `
                        <span class="btn-group-tasks-assign" data-id="${currentTask.identifier}" aria-label="Assign" data-balloon-pos="left"><i class="grey-text text-darken-4 fas fa-hands-helping fa-2x"></i></span>
                    </a>
                    <br><span style="font-weight:300">${currentTask.status}</span>
                    <br><span style="font-weight:bold">${currentTask.assignedTo === 0 ? "Unassigned" : `Assigned to ${currentTask.assignedTo}`}</span> <span data-badge-caption="" class="new badge">${currentTask.identifier}</span>
                </li>
            `

            $('.group-tasks-entries').append(taskElement);
        }
    }
}

function addGroups(groups) {
    for (let group in groups) {
        let groupElement = `
            <li class="collection-item" style="background-color: #31455E;height:70px">
                <span style="color: rgb(255, 255, 255);position:absolute;">${groups[group].namesent}</span>
                <span data-balloon-pos="left" style="position:absolute;margin-top:9%;left:70%;width:20%;"><i class="phone-button white-text text-darken-3 fas fa-folder-open fa-2x icon-button" data-action="group-manage" data-action-data="${groups[group].idsent}" style="position:absolute;top:50%;left:87.5%;transform:translate(-50%, -50%);"></i></span>
                
                <br><span style="color: rgb(255, 255, 255);position:absolute;" >${groups[group].ranksent}</span>
            </li>
        `

        $('.groups-entries').append(groupElement);
    }
}

function addEmails(emails) {
    for (let email of Object.keys(emails)) {
        let emailElement = `
        <div class="row">
        <div class="col s12 center-align">
        <div class="card-panel" style="background: #31455E;border-bottom: solid 1px #ada5a5;">
        <span class="email-name">From: ${emails[email].name}
                                    </span>
        <span class="email-message">${emails[email].message}
               
                    </span>
                    <div class="time-email" style="
    color: white;
    margin-top: 13px;
">${moment.utc(emails[email].time).local().fromNow()}
                    
                </div>
                </div>
            </div>
        </div>
        `
        $('.emails-entries').prepend(emailElement);
    }
}

function addDeliveries(deliveries) {
    for (let delivery of Object.keys(deliveries)) {
        let deliveryEntry = deliveries[delivery];
        let deliveryElement =
            `
            <li>
                <i class="fas fa-truck-loading fa-2x"></i> <span class="delivery-job-entry-street">${deliveryEntry.targetStreet}</span>
                <span class="secondary-content delivery-job-accept" data-job-id="${deliveryEntry.jobId}" data-job-type="${deliveryEntry.jobType}" aria-label="Click to accept job" data-balloon-pos="left">
                    <i class="fas fa-clipboard-check fa-2x"></i>
                </span>
            </li>
        `
        $('.delivery-job-entries').append(deliveryElement);
    }
}

function addGurgleEntries(pGurgleEntries) {
    const preMadeSearchEntries = [

    ]

    let combined = pGurgleEntries === undefined ? preMadeSearchEntries : $.merge(pGurgleEntries, preMadeSearchEntries);
    if (combined !== undefined)
        gurgleEntries = combined;
}

function openBrowser(url) {
    $("#browser object").attr("data", url);
    
    $.post('http://rd-racing/btnCamera', JSON.stringify({}));
    $("#browser").fadeIn(300);
}

function openRadio() {
    let browserRadio =
        `
        <object type="text/html" data="https://static.online/radio/player.html" class="browser-radio-window">
        </object>
    `;

    if ($("#browser-radio").data('loaded') === false) {
        $("#browser-radio").fadeIn(300).data('loaded', true).html(browserRadio)
    }
    else {
        $("#browser-radio").data('loaded', false);
        $("#browser-radio").fadeOut(300).empty();
    }
}

function setWeather(weather) {
    let weatherIcon = "fas fa-sun"
    switch (weather) {
        case "EXTRASUNNY":
        case "CLEAR":
            weatherIcon = "fas fa-sun"
            break;
        case "THUNDER":
            weatherIcon = "fas fa-poo-storm"
            break;
        case "CLEARING":
        case "OVERCAST":
            weatherIcon = "fas fa-cloud-sun-rain"
            break;
        case "CLOUD":
            weatherIcon = "fas fa-cloud"
            break;
        case "RAIN":
            weatherIcon = "fas fa-cloud-rain"
            break;
        case "SMOG":
        case "FOGGY":
            weatherIcon = "fas fa-smog"
            break;
    }
    $('.status-bar-weather').empty();
    $('.status-bar-weather').append(`<i class="${weatherIcon}"></i>`);
    
}

function addStocks(stocksData) {
    for (let i of Object.keys(stocksData)) {
        let stock = stocksData[i];
        // let stockElement = `
        // <li>
        //     <div class="collapsible-header" style="color: white;">
        //                 ${stock.identifier} <span class="new ${stock.change > -0.01 ? 'stockgreen' : 'red'} badge" data-badge-caption="">${stock.change > -0.01 ? '▲' : '▼'} ${stock.change}%</span>
        //             </div>
        //     </div>
        //     <div class="collapsible-body garage-body" style="height: 269px; margin-top: 10px">
        //         <ul class="collection" style="background-color: #31455E;">
        //             <li class="collection-item" style="background-color: #31455E; font-size: 17px">Name: ${stock.name}</li>
        //                 <li class="collection-item" style="background-color: #31455E; font-size: 17px">Shares: ${stock.clientStockValue}</li>
        //                 <li class="collection-item" style="background-color: #31455E; font-size: 17px">Float: ${stock.available}</li>
        //                 <li class="collection-item" style="background-color: #31455E; font-size: 17px">Value: ${stock.value}</li>
        //                 <li class="collection-item center-align" style="background-color: #31455E;">
        //                 <button class="waves-effect waves-light btn-small garage-spawn teal darken-1 stocks-exchange" data-stock-id="${stock.identifier}"><i class="fas fa-exchange-alt"></i> Exchange</button> 
        //             </li>
        //         </ul>
        //     </div>
        // </li>
        // `

        let element = $(`
            <div class="stocks-entry">
                <div class="stocks-entry-title">
                    ${stock.identifier}
                </div>
                <div class="stocks-entry-status">
                    <div class="stocks-entry-status-text">
                    ${stock.change}%
                    </div>
                    ${
                        stock.change > -0.01 ? '<i class="fas fa-level-up-alt green-text stocks-entry-status-icon"></i>' : '<i class="fas fa-level-down-alt red-text stocks-entry-status-icon"></i>'
                    }
                </div>
            </div>
        `)
        $('.stocks-entries-wrapper').append(element);
    }
}


function addVehicles(vehicleData, showCarPayments) {
    if (showCarPayments)
        $('.btn-car-payments').css("visibility", "visible").hide().fadeIn(150);
    for (let vehicle of Object.keys(vehicleData)) {
        let carIconColor = "green";
        if (vehicleData[vehicle].amountDue > 0)
            carIconColor = "#cc5353";
        else if (vehicleData[vehicle].amountDue == 0 && vehicleData[vehicle].payments > 0)
            carIconColor = "orange";
        else
            carIconColor = "white";
    //         var vehicleElement = `
    //         <li>
    //         <div class="hovereffect">
    
       
    // <h3>
    // `
    //     if (vehicleData[vehicle].canSpawn)
    //         vehicleElement += `<button id="hovercorridas" class="" aria-label=""><i class=""></i> </button>
        
    //     <button style="margin-left: 15px" id="hovercorridas" class="" aria-label="Garage - ${vehicleData[vehicle].garage}" data-balloon-pos="up"><i  class="fas fa-oil-can"></i> </button>
    //     <button id="hovercorridas" class="" aria-label=" Car Plate - ${vehicleData[vehicle].plate}" data-balloon-pos="up"><i  class="fas fa-closed-captioning"></i> </button>
    //     <button id="hovercorridas" class="" aria-label="Engine Health - ${vehicleData[vehicle].enginePercent}" data-balloon-pos="up"><i  class="fas fa-oil-can"></i> </button>
    //     <button id="hovercorridas" class="" aria-label="Body Health - ${vehicleData[vehicle].bodyPercent}" data-balloon-pos="up"><i  class="fas fa-car-crash"></i> </button>

    // </h3>
    //             <div class="collapsible-header">
    //                 <i class="fas fa-car " style="font-size: 60px; color:${carIconColor}"> </i>
    //                 <i class="name-car" style="font-size: 13px;">${vehicleData[vehicle].name}</i>
    //                 <span  class="new-badge">(${vehicleData[vehicle].state}) ${vehicleData[vehicle].garage}</span>
    //             </div>
    //             <div class="collapsible-body garage-body">
    //             <div class="collapsible-body garage-body">
    //             <div class="row">
    //                 <div class="col s12"> 
    //                     <ul class="collection">
    //                         <li class="collection-item"><i class="fas fa-map-marker-alt"></i>  ${vehicleData[vehicle].garage}</li>
    //                         <li class="collection-item"><i class="fas fa-closed-captioning"></i> ${vehicleData[vehicle].plate}</li>
    //                         <li class="collection-item"><i class="fas fa-oil-can"></i> ${vehicleData[vehicle].enginePercent}% Engine</li>
    //                         <li class="collection-item"><i class="fas fa-car-crash"></i> ${vehicleData[vehicle].bodyPercent}% Body</li>
    //                         <li class="collection-item"><i class="fas fa-hourglass-half"></i> ${vehicleData[vehicle].payments == 0 ? 'No remaining payments.' : Math.ceil(parseFloat(vehicleData[vehicle].lastPayment)) + ' days until payment is due.'}</li>
    //                         `
    //                     if (vehicleData[vehicle].payments != 0) {
    //                         vehicleElement += `
    //                         <li class="collection-item"><i class="fas fa-credit-card"></i> ${vehicleData[vehicle].payments} payments left.</li>
    //                         <li class="collection-item"><i class="fas fa-dollar-sign"></i> <span class="car-payment-due">${Math.ceil(parseFloat(vehicleData[vehicle].amountDue /12))}</span> amount due.</li>
    //                         `
    //                         }
    //                         vehicleElement += `
    //                     </ul>
    //                 </div>
    //             </div>
    //         </div>
    //     </li>
    // `
    var element = $(`<div class="garage-entry">
        <div class="garage-entry-icon white-text">
            <i class="fas fa-car"></i>
        </div>
        <div class="garage-entry-data">
            <div class="garage-entry-data-name">${vehicleData[vehicle].name} - ${vehicleData[vehicle].state.toUpperCase()}` + (vehicleData[vehicle].state == 'In' ? ` Garage ${vehicleData[vehicle].garage}` : ``) + `</div>
            <div class="garage-entry-data-number">${vehicleData[vehicle].plate}</div>
        </div>
        <div class="garage-entry-buttons center-align icon-spacing">
            <i class="fas fa-map-marker-alt" aria-label="${vehicleData[vehicle].garage}" data-balloon-pos="up"></i>
            <i class="fas fa-oil-can" aria-label="${vehicleData[vehicle].enginePercent}% Engine" data-balloon-pos="up"></i>
            <i class="fas fa-car-crash" aria-label="${vehicleData[vehicle].bodyPercent}% Body" data-balloon-pos="up"></i>
            <i class="fas fa-hourglass-half" aria-label="${vehicleData[vehicle].payments == 0 ? 'No remaining payments.' : Math.ceil(parseFloat(vehicleData[vehicle].lastPayment)) + ' days until payment is due.'}" data-balloon-pos="up-right"></i>
        </div>
    </div>`)
    $('.garage-container-entries-wrapper').append(element);
}
}

function addImportados(vehicleData, showCarPayments) {
    
        var ImportadosElement = `
            <li>
                <div class="collapsible-header">
                    <i class="fas fa-car " style="font-size: 60px"> </i>
                    <i class="name-car" style="font-size: 18px;"></i>
                    <span  class="new-badge">(</span>
                </div>
                <div class="collapsible-body importados-body">
                <i class="fas fa-map-marker-alt fa-2x btn-contacts-send-message"  aria-label="" style="margin-top: 20px;margin-left: 47px;"></i>
                <i class="fas fa-closed-captioning fa-2x btn-contacts-send-message"  aria-label=""style="margin-left: 10px;"></i>
                <i class="fas fa-oil-can fa-2x btn-contacts-send-message"  aria-label="% Engine"style="margin-left: 10px;"></i>
                <i class="fas fa-car-crash fa-2x btn-contacts-send-message"  aria-label="% Body"style="margin-left: 10px;"></i>
                

             
            </div>
        </li>`;
    
        $('.importados-entries').append(ImportadosElement);
    }



function addGPSLocations(locations) {
    let unorderedAdressess = []
    for (let location of Object.keys(locations)) {
        let houseType = parseInt(locations[location].houseType);
        let houseInfo = locations[location].info;
        if (houseInfo !== undefined) {
            for (let i = 0; i < houseInfo.length; i++) {

                const houseMapping = {
                    1: { type: 'House', icon: 'fas fa-home' },
                    2: { type: 'Mansion', icon: 'fas fa-hotel' },
                    3: { type: 'Rented', icon: 'fas fa-key' },
                    69: { type: 'Misc', icon: 'fas fa-info' }
                }
                let address = escapeHtml(houseType == 3 ? houseInfo[i].name : houseInfo[i].info)
                unorderedAdressess.push({
                    address: address.trimStart(),
                    houseId: i + 1,
                    houseIcon: houseMapping[houseType].icon,
                    houseType: houseMapping[houseType].type,
                    houseTypeId: houseType
                })
            }
        }
    }
    unorderedAdressess.sort((a, b) => a.address.localeCompare(b.address))
    for (let j = 0; j < unorderedAdressess.length; j++) {
        let htmlData = `<li class="collection-item" data-house-type="${unorderedAdressess[j].houseType}">
                            <div>
                                <span aria-label="${unorderedAdressess[j].houseType}" data-balloon-pos="right"><i class="${unorderedAdressess[j].houseIcon}"></i></span> ${unorderedAdressess[j].address}
                                <span class="secondary-content gps-location-click" data-house-type=${unorderedAdressess[j].houseTypeId} data-house-id="${unorderedAdressess[j].houseId}"><i class="fas fa-map-marker-alt"></i></span>
                            </div>
                        </li>`
        $('.gps-entries').append(htmlData);
    }
}

function addAccountInformation(accountInfo) {
    if (accountInfo) {
        var Banco = accountInfo.bank.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
        var Carteira = accountInfo.cash.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
        var Paycheck = accountInfo.paycheck.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
       
        var number = accountInfo.myNumber.toString();
        var phoneNumber =  '(' + number.slice(0, 3) + ') ' + number.slice(3, 6) + '-' + number.slice(6, 10);
        
        $('.account-information-paycheck').text(Paycheck);
        $('.account-information-cid').text((accountInfo.cid ? accountInfo.cid : 0));
        $('.account-information-cash  ' ).text(Carteira);
        $('.account-information-bank ' ).text(Banco);
        $('.account-phone-number ' ).text(phoneNumber);
        
        licenses = accountInfo.licenses

        let licenseTable =
        `<table class="responsive-table license-table" >
        <thead>
            <tr>
            
                <th><span aria-label="Your Licenses" data-balloon-pos="up-left" style="margin-left: 90px;font-size: 1rem;font-family: &quot;Roboto&quot;, &quot;Helvetica&quot;, &quot;Arial&quot;, sans-serif;font-weight: 500;line-height: 1.5;letter-spacing: 0.00938em;">Licenses<div class=""></div></span></th>
                
            </tr>
        </thead>
    <tbody>
            `
        for (const key of Object(licenses)) {
            var string = `${key["type"]}`
            string = string.charAt(0).toUpperCase() + string.slice(1)
            licenseTable += `<tr>
                                <td>${string}</td>
                                <td><i class="${key["status"] == 1 ? "fas fa-check-circle licensesucess" : "fas fa-times-circle licenseerror"}"></i></td>
                            </tr>`
        }
        licenseTable +=
            `
            </tbody>
        </table>
        `
        $('.account-information-licenses').html(licenseTable);
        if (accountInfo.pagerStatus)
            $('.account-information-toggle-pager').removeClass('red-text').addClass('green-text')
        else
        $('.account-information-primary-job').text(accountInfo.job ? accountInfo.job : "Desempregado.");
        $('.account-information-secondary-job').text(accountInfo.secondaryJob ? accountInfo.secondaryJob : "No secondary job.");
    }
}

function addTweets(tweets, myHandle) {
    $(".twatter-handle").empty();
    $(".twatter-handle").append(myHandle);
    if (tweets && Object.keys(tweets).length > 0) {
        for (let message of tweets) {
            if (message && message.handle && message.message) {
                var twat = message.message;
                if (twat !== "") {
                    var twatEntry = $(`<div class="row no-padding">
                                <div class="col s12">
                                <div class="card blue darken-3 twat-card" style="background: #0A6BDC !important;">
                                    <div class="card-content white-text twatter-content" style="background: #0A6BDC; border-radius: 10px 10px 0 0;">
                                        <span class="card-title twatter-title" style="font-size: 15px !important; font-weight: 400 !important;">${message.handle}</span>
                                        <p>${twat}</p>
                                    </div>
                                    <div class="usertweetoptions">
                                    <div class="replybox">
                                    <span data-poster="${message.handle}" class="twat-reply white-text"><i class="fas fa-reply " style="margin-left: -20px; margin-bottom: 10px;"></i></span>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>`);
            $('.twatter-entries').prepend(twatEntry);
            }
        }
    }
}
}

function addNoti(tweets, myHandle, pTime) {
                    
    var notiElement = $(`</div><div class="top-notifications-twitter" style="max-height: 80px; display: flex;  ;"><div class="notification-container-twitter slideoutnotify slideinnotify" style="display: block; right: 55px;"><div class="app-bar-twitter"><div class="icon-twitter"><div class="twittericon" title="Messages" id="icon-noti" style="background: url('https://gta-assets.nopixel.net/images/phone-icons/twatter.png') 0% 0% / cover no-repeat;height: 18px; width: 18px; bottom: 0px; left: 2px;">
                
    </div>
    </div><div class="name"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word;" id="notificaçaotweet-titel">${myHandle}</p></div><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word;" id="notificaçao-time">${moment.utc(pTime).local().fromNow()}</p></div><div class="content"><div class="text"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word; margin-top: -16px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;" id="notificaçaotweet-mensagem">${tweets}</p>
    </div></div></div></div>`);
    $('.notificaçaoch').prepend(notiElement);
    setTimeout(() => {
        $(".notificaçaoch").empty();
    }, 5000);
    setTimeout(() => {
        if(pPhoneOpen === false) {
            $(".phone-screen").removeClass("slidein").addClass("slideout").fadeOut()
            $(".phone-app").removeClass("slidein").addClass("slideout").fadeOut()
            $(".phone-app").css("bottom" , "10px")
        }
    }, 5200)
}

function addNotiEmail(email, myHandle) {
    var notiElement = $(`</div><div class="top-notifications-email" style="max-height: 80px; display: flex;  ;"><div class="notification-container-email slideoutnotify slideinnotify" style="display: block; right: 55px;"><div class="app-bar-email"><div class="icon-twitter"><div class="emailicon" title="Email" id="icon-noti" style="background: url('https://gta-assets.nopixel.net/images/phone-icons/email.png') 0% 0% / cover no-repeat;height: 18px; width: 18px; bottom: 10px; left: 2px;">
                
    </div>
    </div><div class="name"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="margin-left: 0.5vw; color: white; word-break: break-word;">${myHandle}</p></div><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word; color: white;" id="notificaçao-time">${("now")}</p></div><div class="content"><div class="text"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word; margin-top: -16px; color: white; overflow: hidden; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;" id="notificaçaotweet-mensagem">${email}</p>
    </div></div></div></div>`);
    $('.notificaçaoch').prepend(notiElement);
    setTimeout(() => {
        $(".notificaçaoch").empty();
    }, 5000);
    setTimeout(() => {
        if(pPhoneOpen === false) {
            $(".phone-screen").removeClass("slidein").addClass("slideout").fadeOut()
            $(".phone-app").removeClass("slidein").addClass("slideout").fadeOut()
            $(".phone-app").css("bottom" , "10px")
        }
    }, 5200)
}

function addNotiJob(email, myHandle) {
    var notiElement = $(`</div><div class="top-notifications-email" style="max-height: 80px; display: flex;"><div class="notification-container-email slideoutnotify slideinnotify" style="display: block; right: 55px;"><div class="app-bar-email"><div class="icon-twitter"><div class="emailicon" title="Email" id="icon-noti" style="background: url('https://gta-assets.nopixel.net/images/phone-icons/jobs.png') 0% 0% / cover no-repeat;height: 18px; width: 18px; bottom: 10px; left: 2px;">
                
    </div>
        </div>
                <div class="name"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="margin-left: 0.5vw; color: white; word-break: break-word;">${myHandle}</p></div><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word; color: white;" id="notificaçao-time">${("now")}</p></div><div class="content"><div class="text"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word; margin-top: -16px; color: white; overflow: hidden; white-space: wrap; max-width: 200px;" id="notificaçaotweet-mensagem">${email}</p>
                </div>
            </div>
        </div>
    </div>`);
    $('.notificaçaoch').prepend(notiElement);
    setTimeout(() => {
        $(".notificaçaoch").empty();
    }, 2500);
    setTimeout(() => {
        if(pPhoneOpen === false) {
            $(".phone-screen").removeClass("slidein").addClass("slideout").fadeOut()
            $(".phone-app").removeClass("slidein").addClass("slideout").fadeOut()
            $(".phone-app").css("bottom" , "10px")
        }
    }, 2500)
}

function addNotiMessage(message, myHandle) {
    var notiElement = $(`</div><div class="top-notifications-email" style="max-height: 80px; display: flex;  ;"><div class="notification-container-email slideoutnotify slideinnotify" style="display: block; right: 55px;"><div class="app-bar-email"><div class="icon-twitter"><div class="emailicon" title="Email" id="icon-noti" style="background: url('https://gta-assets.nopixel.net/images/phone-icons/conversations.png') 0% 0% / cover no-repeat;height: 18px; width: 18px; bottom: 10px; left: 2px;">
                
    </div>
    </div><div class="name"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="margin-left: 0.5vw; color: white; word-break: break-word;">${myHandle}</p></div><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word; color: white;" id="notificaçao-time">${("now")}</p></div><div class="content"><div class="text"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word; margin-top: -16px; color: white; overflow: hidden; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;" id="notificaçaotweet-mensagem">${message}</p>
    </div></div></div></div>`);
    $('.notificaçaoch').prepend(notiElement);
    setTimeout(() => {
        $(".notificaçaoch").empty();
    }, 5000);
    setTimeout(() => {
        if(pPhoneOpen === false) {
            $(".phone-screen").removeClass("slidein").addClass("slideout").fadeOut()
            $(".phone-app").removeClass("slidein").addClass("slideout").fadeOut()
            $(".phone-app").css("bottom" , "10px")
        }
    }, 5200)
}

// function addNotiCalling(message, myHandle) {
//     var notiElement = $(`</div><div class="top-notifications-email" style="max-height: 80px; display: flex;  ;"><div class="notification-container-email slideoutnotify slideinnotify" style="display: block; right: 55px;"><div class="app-bar-email"><div class="icon-twitter"><div class="emailicon" title="Email" id="icon-noti" style="background: url('https://gta-assets.nopixel.net/images/phone-icons/calls.png') 0% 0% / cover no-repeat;height: 18px; width: 18px; bottom: 10px; left: 2px;">
                
//     </div>
//     </div><div class="name"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="margin-left: 0.5vw; color: black; word-break: break-word;">${myHandle}</p></div><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word; color: black;" id="notificaçao-time">${("now")}</p></div><div class="content"><div class="text"><p class="MuiTypography-root MuiTypography-body2 MuiTypography-colorTextPrimary" style="word-break: break-word; margin-top: -16px; color: black; overflow: hidden; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;" id="notificaçaotweet-mensagem">${message}</p>
//     </div></div></div></div>`);
//     $('.notificaçaoch').prepend(notiElement);
//     setTimeout(() => {
//         $(".notificaçaoch").empty();
//     }, 5000);
//     setTimeout(() => {
//         if(pPhoneOpen === false) {
//             $(".phone-screen").removeClass("slidein").addClass("slideout").fadeOut()
//             $(".phone-app").removeClass("slidein").addClass("slideout").fadeOut()
//             $(".phone-app").css("bottom" , "10px")
//         }
//     }, 5200)
// }

function addCallHistoryEntries(callHistory) {
    if (callHistory && Object.keys(callHistory).length > 0) {
        callHistory.slice().reverse().forEach(function (call) {
            let callIcon = (call.type == 1 ? "call" : "phone_callback")
                let callIconColor = (call.type == 1 ? "green" : "red")

                var number = call.number.toString();
                var phoneNumber = number.slice(0, 3) + '-' + number.slice(3, 6) + '-' + number.slice(6, 10);
                var element = $(`
                    <div class="call-history-entry">
                        <div class="call-history-entry-icon">
                            <i class="material-icons ${callIconColor}-text">${callIcon}</i>
                        </div>
                        <div class="call-history-entry-data">
                            <div class="call-history-entry-data-name">${call.name}</div>
                            <div class="call-history-entry-data-number">${phoneNumber}</div>
                        </div>
                        <div class="call-history-entry-buttons center-align icon-spacing">
                            <i class="fas fa-phone-alt fa-2x btn-contacts-call" data-name="${call.name}" data-number="${call.number}"></i>
                            <i class="fas fa-comment-medical fa-2x btn-contacts-send-message" data-number="${call.number}"></i>
                            <i class="fas fa-user-plus fa-2x btn-call-history-add-contact" data-number="${call.number}"></i>
                        </div>
                    </div>
                `)
                element.data("receiver", number);
                $('.call-history-entries-wrapper').append(element);  
        })
    }
}

function addYellowPage(item) {
    var yellowPage = $(`
        <div class="row no-padding">
            <div class="col s12">
            <div class="card yellow darken-1 yellow-page-entry" style="border-radius: 0;color: black;">
                <div class="card-content black-text yellow-page-body center-align" style="border-bottom: solid 1px black"
                        <strong>${item.message}</strong>
                    </div>
                    <div class="card-action" style="padding-top: 8px;padding-right: 16px;padding-bottom: 8px;padding-left: 16px;font-size:14px">
                        <div class="row no-padding">
                            <div class="col s6">
                                <span aria-label="Call" data-balloon-pos="up-left" data-number="${item.phoneNumber}" class="yellow-pages-call"><i class="fas fa-phone-alt fa-1x"></i> ${item.phoneNumber}</span>
                            </div>
                            <div class="col s6" data-balloon-length="medium" aria-label="${item.name}" data-balloon-pos="down-right">
                                <span class="truncate"><i class="fas fa-user-circle fa-1x"></i> ${item.name}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>`);
    $('.yellow-pages-entries').prepend(yellowPage);
}

function addMessage(item) {
    var date = (item.date === undefined ? Date.now() : item.date);
    var element = $(`
    <li id="${item.name}-${item.number}">
    <div class="collapsible-header" style="font-size:12px; margin-top: 15px;">
        <i class="fas fa-comment"></i>
        <span style="color: white; margin-left: 10px; margin-top: 12px; width: 169px; font-size: 15px;">${item.msgDisplayName}</span>
        <span class="new-badge" style="margin-left: 10px;margin-top: 40px;" data-badge-caption="">${moment(date).local().fromNow()}</span>
    

    </div>
</li>`);
    element.id = item.id;
    element.click(function () {
        $.post('http://rd-racing/messageRead', JSON.stringify({ sender: item.sender, receiver: item.receiver, displayName: item.msgDisplayName }));
    });
    $(".messages-entries").prepend(element);
}


function addMessageOther(item) {
    // Check if message is already added
    var receiver = item.name || item.receiver;
    var date = (item.date === undefined ? Date.now() : item.date);
    var element = $('<div class="row messages-entry"> <div class="col s2 black-text"> <i class="far fa-user-circle fa-2x"></i> </div> <div class="col s10 messages-entry-details"> <div class="row no-padding"> <div class="col s8 messages-entry-details-sender">' + item.msgDisplayName + '</div> <div class="col s4 messages-entry-details-date right-align">' + moment(date).local().fromNow() + '</div> </div> <div class="row "> <div class="col s12 messages-entry-body">' + item.message + '</div> </div> </div> </div>');
    element.id = item.id;
    element.click(function () {
        $.post('http://rd-racing/messageRead', JSON.stringify({ sender: item.sender, receiver: item.receiver, displayName: receiver, clientPhone: item.clientNumber }));
    });
    $(".messages-entries").prepend(element);
}

function addMessageRead(item, clientNumber, displayName) {
    var date = (item.date === undefined ? Date.now() : item.date);
    // If its "us" sending it, place it on the right
    if (item.sender === clientNumber) {
        var element = $('<div class="row message-entry"><div class="Messageright">' + item.message + '<div class="message-details">' + '<span aria-label="' + moment(date).local().calendar(null, calendarFormatDate) + '" data-balloon-pos="left">' + moment(date).local().fromNow() + '</span></div></div></div>');
        element.id = item.id;
        $(".message-entries").append(element);
        $('.message-entries').data("sender", item.receiver);
    } else {
        var element = $('<div class="row message-entry"><div class="Messageleft">' + item.message + '<div class="message-details">' + '<span aria-label="' + moment(date).local().calendar(null, calendarFormatDate) + '" data-balloon-pos="left">' + moment(date).local().fromNow() + '</span></div></div></div>');
        element.id = item.id;
        $(".message-entries").append(element);
        $('.message-entries').data("sender", item.sender);
        $('.message-entries').data("receiver", item.sender);
    }
    $('.message-entries').data("displayName", displayName);
    $('.message-entries').data("clientNumber", clientNumber);
}

function addContact(item, idk) {
    if (idk) {
        if (contactList.some(function (e) { return e.name == item.name && e.number == item.number; })) {
            return;
        }
        contactList.push(item);
        contactList.sort();
    }
    var number = item.number.toString();
    var phoneNumber = number.slice(0, 3) + '-' + number.slice(3, 6) + '-' + number.slice(6, 10);
    var name = item.name;
    var nameID = name.replace(/\s/g, '');
    var element = $(`<div class="contacts-entry">
        <div class="contacts-entry-icon white-text">
            <i class="fa fa-user-circle"></i>
        </div>
        <div class="contacts-entry-data">
            <div class="contacts-entry-data-name">${item.name}</div>
            <div class="contacts-entry-data-number">${phoneNumber}</div>
        </div>
        <div class="contacts-entry-buttons center-align icon-spacing">
            <i class="fas fa-user-slash btn-contacts-remove" aria-label="Delete Contact" data-name="${item.name}" data-number="${item.number}"></i>
            <i class="fas fa-phone btn-contacts-call" aria-label="Call" data-number="${item.number}"></i>
            <i class="fas fa-comment btn-contacts-send-message" aria-label="Send Message" data-number="${item.number}"></i>
        </div>
    </div>`)
    $(".contacts-entries-wrapper").append(element);
}



function removeContact(item) {
    ContactsFilter();
    contactList = contactList.filter(function (e) {
        return e.name != item.name && e.number != item.number;
    });
}

function KeysFilter() {
    var filter = $('#keys-search').val();
    $("ul.keys-entries li").each(function () {
        if ($(this).text().search(new RegExp(filter, "i")) < 0) {
            $(this).hide();
        } else {
            if (keyFilters.includes($(this).data('key-type')))
                $(this).hide();
            else
                $(this).show()
        }
    });
}

function GPSFilter() {
    var filter = $('#gps-search').val();
    $("ul.gps-entries li").each(function () {
        if ($(this).text().search(new RegExp(filter, "i")) < 0) {
            $(this).hide();
        } else {
            if (gpsFilters.includes($(this).data('house-type')))
                $(this).hide();
            else
                $(this).show()
        }
    });
}

function GurgleFilter() {
    $('.gurgle-entries').empty();
    var filter = $('#gurgle-search').val();
    let matchedEntries = gurgleEntries.filter(item => {
        let keys = Object.keys(item);
        for (let itemIndex in keys) {
            if (keys[itemIndex] == 'action')
                continue;
            let key = keys[itemIndex];
            if (key !== 'action') {
                if (item[key].search(new RegExp(filter, "i")) >= 0)
                    return true;
            }
        }
    });
    for (let i = 0; i < matchedEntries.length; i++) {
        let searchElement = `
                            <div class="row no-padding phone-button" >
                                <div class="col s12">
                                    <div class="card white gurgle-card ${matchedEntries[i].action !== undefined ? `phone-button" data-action="${matchedEntries[i].action}">` : '">'}
                                        <div class="card-content gurgle-card-content">
                                            <span class="card-title gurgle-card-title">${matchedEntries[i].webTitle}</span>
                                            <p class="gurgle-card-body black-text">${matchedEntries[i].webDescription}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            `
        $('.gurgle-entries').append(searchElement);
    }
}

function ContactsFilter() {
    var filter = $('#new-contact-search').val();
    $(".contacts-entries-wrapper").empty();
    for (var i = 0; i < contactList.length; i++) {
        var contact = contactList[i];
        if (contact.name.toLowerCase().search(filter.toLowerCase()) != -1 || contact.number.toLowerCase().search(filter.toLowerCase()) != -1) {
            addContact(contact);
        }
    }
}

function CarsFilter() {
    var filter = $('#new-car-search').val();
    $("garage-container-entries-wrapper div").each(function () {
        if ($(this).text().search(new RegExp(filter, "i")) < 0) {
            $(this).hide();
        } else {
            $(this).show()
        }
    });
}

function ManageFilter() {
    var filter = $('#group-manage-search').val();
    $("ul.group-manage-entries li").each(function () {
        if ($(this).find('.group-manage-entry-title').text().search(new RegExp(filter, "i")) < 0) {
            $(this).hide();
        } else {
            $(this).show()
        }
    });
}

function OutstandingFilter() {
    var filter = $('#outstanding-search').val();
    $(".outstanding-payments-entries .outstanding-payment-entry").each(function () {
        if ($(this).text().search(new RegExp(filter, "i")) < 0) {
            $(this).hide();
        } else {
            $(this).show()
        }
    });
}

function ManageKeysFilter() {
    var filter = $('#manage-keys-search').val();
    $("ul.manage-keys-entries li").each(function () {
        if ($(this).text().search(new RegExp(filter, "i")) < 0) {
            $(this).hide();
        } else {
            $(this).show()
        }
    });
}

 
// var of Controls
var controlNames = [];
var currentBinds = [];
var currentSettings = [];
var currentSettingWindow = "tokovoip";

var checkedFunctions = ["stereoAudio","localClickOn","localClickOff","remoteClickOn","remoteClickOff"];
var sliderFunctions = ["clickVolume","radioVolume", "phoneVolume"];


controlNames[0] = ["label","Toko Voip Controls"];
controlNames[1] = ["tokoptt","Toko: Radio Push To Talk",true];
controlNames[2] = ["loudSpeaker","Toko: Loud Speaker",false];
controlNames[3] = ["distanceChange","Toko: Distance Change",false];
controlNames[4] = ["handheld","Toko: Handheld Radio",true];
controlNames[5] = ["carStereo","Toko: Car Stereo",true];
controlNames[6] = ["switchRadioEmergency","Toko: Emergency change radio",false];
controlNames[7] = ["radiovolumedown","Toko: Volume down",true];
controlNames[8] = ["radiovolumeup","Toko: Volume up",true];
controlNames[9] = ["radiotoggle","Toko: Toggle Radio",true];



controlNames[10] = ["label","General Controls"];

controlNames[11] = ["generalPhone","General: Phone",true];
controlNames[12] = ["generalInventory","General: Inventory",true]; 
controlNames[13] = ["generalEscapeMenu","General: Leave Menu",true]; 
controlNames[14] = ["generalChat","General: Chat",true];

controlNames[15] = ["actionBar","General: Action Bar",true];
controlNames[16] = ["generalUse","General: Use Action",false]; // this is set to false , might end up setting true might need testing
controlNames[17] = ["generalUseSecondary","General: Menu Secondary",true];
controlNames[18] = ["generalUseSecondaryWorld","General: World Secondary",true];
controlNames[19] = ["generalUseThird","General: World Third",false];
controlNames[20] = ["generalTackle","General: Tackle",true];
controlNames[21] = ["generalMenu","General: Action Menu",true];
controlNames[22] = ["generalProp","General: Prop Drop",false];
controlNames[23] = ["generalScoreboard","General: Scoreboard",false];

controlNames[24] = ["label","Movement Controls"];
controlNames[25] = ["movementCrouch","Move: Crouch",false];
controlNames[26] = ["movementCrawl","Move: Crawl",false];


controlNames[27] = ["label","Vehicle Controls"];
controlNames[28] = ["vehicleCruise","Vehicle: Cruise Control",false];
controlNames[29] = ["vehicleSearch","Vehicle: Search",false];
controlNames[30] = ["vehicleHotwire","Vehicle: Hotwire",false];
controlNames[31] = ["vehicleDoors","Vehicle: Door Lock",false];
controlNames[32] = ["vehicleBelt","Vehicle: Toggle Belt",false];

controlNames[33] = ["vehicleSlights","Siren: Toggle Lights",false];
controlNames[34] = ["vehicleSsound","Siren: Toggle Sound",false];
controlNames[35] = ["vehicleSnavigate","Siren: Switch Lights",false];



controlNames[36] = ["heliCam","Heli: Cam",false];
controlNames[37] = ["helivision","Heli: Vision",false];
controlNames[38] = ["helirappel","Heli: Rappel",false];
controlNames[39] = ["helispotlight","Heli: Spotlight",false];
controlNames[40] = ["helilockon","Heli: Lockon",false];


controlNames[41] = ["label","News Controls"];
controlNames[42] = ["newsTools","Bring out News Tools",false];
controlNames[43] = ["newsNormal","Camera Normal",false];
controlNames[44] = ["newsMovie","Camera Movie",false];

controlNames[45] = ["label","Motel Controls"];
controlNames[46] = ["housingMain","Motel: Main Useage",false];
controlNames[47] = ["housingSecondary","Motel: Secondary Usage",false];

function updateSettings()
{
    switch (currentSettingWindow) {
        case "tokovoip":
            updateTokoSettings();
            break;
        case "control":
            $.post('http://rd-racing/settingsUpdateToko', JSON.stringify({tag: "controlUpdate", controls: currentBinds}));
            break;
        case "browser":
            break;
        default:
            break;
    }

}

function ResetSettings()
{
    switch (currentSettingWindow) {
        case "tokovoip":
            $.post('http://rd-racing/settingsResetToko', JSON.stringify());
            break;
        case "control":
            $.post('http://rd-racing/settingsResetControls', JSON.stringify());
            break;
        case "browser":
            break;
        default:
            break;
    }
    openContainer(oldContainerHistory.pop(), null, currentContainer);
}


var validBinds = [
    "esc","f1","f2","f3","f5","f5","f6","f7","f8","f9","f10",
    "~","5","6","7","8","9","-","=","backspace",
    "tab","q","e","r","t","y","u","p","[","]","enter",
    "caps","f","g","h","k","l",
    "leftshift","z","x","c","b","n","m",",",".",
    "leftctrl","leftalt","space","rightctrl",
    "home","pageup","pagedown","delete",
    "left","right","top","down",
    "nenter","n4","n5","n6","n7","n8","n9","inputaim"
];

// Util Functions of Controls

function getCurrentBindFromID(bindID)
{
    for (var i = currentBinds.length - 1; i >= 0; i--) {
        if(currentBinds[i][0].toUpperCase() == bindID.toUpperCase())
        {
            return currentBinds[i][1];
        }
    }

    return false;
}

function setBindFromID(bindID,bind)
{
    for (var i = currentBinds.length - 1; i >= 0; i--) {
        if(currentBinds[i][0].toUpperCase() == bindID.toUpperCase())
        {
            currentBinds[i][1] = bind;
        }
    }
}

function validKey(key)
{
    var bindValid = false
    for (var i = validBinds.length - 1; i >= 0; i--) {
        if(validBinds[i].toUpperCase() == key.toUpperCase())
        {
            bindValid = true
        }
    }
    return bindValid
    
}


// Fill fucntion of control
function createControlList()
{
    for (let i = 0; i < controlNames.length; i++) { 
        var bindID = controlNames[i][0];
        var bindIsLocked = controlNames[i][2];

        if(bindID == "label")
        {
             var element = $(`
                <div class="row settings-switchBorder">
                  <div class="col s12 resizeBorder">
                      <label class="resizeBorder-Text">${controlNames[i][1]}</label>
                  </div>
                </div> 
            `);

            $('#controlSettings').append(element);
        }
        else
        {
            var element;
            if(bindIsLocked)
            {
                element = $(`
                    <div class="row settings-switchBorder">
                        <div class="col s8">
                            <label class="resizeBorder2 lockedText">${controlNames[i][1]}</label>
                        </div>
                        <div class="input-field col s4 input-field-small">
                             <input class="errorChecking white-text" id="${bindID}" type="text" onfocusout="TriggerSubmit(id)" data-isUnique="${controlNames[i][2]}"> 
                        </div>
                    </div>
                <span class="error" id="${bindID}-error" aria-live="polite"></span> 
                `);
            }
            else
            {
                element = $(`
                    <div class="row settings-switchBorder">
                        <div class="col s8">
                            <label class="resizeBorder2">${controlNames[i][1]}</label>
                        </div>
                        <div class="input-field col s4 input-field-small">
                             <input class="errorChecking white-text" id="${bindID}" type="text" onfocusout="TriggerSubmit(id)" data-isUnique="${controlNames[i][2]}"> 
                        </div>
                    </div>
                <span class="error" id="${bindID}-error" aria-live="polite"></span> 
                `);
            }
            $('#controlSettings').append(element);
            $("#"+bindID).val(getCurrentBindFromID(bindID))
        }
         
    }
}

function setSettings()
{
    for (i in currentSettings) {
        for (j in currentSettings[i]) {
            var name = j
            var outcome = currentSettings[i][j]
           
            if(findTypeOf(name) == 1)
            {   
                $('#'+name).prop('checked', outcome);
            }
            else if(findTypeOf(name) == 2)
            {
                $('#' + name).val(outcome * 10);
            }
        }
    }
}

function updateOnID(settingID,varData)
{
    for (i in currentSettings) {
        for (j in currentSettings[i]) {
            if(j == settingID)
            {   
                currentSettings[i][j] = varData
            }
        }
    }
}
function delay() {
  return new Promise(resolve => setTimeout(resolve, 30));
}

async function delayedLog(item) {
  await delay();
}

// I have autism
// this gets the minimum number in a slider, the maximum, then returns the exact opposite.

async function updateTokoSettings()
{

    for (j in checkedFunctions) {
        var name = checkedFunctions[j]
        var varData = $('#'+name).prop('checked');
        updateOnID(name,varData);
        await delayedLog(name);
    }

    for (j in sliderFunctions) {
        var name = sliderFunctions[j]
        var varData = $('#'+name).val();

        updateOnID(name, varData / 10);
        await delayedLog(name);
    }

    await delayedLog();
    $.post('http://rd-racing/settingsUpdateToko', JSON.stringify({
        tag: "settings",
        settings: currentSettings,
    }));

}



function findTypeOf(settingID)
{
    var type = 0

    for (j in checkedFunctions) {
        if(settingID == checkedFunctions[j])
        {
            type = 1
        }
    }

    if(type == 0)
    {
        for (j in sliderFunctions) {
            if(settingID == sliderFunctions[j])
            {
                type = 2
            }
        }
    }

    return type
}

//Submit Function / check function / main function of control
function TriggerSubmit(name)
{
    var error = $("#"+name+"-error")[0]; 
   
    var valid = true
    var errorMessage = "Invalid Control Input."

    var inputVal = $("#"+name).val();
    var isUnique = $("#"+name).attr("data-isUnique");


     if(inputVal == "")
    {
        valid = false;
        errorMessage = "There must be a bind for this.";
    }

    if(valid)
    {

        if(inputVal.includes('+'))
        {
            var split = inputVal.split("+");
            if(split.length == 2){
                if(!validKey(split[0]))
                {
                    valid = false 
                    errorMessage = "Not a valid bind [1]."
                }
                if(!validKey(split[1]) && valid)
                {
                    valid = false 
                    errorMessage = "Not a valid bind [2]."
                }
            }
            else
            {
                valid = false 
                errorMessage = "Cannot bind 3 keys."
            }
        }
        else
        {
            if(!validKey(inputVal))
            {
                valid = false 
                errorMessage = "Not a valid bind."
            }
        }
    }

    if (valid) {
        for (var i = controlNames.length - 1; i >= 0; i--) {
            if(controlNames[i][0] != "label")
            {
                var nameArr = controlNames[i][0]
                var isUniqueArr = $("#"+nameArr).attr("data-isUnique");
                if(nameArr != name){

                    // If input is the same as another already set input and that found input is unique then error
                    if($("#"+nameArr).val().toUpperCase() == inputVal.toUpperCase() && isUniqueArr == "true"){
                        valid = false;
                        errorMessage = "This Bind is already Being Used";
                    }
                    // if input is same as another already set input and THIS is unique then error
                    
                    if($("#"+nameArr).val().toUpperCase() == inputVal.toUpperCase() && isUnique == "true")
                    {
                        valid = false;
                        errorMessage = "Already in Use : "+controlNames[i][1];
                    }

                    if(inputVal.includes('+'))
                    {
                        var split = inputVal.split("+");
                        var newInput = split[1]+"+"+split[0]

                        if(split[1].toUpperCase() == split[0].toUpperCase()){
                            valid = false;
                            errorMessage = "Both Binds cannot be the same";
                        }

                        // If input is the same as another already set input and that found input is unique then error
                        if($("#"+nameArr).val().toUpperCase() == newInput.toUpperCase() && isUniqueArr == "true"){
                            valid = false;
                            errorMessage = "This Bind is already Being Used";
                        }
                        // if input is same as another already set input and THIS is unique then error
                        
                        if($("#"+nameArr).val().toUpperCase() == newInput.toUpperCase() && isUnique == "true")
                        {
                            valid = false;
                            errorMessage = "Already in Use : "+controlNames[i][1];
                        }
                    }
                }
            }
        }
    }

    if (!valid) {
        error.innerHTML = errorMessage;
        error.className = "error active";
    }
    else
    {
        $("#"+name).val(inputVal.toUpperCase())
        setBindFromID(name,inputVal)
        error.innerHTML = "";
        error.className = "error";
    }
}

function reply_click(clicked_id)
{
  currentSettingWindow = clicked_id;
}


$('#manage-keys-search').keyup(function () {
    ManageKeysFilter();
});

$('#outstanding-search').keyup(function () {
    OutstandingFilter();
});

$('#keys-search').keyup(function () {
    KeysFilter();
});

$('#gps-search').keyup(function () {
    GPSFilter();
});

$('#gurgle-search').keyup(function () {
    GurgleFilter();
});

$('#new-contact-search').keyup(function () {
    ContactsFilter();
});

$('#new-car-search').keyup(function () {
    CarsFilter();
});

$('#group-manage-search').keyup(function () {
    ManageFilter();
});

$('#racing-create-form').on('reset', function (e) {
    $.post('http://rd-racing/racing:map:cancel', JSON.stringify({}));
});

$('#racing-start-tracks').on('change', function (e) {
    let selectedMap = $(this).val();
    if(maps[selectedMap] !== undefined) {
        $.post('http://rd-racing/racing:map:removeBlips', JSON.stringify({}));
        $.post('http://rd-racing/racing:map:load', JSON.stringify({ id: selectedMap}));
        $('#racing-start-map-creator').text(maps[selectedMap].creator);
        $('#racing-start-map-distance').text(maps[selectedMap].distance);
        $('#racing-start-description').text(maps[selectedMap].description);
    }
});

$('#racing-start').submit(function (e) {
    e.preventDefault();
    let reverseTrack = false;
    if ($('#racing-reverse-track').is(":checked")) { reverseTrack = true };
    $.post('http://rd-racing/racing:event:start', JSON.stringify({
        raceMap: $('#racing-start-tracks').val(),
        raceLaps: $('#racing-start-laps').val(),
        raceStartTime: moment.utc().add($('#racing-start-time').val(), 'seconds'),
        reverseTrack: reverseTrack,
        raceCountdown: $('#racing-start-time').val(),
        raceName: $('#racing-start-name').val(),
        mapCreator: $('#racing-start-map-creator').text(),
        mapDistance: $('#racing-start-map-distance').text(),
        mapDescription: $('#racing-start-description').text()
    }));
});

$('#racing-create-form').submit(function (e) {
    e.preventDefault();
    $.post('http://rd-racing/racing:map:save', JSON.stringify({
        name: escapeHtml($('#racing-create-name').val()),
        desc: escapeHtml($('#racing-create-description').val()),
    }));
});

$("#real-estate-sell-form").submit(function (e) {
    e.preventDefault();
    $.post('http://rd-racing/btnAttemptHouseSale', JSON.stringify({
        cid: escapeHtml($("#real-estate-sell-form #real-estate-sell-id").val()),
        price: escapeHtml($("#real-estate-sell-form #real-estate-sell-amount").val()),
    }));

    $('#real-estate-sell-form').trigger('reset');
    $('#real-estate-sell-modal').modal('close');
});

$('#real-estate-transfer-form').submit(function (e) {
    e.preventDefault();
    $.post('http://rd-racing/btnTransferHouse', JSON.stringify({
        cid: escapeHtml($("#real-estate-transfer-form #real-estate-transfer-id").val()),
    }));
    $('#real-estate-transfer-form').trigger('reset');
    $('#real-estate-transfer-modal').modal('close');
});

$("#group-manage-pay-form").submit(function (e) {
    e.preventDefault();

    let cashToPay = escapeHtml($("#group-manage-pay-form #group-manage-amount").val());
    $.post('http://rd-racing/payGroup', JSON.stringify({
        gangid: escapeHtml($(".group-manage-company-name").data('group-id')),
        cid: escapeHtml($("#group-manage-pay-form #group-manage-id").val()),
        cashamount: cashToPay
    }));

    $('#group-manage-pay-form').trigger('reset');
    $('#group-manage-pay-modal').modal('close');
    let currentValue = $('.group-manage-company-bank').text();
    let newValue = parseInt(currentValue.substring(1, currentValue.length)) - parseInt(cashToPay);
    $('.group-manage-company-bank').text('$' + newValue);

});

$("#group-manage-rank-form").submit(function (e) {
    e.preventDefault();
    $.post('http://rd-racing/promoteGroup', JSON.stringify({
        gangid: escapeHtml($(".group-manage-company-name").data('group-id')),
        gangName: $(".group-manage-company-name").text(),
        cid: escapeHtml($("#group-manage-rank-form #group-manage-rank-id").val()),
        newrank: escapeHtml($("#group-manage-rank-form #group-manage-rank").val())
    }));
    $('#group-manage-rank-form').trigger('reset');
    $('#group-manage-rank-modal').modal('close');
});

$("#group-manage-bank-form").submit(function (e) {
    e.preventDefault();
    let cashToAdd = escapeHtml($("#group-manage-bank-form #group-manage-bank-amount").val());
    $.post('http://rd-racing/bankGroup', JSON.stringify({
        gangid: escapeHtml($(".group-manage-company-name").data('group-id')),
        cashamount: cashToAdd,
    }));
    $('#group-manage-bank-form').trigger('reset');
    $('#group-manage-bank-modal').modal('close');
    let currentValue = $('.group-manage-company-bank').text();
    let newValue = parseInt(currentValue.substring(1, currentValue.length)) + parseInt(cashToAdd);
    $('.group-manage-company-bank').text('$' + newValue);
});

$("#group-tasks-assign-modal-form").submit(function (e) {
    e.preventDefault();

    $.post('http://rd-racing/btnGiveTaskToPlayer', JSON.stringify({
        taskid: escapeHtml($("#group-tasks-assign-modal-form #group-task-id").val()),
        targetid: escapeHtml($("#group-tasks-assign-modal-form #group-task-target").val()),
    }));

    $("#group-tasks-assign-modal-form").trigger('reset')
    $('#group-tasks-assign-modal').modal('close');
});

$("#contacts-form").submit(function (e) {
    e.preventDefault();
    var clean = escapeHtml($("#contacts-form #contacts-new-name").val());
    $.post('http://rd-racing/newContactSubmit', JSON.stringify({
        name: clean,
        number: escapeHtml($("#contacts-form #contacts-new-number").val())
    }));

    if (currentContainer === "message") {
        $(".message-recipient").empty();
        $(".message-recipient").append(clean);
    }

    $('#contacts-form').trigger('reset');
    $('#contacts-add-new').modal('close');
});


$("#wallpaper-form").submit(function (e) {
    e.preventDefault();
    var escapedName = $("#wallpaper-form #wallpaper-teste").val();

    $.post('http://rd-racing/updateMyWallpaper', JSON.stringify({
        name: escapedName,
    }));

    if (currentContainer === "message") {
        $(".message-recipient").empty();
        $(".message-recipient").append(clean);
    }

    $('#wallpaper-form').trigger('reset');
    $('#mudar-wallpaper').modal('close');
});

$("#stock-form").submit(function (event) {
    event.preventDefault();
    $.post('http://rd-racing/stocksTradeToPlayer', JSON.stringify({
        identifier: escapeHtml($("#stock-form #stock-id").val()),
        playerid: escapeHtml($("#stock-form #stock-target-id").val()),
        amount: escapeHtml($("#stock-form #stock-amount").val()),
    }));
    $("#stock-form").trigger("reset");
    $('#stock-modal').modal('close');
});

$("#twat-form").submit(function (event) {
    event.preventDefault();
    $.post('http://rd-racing/newTwatSubmit', JSON.stringify({
        twat: escapeHtml($("#twat-form #twat-body").val()),
        time: moment.utc()
    }));
    $("#twat-form").trigger("reset");
    $('#twat-modal').modal('close');
});

$("#call-form").submit(function (event) {
    event.preventDefault();
    $.post('http://rd-racing/callContact', JSON.stringify({
        name: '',
        number: escapeHtml($("#call-form #call-number").val())
    }));
    $("#call-form").trigger("reset");
    $('#call-modal').modal('close');
});

$("#yellow-pages-form").submit(function (event) {
    event.preventDefault();
    $.post('http://rd-racing/newPostSubmit', JSON.stringify({
        advert: escapeHtml($("#yellow-pages-form #yellow-pages-body").val())
    }));
    $("#yellow-pages-form #yellow-pages-body").attr("style", "").val('')
    $('#yellow-pages-modal').modal('close');
});

$("#new-message-form").submit(function (event) {
    event.preventDefault();

    $.post('http://rd-racing/newMessageSubmit', JSON.stringify({
        number: escapeHtml($("#new-message-form #new-message-number").val()),
        message: escapeHtml($("#new-message-form #new-message-body").val())
    }));

    $('#new-message-form').trigger('reset');
    M.textareaAutoResize($('#new-message-body'));
    $('#messages-send-modal').modal('close');
    switch (currentContainer) {
        case "message":
            setTimeout(function () {
                let sender = $('.message-entries').data("sender");
                let receiver = $('.message-entries').data("clientNumber")
                let displayName = $('.message-entries').data("displayName")
                $.post('http://rd-racing/messageRead', JSON.stringify({ sender: sender, receiver: receiver, displayName: displayName }));
            }, 300);
            break;
        case "messages":
            setTimeout(function () {
                $.post('http://rd-racing/messages', JSON.stringify({}));
            }, 300);
            break;
    }
    //M.toast({ html: 'Message Sent!' });
});


// TODO: Add delete map
/*
$('.racing-map-delete').click(function () {  
    let mapname = $('#racing-map-selected option:selected').text()
    $("#confirm-delete-button").text("Confirm Delete: " + mapname);
    if ( $('.racing-delete-confirm').is(":visible") ) {
        $('.racing-delete-confirm').fadeOut(150)
    } else {
        $('.racing-delete-confirm').fadeIn(150)
    }
});
$('.racing-map-delete-confirm').click(function () {  
    let raceMap = $('#racing-map-selected').val()
    $.post('http://rd-racing/racing:map:delete', JSON.stringify({ id: raceMap }));
    $('.racing-delete-confirm').fadeOut(150)
    $('.racing-map-creation').fadeOut(150)
    $('#racing-information').fadeOut(150)
    $('.racing-map-options').fadeOut(150)
});*/
//

$('#real-estate-evict-modal-accept').click(function () {
    $.post('http://rd-racing/btnEvictHouse', JSON.stringify({}));
    $('#real-estate-evict-modal-').modal('close');
});

$('.btn-racing-clear').click(function() {
    $.post('http://rd-racing/racing:map:removeBlips', JSON.stringify({}));
});

$('.racing-create').click(function () {
    openContainer('racing-create');
});

$('.keys-toggle-filter').click(function () {
    let filterData = $(this).data('filter');

    if ($(this).hasClass("grey-text")) {
        if (!keyFilters.includes(filterData))
            keyFilters.push(filterData);
    }
    else
        keyFilters = keyFilters.filter(filter => filter !== filterData);

    KeysFilter();
    $(this).toggleClass("grey-text white-text");
});

$('.gps-toggle-filter').click(function () {
    let filterData = $(this).data('filter');

    if ($(this).hasClass("grey-text")) {
        if (!gpsFilters.includes(filterData))
            gpsFilters.push(filterData);
    }
    else
        gpsFilters = gpsFilters.filter(filter => filter !== filterData);

    GPSFilter();
    $(this).toggleClass("grey-text white-text");
});

$('.message-send-new').click(function () {
    
    $('#messages-send-modal').modal('open');
    let sender = $('.message-entries').data("sender");
    $('#messages-send-modal #new-message-number').val(sender);
    M.updateTextFields();
});

$('.messages-call-contact').click(function () {
    $.post('http://rd-racing/callContact', JSON.stringify({
        name: $('.message-entries').data('displayName'),
        number: $('.message-entries').data('sender')
    }));
});

$('.messages-add-new-contact').click(function () {
    $('#contacts-add-new').modal('open');
    $('#contacts-add-new #contacts-new-number').val($('.message-entries').data('sender'));
    M.updateTextFields();
});

$('.twatter-toggle-notification').click(function () {
    icon = $(this).find("i");
    icon.toggleClass("fa-bell fa-bell-slash")
    $.post('http://rd-racing/btnNotifyToggle', JSON.stringify({}));
});



$('.account-information-toggle-pager').click(function () {
    $.post('http://rd-racing/btnPagerToggle', JSON.stringify({}));
    $(this).toggleClass("red-text green-text");
});




$('.change-theme').click(function () { 
    openContainer("cores"); 
});


$('.racing-entries').on('click', '.racing-entries-entrants', function () {
    $('#racing-entrants-modal').modal('open');
    $('.racing-entrants').empty();
    $('#racing-info-description').text();
    let currentRace = races[$(this).data('id')]
    $('#racing-info-description').text(currentRace.mapDescription);
    if(currentRace.racers !== undefined)
        currentRace.racers = Object.values(currentRace.racers).sort((a,b) => a.total - b.total); 
    for (let id in currentRace.racers) {
        let racer = currentRace.racers[id];
        let racerElement = `
            <li>
                <div class="collapsible-header">Titanium#${racer.server_id}</div>
                <div class="collapsible-body">
                    <div class="row">
                        <div class="col s3 right-align">
                            <i class="fas fa-shipping-fast fa-2x icon "></i>
                        </div>  
                        <div class="col s9">
                            <strong>Fastest Lap</strong>
                            <br>${moment(racer.fastest).format("mm:ss.SSS")}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s3 right-align">
                            <i class="fas fa-stopwatch fa-2x icon"></i>
                        </div>  
                        <div class="col s9">
                            <strong>Total</strong>
                            <br>${moment(racer.total).format("mm:ss.SSS")}
                        </div>
                    </div>
                </div>
            </li>
        `
        $('.racing-entrants').append(racerElement);
    }
});

$('.racing-entries').on('click', '.racing-entries-join', function () {
    $.post('http://rd-racing/racing:event:join', JSON.stringify({ identifier: $(this).data('id') }));
});

$('.keys-entries').on('click', '.manage-keys', function () {
    $.post('http://rd-racing/retrieveHouseKeys', JSON.stringify({}));
});

$('.keys-entries').on('click', '.remove-shared-key', function(e) {
    $.post('http://rd-racing/removeSharedKey', JSON.stringify({
        house_id: $(this).data('house-id'),
        house_model: $(this).data('house-model')
    }))
    $(this).closest('li').remove()
});

$('.manage-keys-entries').on('click', '.manage-keys-remove', function () {
    $.post('http://rd-racing/removeHouseKey', JSON.stringify({
        targetId: $(this).data('target-id')
    }))
    $.post('http://rd-racing/retrieveHouseKeys', JSON.stringify({}));
})

$('.yellow-pages-entries').on('click', '.yellow-pages-call', function () {
    $.post('http://rd-racing/callContact', JSON.stringify({
        name: '',
        number: $(this).data('number')
    }));
});

$('.twatter-entries').on('click', '.twat-reply', function () {
    $('#twat-modal').modal('open');
    $('#twat-form #twat-body').text($(this).data('poster') + " ");
    M.updateTextFields();
    $(".tweetcount").css("color" , "#57e857")
    $(".retwet-color").css("color" , "#57e857")
    $(this).toggleClass('colorretwet')
    $(this).parent().find('.bubble').toggleClass('bubbleclick');
});

$('.twatter-entries').on('click', '.heart', function () {
    $(this).toggleClass('clicked')
    $(this).parent().find('.bubble').toggleClass('bubbleclick');
  });


$('.twatter-entries').on('click', '.twat-like', function () {
    $(".likehover").css("display" , "none")
    $(".superlikehover").css("display" , "flex")
});

$('.call-history-entries-wrapper').on('click', '.btn-call-history-add-contact', function () {
    $('#contacts-add-new').modal('open');
    $('#contacts-add-new #contacts-new-number').val($(this).data('number'));
    M.updateTextFields();
});

$('.group-manage-entries').on('click', '.group-manage-pay', function () {
    $('#group-manage-pay-modal').modal('open');
    $('#group-manage-pay-modal #group-manage-id').val($(this).data('id')).prop('disabled', true);
    M.updateTextFields();
});

$('.group-manage-entries').on('click', '.group-manage-rank', function () {
    $('#group-manage-rank-modal').modal('open');
    $('#group-manage-rank-modal #group-manage-rank-id').val($(this).data('id')).prop('disabled', true);
    $('#group-manage-rank-modal #group-manage-rank').val($(this).data('rank'));
    M.updateTextFields();
});

$('.group-tasks-entries').on('click', '.group-tasks-track', function () {
    $.post('http://rd-racing/trackTaskLocation', JSON.stringify({ TaskIdentifier: $(this).data('id') }));
});

$('.delivery-job-entries').on('click', '.delivery-job-accept', function (e) {
    $.post('http://rd-racing/selectedJob', JSON.stringify({ jobType: $(this).data('job-type'), jobId: $(this).data('job-id') }));
});

$('.stocks-entries').on('click', '.stocks-exchange', function (e) {
    $('#stock-modal').modal('open');
    $('#stock-modal #stock-id').val($(this).data('stock-id'));
    M.updateTextFields();
})

$('.garage-container-entries-wrapper').on('click', '.garage-spawn', function (e) {
    e.preventDefault();
    $.post('http://rd-racing/vehspawn', JSON.stringify({ vehplate: $(this).data('plate') }));
    $.post('http://rd-racing/btnGarage', JSON.stringify({}));
});

$('.garage-container-entries-wrapper').on('click', '.garage-track', function () {
    $.post('http://rd-racing/vehtrack', JSON.stringify({ vehplate: $(this).data('plate') }));
});

$('.garage-entries').on('click', '.garage-pay', function (e) {
    $.post('http://rd-racing/vehiclePay', JSON.stringify({ vehiclePlate: $(this).data('plate') }));
    setTimeout(function () {
        $.post('http://rd-racing/btnGarage', JSON.stringify({}));
    }, 1500);
});

$('.gps-entries, .keys-entries').on('click', '.gps-location-click', function () {
    $.post('http://rd-racing/loadUserGPS', JSON.stringify({ house_id: $(this).data('house-id'), house_type: $(this).data('house-type') }));
})

$('.contacts-entries-wrapper, .call-history-entries-wrapper').on('click', '.btn-contacts-call', function () {
    $.post('http://rd-racing/callContact', JSON.stringify({ name: $(this).data('name'), number: $(this).data('number') }));
});

$('.contacts-entries-wrapper, .call-history-entries-wrapper').on('click', '.btn-contacts-send-message', function (event) {
    $('#messages-send-modal').modal('open');
    $('#messages-send-modal #new-message-number').val($(this).data('number'));
    M.updateTextFields();
});

$('.group-tasks-entries').on('click', '.btn-group-tasks-assign', function () {
    $('#group-tasks-assign-modal').modal('open');
    $('#group-tasks-assign-modal #group-task-id').val($(this).data('id'));
    M.updateTextFields();
});

$('.contacts-entries-wrapper').on('click', '.btn-contacts-remove', function () {
    $('#confirm-modal-accept').data('name', $(this).data('name'));
    $('#confirm-modal-accept').data('number', $(this).data('number'));
    $('#confirm-modal').modal('open');
    $('#confirm-modal-question').text(`Are you sure you want to delete the contact from ${$(this).data('name')}?`);
});

$('#confirm-modal-accept').click(function (event) {
    $.post('http://rd-racing/removeContact', JSON.stringify({ name: $(this).data('name'), number: $(this).data('number') }));
    $('#confirm-modal').modal('close');
});

$('.dial-button').click(function (e) {
    if ($('#call-number').val().length < 10)
        $('#call-number').val(parseInt($('#call-number').val().toString() + $(this).text()));
    M.updateTextFields();
});


$('.settings-submit').click(function (e) {
    updateSettings();
});

$('.settings-reset').click(function (e) {
    ResetSettings();
});

function openContainer(containerName, fadeInTime = 500, ...args) {
    closeContainer(currentContainer, (currentContainer !== containerName ? 300 : 0));
    $("." + containerName + "-container").hide().fadeIn((currentContainer !== containerName ? fadeInTime : 0));
    if (containerName === "home") {
        $(".phone-screen .rounded-square:not('.hidden-buttons')").each(function () {
            $(this).fadeIn(1000);
        });
        $(".navigation-menu").fadeTo("slow", 0.5, null);
    }
    else
        $(".navigation-menu").fadeTo("slow", 1, null);

    if (containerName === "racing")
        clearInterval(racingStartsTimer);

    if (containerName === "message")
        $('.message-entries-wrapper').animate({
            scrollTop: $('.message-entries-wrapper')[0].scrollHeight
        }, 0);

    if (args[0] === undefined) {
        oldContainerHistory.push(currentContainer);
    }
    currentContainer = containerName;
}

function closeContainer(containerName, fadeOutTime = 500) {
    $.when($("." + containerName + "-container").fadeOut(fadeOutTime).hide()).then(function () {
        if (containerName === "home")
            $(".phone-screen .rounded-square").each(function () {
                $(this).fadeIn(300);
            });
    });
}

// function phoneCallerScreenSetup() {
// switch (callStates[currentCallState]) {
//     case "isNotInCall":
//         if (currentContainer === "incoming-call") {
//             currentCallState = 0;
//             currentCallInfo = "";
//             openContainer("home");
//             $('.top-notifications-chamadas').h();
//         }
//         break;
//     case "isDialing":
//         $('.top-notifications-chamadas').show();
//         $('#notificaçaoapp-titel').text(currentCallInfo);
//         break;
//     case "isReceivingCall":
//         $('.top-notifications-chamadas').show();
//         $('#notificaçaoapp-titel').text(currentCallInfo);
//         break;
//     case "isCallInProgress":
//         $('.top-notifications-chamadas').show();
//         $('#notificaçaoapp-titel').text(currentCallInfo);
//         break;
//     }
// }

function openPhoneShell() {
    $('.tablet-container').show();
    $(".phone-screen").removeClass("closephone").addClass('openphone').show().css("bottom" , "32px").add($('.jss13')).fadeIn(500);
   
}

function closePhoneShell() {
    $(".phone-screen").removeClass("openphone").addClass("closephone").fadeOut()
}


var entityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
    '/': '&#x2F;',
    '`': '&#x60;',
    '=': '&#x3D;'
};

function escapeHtml(string) {
    return String(string).replace(/[&<>"'`=\/]/g, function (s) {
        return entityMap[s];
    });
}

function makeTimer(targetTime) {
    var endTime = new Date(targetTime);
    endTime = (Date.parse(endTime) / 1000);

    var now = new Date();
    now = (Date.parse(now) / 1000);

    var timeLeft = endTime - now;

    var days = Math.floor(timeLeft / 86400);
    var hours = Math.floor((timeLeft - (days * 86400)) / 3600);
    var minutes = Math.floor((timeLeft - (days * 86400) - (hours * 3600)) / 60);
    var seconds = Math.floor((timeLeft - (days * 86400) - (hours * 3600) - (minutes * 60)));

    if (hours < "10") { hours = "0" + hours; }
    if (minutes < "10") { minutes = "0" + minutes; }
    if (seconds < "10") { seconds = "0" + seconds; }

    return {
        days: days,
        hours: hours,
        minutes: minutes,
        seconds: seconds
    }
}


function httpGetAsync(theUrl, callback)
{
    // create the request object
    var xmlHttp = new XMLHttpRequest();

    // set the state change callback to capture when the response comes in
    xmlHttp.onreadystatechange = function()
    {
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
        {
            callback(xmlHttp.responseText);
        }
    }

    // open as a GET call, pass in the url and set async = True
    xmlHttp.open("GET", theUrl, true);

    // call send with no params as they were passed in on the url string
    xmlHttp.send(null);

    return;
}
$(document).on('click','img',function(){
   var url = $(this).attr("data-url")
   event.preventDefault();
   if(url === undefined) {
       return
   }
   var matchd = url.match("https")
   if(matchd != null) {
       url = `<image width="100%" height="100%" src='${url}'>`
   }
   $.post('http://rd-racing/newTwatSubmit', JSON.stringify({
       twat: url,
       time: moment.utc()
   }));
   $("#twat-form").trigger("reset");
   $('#twat-modal').modal('close');
})

function tenorCallback_search(responsetext)
{
    var response_objects = JSON.parse(responsetext);
    top_10_gifs = response_objects["results"];
    var i;
    for (i = 0; i < top_10_gifs.length; i++) {
        $('#gifsplace').append(`<button id="gifsss" type="button" style="background-color:transperent;border:none;outline:none;"><img class="gifs" data-url="${top_10_gifs[i]["media"][0]["nanogif"]["url"]}" src="${top_10_gifs[i]["media"][0]["nanogif"]["url"]}" alt="" style="width:220px;height:164px;"></button>`)
    }
    return;
}


function grab_data(searc)
{
    var apikey = "QO693EHK2Q8S";
    var lmt = 8;
    var search_term = searc;
    var search_url = "https://g.tenor.com/v1/search?q=" + search_term + "&key=" +
    apikey + "&limit=" + lmt;
    httpGetAsync(search_url,tenorCallback_search);
    return;
}

var opengif = false;
$("#twat-opengif").click(function(){
    if(opengif == false) {
        opengif = true
        $("#giflol").fadeIn()
    } else if(opengif == true) {
        opengif = false
        $("#giflol").fadeOut()
    }
})

$("#twat-gifword").change(function() {
    $("#gifsplace").empty()
    grab_data($(this).val());
});


   $(document).on('click', '#twat-sendimg', function (e) {
       
    $.post('http://rd-racing/phone:selfie', JSON.stringify({}));
    e.preventDefault();
    $.post('http://rd-racing/PostNewImage', JSON.stringify({}),
        function (url) {
            $('#tweet-new-url').val(url)
            event.preventDefault();
            if(url === undefined) {
                return
            }
            var matchd = url.match("https")
            if(matchd != null) {
                
                url = `<div class="userupimage">
                <img
                src='${url}'
                  alt="img"
                  class="givenimage"
                />
              </div>`

            }
            
            $.post('http://rd-racing/newTwatSubmit', JSON.stringify({
                twat: url,
                time: moment.utc()
            }));
            $("#twat-form").trigger("reset");
            $('#twat-modal').modal('close');
            $.post('http://rd-racing/phone:selfie', JSON.stringify({}));
          
        },
    );
    
});

$(document).ready( function() {
    $("#pinger_button").click(function() {
        let id = $("#pingerid").val()
        $.post('https://rd-racing/pingSend', JSON.stringify({
            number: id,
        }));
    })
})

// Job Center

function SetWaypointPostOP() {
    $.post('http://rd-racing/SetPostOpNewWaypoint', JSON.stringify({}));
}

function SetWaypointFarming() {
    $.post('http://rd-racing/SetFarmerJobWaypoint', JSON.stringify({}));
}

function SetWaypointFarmingSales() {
    $.post('http://rd-racing/SetFarmerJobWaypointSale', JSON.stringify({}));
}

function SetWaypointFarmingProcess() {
    $.post('http://rd-racing/SetFarmerJobWaypointProcess', JSON.stringify({}));
}

function SetWaypointMining() {
    $.post('http://rd-racing/SetMiningNewWaypoint', JSON.stringify({}));
}

function SetWaypointWaterNPower() {
    $.post('http://rd-racing/SetWaterNPowerNewWaypoint', JSON.stringify({}));
}

function SetWayPointGarbage() {
    $.post('http://rd-racing/SetGarbageNewWaypoint', JSON.stringify({}));
}

function SetWayPointChickenJob() {
    $.post('http://rd-racing/SetChickenNewWaypoint', JSON.stringify({}));
}

function SetWayPointFishingJob() {
    $.post('http://rd-racing/SetFishingNewWaypoint', JSON.stringify({}));
}

function SetWayPointHunting() {
    $.post('http://rd-racing/SetHuntingNewWaypoint', JSON.stringify({}));
}

// Sale Locations

function MiningSales() {
    $.post('http://rd-racing/SetMiningSalesLocation', JSON.stringify({}));
}

function ChickenSales() {
    $.post('http://rd-racing/SetChickenSalesLocation', JSON.stringify({}));
}

function FishingSales() {
    $.post('http://rd-racing/SetFishingSalesLocation', JSON.stringify({}));
}

function HuntingSales() {
    $.post('http://rd-racing/SetHuntingSalesLocation', JSON.stringify({}));
}


function showFoundPropertyModal(propertyName, propertyPrice, propertyCategory) {
    //console.log("inside show found prop");
    var propPrice = propertyPrice.toLocaleString();
        let modalElement = `
        Name: ${propertyName}
        <br>
        Category: ${propertyCategory}
        <br>
        Price:  $${propPrice}
        `

        $('.iamgay').append(modalElement);
}

function showNoPropertyFoundModal(data) {
    //console.log("inside show not found prop");
        let modalElement = `
        ${data}
        `

        $('.iamgay2').append(modalElement);
}

function showPurchaseSuccessfulModal(data) {
    //console.log("inside purchase successful");
        let modalElement = `
        ${data}
        `

        $('.iamgay4').append(modalElement);
}

function showPurchaseUnsuccessfulModal(data) {
    //console.log("inside purchase unsuccessful");
        let modalElement = `
        ${data}
        `

        $('.iamgay3').append(modalElement);
}

function showTooManyPropertiesModal(data) {
    //console.log("inside too many properties owned");
        let modalElement = `
        ${data}
        `

        $('.iamgay5').append(modalElement);
}