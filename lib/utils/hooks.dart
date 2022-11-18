import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

bool useIsScrollable(ScrollController controller) {
  final isScrollable = useState(false);
  useEffect(
    () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isScrollable.value = controller.position.maxScrollExtent > 0;
      });
      return;
    },
    [WidgetsBinding.instance],
  );

  return isScrollable.value;
}

bool useIsMinScrolled(ScrollController controller) {
  final isMinScrolled = useState(
    controller.position.pixels == controller.position.minScrollExtent,
  );
  useEffect(
    () {
      void listener() {
        if (controller.position.pixels == controller.position.minScrollExtent &&
            !isMinScrolled.value) {
          isMinScrolled.value = true;
        }
        if (!(controller.position.pixels ==
                controller.position.minScrollExtent) &&
            isMinScrolled.value) {
          isMinScrolled.value = false;
        }
      }

      controller.addListener(listener);
      return () {
        controller.removeListener(listener);
      };
    },
    [controller],
  );

  return isMinScrolled.value;
}

bool useIsMaxScrolled(ScrollController controller) {
  final isMaxScrolled = useState(
    controller.position.pixels == controller.position.maxScrollExtent,
  );
  useEffect(
    () {
      void listener() {
        if (controller.position.pixels == controller.position.maxScrollExtent &&
            !isMaxScrolled.value) {
          isMaxScrolled.value = true;
        }
        if (!(controller.position.pixels ==
                controller.position.maxScrollExtent) &&
            isMaxScrolled.value) {
          isMaxScrolled.value = false;
        }
      }

      controller.addListener(listener);
      return () {
        controller.removeListener(listener);
      };
    },
    [controller],
  );

  return isMaxScrolled.value;
}

bool useIsLastPage(
  PageController controller, {
  required int pageCount,
}) {
  final isLastPage = useState(false);
  useEffect(
    () {
      void listener() {
        if ((controller.page ?? 0.0) >= (pageCount - 1.5)) {
          if (!isLastPage.value) {
            isLastPage.value = true;
          }
        } else {
          if (isLastPage.value) {
            isLastPage.value = false;
          }
        }
      }

      controller.addListener(listener);
      return () {
        controller.removeListener(listener);
      };
    },
    [controller],
  );
  return isLastPage.value;
}
