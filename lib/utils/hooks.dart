import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

bool useIsScrollable(
  ScrollController controller, {
  required MediaQueryData mediaQueryData,
}) {
  final isScrollable = useState(false);
  useEffect(
    () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isScrollable.value = controller.position.maxScrollExtent > 0;
      });
      return;
    },
    [
      WidgetsBinding.instance,
      mediaQueryData,
    ],
  );

  return isScrollable.value;
}

bool useIsLastPage(
  PageController controller, {
  required int pageCount,
}) {
  final isLastPage = useState(false);
  useEffect(
    () {
      if (controller.hasClients) {
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
    [controller, pageCount],
  );
  return isLastPage.value;
}
