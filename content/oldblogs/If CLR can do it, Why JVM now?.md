Title: If CLR can do it, Why JVM now?
Date: 2004-03-04 19:21

在这篇文章里，提到了managed code比unmanaged code性能更好的可能性。
CLR可以做到的，JVM理论上也能做到，唯一的差距，可能是微软可以把CLR放入Ring 0来执行，不是么？

很多人都有java慢的感觉，一方面是因为以前机器不够好，而JVM的JIT不够完善，一方面swing的效率的确不够高，所以虽然java在server端有点所向无敌的感觉，在client端始终裹足不前，令人遗憾。以前看过一篇文章，介绍swing的编程技巧，据说swing一方面是先天不足，另一方面编程的失误也是速度缓慢的重要原因，因为swing的事件模型和windows的有很大的不同。

还有一个选择，SWT，用过eclipse的人都能够体会到SWT的速度。那么，综合越来越先进的java JVM，native的SWT，C#还能被称为java killer么？