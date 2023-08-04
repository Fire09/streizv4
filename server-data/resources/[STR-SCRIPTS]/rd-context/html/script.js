let Menus = [];
let MenuCurrent = 0;
let Buttons = [];
let ButtonsData = [];
let ShowingImage = null;

const OpenMenu = (data) => {
    Menus.push(data)
    MenuCurrent = 0

    DrawButtons(data)
};

const CloseMenu = () => {
    $("#buttons").empty();
    $("#images").empty();

    Menus = [];
    MenuCurrent = 0;
    Buttons = [];
    ButtonsData = [];
};

const DrawButtons = (data, back) => {
    let ButtonsData = data

    $("#buttons").empty();
    $("#images").empty();

    Buttons = [];

    if (back != undefined) {
        let element = `
            <div class="button" id=` + 69420 + `>
                <div class="header" id=` + 69420 + `>` + "Go Back" + `</div>
                <div class="txt" id=` + 69420 + `>` + "" + `</div>
                <div class="icon"><i class="fas fa-chevron-left"></i></div>
            </div>`


        $("#buttons").append(element);
        Buttons[69420] = back;
    }

    for (let i = 0; i < ButtonsData.length; i++) {
        if (ButtonsData[i].description == undefined) {
            ButtonsData[i].description = ""
        }

        let id = i
        let element

        element = `
        <div class="button" id=` + id + `>
            <div class="header" id=` + id + `>` + ButtonsData[i].title + `</div>
            <div class="txt" id=` + id + `>` + ButtonsData[i].description + `</div>`
            if (ButtonsData[i].children) {
                element += `<div class="icon"><i class="fas fa-chevron-right"></i></div>`
            }
        `</div>`

        $("#buttons").append(element);

        if (ButtonsData[i].image) {
            let elementImage = `
                <img id="image-${id}" class="place-image" src="${ButtonsData[i].image}" style="display: none;">
            `

            $("#images").append(elementImage);
        }

        if (ButtonsData[i].disabled === true) {
            $("#" + id).prop("disabled", true);
            $("#" + id).attr("class", "button disabled");
        }

        Buttons[id] = ButtonsData[i];
    };

    $(".button").hover(
        function(event) {
            if (ShowingImage === null) {
                let id = event.target.id;
                $(`#image-${id}`).fadeIn("fast");
                ShowingImage = id;
            }
        },
        function() {
            if (ShowingImage !== null) {
                let id = ShowingImage;
                $(`#image-${id}`).fadeOut("fast");
                ShowingImage = null;
            }
        }
    );
};

$(document).click(function (event) {
    let $target = $(event.target);
    if ($target.closest(".button").length && $(".button").is(":visible")) {
        let id = event.target.id;

        if (Buttons[id].action && Buttons[id].disabled !== true) {
            PostData(Buttons[id])
        } else if (Buttons[id].children && Buttons[id].disabled !== true) {
            Menus.push(Buttons[id].children)
            DrawButtons(Buttons[id].children, MenuCurrent)
            MenuCurrent = Menus.length - 1
        } else if (id == 69420) {
            MenuCurrent = Buttons[id]
            let data = Menus[MenuCurrent]

            let back = undefined
            if (MenuCurrent != 0) {
                back = MenuCurrent - 1
            }

            DrawButtons(data, back)

            Menus.pop()
        }
    }
})

const PostData = (data) => {
    $.post(`https://${GetParentResourceName()}/dataPost`, JSON.stringify(data))
    return CloseMenu();
}

const CancelMenu = () => {
    $.post(`https://${GetParentResourceName()}/cancel`)
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
        case "LOAD_IMAGES":
            return preloadImages(info);
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

function preloadImages(array) {
    if (!preloadImages.list) {
        preloadImages.list = [];
    }
    var list = preloadImages.list;
    for (var i = 0; i < array.length; i++) {
        var img = new Image();
        img.onload = function() {
            var index = list.indexOf(this);
            if (index !== -1) {
                // remove image from the array once it's loaded
                // for memory consumption reasons
                list.splice(index, 1);
            }
        }
        list.push(img);
        img.src = array[i];
    }
}