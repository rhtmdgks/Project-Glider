import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

/// 스택이 비어 있을 때(예: `go`로 연 화면에서 뒤로가기) 안전하게 메인으로 보냅니다.
void safePopOrMain(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(AppRoutes.mainHome);
  }
}
