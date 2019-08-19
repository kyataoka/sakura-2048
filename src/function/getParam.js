function getParam(type) {
  var paramFilePath = pluginPath + "\param\" + type;
  var paramFile = fso.OpenTextFile(paramFilePath, 1);
  var param = paramFile.ReadAll();

  return param;
}
