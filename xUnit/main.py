class TestCase:
    def __init__(self, name):
        self.name = name

    def run(self):
        method = getattr(self, self.name)
        method()

class WasRun(TestCase):
    def __init__(self, name):
        self.wasRun = None
        TestCase.__init__(self, name)

    def testMethod(self):
        self.wasRun = 1

class TestCaseTest(TestCase):
    def testRunning(self):
        test = WasRun("testMethod")
        print test.wasRun
        assert(not test.wasRun)
        test.run()
        print test.wasRun
        assert(test.wasRun)

TestCaseTest("testRunning").run()

