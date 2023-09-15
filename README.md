# memory-leak-testing-ios

This repo is to test how memory leaks if you do not properly manage retain cycle. There are two views, one maintaining strong reference and one weak reference.

If we use `myView = MemoryLeakageView(vc: self)` in second view controller, then by pressing share in debug area, we can see that in our memory graph even after closing second view controller, we still see second view controller. Hence memory leak.

but if we use `myView = WeakReferencedView(vc: self)` in second view controller, then by pressing share in debug area, we can see that in our memory graph after closing second view controller, we do not see second view controller.
