import { InputLabel, Slider, Tooltip, Typography } from "@mui/material";
import Button from "@mui/material/Button";
import ButtonGroup from "@mui/material/ButtonGroup";
import React, { useState, useEffect } from "react";
import { FaChevronLeft, FaChevronRight } from "react-icons/fa";
import * as FaIcons from "react-icons/fa";

import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import { fetchNui } from "./utils/fetchNui";
import { useNuiEvent } from "./utils/useNuiEvent";

function App() {
  const [menus, setMenus] = useState([]);
  const [display, setDisplay] = useState(false);
  const [currentShop, setCurrentShop] = useState(null);
  const [modal, setModal] = useState(false);
  const [cost, setCost] = useState(0);

  useNuiEvent("raggsyFix", setModal)
  useNuiEvent("updatePrice", setCost)
  
  const [buttons, setButtons] = useState([
    {
      name: "Hat",
      path: "hat",
      icon: "FaHatCowboy",
    },
    {
      name: "Mask",
      path: "mask",
      icon: "FaMask",
    },
    {
      name: "Glasses",
      path: "glasses",
      icon: "FaGlasses",
    },
    {
      name: "Shirt",
      path: "tshirt",
      icon: "FaTshirt",
    },
    {
      name: "Bag",
      path: "bag",
      icon: "FaShoppingBag",
    },
    {
      name: "Pants",
      path: "pants",
      icon: "FaDrumstickBite",
    },
    {
      name: "shoes",
      path: "shoes",
      icon: "FaSocks",
    },
  ]);

  const [subMenus, setSubMenus] = useState([]);
  useNuiEvent("setSubMenus", setSubMenus);

  const getShop = (shop) => {
    setMenus([]);
    fetchNui("getClothesMenu", shop).then((data) => {
    //  console.log(data);
      setMenus(data ?? []);
    });
  };

  useNuiEvent("setCurrentShop", (shop) => {
    getShop(shop);

    setCurrentShop(shop);
  });

  useNuiEvent("setDisplay", setDisplay);

  const closeNui = (buy = false) => fetchNui("closeNui", buy);
  const resetNui = (buy = false) => fetchNui("resetNui", buy);
  const PayBank = (buy = false) => fetchNui("PayBank", buy);  
  useEffect(() => {
    // Only attach listener when we are visible
    if (!display) return;

    const scroolHandler = (e) => {
      let scroolDelta;
      if (e.wheelDeltaY < 0) scroolDelta = "down";
      else scroolDelta = "up";

      if (e.srcElement.parentNode.id == "scroolbar")
        fetchNui("updateCamera", scroolDelta);
    };

    let oldx = 0;
    window.addEventListener("mousewheel", scroolHandler);

    const cursor = (e) => {
      let val = e.pageX / 1200;
      if (e.pageX < oldx) {
        val = val * -1;
      }

      oldx = e.pageX;
      fetchNui("rotateCharacter", val);
    };

    window.addEventListener("mousedown", function (e) {
      console.log();
      if (e.which == 1 && e.srcElement.parentNode.id == "scroolbar")
        window.addEventListener("mousemove", cursor);
    });

    window.addEventListener("mouseup", function (e) {
      if (e.which == 1 && e.srcElement.parentNode.id == "scroolbar")
        window.removeEventListener("mousemove", cursor);
    });

    return () => {
      window.removeEventListener("mousewheel", scroolHandler);
      window.removeEventListener("mousemove", cursor);
    };
  }, [display]);

  const SetActiveButton = (id) => {
    let g = buttons[id];
    g.isActive = g.isActive ? false : true;

    setButtons([...buttons.slice(0, id), g, ...buttons.slice(id + 1)]);
  };

  const setSubMenuActive = (index) => {
    let oldIndex = subMenus.findIndex((x) => x.isActive == true);
    if (oldIndex !== -1) {
      let x = subMenus[oldIndex];
      x.isActive = false;

      setSubMenus([
        ...subMenus.slice(0, oldIndex),
        x,
        ...subMenus.slice(oldIndex + 1),
      ]);
    }
    // if (oldIndex) nw[oldIndex].isActive = ;
    let g = subMenus[index];
    g.isActive = true;

    setSubMenus([...subMenus.slice(0, index), g, ...subMenus.slice(index + 1)]);
  };

  return (
    <div
      style={{ visibility: display ? "visible" : "hidden" }}
      className="w-screen h-screen flex justify-end"
    >
      <div id="scroolbar" className="h-screen flex-1 z-10 overflow-y-scroll">
        <div className="h-screen p-4 w-full  my-2"></div>
        <div className="h-screen p-4 w-full "></div>
      </div>
      <div
        className="w-[480px] h-screen flex relative"
        style={{ background: "rgb(48,71,94)", pointerEvents: "unset" }}
      >
        <div
          className="max-h-screen overflow-y-auto overflow-x-hidden"
          style={{ flex: "6 1 0%", background: "rgb(34,40,49)" }}
        >
          <div className="flex w-[412px] p-4 z-[200] fixed">
            <Typography variant="h6">
              { <span style={{ color: "rgb(174,213,129)" }}>
                ${cost}.0 (+ 20% tax)
              </span> }
            </Typography>
            <div className="flex-1 flex justify-end">
              <div>
                <Button
                  color="secondary"
                  size="small"
                  variant="contained"
                  onClick={() => setModal(!modal)}
                  sx={{
                    borderBottomRightRadius: "0",
                    borderTopRightRadius: "0",
                  }}
                >
                  Pay
                </Button>
              </div>
              <div>
                <Button
                  color="primary"
                  size="small"
                  variant="contained"
                  onClick={() => resetNui(false)}
                  sx={{
                    borderBottomLeftRadius: "0",
                    borderTopLeftRadius: "0",
                    color: "black",
                  }}
                >
                  Close
                </Button>
              </div>
            </div>
          </div>
          <br />
          <br />
          <div className="overflow-y-auto">
            <div className="p-3 relative overflow-y-auto">
              {display &&
                menus.map((m) =>
                  m.isColor ? <ColorPallete _data={m} /> : <Item _data={m} />
                )}
            </div>
          </div>
        </div>
        <div className="flex-1 max-h-screen overflow-y-auto text-[#e0e0e0]">
          <div className="h-[56px] w-full flex items-center justify-center">
            <img
              className="h-[32px]"
              src="https://cdn.discordapp.com/attachments/1065299254983270540/1065300724390559847/riddleClothingLogo.png"
            />
          </div>
          {subMenus.map((s, index) => (
            <Tooltip arrow placement="left" title={s.name}>
              <div
                onClick={() => {
                  getShop(s.path);
                  setSubMenuActive(index);
                }}
                className={`h-[56px] w-full flex items-center justify-center`}
                style={{
                  backgroundColor:
                    s.isActive == true ? "rgb(34,40,49)" : "rgba(48,71,94,0)",
                }}
              >
                <div className="text-[2em]">
                  {React.createElement(FaIcons[s.icon])}
                </div>
              </div>
            </Tooltip>
          ))}
        </div>
      </div>

      <div className="top-0 right-[480px] cursor-pointer flex z-10 absolute select-none flex-col text-[#e0e0e0]">
        {buttons.map((button, id) => (
          <Tooltip arrow title={button.name} placement="left">
            <div
              style={{
                background: button.isActive ? "rgb(48,71,94)" : "rgb(34,40,49)",
              }}
              onClick={() => {
                SetActiveButton(id);
                fetchNui("handleClothe", button.path); 
              }}
              className="w-8 h-8 m-[3px] flex items-center rounded-[10%] justify-center "
            >
              {React.createElement(FaIcons[button.icon], {
                class: "h-[16px] w-[20px] ",
              })}
            </div>
          </Tooltip>
        ))}
      </div>

      {modal && (
        <div className="flex items-center justify-center w-full h-full absolute top-0 left-0 my-0 mx-auto z-50">
          <div
            className="w-[500px] h-[140px] p-[1.5%] flex flex-col justify-between text-[#e0e0e0]"
            style={{ borderRadius: "0.5vh", background: "rgb(34,40,49)" }}
          >
            <Typography variant="h5">
              Would you like to purchase these clothes
            </Typography>

            <div className="flex justify-between text-black">
              <div>
                <Button onClick={() => closeNui(true)} variant="contained" color="secondary" size="small">
                  Cash
                </Button>
              </div>
              <div>
                <Button
                  onClick={() => PayBank(true)}
                  variant="contained"
                  color="secondary"
                  size="small"
                >
                  Bank
                </Button>
              </div>
              <div>
                <Button
                  onClick={() => setModal(false)}
                  variant="contained"
                  color="primary"
                  size="small"
                >
                  Discard
                </Button>
              </div>
              <div>
                <Button
                  onClick={() => closeNui(false)}
                  variant="contained"
                  color="info"
                  size="small"
                >
                  Cancel
                </Button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

function ColorPallete({ _data }) {
  const [data, setData] = useState(_data);
  const [open, setOpen] = useState(false);
  const [currentIndex, setCurrentIndex] = useState(1);
  const [currentTextureIndex, setCurrentTextureIndex] = useState(1);
  const [active, setActive] = useState(false);

  useEffect(() => {
    if (active)
      fetchNui("changeHairColor", {
        currentIndex,
        currentTextureIndex,
        type: data.type,
        id: data.id,
      });
  }, [currentIndex, currentTextureIndex]);

  return (
    <div className="w-full mb-2 border-b border-[#c8c6ca] bg-[#30475e] rounded rounded-b-none p-2 text-[#e0e0e0] relative">
      <div className="w-full" onClick={() => setOpen(!open)}>
        <Typography variant="h6">{data.name}</Typography>
      </div>
      {open && (
        <div
          className="flex flex-col"
          style={{ padding: "8px 12px 0px", color: "#c8c6ca" }}
        >
          <Typography variant="h6">{data.colorLabel}</Typography>
          <div
            className="grid max-w-[50%]"
            style={{
              gridTemplaterRows: "repeat(8, 1fr)",
              gridTemplateColumns: "repeat(8, 1fr)",
            }}
          >
            {_data.colors.map((color) => (
              <div
                className="border w-[43px] h-[43px] cursor-pointer"
                onClick={() => {
                  setActive(true);
                  setCurrentIndex(color.id);
                }}
                style={{
                  backgroundColor: `rgb(${color.r}, ${color.g}, ${color.b})`,
                  borderColor:
                    currentIndex == color.id ? "rgb(0,0,255)" : "#fff",
                }}
              ></div>
            ))}
          </div>
          {data.secondaryColorLabel && (
            <div>
              <Typography variant="h6">{data.secondaryColorLabel}</Typography>
              <div
                className="grid max-w-[50%]"
                style={{
                  gridTemplaterRows: "repeat(8, 1fr)",
                  gridTemplateColumns: "repeat(8, 1fr)",
                }}
              >
                {_data.highlight.map((color) => (
                  <div
                    className="border w-[43px] h-[43px] cursor-pointer"
                    onClick={() => {
                      setActive(true);
                      setCurrentTextureIndex(color.id);
                    }}
                    style={{
                      backgroundColor: `rgb(${color.r}, ${color.g}, ${color.b})`,
                      borderColor:
                        currentTextureIndex == color.id
                          ? "rgb(0,0,255)"
                          : "#fff",
                    }}
                  ></div>
                ))}
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}

function Item({ _data }) {
  const [data, setData] = useState(_data);

  const Buttons = ({ clotheData, setMainData }) => {
    const [data, setData] = useState(clotheData ?? []);
    const [currentIndex, setIndex] = useState(data.currentIndex ?? 0);
    const [textures, setTextures] = useState([])
    const [first, setFirst] = useState({
      currentIndex: data.currentIndex ?? 0,
      indexChanged: false,
      currentTextureIndex: data.currentTextureIndex ?? 0,
      textureChanged: false
    });
    const [changed, setChanged] = useState(false);
    const [currentTextureIndex, setTextureIndex] = useState(
      data.currentTextureIndex ?? 0
    );

    useEffect(() => {
      const x = () => {
        if (!data.componentSettings.texture) return
        var tab = []
        for (var i = 0; i <= data.componentSettings.texture.max; i++) {
          tab.push(i)
        }

        setTextures(tab)


      }

      x()
    }, [])

    useEffect(() => console.log())

    useEffect(() => {
      if (changed) {
        fetchNui("changeClothe", {
          ...data,
          currentIndex: currentIndex,
          currentTextureIndex: currentTextureIndex,
        });
       // fetchNui("handlePrice");
      }
    }, [currentIndex, currentTextureIndex]);


    useEffect(() => {
      if (changed) {
        setTextureIndex(0);
        fetchNui("getComponentSettings", data).then((_data) => {
          setData({ ...data, componentSettings: _data });
        });
      }
    }, [currentIndex]);

    const updateIndex = (type, val, texture) => {
      setChanged(true);
      // fetchNui("handlePrice");
      if (val) {
        if (texture) {
          var newVal = parseInt(val);
          if (parseInt(val) > data.componentSettings.texture.max)
            newVal = data.componentSettings.texture.min;
          if (parseInt(val) < data.componentSettings.texture.min)
            newVal = data.componentSettings.texture.max;

          setTextureIndex(newVal);
        } else {
          var newVal = parseInt(val);

          if (newVal > data.componentSettings.drawable.max)
            newVal = data.componentSettings.drawable.min;
          if (newVal < data.componentSettings.drawable.min)
            newVal = data.componentSettings.drawable.max;

          setIndex(newVal);
        }
      } else {
        let number = type == "up" ? 1 : -1;

        if (texture) {
          setTextureIndex((currentVal) => {
            if (currentVal + number < data.componentSettings.texture.min)
              return data.componentSettings.texture.max;

            if (currentVal + number > data.componentSettings.texture.max)
              return 0;

            return currentVal + number;
          });
        } else {
          setIndex((currentVal) => {
            if (currentVal + number < data.componentSettings.drawable.min)
              return data.componentSettings.drawable.max;

            if (currentVal + number > data.componentSettings.drawable.max)
              return 0;

            return currentVal + number;
          });
        }
      }
    };

    return (
      <div>
        <div className="flex items-center justify-between gap-1">
          <ButtonGroup>
            <Button
              variant="contained"
              color="info"
              onClick={() => updateIndex("down", null, false)}
              sx={{
                borderBottomRightRadius: "0",
                borderTopRightRadius: "0",
                minWidth: "40px",
                minHeight: "36px",
              }}
            >
              <FaChevronLeft />
            </Button>
            <input
              className="bg-transparent outline-none border-b text-center max-w-[90px]"
              value={currentIndex}
              onChange={(e) => updateIndex(null, e.target.value, false)}
            />
            <Button
              variant="contained"
              color="info"
              onClick={() => updateIndex("up", null, false)}
              sx={{
                borderBottomLeftRadius: "0",
                borderTopLeftRadius: "0",
                color: "black",
              }}
            >
              {" "}
              <FaChevronRight />{" "}
            </Button>
          </ButtonGroup>
          {data.componentSettings.texture && !data.useSlider && (
            <ButtonGroup>
              <Button
                variant="contained"
                color="info"
                onClick={() => updateIndex("down", null, true)}
                sx={{
                  borderBottomRightRadius: "0",
                  borderTopRightRadius: "0",
                  minWidth: "40px",
                  minHeight: "36px",
                }}
              >
                <FaChevronLeft />
              </Button>
              <input
                className="bg-transparent outline-none border-b text-center max-w-[90px]"
                value={currentTextureIndex}
                onChange={(e) => updateIndex(null, e.target.value, true)}
              />
              <Button
                variant="contained"
                color="info"
                onClick={() => updateIndex("up", null, true)}
                sx={{
                  borderBottomLeftRadius: "0",
                  borderTopLeftRadius: "0",
                  color: "black",
                }}
              >
                {" "}
                <FaChevronRight />{" "}
              </Button>
            </ButtonGroup>
          )}

          {data.useSlider == true && (
            <div className="w-full">
              <Slider
                size="small"
                defaultValue={currentTextureIndex}
                max={data.componentSettings.drawable.max}
                min={data.componentSettings.drawable.min}
                color="secondary"
                onChange={(e, newVal) => setTextureIndex(newVal)}
              />
            </div>
          )}
        </div>

        {data.componentSettings.texture && !data.disableSelect && (
          <FormControl
            variant="standard"
            sx={{ minWidth: "100%", marginTop: ".5rem" }}
          >
            <InputLabel color="info" id="demo-simple-select-standard-label">
              {data.componentSettings.texture.max} Texture
            </InputLabel>
            <Select
              label="Texture"
              color="info"
              // value={1}
              onChange={(e) => {
                updateIndex(null, e.target.value, true)
              }}
            >
              {textures &&
                textures.map((val, key) => (
                  <MenuItem value={parseInt(val)}>Texture {val}</MenuItem>
                ))
              }
            </Select>
          </FormControl>
        )}
      </div>
    );
  };

  const Sliders = ({ clotheData }) => {
    const [data, setData] = useState(clotheData);
    const [currentIndex, setIndex] = useState(data.currentIndex ?? 0);
    const [active, setActive] = useState(false);


    const handleChange = (e, newValue) => {
      setActive(true);
      setIndex(newValue);
    };

    useEffect(() => {
      if (active)
        fetchNui("changeClothe", { ...data, currentIndex: currentIndex });
    }, [currentIndex]);

    return (
      <div className="w-full">
        <Slider
          size="small"
          defaultValue={currentIndex}
          max={data.componentSettings.drawable.max}
          color="secondary"
          onChange={handleChange}
          sx={{ width: "100%" }}
        />
      </div>
    );
  };

  const Multi = (clotheData) => {
    const [data, setData] = useState(clotheData);

    const Item = ({ itemData }) => {
      const [item, setItem] = useState(itemData);
      const [currentIndex, setCurrentIndex] = useState(0);
      const [active, setActive] = useState(false);

      useEffect(() => {
        if (active)
          fetchNui("changeClothe", { ...item, currentIndex: currentIndex });
      }, [currentIndex]);

      return (
        <div
          className={`${
            itemData.width == "full" ? "w-full" : "w-[44%]"
          } p-[10px] inline-flex`}
        >
          <div className="w-full">
            <Typography>{item.name}</Typography>
            <Slider
              size="small"
              defaultValue={currentIndex}
              max={item.componentSettings.max}
              min={item.componentSettings.min}
              color="secondary"
              onChange={(e, val) => {
                setActive(true);
                setCurrentIndex(parseInt(val));
              }}
              sx={{ width: "100%" }}
            />
          </div>
        </div>
      );
    };

    useEffect(() => {
      //console.log();
    }, []);

    return (
      <div className="w-full">
        {/* {JSON.stringify(data)} */}

        {data.clotheData.map((item) => (
          <Item itemData={item} />
        ))}
      </div>
    );
  };

  return (
    <div className="mt-[7.5%] w-full mb-2 bg-[#30475e] rounded rounded-b-none p-2 text-[#e0e0e0] relative">
      <div className="flex w-full">
        <div
          className="flex flex-col relative justify-between overflow-hidden"
          style={{ alignContent: "space-between", flex: "1 1" }}
        >
          <div>
            <Typography variant="h5">{data.name}</Typography>
          </div>

          <div>
            <div>
              {data.multi ? (
                <Multi clotheData={data.multi} />
              ) : (
                <div className="w-full">
                  <Typography variant="body2">
                    {data.componentSettings.drawable.max} components
                  </Typography>
                  <div className="flex justify-between items-center gap-2">
                    {!data.slider ? (
                      <Buttons clotheData={data} setMainData={setData} />
                    ) : (
                      <Sliders clotheData={data} />
                    )}
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default App;
