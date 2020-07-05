#!/usr/bin/env python3
from unittest import TestCase
import sys
import os
sys.path.append(os.path.dirname(__file__) + "/../")
try:
    from PathPlanning.AStar import a_star as m
except:
    raise


class Test(TestCase):

    def test1(self):
<<<<<<< HEAD
        m.show_animation = False
=======
        m.show_animation = True
>>>>>>> 5fef2d71a67fe09830f7e3239bd2e90fc6a3f73e
        m.main()


if __name__ == '__main__':  # pragma: no cover
    test = Test()
    test.test1()
