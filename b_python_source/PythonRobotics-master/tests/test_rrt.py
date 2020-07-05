#!/usr/bin/env python3
import os
import sys
from unittest import TestCase

sys.path.append(os.path.dirname(os.path.abspath(__file__)) + "/../")
try:
    from PathPlanning.RRT import rrt as m
    from PathPlanning.RRT import rrt_with_pathsmoothing as m1
except ImportError:
    raise


print(__file__)


class Test(TestCase):

    def test1(self):
        m.show_animation = True
        m.main(gx=8.0, gy=9.0)

    def test2(self):
        m1.show_animation = True
        m1.main()


if __name__ == '__main__':  # pragma: no cover
    test = Test()
    test.test1()
<<<<<<< HEAD
    test.test2()
=======
    # test.test2()
>>>>>>> 5fef2d71a67fe09830f7e3239bd2e90fc6a3f73e
