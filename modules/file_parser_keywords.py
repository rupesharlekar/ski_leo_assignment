from lib import constants
from robot.api import logger
from robot.utils import asserts


class FileParserKeywords:

    def search_pattern(self, filename, pattern):
        with open(filename, 'r') as file:
            for line in file:
                if pattern in line:
                    yield line

    def calculate_success_rate(self, filename, threshold):
        # Generators to search for each pattern without loading the entire file into memory
        msg3_unknown_gen = self.search_pattern(filename, constants.ERROR_MSG3_TIMEOUT)
        msg3_rrc_req_gen = self.search_pattern(filename, constants.SUCCESS_MSG3)

        # Count the occurrences by iterating over the generators
        msg3_unknown_count = sum(1 for _ in msg3_unknown_gen)
        msg3_rrc_req_count = sum(1 for _ in msg3_rrc_req_gen)

        # Calculate success rate percentage
        success_rate = (msg3_rrc_req_count / (msg3_unknown_count + msg3_rrc_req_count)) * 100
        logger.info("Success rate calculated %s" % success_rate)

        asserts.assert_true(success_rate >= float(threshold), "calculated success rate is below threshold")

        return success_rate >= float(threshold)
