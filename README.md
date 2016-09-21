# Possible Module bug in MSV++ compiler 19.00.24213.1

If two modules export the same namespace, only the first one seen by the compiler will be used.

This example has three modules, modules A, B, and C. A stands alone, B depends on A, and C depends on B and thus depends on A transitively.

In the "Works" folder, all three modules export different namespaces. This works.

In the "Breaks" folder, the modules use the same namespace. There is no compiler error saying this is wrong, however while A and B compile (meaning B exports the same namespace as A) when the C tries to import module B and then reference the class B exports the compiler fails, claiming to know nothing about the class. However C can successfully reference items exported from A.
