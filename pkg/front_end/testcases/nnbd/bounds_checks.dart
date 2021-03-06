// Copyright (c) 2020, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class A<X extends num> {}

foo(A<num?> a) {} // Error in strong mode and Warning in weak mode.

A<num?> bar() {} // Error in strong mode and Warning in weak mode.

baz<T extends A<num?>>() {} // Error in strong mode and Warning in weak mode.

class B extends A<num?> {} // Error in strong mode and Warning in weak mode.

class C<T extends A<num?>> {} // Error in strong mode and Warning in weak mode.

void hest<T extends num>() {}

class Hest {
  void hest<T extends num>() {}
}

fisk(Hest h) {
  hest<num?>();
  h.hest<num?>();
}

main() {}
