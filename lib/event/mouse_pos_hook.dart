class MousePosHook {
  static final MousePosHook _singleton = MousePosHook._internal();
  factory MousePosHook() {
    return _singleton;
  }
  MousePosHook._internal();

  final List<Function> _listeners = [];

  void addListener(Function listener) {
    _listeners.add(listener);
  }

  void removeListener(Function listener) {
    _listeners.remove(listener);
  }

  void notifyListeners(int x, int y) {
    for (var listener in _listeners) {
      listener(x, y);
    }
  }

  // 接收鼠标位置
  void handleMousePos(int x, int y) {
    notifyListeners(x, y);
  }
}
