from prometheus_client import Counter, Summary, Gauge,Histogram



REQUEST_LATENCY = Summary(name="http_request_duration_seconds",documentation="Time spent processing HTTP requests")


HAPPY_PREDICTIONS = Counter( name="happy_predictions_total",documentation="Total happy predictions")


SAD_PREDICTIONS = Counter(name="sad_predictions_total", documentation="Total sad predictions")


TOKEN_LENGTH = Counter(name="input_token_length",documentation="Total length of tokens")