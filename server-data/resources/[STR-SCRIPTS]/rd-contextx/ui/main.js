let ButtonsData = [];
let Buttons = [];
let Button = [];

const OpenMenu = (data) => {
    DrawButtons(data)
}

const CloseMenu = () => {
    for (let i = 0; i < ButtonsData.length; i++) {
        let id = ButtonsData[i].id
        $(".button").remove();
    }
    ButtonsData = [];
    Buttons = [];
    Button = [];
    document.getElementById("image-container").style.display = 'none';
};

const DrawButtons = (data) => {
    ButtonsData = data
    for (let i = 0; i < ButtonsData.length; i++) {
        let header = ButtonsData[i].header
        let message = ButtonsData[i].txt
        let url = ButtonsData[i].url;
        let id = ButtonsData[i].id
        let element
        //<div class="image" id=`+ id + `><img src=`+url+` id=`+id+`></div>
        if (url && url != undefined) {
            element = $(`
                <div class="button" id=`+ id + `>
                    
                    <div class="header" id=`+ id + `>` + header + `</div>
                    <div class="txt" id=`+ id + `>` + message + `</div>
                </div>`
            );
        } else {
            element = $(`
                <div class="button" id=`+ id + `>
                    <div class="header" id=`+ id + `>` + header + `</div>
                    <div class="txt" id=`+ id + `>` + message + `</div>
                </div>`
            );
        }
        $('#buttons').append(element);
        Buttons[id] = element;
        Buttons[id].mouseover(function () {
            if (url && url != undefined) {
                if (document.getElementById("image-container").style.display == 'none') {
                    document.getElementById("image-container").style.display = 'block';
                    document.getElementById("image-container").style.animation = 'pulse 1s';
                }
                SetImage(url);
            } else {
                document.getElementById("image-container").style.display = 'none';
            }
        });
        Buttons[id].mouseleave(function () {
            if (url && url != undefined) {
                document.getElementById("image-container").style.display = 'none';
            }
        });
        if (ButtonsData[i].params) {
            Button[id] = ButtonsData[i].params
        }
    }
};

function SetImage(url) {
    $('#image-container').attr('src', url);
    return true;
}

$(document).click(function(event){
    let $target = $(event.target);
    if ($target.closest('.button').length && $('.button').is(":visible")) {
        let id = event.target.id;
        if (!Button[id]) return
        PostData(id)
    }
})

const PostData = (id) => {
    $.post(`https://rd-contextx/dataPost`, JSON.stringify(Button[id]))
    return CloseMenu();
}

const CancelMenu = () => {
    $.post(`https://rd-contextx/cancel`)
    return CloseMenu();
}

window.addEventListener("message", (evt) => {
    const data = evt.data
    const info = data.data
    const action = data.action
    switch (action) {
        case "OPEN_MENU":
            return OpenMenu(info);
        case "CLOSE_MENU":
            return CloseMenu();
        default:
            return;
    }
})


document.onkeyup = function (event) {
    event = event || window.event;
    var charCode = event.keyCode || event.which;
    if (charCode == 27) {
        CancelMenu();
    }
};