


on("onResourceStart", (resName: string) => {
  if (resName === GetCurrentResourceName()) {
    console.log("Satellite for Tesla's Initialized")
  }
});