class GlobalRunOnce {

  bool _hasRun = false;

  void call(void Function() function) {

    if (_hasRun) {
      return;
    }

    _hasRun = true;

    function();
  }

}
