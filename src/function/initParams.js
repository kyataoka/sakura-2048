function initParams() {
  initParamFile("command", "");
}

function initParamFile(paramName, initVal) {
  var paramFilePath = pluginPath + "\param\" + paramName;
  fso.CreateTextFile(paramFilePath, true, true);
}
