var uisettings = {
    "date.format":"YYYY-MM-DD hh:mm:ss",
    "date.timezone": "America/New_York",
    "hud.blackbars.enabled": false,
    "hud.blackbars.size": 10,
    "hud.phone.wallpaper": "",
    "hud.presetSelected": 1,
    "hud.presets": [
        {
            "hud.blackbars.enabled": false,
            "hud.blackbars.size": 10,
        },
    ],


    "phone.images.enabled": true,
    "phone.notifications.email": true,
    "phone.notifications.sms": true,
    "phone.notifications.twatter": true,
    "phone.shell": "ios",
    "phone.volume": 0.8,
    "phone.wallpaper": "",
    "radio.clicks.incoming.enabled": true,
    "radio.clicks.outgoing.enabled": true,
    "radio.clicks.volume": 0.8,
    "radio.stereo.enabled": true,
    "radio.volume": 0.8,
    "rtc.settings.device": {},
    "rtc.settings.phone.filter.enabled": true,
    "rtc.settings.phone.filter.gainNode": 1,
    "rtc.settings.phone.filter.highpassBiquad": 500,
    "rtc.settings.phone.filter.lowpassBiquad": 8000,
    "rtc.settings.phone.filter.pannerNode": 0.4,
    "rtc.settings.radio.filter.enabled": true,
    "rtc.settings.radio.filter.gainNode": 1.5,
    "rtc.settings.radio.filter.highpassBiquad": 1000,
    "rtc.settings.radio.filter.lowpassBiquad": 2000,
    "rtc.settings.radio.filter.pannerNode": -0.39,
    "rtc.settings.radio.filter.waveShaper": 9,
    "rtc.system": {},
}

// New 

$(function() {
    sleep(5000,function(){
        $.post('https://rd-uix/rd-uix:getKVPValue', JSON.stringify({
            key : "rd-preferences",
        }),function(result){

            for (const key in result.data.value) {
                uisettings[key] = result.data.value[key];
            }

            if (uisettings["hud.status.health.enabled"] == true) {
                $(".health").fadeIn(1000);
                document.getElementById("showheath").checked = true;
                document.querySelector('#valhealthmenu').classList.remove('hidden');
            }else if(uisettings["hud.status.health.enabled"] == false){
                $(".health").fadeOut(1000);
                document.getElementById("showheath").checked = false;
                document.querySelector('#valhealthmenu').classList.add('hidden');
            }

            if (uisettings["hud.status.armor.enabled"] == true) {
                $(".armor").fadeIn(1000);
                document.getElementById("showarmor").checked = true;
                document.querySelector('#valarmormenu').classList.remove('hidden');
            }else if(uisettings["hud.status.armor.enabled"] == false){
                $(".armor").fadeOut(1000);
                document.getElementById("showarmor").checked = false;
                document.querySelector('#valarmormenu').classList.add('hidden');
            }

            if (uisettings["hud.status.food.enabled"] == true) {
                $(".hunger").fadeIn(1000);
                document.getElementById("showfood").checked = true;
                document.querySelector('#valfoodmenu').classList.remove('hidden');
            }else if(uisettings["hud.status.food.enabled"] == false){
                $(".hunger").fadeOut(1000);
                document.getElementById("showfood").checked = false;
                document.querySelector('#valfoodmenu').classList.add('hidden');
            }

            if (uisettings["hud.status.water.enabled"] == true) {
                $(".thrist").fadeIn(1000);
                document.getElementById("showwater").checked = true;
                document.querySelector('#valwatermenu').classList.remove('hidden');
            }else if(uisettings["hud.status.water.enabled"] == false){
                $(".thrist").fadeOut(1000);
                document.getElementById("showwater").checked = false;
                document.querySelector('#valwatermenu').classList.add('hidden');
            }

            if (uisettings["hud.status.oxygen.enabled"] == true) {
                $(".oxygen").fadeIn(1000);
                document.getElementById("showoxygen").checked = true;
            }else if(uisettings["hud.status.oxygen.enabled"] == false){
                $(".oxygen").fadeOut(1000);
                document.getElementById("showoxygen").checked = false;
            }

            if (uisettings["hud.status.stress.enabled"] == true) {
                $(".stress").fadeIn(1000);
                document.getElementById("showstress").checked = true;
            }else if(uisettings["hud.status.stress.enabled"] == false){
                $(".stress").fadeOut(1000);
                document.getElementById("showstress").checked = false;
            }

            document.querySelector('#valhealth').value = uisettings["hud.status.health.hide"];
            document.querySelector('#valarmor').value = uisettings["hud.status.armor.hide"];
            document.querySelector('#valfood').value = uisettings["hud.status.food.hide"];
            document.querySelector('#valwater').value = uisettings["hud.status.water.hide"];

            //Vehicle
            document.querySelector('.speedometerfps').value = uisettings["hud.vehicle.speedometer.fps"];
            document.querySelector(".showminimap").checked = uisettings["hud.vehicle.minimap.enabled"];
            document.querySelector(".showharness").checked = uisettings["hud.vehicle.harness.enabled"];
            document.querySelector(".shownitrolevel").checked = uisettings["hud.vehicle.nitrous.enabled"];
            document.querySelector(".shownitrotrail").checked = uisettings["hud.vehicle.nitrous.arcadetrail"];
            document.querySelector(".minimapoutline").checked = uisettings["hud.vehicle.minimap.outline"];
            document.querySelector(".defaultminimap").checked = uisettings["hud.vehicle.minimap.default"];

            //Compass
            document.querySelector('.compassfps').value = uisettings["hud.compass.fps"];
            document.querySelector(".showcompass").checked = uisettings["hud.compass.enabled"];
            document.querySelector(".showtimecompass").checked = uisettings["hud.compass.roadnames.enabled"];
            document.querySelector(".showstreetcompass").checked = uisettings["hud.compass.time.enabled"];

            $.post('https://rd-uix/rd-uix:hudSetPreferences', JSON.stringify(uisettings),function(result){
    
            });
        });
    });
});

//HUD Settings
$("#showheath").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.status.health.enabled"] = true;
            document.querySelector('#valhealthmenu').classList.remove('hidden');
            $(".health").fadeIn(1000);
            break;
        case false:
            document.querySelector('#valhealthmenu').classList.add('hidden');
            uisettings["hud.status.health.enabled"] = false;
            $(".health").fadeOut(1000);
            break;
    }
});

$("#showarmor").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.status.armor.enabled"] = true;
            document.querySelector('#valarmormenu').classList.remove('hidden');
            $(".armor").fadeIn(1000)
            break;
        case false:
            uisettings["hud.status.armor.enabled"] = false;
            document.querySelector('#valarmormenu').classList.add('hidden');
            $(".armor").fadeOut(1000)
            break;
    }
});

$("#showfood").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.status.food.enabled"] = true;
            document.querySelector('#valfoodmenu').classList.remove('hidden');
            $(".hunger").fadeIn(1000)
            break;
        case false:
            uisettings["hud.status.food.enabled"] = false;
            document.querySelector('#valfoodmenu').classList.add('hidden');
            $(".hunger").fadeOut(1000)
            break;
    }
});

$("#showwater").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.status.water.enabled"] = true;
            document.querySelector('#valwatermenu').classList.remove('hidden');
            $(".thrist").fadeIn(1000)
            break;
        case false:
            uisettings["hud.status.water.enabled"] = false;
            document.querySelector('#valwatermenu').classList.add('hidden');
            $(".thrist").fadeOut(1000)
            break;
    }
});

$("#showstress").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.status.stress.enabled"] = true;
            $(".stress").fadeIn(1000)
            break;
        case false:
            uisettings["hud.status.stress.enabled"] = false;
            $(".stress").fadeOut(1000)
            break;
    }
});

$("#showoxygen").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.status.oxygen.enabled"] = true;
            $(".oxygen").fadeIn(1000)
            break;
        case false:
            uisettings["hud.status.oxygen.enabled"] = false;
            $(".oxygen").fadeOut(1000)
            break;
    }
});

document.querySelector('#valhealth').addEventListener('change', function(e){
    if (!isNaN(e.target.value)) {
        uisettings["hud.status.health.hide"] = parseInt(e.target.value);
    }
});

document.querySelector('#valarmor').addEventListener('change', function(e){
    if (!isNaN(e.target.value)) {
        uisettings["hud.status.armor.hide"] = parseInt(e.target.value);
    }
});

document.querySelector('#valfood').addEventListener('change', function(e){
    if (!isNaN(e.target.value)) {
        uisettings["hud.status.food.hide"] = parseInt(e.target.value);
    }
});

document.querySelector('#valwater').addEventListener('change', function(e){
    if (!isNaN(e.target.value)) {
        uisettings["hud.status.water.hide"] = parseInt(e.target.value);
    }
});

// Vehicle
$(".showminimap").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.vehicle.minimap.enabled"] = true;
            break;
        case false:
            uisettings["hud.vehicle.minimap.enabled"] = false;
            break;
    }
});

$(".defaultminimap").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.vehicle.minimap.default"] = true;
            break;
        case false:
            uisettings["hud.vehicle.minimap.default"] = false;
            break;
    }
});

$(".minimapoutline").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.vehicle.minimap.outline"] = true;
            break;
        case false:
            uisettings["hud.vehicle.minimap.outline"] = false;
            break;
    }
});

$(".showharness").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.vehicle.harness.enabled"] = true;
            break;
        case false:
            uisettings["hud.vehicle.harness.enabled"] = false;
            break;
    }
});

$(".shownitrolevel").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.vehicle.nitrous.enabled"] = true;
            break;
        case false:
            uisettings["hud.vehicle.nitrous.enabled"] = false;
            break;
    }
});

$(".minimapoutline").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.vehicle.minimap.outline"] = true;
            break;
        case false:
            uisettings["hud.vehicle.minimap.outline"] = false;
            $(".radarmap").css("display","none");
            break;
    }
});

$(".defaultminimap").change(function(){
    switch (this.checked) {
        case true:
            uisettings["hud.vehicle.minimap.default"] = true;
            break;
        case false:
            uisettings["hud.vehicle.minimap.default"] = false;
            break;
    }
});

document.querySelector('#hudmenu').addEventListener('click', function(){
    $(".hud-settings-menu").show();
    $("#hudmenu").css("background","#202730");
    $("#phonemenu").css("background","#30475c");
    $("#radiomenu").css("background","#30475c");

});

document.querySelector('#phonemenu').addEventListener('click', function(){
    $(".hud-settings-menu").hide();
    $("#phonemenu").css("background","#202730");
    $("#hudmenu").css("background","#30475c");
    $("#radiomenu").css("background","#30475c");
});

document.querySelector('#radiomenu').addEventListener('click', function(){
    $(".hud-settings-menu").hide();
    $("#radiomenu").css("background","#202730");
    $("#phonemenu").css("background","#30475c");
    $("#hudmenu").css("background","#30475c");
});


document.querySelector('#setting_hud_save').addEventListener('click', function(){
    var presetselect = parseInt(document.querySelector('.presetid').value);
    uisettings["hud.presetSelected"] = presetselect;
    var idx = presetselect - 1;
    for (const key in uisettings) {
        for (const key2 in uisettings["hud.presets"][idx]) {
            if (key2 == key) {
                uisettings["hud.presets"][idx][key2] = uisettings[key]
            }
        }
    }

    $.post('https://rd-uix/rd-uix:setKVPValue', JSON.stringify({
        key : "rd-preferences",
        value:uisettings
    }),function(res){
        console.log("Get Callback SetKvp")
        $.post('https://rd-uix/rd-uix:hudSetPreferences', JSON.stringify(uisettings),function(result){
    
        });
    });
});


let playsomesound = {}
function playfuncsound(id,name,loop,volume) {
    playsomesound[id] = new Howl({
        src: ['../media/'+name+'.ogg'],
        loop: loop,
        volume: volume,
        // onend: function () {
        //     console.log('Finished!',name);
        // }
    });
    playsomesound[id].play();
}

function playfunsoundsetvolume(id,vol) {
    playsomesound[id].volume(vol);
}

function stopplayfunsound(id) {
    playsomesound[id].stop();
}

class minigame_captcha{
    range = (start, end, length = end - start + 1) => {
        return Array.from({ length }, (_, i) => start + i)
    }
    random = (min, max) => {
        return Math.floor(Math.random() * (max - min)) + min;
    }
    shuffle = (arr) => {
        for (let i = arr.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            const temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }
    
    shapes = ['square', 'rectangle', 'circle', 'triangle'];
    colors = ['blue', 'green', 'red', 'orange', 'yellow', 'purple', 'black', 'white'];
    types = [
        {'type': 'shape','text': 'SHAPE'},
        {'type': 'shape_color','text': 'SHAPE COLOR'},
        {'type': 'text_color','text': 'TEXT COLOR'},
        {'type': 'text_shape','text': 'SHAPE TEXT'},
        {'type': 'text_bg_color','text': 'TEXT BACKGROUND COLOR'},
        {'type': 'background_color','text': 'BACKGROUND COLOR'},
        {'type': 'number_color','text': 'NUMBER COLOR'}
    ];

    create(numberask){
        let real_numbers, impostor_numbers, minigame, group, background_colors, types, quiz_numbers;

        real_numbers = this.range(1, numberask);
        this.shuffle(real_numbers);

        impostor_numbers = this.range(1, numberask);
        this.shuffle(impostor_numbers);

        minigame = {
            'real_numbers': real_numbers,
            'impostor_numbers': impostor_numbers,
            'groupscaptcha': []
        };

        for(let i = 0; i < numberask; i++){
            group = [];

            background_colors = this.colors;
            this.shuffle(background_colors);

            group['real_number'] = real_numbers[i];
            group['impostor_number'] = impostor_numbers[i];

            group['shape'] = this.shapes[this.random(0, this.shapes.length)];
            group['background_color'] = background_colors[0];
            group['shape_color'] = background_colors[1];
            group['text_bg_color'] = this.colors[this.random(0, this.colors.length)];
            group['number_color'] = this.colors[this.random(0, this.colors.length)];

            group['text_shape'] = this.shapes[this.random(0, this.shapes.length)];
            group['text_color'] = this.colors[this.random(0, this.colors.length)];

            minigame['groupscaptcha'].push(group);
        }

        quiz_numbers = this.range(0, (numberask - 1));
        this.shuffle(quiz_numbers);

        types = this.types;
        this.shuffle(types);

        minigame['quiz1'] = {
            'pos': quiz_numbers[0],
            'type': types[0],
            'solution': minigame['groupscaptcha'][quiz_numbers[0]][types[0]['type']]
        };

        minigame['quiz2'] = {
            'pos': quiz_numbers[1],
            'type': types[1],
            'solution': minigame['groupscaptcha'][quiz_numbers[1]][types[1]['type']]
        };

        minigame['solution'] = minigame['groupscaptcha'][quiz_numbers[0]][types[0]['type']] +
            ' ' + minigame['groupscaptcha'][quiz_numbers[1]][types[1]['type']];

        return minigame;
    }
}

let timer_start_captcha_game, timer_numbers_captcha_game, timer_game_captcha, timer_splash_captcha, data_captcha, durationGame_captcha, roundTotal_captcha, asktotal, minigame_captcha_endpoint;
let mode = 'vault';
let minigame = new minigame_captcha();
let streakcaptcha = 0;

let sleep = (ms, fn) => {return setTimeout(fn, ms)};

let audio_splash = document.querySelector('.splashcaptcha audio');
let audio_timer = document.querySelector('.timer audio');

var minigame_capthcha_active = false
var minigame_capthcha_result = false

// Options

// Process answer
document.querySelector('#answer').addEventListener('keydown', function(e) {
    if (e.key === 'Enter' && document.querySelector('.solution').offsetHeight === 0) {
        clearTimeout(timer_game_captcha);
        audio_timer.pause();

        const answer = e.target.value.toLowerCase().trim();
        let wrapper = document.querySelector('.answer-wrapper');
        if(data_captcha.solution === answer){
            wrapper.classList.remove('wrong');
            wrapper.classList.add('right');
            streakcaptcha++;
            //Success
            // console.log(mode,streak,roundTotal_captcha)
            if( (mode === 'vault' && streakcaptcha === roundTotal_captcha) ){
                streakcaptcha = 0;
                splash_screenminigamecaptcha();
                document.querySelector('.splashcaptcha .icon .fa').innerHTML = '&#xf21b;';
                document.querySelector('.splashcaptcha .message').innerText = "The system has been bypassed.";

                minigame_capthcha_result = true;
                checkanswernumbers();
                
            }else{
                resetminigamecaptcha(false);
            }
        }else{
            //Failed
            streakcaptcha = 0;
            splash_screenminigamecaptcha();
            document.querySelector('.splashcaptcha .icon .fa').innerHTML = '&#xf05e;';
            document.querySelector('.splashcaptcha .message').innerText = "The system didn't accept your answer";

            minigame_capthcha_result = false;
            checkanswernumbers();
          
        }
    }
});

let splash_screenminigamecaptcha = (show = true) => {
    if(show){
        document.querySelectorAll('.groupscaptcha, .inputs').forEach(el => {el.classList.add('hidden');});
        document.querySelector('.splashcaptcha').classList.remove('hidden');
    }else{
        document.querySelector('.splashcaptcha').classList.add('hidden');
        document.querySelectorAll('.groupscaptcha').forEach(el => {el.classList.remove('hidden');});
    }
}

let resetminigamecaptcha = (gameDuration , gameRoundsTotal, ask) => {
    if (gameDuration) {
        $(".groupscaptcha").html("")
        for (let i = 0; i < ask; i++) {
            $(".groupscaptcha").append('<div class="groupcaptcha"><div class="real_number">&nbsp;</div><div class="shape hidden"></div><div class="text hidden">&nbsp;</div><div class="number hidden">&nbsp;</div></div>');
        }
    }
    
    document.querySelector('.minigamecaptcha').classList.remove('hidden');
    clearTimeout(timer_start_captcha_game);
    clearTimeout(timer_numbers_captcha_game );
    clearTimeout(timer_game_captcha);
    clearTimeout(timer_splash_captcha);

    audio_splash.pause();
    audio_splash.currentTime = 0;

    audio_timer.pause();
    audio_timer.currentTime = 0;

    document.querySelectorAll('.real_number').forEach(el => {
        el.innerHTML = '&nbsp;';
        el.style.fontSize = '190px';
        el.classList.remove('hidden');
    });
    document.querySelectorAll('.groupscaptcha .shape, .groupscaptcha .text, .groupscaptcha .number, .inputs').forEach(el => {
        el.classList.add('hidden');
    });
    document.querySelectorAll('.groupcaptcha .shape').forEach(el => {
        minigame.shapes.forEach(shape => {
            el.classList.remove(shape);
        });
    });
    document.querySelectorAll('.groupcaptcha, .groupcaptcha div, .groupcaptcha .shape').forEach(el => {
        el.classList.forEach(cl => {
            if( /^(bg_|txt_)/.test(cl) ) {
                el.classList.remove(cl);
            }
        });
    });

    document.querySelector(".progress-bar").style.width = '100%';

    document.querySelector('.answer-wrapper').classList.remove('wrong', 'right')
    document.querySelector('#answer').value = '';

    if(gameDuration){
        durationGame_captcha = gameDuration
        roundTotal_captcha = gameRoundsTotal;
        asktotal = ask;
        splashminigamecaptcha();
    }else{
        startminigamecaptcha(asktotal);
    }
}

let startminigamecaptcha = (askt) => {
    minigame_capthcha_active = true;
    data_captcha = minigame.create(askt);
    console.log(data_captcha.solution)
    data_captcha.groupscaptcha.forEach(function(group, i) {
        // console.log("Info BG"+i,group.background_color)
        // console.log("Info"+i,group.shape,group.shape_color)
        let g = document.querySelectorAll('.groupscaptcha .groupcaptcha')[i];
        g.classList.add('bg_'+group.background_color);
        g.querySelector('.real_number').innerHTML = group.real_number;
        g.querySelector('.shape').classList.add(group.shape, 'bg_'+group.shape_color);
        g.querySelector('.text').classList.add('txt_'+group.text_bg_color);
        g.querySelector('.text').innerHTML = group.text_color+'<br>'+group.text_shape;
        g.querySelector('.number').classList.add('txt_'+group.number_color);
        g.querySelector('.number').innerHTML = group.impostor_number;
    });

    document.querySelector('.quiz1').innerHTML = data_captcha.quiz1.type.text + ' ('+data_captcha['real_numbers'][data_captcha.quiz1.pos]+')';
    document.querySelector('.quiz2').innerHTML = data_captcha.quiz2.type.text + ' ('+data_captcha['real_numbers'][data_captcha.quiz2.pos]+')';


    timer_start_captcha_game = sleep(1000, function(){
        document.querySelectorAll('.real_number').forEach(el => {el.style.fontSize = '0px';});
        timer_numbers_captcha_game = sleep(2000, function(){
            document.querySelectorAll('.real_number').forEach(el => {el.classList.add('hidden');});
            document.querySelectorAll('.groupscaptcha .shape, .groupscaptcha .text, .groupscaptcha .number, .inputs').forEach(
                el => {el.classList.remove('hidden');});
                audio_timer.play();
            document.querySelector('#answer').focus({preventScroll: true});

            
            document.querySelector(".progress-bar").style.transition = 'width '+(durationGame_captcha / 1000)+'s linear';
            document.querySelector(".progress-bar").style.width = '0';
            // console.log("Timer for end",durationGame_captcha)
            timer_game_captcha = sleep(durationGame_captcha, function(){
                //This if Timer habis
                streakcaptcha = 0;
                audio_timer.pause();
                splash_screenminigamecaptcha();
                document.querySelector('.splashcaptcha .icon .fa').innerHTML = '&#xf05e;';
                document.querySelector('.splashcaptcha .message').innerText = "The system didn't accept your answer";

                minigame_capthcha_result = false;
                
            });
        });
    });

}

let splashminigamecaptcha = () => {
    splash_screenminigamecaptcha();
    document.querySelector('.splashcaptcha .icon .fa').innerHTML = '&#xf21b;';
    document.querySelector('.splashcaptcha .message').innerText = 'Device booting up...';
    timer_splash_captcha = sleep(3000, function(){
        document.querySelector('.splashcaptcha .message').innerText = 'Dialing...';
        audio_splash.play();
        timer_splash_captcha = sleep(8000, function(){
            document.querySelector('.splashcaptcha .message').innerText = 'Establishing connection...';

            timer_splash_captcha = sleep(6000, function(){
                document.querySelector('.splashcaptcha .message').innerText = 'Doing some hackermans stuff...';

                timer_splash_captcha = sleep(6000, function(){
                    document.querySelector('.splashcaptcha .message').innerText = 'Access code flagged; requires human captcha input...';

                    timer_splash_captcha = sleep(6000, function(){
                        document.querySelector('.splashcaptcha').classList.add('hidden');
                        document.querySelector('.groupscaptcha').classList.remove('hidden');
                        startminigamecaptcha(asktotal);
                    });
                });
            });
        });
    });
}

// resetminigamecaptcha(9500,2,4) //Testing
// resetminigamecaptcha(9500,6,3)

// Skilbar Think
let canvas_skillbar = document.getElementById("skillbarcanvas");
let ctx = canvas_skillbar.getContext("2d");
let W = canvas_skillbar.width;
let H = canvas_skillbar.height;
let degrees_skillbar = 0;
let new_degrees_skillbar = 0;
let time = 0;
let colorskillbar = "#ffffff";
let bgcolorskillbar = "#404b58";
let bgcolor2skillbar = "#41a491";
let key_to_press_skillbar;
let g_start_skillbar, g_end_skillbar;
let animation_loop_skillbar;
let skillbaractive = false

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
}

function init_skillbar() {
    // Clear the canvas every time a chart is drawn
    ctx.clearRect(0,0,W,H);

    // Background 360 degree arc
    ctx.beginPath();
    ctx.strokeStyle = bgcolorskillbar;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, 0, Math.PI * 2, false);
    ctx.stroke();

    // Green zone
    ctx.beginPath();
    ctx.strokeStyle = bgcolor2skillbar;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, g_start_skillbar - 90 * Math.PI / 180, g_end_skillbar - 90 * Math.PI / 180, false);
    ctx.stroke();

    // Angle in radians = angle in degrees * PI / 180
    let radians = degrees_skillbar * Math.PI / 180;
    ctx.beginPath();
    ctx.strokeStyle = colorskillbar;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, 0 - 90 * Math.PI / 180, radians - 90 * Math.PI / 180, false);
    ctx.stroke();

    // Adding the key_to_press
    ctx.fillStyle = colorskillbar;
    ctx.font = "100px sans-serif";
    let text_width = ctx.measureText(key_to_press_skillbar).width;
    ctx.fillText(key_to_press_skillbar, W / 2 - text_width / 2, H / 2 + 35);
}

function draw_skillbar(duration,level) {
    $(".skillbar").show()
    skillbaractive = true

    if (typeof animation_loop_skillbar !== undefined) clearInterval(animation_loop_skillbar);
    g_start_skillbar = getRandomInt(20,40) / 10;
    g_end_skillbar = getRandomInt(5,10) / 10;
    g_end_skillbar = g_start_skillbar + g_end_skillbar;

    degrees_skillbar = 0;
    new_degrees_skillbar = 360;

    key_to_press_skillbar = ''+getRandomInt(1,4);

    time = (duration / 1000 ) * 3;

    animation_loop_skillbar = setInterval(animate_to, time);
}

function animate_to() {
    if (degrees_skillbar >= new_degrees_skillbar) {
        console.log('Failed: timeout!');
        wrong_skillbar();
        return;
    }

    degrees_skillbar+=2;
    init_skillbar();
}

function correct_skillbar(){
    console.log("correct_skillbar")
    $(".skillbar").hide()
    clearInterval(animation_loop_skillbar);
    skillbaractive = false
    $.post('https://rd-uix/rd-uix:taskBarSkillResult', JSON.stringify({
        success: true,
    }));
}

function wrong_skillbar(){
    console.log("wrong_skillbar")
    $(".skillbar").hide()
    clearInterval(animation_loop_skillbar);
    skillbaractive = false
    $.post('https://rd-uix/rd-uix:taskBarSkillResult', JSON.stringify({
        success: false,
    }));
}

document.addEventListener("keydown", function(ev) {
    let key_pressed = ev.key;
    let valid_keys = ['1','2','3','4'];

    if (skillbaractive) {
        if( valid_keys.includes(key_pressed) ){
            if( key_pressed === key_to_press_skillbar ){
                let d_start = (180 / Math.PI) * g_start_skillbar;
                let d_end = (180 / Math.PI) * g_end_skillbar;
                if( degrees_skillbar < d_start ){
                    console.log('Failed: Too soon!');
                    wrong_skillbar();
                }else if( degrees_skillbar > d_end ){
                    console.log('Failed: Too late!');
                    wrong_skillbar();
                }else{
                    console.log('Success!');
                    correct_skillbar();
                }
            }else{
                console.log('Failed: Pressed '+key_pressed+' instead of '+key_to_press_skillbar);
                wrong_skillbar();
            }
        }
    }
});

//Testing
// draw_skillbar(10000,15);

//Memory Minigame Think
let timer_start, timer_game, timer_finish, timer_time, good_positions, wrong, right, speed, timerStart, minigame_memory_endpoint, minigame_memory_max_good;
let game_started = false;
var game_memmory_active = false;
var game_memmory_result = false;

const range = (start, end, length = end - start + 1) => {
    return Array.from({length}, (_, i) => start + i)
}

const shuffle = (arr) => {
    for (let i = arr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        const temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}

let positions = range(0, 35);

function listener(ev){
    if(!game_started) return;

    if( good_positions.indexOf( parseInt(ev.target.dataset.position) ) === -1 ){
        wrong++;
        ev.target.classList.add('bad');
    }else{
        right++;
        ev.target.classList.add('good');
    }

    ev.target.removeEventListener('mousedown', listener);

    check();
}

function addListeners(){
    document.querySelectorAll('.group_memory').forEach(el => {
        el.addEventListener('mousedown', listener);
    });
}

function check(){
    if(wrong === 3){
        resetTimer();
        game_started = false;

        let blocks = document.querySelectorAll('.group_memory');
        good_positions.forEach( pos => {
            blocks[pos].classList.add('proper');
        });
        reset(false);
        return;
    }
    if(right === minigame_memory_max_good){
        stopTimer();
        console.log("Succcess")
        reset(true);
    }
}

function reset(checked){
    game_started = false;

    resetTimer();
    clearTimeout(timer_start);
    clearTimeout(timer_game);
    clearTimeout(timer_finish);

    document.querySelector('.splash_memory').classList.remove('hidden');
    document.querySelector('.groups_memory').classList.add('hidden');

    document.querySelectorAll('.group_memory').forEach(el => { el.remove(); });

    if (checked) {
        //Send hasil success or true
        document.querySelector('.groups_memory').classList.add('hidden');
        $(".splash_memory").html("<div class='fa hacker_memmory'>&#xf21b;</div>Remote Sequencing Complete");
        document.querySelector('.splash_memory').classList.remove('hidden');
        
        console.log("Success")

        game_memmory_result = true;
        // sleep(4000, function(){
        //     document.querySelector('.minigame_memory').classList.add('hidden');
        //     $.post('https://rd-uix/'+minigame_memory_endpoint, JSON.stringify({
        //         result : true
        //     }));
        // })
    }else{
        //Send hasil Fail or false
        document.querySelector('.groups_memory').classList.add('hidden');
        $(".splash_memory").html("<div class='fa hacker_memmory'>&#xf21b;</div>Remote Sequencing Failed");
        document.querySelector('.splash_memory').classList.remove('hidden');
        console.log("Failed")

        game_memmory_result = false;
        
    }
}

function start_memorygame(duration,coloredSquares,gridSize){
    game_memmory_active = true;
    if (gridSize == 5) {
        console.log("This Grid 5")
        $(".minigame_memory").css("width","25.52vw");
        $(".minigame_memory").css("height","48.04vh");
    }else if(gridSize == 6){
        console.log("This Grid 6")
        $(".minigame_memory").css("width","28.125vw");
        $(".minigame_memory").css("height","57.02vh");
    }
    $(".splash_memory").html("<div class='fa hacker_memmory'>&#xf21b;</div>Remote Sequencing Required");
    document.querySelector('.minigame_memory').classList.remove('hidden');
    wrong = 0;
    right = 0;
    var sizegrid = gridSize ? gridSize : 6 ;
    minigame_memory_max_good = coloredSquares ? coloredSquares : 14;
    let positions = range(0, (sizegrid * sizegrid) -1);
    shuffle(positions);
    good_positions = positions.slice(0, minigame_memory_max_good);

    let div = document.createElement('div');
    div.classList.add('group_memory');
    const groups = document.querySelector('.groups_memory');
    for(let i=0; i<(sizegrid * sizegrid); i++){
        let group = div.cloneNode();
        group.dataset.position = i.toString();
        groups.appendChild(group);
    }

    addListeners();

    timer_start = sleep(4000, function(){
        document.querySelector('.splash_memory').classList.add('hidden');
        document.querySelector('.groups_memory').classList.remove('hidden');

        let blocks = document.querySelectorAll('.group_memory');
        good_positions.forEach( pos => {
            blocks[pos].classList.add('good');
        });

        timer_game = sleep(4000, function(){
            document.querySelectorAll('.group_memory.good').forEach(el => { el.classList.remove('good')});
            game_started = true;

            startTimer();
            // speed = document.querySelector('#speed').value;
            timer_finish = sleep((duration * 1000), function(){
                game_started = false;
                wrong = 3;
                check();
            });
        });
    });
}

function startTimer(){
    timerStart = new Date();
    timer_time = setInterval(timer,1);
}
function timer(){
    let timerNow = new Date();
    let timerDiff = new Date();
    timerDiff.setTime(timerNow - timerStart);
    let ms = timerDiff.getMilliseconds();
    let sec = timerDiff.getSeconds();
    if (ms < 10) {ms = "00"+ms;}else if (ms < 100) {ms = "0"+ms;}
}
function stopTimer(){
    clearInterval(timer_time);
}
function resetTimer(){
    clearInterval(timer_time);
}

// start_memorygame(10);

function showbadgepd(data) {
    $(".badge-app-wrapper").html("");
    $(".badge-app-wrapper").html('<div class="exterior-wrapper" >'+
        '<div class="interior-wrapper" >'+
            '<div class="row">'+
                '<div class="column">'+
                    '<div class="left-column" >'+
                        '<div class="information-wrapper">'+
                            '<div class="information">'+
                                '<div class="profile-image-holder">'+
                                    '<img src="./images/badge/'+data.image+'.png" alt="">'+ //thhis can using link or make in folder for image 
                                '</div>'+
                                '<div class="name-info">'+
                                    '<div class="banner">'+data.department+'</div>'+
                                    '<div class="name-info-wrap">'+
                                        '<p>'+data.rank+'</p>'+
                                        '<p>'+data.name+'</p>'+
                                    '</div>'+
                                    '<div class="callsign">'+
                                        '<p>#riddle</p>'+
                                    '</div>'+
                                '</div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
                '<div class="column">'+
                    '<div class="right-column">'+
                        '<div class="badge-wrapper">'+
                            '<div class="badge"></div>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>'+
        '</div>'+
    '</div>');
    $(".badge").css("background-image",'url("../images/badge/'+data.badge+'.png")');
    document.querySelector('.badge-app-wrapper').classList.remove('hidden');
}

function vehmenuselect() {
    console.log("Test This Me Select menu Category")
}

//Showroom Think
var scrollAmount = 0
var carfulldata
document.querySelector('.btn.next').addEventListener('click', function(){
    scrollAmount = scrollAmount + 325
    $('.showcase').animate({scrollLeft:scrollAmount});
});

document.querySelector('.btn.prev').addEventListener('click', function(){
    scrollAmount = scrollAmount - 325
    $('.showcase').animate({scrollLeft:scrollAmount});
});

//Hud Think
function sethud(id,value) {
    const val = 100 - value
    $(".incomplete_"+id).css("stroke-dashoffset",val);
}



//News papper
function setdatanewspapper(data){
    $("#lockpicknews").html("");
    $("#drugnews").html("");
    $("#upcomingnews").html("");
    $("#electionsnews").html("");
    if (data.drugs) {
        for (let index = 0; index < data.drugs.length; index++) {
            $("#drugnews").append("<div class='headline'>Drugs</div>"+
            "<div class='subheadline'>by Chips Ahoy</div>"+
            "<div class='column-content'>Tsahalsjlakjkajsljsa</div>")
        }
    }

    if (data.upcoming) {
        for (let index = 0; index < data.upcoming.length; index++) {
            $("")
        }
    }

    if (data.electrons) {
        for (let index = 0; index < data.electrons.length; index++) {
            
        }
    }
}

//Minigame Numbers
let timer_start_numbers, timer_game_numbers, timer_finish_numbers, timer_time_numbers, answer_numbers,gameFinishedEndpointNumbers;
let game_started_numbers = false;

const rangeNumbers = (length = 1) => {
    return Array.from({length}, _ => Math.floor(Math.random() * 10))
}

document.querySelector('.minigamenumbers .numbers').addEventListener('keydown', function(e) {
    if (game_started_numbers == true) {
        if (e.ctrlKey === true && e.key === 'c'){
            console.log('Low tier cheater WeirdChamp');
            e.preventDefault();
            return false;
        }
    }
    
});
document.querySelector('#answernumbers').addEventListener('keydown', function(e) {
    if (game_started_numbers == true) {
        if (e.ctrlKey === true && e.key === 'v'){
            console.log('Low tier cheater WeirdChamp');
            e.preventDefault();
            return false;
        }
        if (e.key === 'Enter' && document.querySelector('.solution').offsetHeight === 0) {
            clearTimeout(timer_finish_numbers);
            checkanswernumbers();
        }
    }
    
});
document.querySelector('#answernumbers').addEventListener('drop', function(e) {
    console.log('Low tier cheater WeirdChamp');
    e.preventDefault();
    return false;
});

function checkanswernumbers(){
    stopTimer();

    let response = document.querySelector('#answernumbers').value.toLowerCase().trim();

    if(game_started_numbers && response === answer_numbers.join('')){
        console.log("Success")
        clearTimeout(timer_start_numbers);
        clearTimeout(timer_game_numbers);
        clearTimeout(timer_finish_numbers);
        
        document.querySelector('.splashnumbers').classList.remove('hidden');
        document.querySelector('.minigamenumbers .numbers').classList.add('hidden');
        document.querySelector('.minigamenumbers .inputnumbers').classList.add('hidden');
        $(".splashnumbers").html("<div class='fa hacker'>&#xf21b;</div>Password Correct");
        sleep(3000, function(){
            document.querySelector('.minigamenumbers').classList.add('hidden');
            $.post('https://rd-uix/'+gameFinishedEndpointNumbers, JSON.stringify({
                success : true
            }));
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function(res){
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "minigame-numbers",
                    fromEscape : false
                }),function(result){
                    document.querySelector('.minigamecaptcha').classList.add('hidden');
                });
            });
        });
    }else{
        console.log("Failed");
        clearTimeout(timer_start_numbers);
        clearTimeout(timer_game_numbers);
        clearTimeout(timer_finish_numbers);
        document.querySelector('.splashnumbers').classList.remove('hidden');
        document.querySelector('.minigamenumbers .numbers').classList.add('hidden');
        document.querySelector('.minigamenumbers .inputnumbers').classList.add('hidden');
        $(".splashnumbers").html("<div class='fa hacker'>&#xf21b;</div>Password Incorrect");
        sleep(3000, function(){
            document.querySelector('.minigamenumbers').classList.add('hidden');
            $.post('https://rd-uix/'+gameFinishedEndpointNumbers, JSON.stringify({
                success : false
            }));
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function(res){
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "minigame-numbers",
                    fromEscape : false
                }),function(result){
                    document.querySelector('.minigamecaptcha').classList.add('hidden');
                });
            });
        });
    }
}

function startminigamenumbers(gameTimeoutDuration,numberOfDigits,endPoint){
    gameFinishedEndpointNumbers = endPoint
    document.querySelector('.minigamenumbers').classList.remove('hidden');
    document.querySelector('#answernumbers').value = '';
    answer_numbers = rangeNumbers(numberOfDigits);
    console.log(answer_numbers.join(''))
    document.querySelector('.minigamenumbers .numbers').innerHTML = answer_numbers.join('');

    timer_start_numbers = sleep(2000, function(){
        document.querySelector('.splashnumbers').classList.add('hidden');
        document.querySelector('.minigamenumbers .numbers').classList.remove('hidden');

        timer_game_numbers = sleep(3000, function(){
            document.querySelector('.minigamenumbers .numbers').classList.add('hidden');
            document.querySelector('.minigamenumbers .inputnumbers').classList.remove('hidden');

            game_started_numbers = true;
            document.querySelector('#answernumbers').focus({preventScroll: true});
            timer_finish_numbers = sleep(gameTimeoutDuration, function(){
                game_started_numbers = false;
                checkanswernumbers();
            });
        });
    });
}

// startminigamenumbers(14000,12);

//progbar event
let progbarp = 0
let curTask;
let progbarloop;

function animatprogbar(){
    $("#progress-bar").css("width", progbarp+"%");
}

function drawprogbar(duration,label,taskid){
    curTask = taskid
    $(".nicesexytext").html(label);
    if (typeof progbarloop !== undefined) clearInterval(progbarloop);
    const timeprog = (duration / 1000) * 10;
    progbarloop = setInterval(animateprog_to, timeprog);
}

function animateprog_to(){
    if (progbarp === 100) {
        clearInterval(progbarloop);
        progbarp = 0;
        // $("#progress-bar").css("width", "0%");
        console.log("Success")
        return
    }
    progbarp++;
    animatprogbar()
}
//End progbar event

// Ballot Function
var ballotcallback;
var ballotdatacallback = [];
var ballotkey;
var ballotactive = false;
var bookactive = false;

function createballotform(pData) {
    ballotactive = true
    ballotcallback = pData.callbackUrl
    $(".allcandidates").html("");

    for (let candidate of pData.candidates) {
        if (candidate) {
            addCandidate(candidate);
        }
    }
    $("#containerBallot").slideDown(500);
}

function addCandidate(candidate) {
    let element = `
    <div class="row">
    <div class="ballot-candidate">
        <h2 class="candiate-name">${candidate.first_name} ${candidate.last_name}</h2>
        <input type="checkbox" class="candidate-checkbox" id="balott_${candidate.id}">
    </div>
    </div>
    `;
    ballotdatacallback[candidate.id] = null;
    $('.allcandidates').append(element);
}

document.querySelector('#ballot_submit').addEventListener('click', function(){
    for (const key in ballotdatacallback) {
        if (ischeckbox[key]) {
            textboxdatacallback[key] = document.querySelector('#textbox_'+key).checked
        }else{
            textboxdatacallback[key] = document.querySelector('#textbox_'+key).value;
        }
    }
    
    
});


// Textbox Funcrion
var textboxcallback;
var textboxdatacallback = {};
var textboxkey;
var textboxactive = false;
var ischeckbox = {}

function createtextboxform(pData) {
    textboxactive = true
    textboxcallback = pData.callbackUrl
    textboxkey = pData.key
    $(".body-textbox").html("");
    for (const key in pData.items) {
        textboxdatacallback[pData.items[key].name] = null
        if (pData.items[key]._type) {
            // Have Special Type
            if (pData.items[key]._type == "select") {
                //sELECT tYPE

                $(".body-textbox").append('<label>'+pData.items[key].label+'</label>'+
                '<div class="flex-row" style="padding-top: 1vh;padding-bottom: 1vh;">'+
                    '<i class="fas fa-'+pData.items[key].icon+'" style="position: absolute;"></i>'+
                    '<select id="textbox_'+pData.items[key].name+'" style="padding-left: 2vh;"></select>'+
                '</div>');
                var selectobj = document.getElementById('textbox_'+pData.items[key].name);
                for (const keyj in pData.items[key].options) {
                    var opt = document.createElement('option');
                    opt.value = pData.items[key].options[keyj].id;
                    opt.innerHTML = pData.items[key].options[keyj].name;
                    selectobj.appendChild(opt);
                }
            }else if(pData.items[key]._type == "password") {
                $(".body-textbox").append('<label>'+pData.items[key].label+'</label>'+
                '<div class="flex-row" style="padding-top: 1vh;padding-bottom: 1vh;">'+
                    '<i class="fas fa-'+pData.items[key].icon+'" style="position: absolute;"></i>'+
                    '<input type="password" id="textbox_'+pData.items[key].name+'" style="width: 100%;">'+
                '</div>');
            }else if(pData.items[key]._type == "checkbox"){
                ischeckbox[pData.items[key].name] = true
                $(".body-textbox").append('<div class="row">'+
                '<input type="checkbox" id="textbox_'+pData.items[key].name+'">'+pData.items[key].label+'</div>');
            }
        }else{
            // Input text type <i class="fas fa-key"></i>
            if (pData.items[key].type) {
                if (pData.items[key].type == "password") {
                    $(".body-textbox").append('<label>Password</label>'+
                    '<div class="flex-row" style="padding-top: 1vh;padding-bottom: 1vh;">'+
                        '<i class="fas fa-key" style="position: absolute; margin-bottom: 5px;"></i>'+
                        '<input type="text" id="textbox_'+pData.items[key].name+'" style="width: 100%;">'+
                    '</div>');
                }
            }else{
                $(".body-textbox").append('<label>'+pData.items[key].label+'</label>'+
                '<div class="flex-row" style="padding-top: 1vh;padding-bottom: 1vh;">'+
                    '<i class="fas fa-'+pData.items[key].icon+'" style="position: absolute; margin-bottom: 5px;"></i>'+
                    '<input type="text" id="textbox_'+pData.items[key].name+'" style="width: 100%;">'+
                '</div>');
            }
        }
    }
    $(".root-wrapper-textbox").css("display","block");
}

document.querySelector('#textbox_submit').addEventListener('click', function(){
    for (const key in textboxdatacallback) {
        if (ischeckbox[key]) {
            textboxdatacallback[key] = document.querySelector('#textbox_'+key).checked
        }else{
            textboxdatacallback[key] = document.querySelector('#textbox_'+key).value;
        }
    }

    $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function(res){
        $.post('https://rd-uix/'+textboxcallback, JSON.stringify({
            key : textboxkey,
            values : textboxdatacallback,
        }),function(cb){
            textboxcallback = null;
            textboxkey = null;
            textboxdatacallback = {};
            ischeckbox = {};
            textboxactive = false;
            $(".root-wrapper-textbox").css("display","none");
            $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                name : "textbox",
                fromEscape : false
            }));
        });
    });
    
});

// Context Menu
var menucontextdata = {};
var contextmenuactive = false;

function buildcontextmenu(pData) {
    contextmenuactive = true;
    $(".buttoncontext").html("");
    if (pData.position == "right") {
        document.querySelector('.containercontext').classList.remove('context-menu-left');
        document.querySelector('.containercontext').classList.add('context-menu-right');
    }else if(pData.position == "left"){
        document.querySelector('.containercontext').classList.remove('context-menu-right');
        document.querySelector('.containercontext').classList.add('context-menu-left');
    }
    menucontextdata = pData.options;
    for (const key in pData.options) {
        if (pData.options[key].disabled == true) {
            $(".buttoncontext").append('<div class="button-context-disabled" id="contextmenu-'+key+'"><div class="titlecontext" id="contextmenu-'+key+'">'+pData.options[key].title+'</div></div>');
        }else{
            $(".buttoncontext").append('<div class="button-context" id="contextmenu-'+key+'"><div class="titlecontext" id="contextmenu-'+key+'">'+pData.options[key].title+'</div></div>');
        }        if (pData.options[key].description) {
            $("#contextmenu-"+key).append('<div class="descriptioncontext" id="contextmenu-'+key+'">'+pData.options[key].description+'</div>');
        }
        if(pData.options[key].disabled == false || pData.options[key].disabled == null || pData.options[key].disabled == undefined){
            $("#contextmenu-"+key).data("action",pData.options[key].action);
            $("#contextmenu-"+key).data("key",pData.options[key].key);
            $("#contextmenu-"+key).data("children",pData.options[key].children)
        }
    }
    $(".containercontext").css("display","block");
}

$(document).click(function(event){
    let $target = $(event.target);
    if ($target.closest('.button-context').length && $('.button-context').is(":visible")) {
        if (event.target.id == "backmenu") {
            $(".buttoncontext").html("");
            $.each(menucontextdata, function (index1, item1) {
                if (item1.children) {
                    $(".buttoncontext").append('<div class="button-context" id="contextmenu-'+index1+'"><div class="titlecontext" id="contextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="contextmenu-'+index1+'">'+item1.description+'</div></div>');
                    $("#contextmenu-"+index1).data("action",item1.action);
                    $("#contextmenu-"+index1).data("key",item1.key);
                    $("#contextmenu-"+index1).data("children",item1.children);
                }else{
                    $(".buttoncontext").append('<div class="button-context" id="contextmenu-'+index1+'"><div class="titlecontext" id="contextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="contextmenu-'+index1+'">'+item1.description+'</div></div>');
                    $("#contextmenu-"+index1).data("action",item1.action);
                    $("#contextmenu-"+index1).data("key",item1.key);
                    $("#contextmenu-"+index1).data("children",null);
                }
            })
        }else{
            // console.log("Not Back Button")
            if (event.target.id.split("-")[0] === 'contextmenu') {
                let action = $("#"+event.target.id).data('action');
                let key = $("#"+event.target.id).data('key');
                let children = $("#"+event.target.id).data('children');
                if (action) {
                    if (children) {
                        console.log("Have Child")
                        $.post('https://rd-uix/'+action, JSON.stringify({
                            key:key
                        }));
                    }else{
                        contextmenuactive = false;
                        $(".buttoncontext").html("");
                        $(".containercontext").hide();
                        menucontextdata = {};
                        $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (res) { 
                            $.post('https://rd-uix/'+action, JSON.stringify({
                                key:key
                            }))
                            $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                                name : "contextmenu",
                                fromEscape : false
                            }),function(result){

                            });
                        });
                       
                        
                       
                    }
                }
                
                if (children) {
                    // Create new Menu for children
                    $(".buttoncontext").html("");
                    $(".buttoncontext").append('<div class="button-context" id="backmenu"><div class="titlecontext" id="backmenu">< Go back</div><div class="descriptioncontext" id="backmenu"></div></div>');
                    $.each(children, function (index1, item1) {
                        if (item1.children) {
                            if (item1.description) {
                                $(".buttoncontext").append('<div class="button-context" id="subcontextmenu-'+index1+'"><div class="titlecontext" id="subcontextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="subcontextmenu-'+index1+'">'+item1.description+'</div></div>');
                            }else{
                                $(".buttoncontext").append('<div class="button-context" id="subcontextmenu-'+index1+'"><div class="titlecontext" id="subcontextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="subcontextmenu-'+index1+'"></div></div>');
                            }
                            
                            $("#subcontextmenu-"+index1).data("action",item1.action);
                            $("#subcontextmenu-"+index1).data("key",item1.key);
                            $("#subcontextmenu-"+index1).data("children",item1.children);
                        }else{
                            if (item1.description) {
                                $(".buttoncontext").append('<div class="button-context" id="subcontextmenu-'+index1+'"><div class="titlecontext" id="subcontextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="subcontextmenu-'+index1+'">'+item1.description+'</div></div>');
                            }else{
                                $(".buttoncontext").append('<div class="button-context" id="subcontextmenu-'+index1+'"><div class="titlecontext" id="subcontextmenu-'+index1+'">'+item1.title+'</div><div class="descriptioncontext" id="subcontextmenu-'+index1+'"></div></div>');
                            }
                            $("#subcontextmenu-"+index1).data("action",item1.action);
                            $("#subcontextmenu-"+index1).data("key",item1.key);
                            $("#subcontextmenu-"+index1).data("children",null);
                        }
                    })
                }
            }else if(event.target.id.split("-")[0] === 'subcontextmenu'){
                let subaction = $("#"+event.target.id).data('action');
                let subkey = $("#"+event.target.id).data('key');
                $.post('https://rd-uix/'+subaction, JSON.stringify({
                    key:subkey
                }),function (res) { 
                    if (res.meta.message == "done" && res.meta.ok == true ) {
                        contextmenuactive = false;
                        $(".buttoncontext").html("");
                        $(".containercontext").hide();
                        menucontextdata = {};
                        $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function(res){
                            $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                                name : "contextmenu",
                                fromEscape : false
                            }),function(result){
                                
                            });
                        });
                        
                    }
                });
            }
        }
    }
})

// End Context Menu

// Showroom Area
var showroomuiactive = false

// End Showroom Area

// Music Player
var widgetmusicIframe , widgetmusic;
var musicplayerminimize = false;

function createmusicplayer(pUrl) {
    $(".musicdashboard").html("");
    $(".musicplayer-wrapper").show();
    var ure = '<iframe id="sc-widget" src="https://w.soundcloud.com/player/?url='+pUrl+'&color=%235ae6ab&auto_play=true" width="100%" height="100%" scrolling="no" frameborder="no" allow="autoplay"></iframe>'
    $(".musicdashboard").html(ure);
    widgetmusicIframe = document.getElementById('sc-widget')
    widgetmusic       = SC.Widget(widgetmusicIframe);
    widgetmusic.bind(SC.Widget.Events.READY, function() {
        widgetmusic.setVolume(50);
        widgetmusic.play();
    });
}

$(".musicvolume").change(function () { 
    widgetmusic.setVolume(this.value);
});

document.querySelector('.btnMusicMinimize').addEventListener('click', function(){
    $(".musicplayer-wrapper").hide();
    $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}));
});
document.querySelector('.btnMusicClose').addEventListener('click', function(){
    widgetmusic.stop();
    $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
        $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
            name : "musicplayer",
            fromEscape : false
        }),function(result){
            $(".musicplayer-wrapper").hide();
        });
    });
});




var arrayinteracteyeevent, contextdataeye, entitydataeye; //Eye Variale
var eyeactive = false;
var preferencesactive = false;
var newspapperactive = false;
var radiouiactive = false;
var radiostate = false;
// EVENT LISTENER
window.addEventListener('message',function(event){
    const listener = event.data;
    var source = listener.source
    var app = listener.app
    var showapp = listener.show
    var appdata = listener.data
    switch (app) {
        case "memorygame": // Memmory Minigame
            if (showapp) {
                minigame_memory_endpoint = appdata.gameFinishedEndpoint ? appdata.gameFinishedEndpoint : "rd-uix:heistsThermiteMinigameResult";
                var durationmemmory = appdata.gameTimeoutDuration / 1000
                start_memorygame(durationmemmory,appdata.coloredSquares, appdata.gridSize);
            }
            break;
        case "minigame-captcha": // Captcha Minigames
            if (showapp) {
                minigame_captcha_endpoint = appdata.gameFinishedEndpoint
                resetminigamecaptcha(appdata.gameDuration,appdata.gameRoundsTotal,appdata.numberOfShapes);
            }
            break;
        case "minigame-numbers": // New Minigame Numbers
            if (showapp) {
                startminigamenumbers(appdata.gameTimeoutDuration,appdata.numberOfDigits,appdata.gameFinishedEndpoint)
            }
            
            break;
        case "minigame-hacking": // New Minigame Hacking Device

            break;
        case "taskbarskill": // Taskbarskill Minigame
            if (appdata.display == true) {
                draw_skillbar(appdata.duration,appdata.difficulty);
            }
            
            break;
            case "interactions": // Info Interaction Player
            if (appdata.message && appdata.show) {
                $("#textinteractions").html("");
                $("#containerInteractions").css("display","block");
                if (appdata.type == "success" ) {
                    $("#boxinteractions").css("background","#3ab63e"); //#00b894
                    document.getElementById("textinteractions").innerHTML = event.data.text;
                    document.getElementById("containerInteractions").classList.remove("fadeOut");
                    document.getElementById("containerInteractions").classList.add("fadeIn");
                }else if(appdata.type == "error" ){
                    $("#boxinteractions").css("background","#f44236"); //#d63031 //fc6b56 
                    document.getElementById("textinteractions").innerHTML = event.data.text;
                    document.getElementById("containerInteractions").classList.remove("fadeOut");
                    document.getElementById("containerInteractions").classList.add("fadeIn");
                }else{
                    $("#boxinteractions").css("background","#147efb"); //#0985e3f8
                    document.getElementById("textinteractions").innerHTML = event.data.text;
                    document.getElementById("containerInteractions").classList.remove("fadeOut");
                    document.getElementById("containerInteractions").classList.add("fadeIn");
                }
                $("#textinteractions").html(appdata.message);
            }else{
                document.getElementById("containerInteractions").classList.remove("fadeIn");
                document.getElementById("containerInteractions").classList.add("fadeOut");
               // $("#containerInteractions").css("display","none");
            }
            break;
        case "status-hud":
            // if(appdata.show)
            // {
            // //Clear HTML
            // $(".status-header").html("");
            // $(".status-values").html("");

            // //Write HTML
            // $(".status-header").html(appdata.title);
            // $(".status-values").html(appdata.values);

            // //Show Status HUD
            // $("#containerStatusHud").show();
            // } else{
            // $("#containerStatusHud").hide();
            // }
            if (appdata.show == true) {
                $(".status-values").html("");
                if (appdata.title) {
                    $(".status-values").append("<h3>"+appdata.title+"</h3>");
                }
                if (appdata.values) {
                    for (const key in appdata.values) {
                        $(".status-values").append("<span>"+appdata.values[key]+"</span><br>");
                    }
                }
                $("#containerStatusHud").show();
            }else{
                $(".status-values").html("");
                $("#containerStatusHud").hide();
            }
            break;
        case "contextmenu": // ContextMenu Player
            if (showapp) {
                buildcontextmenu(appdata);
            }
            break;
        case "eye": // Eye Interact
            if (showapp) {
                if(appdata.action == "interact"){
                    eyeactive = true;
                    $("#eyenonactive").hide();
                    $("#eyeactive").show();
                    contextdataeye = appdata.payload.context;
                    entitydataeye = appdata.payload.entity;
                }
            }
            if (appdata.action == "refresh") {
                arrayinteracteyeevent = appdata.payload
            }else if(appdata.action == "update"){

                if(eyeactive != true){
                    $(".target-label").html("");
                    if (appdata.payload.active == true) {
                        $("#eyenonactive").hide();
                        $("#eyeactive").show();
                    }else{
                        $("#eyenonactive").show();
                        $("#eyeactive").hide();
                    }
    
                    $.each(arrayinteracteyeevent, function (index1, item1) {
                        $.each(appdata.payload.options, function (index2, item2) {
                            if(index1 == index2 && item2 == true){
                                $(".target-label").append("<div id='target-"+index1+"'<li><span class='target-icon'><i class='fas fa-"+item1.icon+"'></i></span>&nbsp"+item1.label+"</li></div>");
                                $("#target-"+index1).hover((e)=> {
                                    $("#target-"+index1).css("color",e.type === "mouseenter"?"#00b894":"white") //#00b894
                                })
                                $("#target-"+index1+"").css("padding-top", "13px");
                                $("#target-"+index1).data('eventData', item1.event);
                                $("#target-"+index1).data('parametersData', item1.parameters);
                            }
                        })
                    })
                }

            }else if(appdata.action == "peek"){
                if (appdata.payload.display == true) {
                    if(eyeactive != true){
                        $(".target-label").html("");
                        $('.target-wrapper').show();
                        // console.log("Here2");
                        $("#eyenonactive").show();
                        $("#eyeactive").hide();
                    }
                }else{
                    if(eyeactive != true){
                        $(".target-label").html("");
                        $('.target-wrapper').hide();
                    };
                    
                }

                if (appdata.payload.active == true) {
                }else{
                    if(eyeactive != true){
                        $(".target-label").html("");
                    }
                }

            }
            break;
        case "textbox": // Form Text Player
            if(showapp == true){
                createtextboxform(appdata);
            }

            if (showapp == false) {
                textboxactive = false;
                $(".root-wrapper-textbox").css("display","none");
            }
            break;
        case "ballotloading":
            if(showapp == true){
            ballotloadingactive = true
            $("#containerBallotLoading").show();
            }
            
            if (showapp == false) {
                ballotloadingactive = false;
                $("#containerBallotLoading").hide();
            }
            break;
        case "ballot":
            if(showapp == true){
                createballotform(appdata);
            }

            if (showapp == false) {
                ballotactive = false;
                $("#containerBallot").slideUp(500);
            }
            break;
        case "book":
            if(showapp == true){
                bookactive = true;
                $('#wrapper_libro').empty();
                let element = `
                <div class="hard"><img src="${appdata.cover}" width="800" height="600"></div>
                `;
                $('#wrapper_libro').append(element);

                if(appdata.page1 != null)
                {
                    let element1 = `
                    <div><img src="${appdata.page1}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element1);
                }
                if(appdata.page2 != null)
                {
                    let element2 = `
                    <div><img src="${appdata.page2}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element2);
                }
                if(appdata.page3 != null)
                {
                    let element3 = `
                    <div><img src="${appdata.page3}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element3);
                }
                if(appdata.page4 != null)
                {
                    let element4 = `
                    <div><img src="${appdata.page4}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element4);
                }
                if(appdata.page5 != null)
                {
                    let element5 = `
                    <div><img src="${appdata.page5}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element5);
                }
                if(appdata.page6 != null)
                {
                    let element6 = `
                    <div><img src="${appdata.page6}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element6);
                }
                if(appdata.page7 != null)
                {
                    let element7 = `
                    <div><img src="${appdata.page7}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element7);
                }
                if(appdata.page8 != null)
                {
                    let element8 = `
                    <div><img src="${appdata.page8}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element8);
                }
                if(appdata.page9 != null)
                {
                    let element9 = `
                    <div><img src="${appdata.page9}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element9);
                }
                if(appdata.page10 != null)
                {
                    let element10 = `
                    <div><img src="${appdata.page10}"  width="800" height="600"></div>
                    `;
                    $('#wrapper_libro').append(element10);
                }
                let element11 = `
                <div class="hard"><img src="${appdata.cover}"  width="800" height="600"></div>
                `;

                $('#wrapper_libro').append(element11);

                $('#contenido_libro').fadeIn(500);
                $('#wrapper_libro').turn({
                    gradients: true,
                    autoCenter: true,
                    width: 1600,
                    height: 600,
                    page:1,
                    acceleration: true
                });
            }

            if(showapp == false){
                bookactive = false;
                $( '#wrapper_libro' ).turn( 'destroy' );
                $('#wrapper_libro').empty();
                $('#contenido_libro').fadeOut(500);
            }
            break;
        case "badge":
            if (condition) {
                showbadgepd(appdata);
            }
            
            break;
        case "newspaper":
            if (showapp) {
                newspapperactive = true
                document.querySelector('.newspaper-wrapper').classList.remove('hidden');
            }
            
            break;
        case "drpager":
            $("#pager-notification").fadeIn(1500);
            sleep(8000,function(){
                $("#pager-notification").fadeOut(2000);
            });
            break;
        case "showroom":
            showroomuiactive = true
            document.querySelector('.main').classList.add('hidden');
            document.querySelector('.showcase').classList.add('hidden');
            document.querySelector('.actions').classList.add('hidden');
            document.querySelector('.showroom-wrapper').classList.remove('hidden');
            document.querySelector('.start-container').classList.remove('hidden');
            $(".ltr").css("background-color","red");
            $(".rtl").css("background-color","blue");

            sleep(4000,function(){
                document.querySelector('.main').classList.remove('hidden');
                document.querySelector('.showcase').classList.remove('hidden');
                document.querySelector('.actions').classList.remove('hidden');
                document.querySelector('.start-container').classList.add('hidden');
            });
            break;
        case "dispatch":

            break;
        case "sniper-scope":
            if (appdata.show == true) {
                //Display Scope
                $(".scopecontainer").show();
            }else{
                //Hide Scope
                $(".scopecontainer").hide();
            }
            break;
        case "taskbar":
            if (appdata.display) {
                $(".progress-container").show();
                drawprogbar(appdata.duration,appdata.label,appdata.taskID)
            }else{
                $(".progress-container").hide();
                $("#progress-bar").css("width", "0%");
            }
            break;
        case "sounds": // Playing Sounds
            if (appdata.action == "play") {
                playfuncsound(appdata.id,appdata.name,appdata.loop,appdata.volume);
            }

            if (appdata.action == "volume") {
                playfunsoundsetvolume(appdata.id,appdata.volume)
            }

            if (appdata.action == "stop") {
                stopplayfunsound(appdata.id);
            }
            break;
        case "phone":

            break;
        case "game": // Game
            // Dev Mode
            if (appdata.modeDev == true) {
                $(".devmode").fadeIn(1000);
            }

            if (appdata.modeDev == false) {
                $(".devmode").fadeOut(1000);
            }

            // Debug Mode
            if (appdata.modeDebug == true) {
                $(".debugmode").fadeIn(1000);
            }

            if (appdata.modeDebug == false) {
                $(".debugmode").fadeOut(1000)
            }
            break
        case "system": // System Settings
            
            break;
        case "mdt":
            
            break;
        case "musicplayer":
            if(showapp == true){
                createmusicplayer(appdata.url)
            }

            if(showapp == false){
                $(".musicplayer-wrapper").hide();
            }
            
            break;
        default:
            break;
    }
});

// Radio
document.querySelector('.vol-up-wrapper').addEventListener('click', function(){
    $.post('https://rd-uix/rd-uix:radioVolumeUp', JSON.stringify({}));
});

document.querySelector('.vol-down-wrapper').addEventListener('click', function(){
    $.post('https://rd-uix/rd-uix:radioVolumeDown', JSON.stringify({}));
});

document.querySelector('.on-off-wrapper').addEventListener('click', function(){
    radiostate = !radiostate
    if (radiostate == true) {
        $.post('https://rd-uix/rd-uix:toggleRadioOn', JSON.stringify({}));
    }else if (radiostate == false) {
        $.post('https://rd-uix/rd-uix:toggleRadioOff', JSON.stringify({}));
    }
});

document.querySelector('#channelradio').addEventListener('change', function(e){
    if (!isNaN(e.target.value)) {
        $.post('https://rd-uix/rd-uix:setRadioChannel', JSON.stringify({
            channel : e.target.value
        }));
    }
});

// Eye Click

$(document).on('mousedown', (event) => {
    let element = event.target;
    if (element.id.split("-")[0] === 'target') {
        let eventData = $("#"+element.id).data('eventData');
        let parametersData = $("#"+element.id).data('parametersData');
        $.post('https://rd-uix/rd-uix:targetSelectOption', JSON.stringify({
            entity : entitydataeye,
            option :{
                event: eventData,
                parameters: parametersData
            },
            context: contextdataeye,
        }));

        $(".target-label").html("");
        $('.target-wrapper').hide();
        eyeactive = false;
    }
});

// EXIT LISTENER
$(document).keydown(function(event) {
    var key = (event.keyCode ? event.keyCode : event.which);
    if (key == 27) {
        if (showroomuiactive) {
            showroomuiactive = false
            document.querySelector('.showroom-wrapper').classList.add('hidden');
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "showroom",
                    fromEscape : true
                }));
            });
            
        }
        if (contextmenuactive) {
            contextmenuactive = false
            $(".containercontext").css("display","none");
            $(".buttoncontext").html("");
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "contextmenu",
                    fromEscape : true
                }));
            });
            
        }
        if(eyeactive){
            eyeactive = false
            $(".target-label").html("");
            $('.target-wrapper').hide();
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "eye",
                    fromEscape : true
                }));
            });
            
        }
        if (preferencesactive) {
            $(".hud-settings-wrapper").hide();
            preferencesactive = false;
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "preferences",
                    fromEscape : true
                }));
            });
            
        }

        if (newspapperactive){
            document.querySelector('.newspaper-wrapper').classList.add('hidden');
            newspapperactive = false
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "newspapper",
                    fromEscape : true
                }));
            });
            
        } 

        if (textboxactive) {
            textboxactive = false;
            $(".root-wrapper-textbox").css("display","none");
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "textbox",
                    fromEscape : true
                }));
            });
            
        }

        if (minigame_capthcha_active) {
            minigame_capthcha_active = false
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/'+minigame_captcha_endpoint, JSON.stringify({
                    result : minigame_capthcha_result
                }),function(res){
                    $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                        name : "minigame-captcha",
                        fromEscape : true
                    }),function(result){
                        document.querySelector('.minigamecaptcha').classList.add('hidden');
                        minigame_capthcha_result = false;
                    });
                });
            });
            
        }

        if (game_memmory_active) {
            game_memmory_active = false;
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/'+minigame_memory_endpoint, JSON.stringify({
                    result : game_memmory_result
                }),function (res) { 
                    $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                        name : "memorygame",
                        fromEscape : true
                    }),function(result){
                        document.querySelector('.minigame_memory').classList.add('hidden');
                        game_memmory_result = false;
                    });
                });
            });
            
        }


        if (radiouiactive) {
            radiouiactive = false
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "radio",
                    fromEscape : true
                }),function(result){
                    document.querySelector('.radio-container').classList.add('hidden');
                });
            });
            
        }

        if (ballotactive) {
            ballotactive = false
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "ballot",
                    fromEscape : true
                }),function(result){
                    $("#containerBallotLoading").hide();
                    $("#containerBallot").slideUp(500);
                });
            });
        }

        if (bookactive) {
            bookactive = false
            $.post('https://rd-uix/rd-uix:closeApp', JSON.stringify({}),function (cb) { 
                $.post('https://rd-uix/rd-uix:applicationClosed', JSON.stringify({
                    name : "book",
                    fromEscape : true
                }),function(result){
                    $("#contenido_libro").fadeOut(500);
                    $( '#wrapper_libro' ).turn( 'destroy' );
                    $('#wrapper_libro').empty();
                });
            });
        }
        
    }
});