<<<<<<< HEAD
=======
#! /usr/bin/env python3

>>>>>>> 5fef2d71a67fe09830f7e3239bd2e90fc6a3f73e
from unittest import TestCase

import sys
import os
sys.path.append(os.path.dirname(__file__) + "/../")
try:
    from PathPlanning.DynamicWindowApproach import dynamic_window_approach as m
except:
    raise

print(__file__)


class Test(TestCase):

    def test1(self):
<<<<<<< HEAD
        m.show_animation = False
        m.main(gx=1.0, gy=1.0)
=======
        m.show_animation = True
        m.main(gx=8.0, gy=9.0)
>>>>>>> 5fef2d71a67fe09830f7e3239bd2e90fc6a3f73e


if __name__ == '__main__':  # pragma: no cover
    test = Test()
    test.test1()
