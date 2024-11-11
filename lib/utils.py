import requests
from lib import constants

def execute_rest_api(method, target, headers=None, data=None, params=None, verify=True,
                     allow_redirects=True, connect_timeout=5, read_request_timeout=10):
    """Execute a REST API call with the specified HTTP method and parameters."""
    base_url = constants.BASE_URL
    url = "%s%s%s" % (base_url, "/", target)
    session = requests.Session()

    # Choose the appropriate request method
    if method.lower() == 'post':
        resp = session.post(url, headers=headers, data=data, params=params, verify=verify,
                            allow_redirects=allow_redirects, timeout=(connect_timeout, read_request_timeout))
    elif method.lower() == 'get':
        resp = session.get(url, headers=headers, data=data, params=params, verify=verify,
                           allow_redirects=allow_redirects, timeout=(connect_timeout, read_request_timeout))
    elif method.lower() == 'put':
        resp = session.put(url, headers=headers, data=data, params=params, verify=verify,
                           allow_redirects=allow_redirects, timeout=(connect_timeout, read_request_timeout))
    elif method.lower() == 'delete':
        resp = session.delete(url, headers=headers, data=data, params=params, verify=verify,
                              allow_redirects=allow_redirects, timeout=(connect_timeout, read_request_timeout))
    else:
        raise ValueError(f"Unsupported HTTP method: {method}")

    resp.raise_for_status()  # Raises an error for HTTP 4xx/5xx responses
    return resp.json()  # Return JSON response
