import dagshub
dagshub.init(repo_owner='Sovith07', repo_name='mlflow-mini-project', mlflow=True)

import mlflow
mlflow.set_tracking_uri('https://dagshub.com/Sovith07/mlflow-mini-project.mlflow')
with mlflow.start_run():
  mlflow.log_param('parameter name', 'value')
  mlflow.log_metric('metric name', 1)