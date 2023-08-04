class Vector3 {
  constructor(x, y, z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}

exports["rd-polytarget"].AddCircleZone("hno_gne_exchange", new Vector3(911.59, -1806.34, 22.37), 0.3, {
  useZ: true
});

  exports["rd-interact"].AddPeekEntryByPolyTarget("hno_gne_exchange", [
  {
    event: "rd-hoimports:GNE10Exchange",
    id: "hno_gne_exchange",
    icon: "circle",
    label: "Exchange GNE [10]",
    parameters: {}
  },
  {
    event: "rd-hoimports:GNE25Exchange",
    id: "hno_gne_exchange2",
    icon: "circle",
    label: "Exchange GNE [25]",
    parameters: {}
  },
  {
    event: "rd-hoimports:GNE50Exchange",
    id: "hno_gne_exchange3",
    icon: "circle",
    label: "Exchange GNE [50]",
    parameters: {}
  },
  {
    event: "rd-hoimports:GNE100Exchange",
    id: "hno_gne_exchange4",
    icon: "circle",
    label: "Exchange GNE [100]",
    parameters: {}
  },
  {
    event: "rd-hoimports:GNE250Exchange",
    id: "hno_gne_exchange5",
    icon: "circle",
    label: "Exchange GNE [250]",
    parameters: {}
  }
], {
  distance: { radius: 3.0 }
});

onNet('rd-hoimports:GNE10Exchange', function() {
  const isEmployed = exports["rd-business"].IsEmployedAt("hno_imports");
  if (isEmployed) {
    if (exports["rd-inventory"].hasEnoughOfItem("cryptostick4", 1)) {
      emit('inventory:removeItem', "cryptostick4", 1);
      emitNet('rd-boosting:giveGNE', 10);
    } else {
      emit('DoLongHudText', 'You Do Not Have GNE stick [10]', 2);
    }
  }
});

onNet('rd-hoimports:GNE25Exchange', function() {
  const isEmployed = exports["rd-business"].IsEmployedAt("hno_imports");
  if (isEmployed) {
    if (exports["rd-inventory"].hasEnoughOfItem("cryptostick5", 1)) {
      emit('inventory:removeItem', "cryptostick5", 1);
      emitNet('rd-boosting:giveGNE', 25);
    } else {
      emit('DoLongHudText', 'You Do Not Have GNE stick [25]', 2);
    }
  }
});

onNet('rd-hoimports:GNE50Exchange', function() {
  const isEmployed = exports["rd-business"].IsEmployedAt("hno_imports");
  if (isEmployed) {
    if (exports["rd-inventory"].hasEnoughOfItem("cryptostick1", 1)) {
      emit('inventory:removeItem', "cryptostick1", 1);
      emitNet('rd-boosting:giveGNE', 50);
    } else {
      emit('DoLongHudText', 'You Do Not Have GNE stick [50]', 2);
    }
  }
});

onNet('rd-hoimports:GNE100Exchange', function() {
  const isEmployed = exports["rd-business"].IsEmployedAt("hno_imports");
  if (isEmployed) {
    if (exports["rd-inventory"].hasEnoughOfItem("cryptostick2", 1)) {
      emit('inventory:removeItem', "cryptostick2", 1);
      emitNet('rd-boosting:giveGNE', 100);
    } else {
      emit('DoLongHudText', 'You Do Not Have GNE stick [100]', 2);
    }
  }
});

onNet('rd-hoimports:GNE250Exchange', function() {
  const isEmployed = exports["rd-business"].IsEmployedAt("hno_imports");
  if (isEmployed) {
    if (exports["rd-inventory"].hasEnoughOfItem("cryptostick3", 1)) {
      emit('inventory:removeItem', "cryptostick3", 1);
      emitNet('rd-boosting:giveGNE', 250);
    } else {
      emit('DoLongHudText', 'You Do Not Have GNE stick [250]', 2);
    }
  }
});
