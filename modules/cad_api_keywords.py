import requests
from lib import constants
from lib import utils
from robot.api import logger
from robot.utils import asserts


class CADAPIKeywords:
    def __init__(self):
        self.target = constants.CAD_API

    def get_all_close_approach_asteroid_data(self, asteroid_num, au, min_date, max_date):
        """Fetch asteroid data from NASA's CAD API."""
        params = {
            "des": asteroid_num,
            "dist-max": au,
            "date-min": min_date,
            "date-max": max_date
        }
        response = utils.execute_rest_api("GET", self.target, params=params)
        logger.info("GET CAD API response %s" % response)

        asserts.assert_not_none(response, "Response should not be None")
        return response

    def get_earth_close_approach_data(self, dist_max, min_date, sort):
        """Fetch Earth close-approach data"""
        params = {
            "dist-max": dist_max,
            "date-min": min_date,
            "sort": sort
        }
        response = utils.execute_rest_api("GET", self.target, params=params)
        logger.info("GET CAD API response for Earth : %s" % response)

        asserts.assert_not_none(response, "Response should not be None")
        return response