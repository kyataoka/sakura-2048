function getLineFeedCode() {
  switch (Editor.GetLineCode()) {
    case 0:
      return "\r\n";
    case 1:
      return "\r";
    case 2:
      return "\n";
  }
}
