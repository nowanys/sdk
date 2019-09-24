// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analysis_server/src/services/correction/fix.dart';
import 'package:analysis_server/src/services/linter/lint_names.dart';
import 'package:analyzer_plugin/utilities/fixes/fixes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import 'fix_processor.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(RemoveEmptyConstructorBodyTest);
  });
}

@reflectiveTest
class RemoveEmptyConstructorBodyTest extends FixProcessorLintTest {
  @override
  FixKind get kind => DartFixKind.REMOVE_EMPTY_CONSTRUCTOR_BODY;

  @override
  String get lintCode => LintNames.empty_constructor_bodies;

  test_empty() async {
    await resolveTestUnit('''
class C {
  C() {/*LINT*/}
}
''');
    await assertHasFix('''
class C {
  C();
}
''');
  }
}